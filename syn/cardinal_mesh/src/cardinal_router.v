
//==============================================================
//  Module: cardinal_router

//==============================================================
`timescale 1ns/1ps

//==============================================================
// Single-entry elastic buffer (synthesizable)
// Handshake: upstream  (si=data valid, ri=this ready)
//            downstream(so=data valid, ro=next ready)
//==============================================================
module buffer (
    input         clk,
    input         reset,
    input         buffer_en,        // enable pop when ro=1 (flow-thru gating)

    // Upstream
    input  [63:0] buffer_di,
    input         buffer_si,
    output        buffer_ri,

    // Downstream
    input         buffer_ro,
    output        buffer_so,
    output [63:0] buffer_do
);
    reg        full;
    reg [63:0] data_q;

    // Handshakes
    assign buffer_so = full;                              // we have valid when full
    assign buffer_do = data_q;

    // ready to accept new data if not full, OR if we will pop this cycle
    wire will_pop = full && buffer_en && buffer_ro;       // downstream takes it
    assign buffer_ri = (~full) || will_pop;

    // push when upstream drives valid and we are ready
    wire will_push = buffer_si && buffer_ri;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            full   <= 1'b0;
            data_q <= 64'd0;
        end else begin
            case ({will_pop, will_push})
                2'b00: begin
                    // no change
                end
                2'b01: begin
                    // push only
                    data_q <= buffer_di;
                    full   <= 1'b1;
                end
                2'b10: begin
                    // pop only
                    full <= 1'b0;
                end
                2'b11: begin
                    // pop and push in same cycle: pass-through overwrite
                    data_q <= buffer_di;
                    full   <= 1'b1;
                end
            endcase
        end
    end
endmodule

// ----------------------------
// Round-robin arbiter w/ advance
// ----------------------------
module rr4_arbiter (
  input        clk,
  input        reset,
  input  [3:0] request,    // 4 requesters
  input        advance,    // rotate only when a push happens
  output reg [3:0] grant   // one-hot grant
);
  reg [3:0] ptr;           // one-hot rotating priority pointer
  integer i;

  // combinational grant starting from ptr
  always @(*) begin
    grant = 4'b0000;
    for (i = 0; i < 4; i = i + 1) begin
      if (ptr[i]) begin
        if      (request[i])          grant[i]          = 1'b1;
        else if (request[(i+1) & 3])  grant[(i+1) & 3]  = 1'b1;
        else if (request[(i+2) & 3])  grant[(i+2) & 3]  = 1'b1;
        else if (request[(i+3) & 3])  grant[(i+3) & 3]  = 1'b1;
      end
    end
  end

  // pointer rotates only when advance=1
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ptr <= 4'b0001; // start at input 0
    end else if (advance) begin
      ptr <= {grant[2:0], grant[3]};
    end
  end
endmodule

module output_controller_4in (
  input  clk,
  input  reset,
  input  polarity,

  // ---- output side (to next router) ----
  output        output_so,
  output [63:0] output_do,
  input         output_ro,

  // ---- 4 input sources feeding this output ----
  input         in0_si, input  [63:0] in0_di, output in0_ri,
  input         in1_si, input  [63:0] in1_di, output in1_ri,
  input         in2_si, input  [63:0] in2_di, output in2_ri,
  input         in3_si, input  [63:0] in3_di, output in3_ri
);
  wire [3:0] req   = {in3_si, in2_si, in1_si, in0_si};
  wire [3:0] grant;

  // Select flit from granted input
  wire [63:0] sel_data =
      grant[0] ? in0_di :
      grant[1] ? in1_di :
      grant[2] ? in2_di :
      grant[3] ? in3_di : 64'd0;

  // Strict VC slotting: a flit can only be accepted into OB when VC matches
  wire vc_match = 1'b1;

  // Buffer handshake
  wire buf_ri, buf_so;
  wire [63:0] buf_do;

  // A real push happens when: someone is granted, VC matches, and buffer can take it
  wire push_to_buf = (|grant) && vc_match && buf_ri;

  // Use push_to_buf to rotate the arbiter
  rr4_arbiter ARB (
    .clk(clk), .reset(reset),
    .request(req),
    .advance(push_to_buf),
    .grant(grant)
  );

  // Output buffer: pop only when downstream ready (strict slotting is on the *push* side)
  buffer OB (
    .clk       (clk),
    .reset     (reset),
    .buffer_en (1'b1),

    .buffer_di (sel_data),
    .buffer_si (push_to_buf),
    .buffer_ri (buf_ri),

    .buffer_ro (output_ro),
    .buffer_so (buf_so),
    .buffer_do (buf_do)
  );

  assign output_so = buf_so;
  assign output_do = buf_do;

  // Ready only to the currently granted source and only when we could accept it this cycle
  assign in0_ri = grant[0] && buf_ri && vc_match;
  assign in1_ri = grant[1] && buf_ri && vc_match;
  assign in2_ri = grant[2] && buf_ri && vc_match;
  assign in3_ri = grant[3] && buf_ri && vc_match;
endmodule

module input_controller #(
    // Map the four flat outputs for this input controller instance
    parameter IDX_W   = 0,
    parameter IDX_E   = 1,
    parameter IDX_S   = 2,
    parameter IDX_NIC = 3,
    // Some inputs need an "Up-like" output (for Y=0 case is NIC, else Y>0 is Up)
    parameter IDX_U   = 2          // typically share S/U slot or wire appropriately per instance
)(
    input         clk,
    input         reset,
    input         polarity,

    // Upstream (from prior stage)
    input         upstream_si,
    input  [63:0] upstream_di,
    output        upstream_ri,

    // Readies from the 4 destination output-controllers
    input         out_ready0,
    input         out_ready1,
    input         out_ready2,
    input         out_ready3,

    // Valids to the 4 destination output-controllers
    output        out_valid0,
    output        out_valid1,
    output        out_valid2,
    output        out_valid3,

    // Data to the 4 destinations
    output [63:0] out_data0,
    output [63:0] out_data1,
    output [63:0] out_data2,
    output [63:0] out_data3
);
    // VC gating: only accept when VC matches the current polarity slot
    wire vc_ok = 1'b1;

    // Small input buffer
    wire        ib_so;
    wire [63:0] ib_do;
    
    reg         ib_en;   // pop only when chosen dest is ready

    buffer INBUF (
        .clk(clk), .reset(reset),
        .buffer_en(ib_en),

        .buffer_di(upstream_di),
        .buffer_si(upstream_si),
        .buffer_ri(upstream_ri),

        .buffer_ro(vc_ok),     // only allow capture when VC matches
        .buffer_so(ib_so),
        .buffer_do(ib_do)
    );

    // Extract fields
    wire x_dir = ib_do[62]; // 0=Right, 1=Left
    wire y_dir = ib_do[61]; // 0=Up,    1=Down

    wire [3:0] hopX = ib_do[55:52];
    wire [3:0] hopY = ib_do[51:48];

    // Decide target one-hot among 4
    reg  [3:0] sel;
    reg  [63:0] next_flit;

    always @(*) begin
        sel       = 4'b0000;
        next_flit = ib_do;

        if (ib_so) begin
            if (hopX != 4'd0) begin
                // X first
                if (x_dir == 1'b0) begin
                    sel[IDX_E]        = 1'b1;
                    next_flit[55:52]  = hopX - 4'd1;
                end else begin
                    sel[IDX_W]        = 1'b1;
                    next_flit[55:52]  = hopX - 4'd1;
                end
            end else if (hopY != 4'd0) begin
                // Y after X finished
                if (y_dir == 1'b0) begin
                    sel[IDX_U]        = 1'b1;
                    next_flit[51:48]  = hopY - 4'd1;
                end else begin
                    sel[IDX_S]        = 1'b1;
                    next_flit[51:48]  = hopY - 4'd1;
                end
            end else begin
                // local delivery
                sel[IDX_NIC] = 1'b1;
            end
        end
    end

    // Valids, datas
    assign out_valid0 = ib_so & sel[0];
    assign out_valid1 = ib_so & sel[1];
    assign out_valid2 = ib_so & sel[2];
    assign out_valid3 = ib_so & sel[3];

    assign out_data0 = next_flit;
    assign out_data1 = next_flit;
    assign out_data2 = next_flit;
    assign out_data3 = next_flit;

    // Pop (ib_en) only when the chosen target is ready
    wire chosen_ready =
        (sel[0] & out_ready0) |
        (sel[1] & out_ready1) |
        (sel[2] & out_ready2) |
        (sel[3] & out_ready3);

    always @(*) begin
        // Allow pop only when we actually handoff this cycle
        ib_en = chosen_ready;
    end
endmodule

//==============================================================
//  cardinal_router: 5 inputs x 5 outputs with VC polarity
//  Directions: UP, DOWN, LEFT, RIGHT, NIC
//==============================================================


module cardinal_router(
    input clk, reset,

    // Upstream valids/data (from neighbors / core)
    input        up_si,    down_si,    left_si,    right_si,    NIC_si,
    input [63:0] up_di,    down_di,    left_di,    right_di,    NIC_di,
    output       up_ri,    down_ri,    left_ri,    right_ri,    NIC_ri,

    // Downstream handshake to links / core
    output       up_so,    down_so,    left_so,    right_so,    NIC_so,
    output [63:0] up_do,   down_do,    left_do,    right_do,    NIC_do,
    input        up_ro,    down_ro,    left_ro,    right_ro,    NIC_ro,

    output       polarity_to_NIC
);

    // -----------------------------
    // Polarity: toggles every cycle after reset
    // -----------------------------
    reg polarity;
      always @(posedge clk) begin
        if (reset) polarity <= 1'b0;   // even during reset
        else       polarity <= ~polarity;
      end

assign polarity_to_NIC = polarity;


    // ---------------------------------------------------------
    // Wires: IC -> OC channels (valid/data/ready) for all pairs
    // Naming: A2B_* means from InputController A to OutputController B
    // ---------------------------------------------------------

    // UP IC outputs: to LEFT, RIGHT, DOWN, NIC
    wire U2L_si, U2R_si, U2D_si, U2N_si;
    wire [63:0] U2L_di, U2R_di, U2D_di, U2N_di;
    wire U2L_ri, U2R_ri, U2D_ri, U2N_ri;

    // DOWN IC outputs: to LEFT, RIGHT, UP, NIC
    wire D2L_si, D2R_si, D2U_si, D2N_si;
    wire [63:0] D2L_di, D2R_di, D2U_di, D2N_di;
    wire D2L_ri, D2R_ri, D2U_ri, D2N_ri;

    // LEFT IC outputs: to UP, DOWN, RIGHT, NIC
    wire L2U_si, L2D_si, L2R_si, L2N_si;
    wire [63:0] L2U_di, L2D_di, L2R_di, L2N_di;
    wire L2U_ri, L2D_ri, L2R_ri, L2N_ri;

    // RIGHT IC outputs: to UP, DOWN, LEFT, NIC
    wire R2U_si, R2D_si, R2L_si, R2N_si;
    wire [63:0] R2U_di, R2D_di, R2L_di, R2N_di;
    wire R2U_ri, R2D_ri, R2L_ri, R2N_ri;

    // NIC IC outputs: to UP, DOWN, LEFT, RIGHT
    wire N2U_si, N2D_si, N2L_si, N2R_si;
    wire [63:0] N2U_di, N2D_di, N2L_di, N2R_di;
    wire N2U_ri, N2D_ri, N2L_ri, N2R_ri;

    // ---------------------------------------------------------
    // OUTPUT CONTROLLERS (5x): each takes 4 inputs (no U-turn)
    // Define a consistent order for in0..in3 per output:
    //   UP   : in0=LEFT,  in1=RIGHT, in2=DOWN,  in3=NIC
    //   DOWN : in0=LEFT,  in1=RIGHT, in2=UP,    in3=NIC
    //   LEFT : in0=UP,    in1=DOWN,  in2=RIGHT, in3=NIC
    //   RIGHT: in0=UP,    in1=DOWN,  in2=LEFT,  in3=NIC
    //   NIC  : in0=UP,    in1=DOWN,  in2=LEFT,  in3=RIGHT
    // ---------------------------------------------------------

    // UP output controller
    output_controller_4in OC_UP (
        .clk(clk), .reset(reset), .polarity(polarity),
        .output_so(up_so), .output_do(up_do), .output_ro(up_ro),
        .in0_si(L2U_si), .in0_di(L2U_di), .in0_ri(L2U_ri),   // LEFT->UP
        .in1_si(R2U_si), .in1_di(R2U_di), .in1_ri(R2U_ri),   // RIGHT->UP
        .in2_si(D2U_si), .in2_di(D2U_di), .in2_ri(D2U_ri),   // DOWN->UP
        .in3_si(N2U_si), .in3_di(N2U_di), .in3_ri(N2U_ri)    // NIC->UP
    );

    // DOWN output controller
    output_controller_4in OC_DOWN (
        .clk(clk), .reset(reset), .polarity(polarity),
        .output_so(down_so), .output_do(down_do), .output_ro(down_ro),
        .in0_si(L2D_si), .in0_di(L2D_di), .in0_ri(L2D_ri),   // LEFT->DOWN
        .in1_si(R2D_si), .in1_di(R2D_di), .in1_ri(R2D_ri),   // RIGHT->DOWN
        .in2_si(U2D_si), .in2_di(U2D_di), .in2_ri(U2D_ri),   // UP->DOWN
        .in3_si(N2D_si), .in3_di(N2D_di), .in3_ri(N2D_ri)    // NIC->DOWN
    );

    // LEFT output controller
    output_controller_4in OC_LEFT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .output_so(left_so), .output_do(left_do), .output_ro(left_ro),
        .in0_si(U2L_si), .in0_di(U2L_di), .in0_ri(U2L_ri),   // UP->LEFT
        .in1_si(D2L_si), .in1_di(D2L_di), .in1_ri(D2L_ri),   // DOWN->LEFT
        .in2_si(R2L_si), .in2_di(R2L_di), .in2_ri(R2L_ri),   // RIGHT->LEFT
        .in3_si(N2L_si), .in3_di(N2L_di), .in3_ri(N2L_ri)    // NIC->LEFT
    );

    // RIGHT output controller
    output_controller_4in OC_RIGHT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .output_so(right_so), .output_do(right_do), .output_ro(right_ro),
        .in0_si(U2R_si), .in0_di(U2R_di), .in0_ri(U2R_ri),   // UP->RIGHT
        .in1_si(D2R_si), .in1_di(D2R_di), .in1_ri(D2R_ri),   // DOWN->RIGHT
        .in2_si(L2R_si), .in2_di(L2R_di), .in2_ri(L2R_ri),   // LEFT->RIGHT
        .in3_si(N2R_si), .in3_di(N2R_di), .in3_ri(N2R_ri)    // NIC->RIGHT
    );

    // NIC output controller (local delivery)
    output_controller_4in OC_NIC (
        .clk(clk), .reset(reset), .polarity(polarity),
        .output_so(NIC_so), .output_do(NIC_do), .output_ro(NIC_ro),
        .in0_si(U2N_si), .in0_di(U2N_di), .in0_ri(U2N_ri),   // UP->NIC
        .in1_si(D2N_si), .in1_di(D2N_di), .in1_ri(D2N_ri),   // DOWN->NIC
        .in2_si(L2N_si), .in2_di(L2N_di), .in2_ri(L2N_ri),   // LEFT->NIC
        .in3_si(R2N_si), .in3_di(R2N_di), .in3_ri(R2N_ri)    // RIGHT->NIC
    );

    // ---------------------------------------------------------
    // INPUT CONTROLLERS (5x): each targets 4 outputs (no U-turn)
    // Param mapping per IC:
    //   For each IC, we set which of its 4 flat outputs correspond to
    //   W/E/S/NIC (or UP/DOWN/LEFT/RIGHT/NIC) as applicable.
    //   Then we wire each out_valid/data toward the corresponding OC input.
    // ---------------------------------------------------------

    // UP Input Controller: can send to LEFT, RIGHT, DOWN, NIC
    // Choose mapping of its 4 outputs: {0:LEFT, 1:RIGHT, 2:DOWN, 3:NIC}
    input_controller
    #(.IDX_W(0), .IDX_E(1), .IDX_S(2), .IDX_NIC(3))
    IC_UP (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(up_si), .upstream_di(up_di), .upstream_ri(up_ri),

        .out_ready0(U2L_ri), .out_ready1(U2R_ri), .out_ready2(U2D_ri), .out_ready3(U2N_ri),
        .out_valid0(U2L_si), .out_valid1(U2R_si), .out_valid2(U2D_si), .out_valid3(U2N_si),
        .out_data0(U2L_di),  .out_data1(U2R_di),  .out_data2(U2D_di),  .out_data3(U2N_di)
    );

    // DOWN Input Controller: can send to LEFT, RIGHT, UP, NIC
    // Mapping {0:LEFT, 1:RIGHT, 2:UP, 3:NIC}
    input_controller
    #(.IDX_W(0), .IDX_E(1), .IDX_U(2), .IDX_NIC(3))
    IC_DOWN (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(down_si), .upstream_di(down_di), .upstream_ri(down_ri),

        .out_ready0(D2L_ri), .out_ready1(D2R_ri), .out_ready2(D2U_ri), .out_ready3(D2N_ri),
        .out_valid0(D2L_si), .out_valid1(D2R_si), .out_valid2(D2U_si), .out_valid3(D2N_si),
        .out_data0(D2L_di),  .out_data1(D2R_di),  .out_data2(D2U_di),  .out_data3(D2N_di)
    );

    // LEFT Input Controller: can send to UP, DOWN, RIGHT, NIC
    // Mapping {0:UP, 1:DOWN, 2:RIGHT, 3:NIC}
    input_controller
    #(.IDX_U(0), .IDX_E(2), .IDX_S(1), .IDX_NIC(3))
    IC_LEFT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(left_si), .upstream_di(left_di), .upstream_ri(left_ri),

        .out_ready0(L2U_ri), .out_ready1(L2D_ri), .out_ready2(L2R_ri), .out_ready3(L2N_ri),
        .out_valid0(L2U_si), .out_valid1(L2D_si), .out_valid2(L2R_si), .out_valid3(L2N_si),
        .out_data0(L2U_di),  .out_data1(L2D_di),  .out_data2(L2R_di),  .out_data3(L2N_di)
    );

    // RIGHT Input Controller: can send to UP, DOWN, LEFT, NIC
    // Mapping {0:UP, 1:DOWN, 2:LEFT, 3:NIC}
    input_controller
    #(.IDX_W(2), .IDX_S(1), .IDX_U(0), .IDX_NIC(3))
    IC_RIGHT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(right_si), .upstream_di(right_di), .upstream_ri(right_ri),

        .out_ready0(R2U_ri), .out_ready1(R2D_ri), .out_ready2(R2L_ri), .out_ready3(R2N_ri),
        .out_valid0(R2U_si), .out_valid1(R2D_si), .out_valid2(R2L_si), .out_valid3(R2N_si),
        .out_data0(R2U_di),  .out_data1(R2D_di),  .out_data2(R2L_di),  .out_data3(R2N_di)
    );

    // NIC Input Controller: can send to UP, DOWN, LEFT, RIGHT
    // Mapping {0:UP, 1:DOWN, 2:LEFT, 3:RIGHT}
    input_controller
    #(.IDX_W(2), .IDX_E(3), .IDX_S(1), .IDX_U(0))  // reuse NIC idx for "UP" slot
    IC_NIC (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(NIC_si), .upstream_di(NIC_di), .upstream_ri(NIC_ri),

        .out_ready0(N2U_ri), .out_ready1(N2D_ri), .out_ready2(N2L_ri), .out_ready3(N2R_ri),
        .out_valid0(N2U_si), .out_valid1(N2D_si), .out_valid2(N2L_si), .out_valid3(N2R_si),
        .out_data0(N2U_di),  .out_data1(N2D_di),  .out_data2(N2L_di),  .out_data3(N2R_di)
    );

endmodule