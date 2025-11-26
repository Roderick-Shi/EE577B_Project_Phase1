
//==============================================================
//  Module: gold_router

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


//==============================================================
//  gold_router: 5 inputs x 5 outputs with VC polarity
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

//==============================================================
// 4x4 cardinal_mesh
// Each nodeXY has:
//   nodeXY_pesi   : input  (NIC -> router valid)
//   nodeXY_peri   : output (router -> NIC ready)
//   nodeXY_pedi   : input  [63:0] (NIC -> router data)
//   nodeXY_peso   : output (router -> NIC valid)
//   nodeXY_pero   : input  (NIC -> router ready)
//   nodeXY_pedo   : output [63:0] (router -> NIC data)
//   nodeXY_polarity : output (router -> NIC polarity)
//==============================================================
module cardinal_mesh(
  input  clk,
  input  reset,

  // node00
  input         node00_pesi, node00_pero,
  input  [63:0] node00_pedi,
  output        node00_peri, node00_peso,
  output [63:0] node00_pedo,
  output        node00_polarity,

  // node01
  input         node01_pesi, node01_pero,
  input  [63:0] node01_pedi,
  output        node01_peri, node01_peso,
  output [63:0] node01_pedo,
  output        node01_polarity,

  // node02
  input         node02_pesi, node02_pero,
  input  [63:0] node02_pedi,
  output        node02_peri, node02_peso,
  output [63:0] node02_pedo,
  output        node02_polarity,

  // node03
  input         node03_pesi, node03_pero,
  input  [63:0] node03_pedi,
  output        node03_peri, node03_peso,
  output [63:0] node03_pedo,
  output        node03_polarity,

  // node10
  input         node10_pesi, node10_pero,
  input  [63:0] node10_pedi,
  output        node10_peri, node10_peso,
  output [63:0] node10_pedo,
  output        node10_polarity,

  // node11
  input         node11_pesi, node11_pero,
  input  [63:0] node11_pedi,
  output        node11_peri, node11_peso,
  output [63:0] node11_pedo,
  output        node11_polarity,

  // node12
  input         node12_pesi, node12_pero,
  input  [63:0] node12_pedi,
  output        node12_peri, node12_peso,
  output [63:0] node12_pedo,
  output        node12_polarity,

  // node13
  input         node13_pesi, node13_pero,
  input  [63:0] node13_pedi,
  output        node13_peri, node13_peso,
  output [63:0] node13_pedo,
  output        node13_polarity,

  // node20
  input         node20_pesi, node20_pero,
  input  [63:0] node20_pedi,
  output        node20_peri, node20_peso,
  output [63:0] node20_pedo,
  output        node20_polarity,

  // node21
  input         node21_pesi, node21_pero,
  input  [63:0] node21_pedi,
  output        node21_peri, node21_peso,
  output [63:0] node21_pedo,
  output        node21_polarity,

  // node22
  input         node22_pesi, node22_pero,
  input  [63:0] node22_pedi,
  output        node22_peri, node22_peso,
  output [63:0] node22_pedo,
  output        node22_polarity,

  // node23
  input         node23_pesi, node23_pero,
  input  [63:0] node23_pedi,
  output        node23_peri, node23_peso,
  output [63:0] node23_pedo,
  output        node23_polarity,

  // node30
  input         node30_pesi, node30_pero,
  input  [63:0] node30_pedi,
  output        node30_peri, node30_peso,
  output [63:0] node30_pedo,
  output        node30_polarity,

  // node31
  input         node31_pesi, node31_pero,
  input  [63:0] node31_pedi,
  output        node31_peri, node31_peso,
  output [63:0] node31_pedo,
  output        node31_polarity,

  // node32
  input         node32_pesi, node32_pero,
  input  [63:0] node32_pedi,
  output        node32_peri, node32_peso,
  output [63:0] node32_pedo,
  output        node32_polarity,

  // node33
  input         node33_pesi, node33_pero,
  input  [63:0] node33_pedi,
  output        node33_peri, node33_peso,
  output [63:0] node33_pedo,
  output        node33_polarity
);

  // NOTE: The exact ordering above can be rearranged to match
  // your instructor’s port order; the important part is the
  // names and directions. If your template lists them grouped
  // as in Figure 2 (left, right, bottom), keep that grouping.

  // ==========================================================
  // Internal mesh wiring (same structure as your NIC_* version)
  // ==========================================================

  // Flatten (x,y) into single index 0..15
  function integer IDX;
    input integer x;
    input integer y;
    begin
      IDX = x + 4*y;
    end
  endfunction

  // Router link signals
  wire        up_si   [0:15], down_si [0:15], left_si [0:15], right_si[0:15];
  wire        up_ri   [0:15], down_ri [0:15], left_ri [0:15], right_ri[0:15];
  wire        up_so   [0:15], down_so [0:15], left_so [0:15], right_so[0:15];
  wire        up_ro   [0:15], down_ro [0:15], left_ro [0:15], right_ro[0:15];
  wire [63:0] up_di   [0:15], down_di [0:15], left_di [0:15], right_di[0:15];
  wire [63:0] up_do   [0:15], down_do [0:15], left_do [0:15], right_do[0:15];

  // Local NIC side (per node)
  wire        nic_si  [0:15];
  wire [63:0] nic_di  [0:15];
  wire        nic_ri  [0:15];
  wire        nic_so  [0:15];
  wire [63:0] nic_do  [0:15];
  wire        nic_ro  [0:15];

  // Router polarity outputs
  wire        rpol    [0:15];

  // ----------------------------------------------------------
  // Map nodeXY_* ports <-> internal nic_* arrays
  // (x index is first digit, y is second; adjust if your coord
  // system is swapped.)
  // ----------------------------------------------------------

  // y = 0 row: nodes 00,10,20,30
  assign nic_si[IDX(0,0)] = node00_pesi;
  assign nic_di[IDX(0,0)] = node00_pedi;
  assign node00_peri      = nic_ri[IDX(0,0)];
  assign node00_peso      = nic_so[IDX(0,0)];
  assign node00_pedo      = nic_do[IDX(0,0)];
  assign nic_ro[IDX(0,0)] = node00_pero;
  assign node00_polarity  = rpol[IDX(0,0)];

  assign nic_si[IDX(1,0)] = node10_pesi;
  assign nic_di[IDX(1,0)] = node10_pedi;
  assign node10_peri      = nic_ri[IDX(1,0)];
  assign node10_peso      = nic_so[IDX(1,0)];
  assign node10_pedo      = nic_do[IDX(1,0)];
  assign nic_ro[IDX(1,0)] = node10_pero;
  assign node10_polarity  = rpol[IDX(1,0)];

  assign nic_si[IDX(2,0)] = node20_pesi;
  assign nic_di[IDX(2,0)] = node20_pedi;
  assign node20_peri      = nic_ri[IDX(2,0)];
  assign node20_peso      = nic_so[IDX(2,0)];
  assign node20_pedo      = nic_do[IDX(2,0)];
  assign nic_ro[IDX(2,0)] = node20_pero;
  assign node20_polarity  = rpol[IDX(2,0)];

  assign nic_si[IDX(3,0)] = node30_pesi;
  assign nic_di[IDX(3,0)] = node30_pedi;
  assign node30_peri      = nic_ri[IDX(3,0)];
  assign node30_peso      = nic_so[IDX(3,0)];
  assign node30_pedo      = nic_do[IDX(3,0)];
  assign nic_ro[IDX(3,0)] = node30_pero;
  assign node30_polarity  = rpol[IDX(3,0)];

  // y = 1 row: nodes 01,11,21,31
  assign nic_si[IDX(0,1)] = node01_pesi;
  assign nic_di[IDX(0,1)] = node01_pedi;
  assign node01_peri      = nic_ri[IDX(0,1)];
  assign node01_peso      = nic_so[IDX(0,1)];
  assign node01_pedo      = nic_do[IDX(0,1)];
  assign nic_ro[IDX(0,1)] = node01_pero;
  assign node01_polarity  = rpol[IDX(0,1)];

  assign nic_si[IDX(1,1)] = node11_pesi;
  assign nic_di[IDX(1,1)] = node11_pedi;
  assign node11_peri      = nic_ri[IDX(1,1)];
  assign node11_peso      = nic_so[IDX(1,1)];
  assign node11_pedo      = nic_do[IDX(1,1)];
  assign nic_ro[IDX(1,1)] = node11_pero;
  assign node11_polarity  = rpol[IDX(1,1)];

  assign nic_si[IDX(2,1)] = node21_pesi;
  assign nic_di[IDX(2,1)] = node21_pedi;
  assign node21_peri      = nic_ri[IDX(2,1)];
  assign node21_peso      = nic_so[IDX(2,1)];
  assign node21_pedo      = nic_do[IDX(2,1)];
  assign nic_ro[IDX(2,1)] = node21_pero;
  assign node21_polarity  = rpol[IDX(2,1)];

  assign nic_si[IDX(3,1)] = node31_pesi;
  assign nic_di[IDX(3,1)] = node31_pedi;
  assign node31_peri      = nic_ri[IDX(3,1)];
  assign node31_peso      = nic_so[IDX(3,1)];
  assign node31_pedo      = nic_do[IDX(3,1)];
  assign nic_ro[IDX(3,1)] = node31_pero;
  assign node31_polarity  = rpol[IDX(3,1)];

  // y = 2 row: nodes 02,12,22,32
  assign nic_si[IDX(0,2)] = node02_pesi;
  assign nic_di[IDX(0,2)] = node02_pedi;
  assign node02_peri      = nic_ri[IDX(0,2)];
  assign node02_peso      = nic_so[IDX(0,2)];
  assign node02_pedo      = nic_do[IDX(0,2)];
  assign nic_ro[IDX(0,2)] = node02_pero;
  assign node02_polarity  = rpol[IDX(0,2)];

  assign nic_si[IDX(1,2)] = node12_pesi;
  assign nic_di[IDX(1,2)] = node12_pedi;
  assign node12_peri      = nic_ri[IDX(1,2)];
  assign node12_peso      = nic_so[IDX(1,2)];
  assign node12_pedo      = nic_do[IDX(1,2)];
  assign nic_ro[IDX(1,2)] = node12_pero;
  assign node12_polarity  = rpol[IDX(1,2)];

  assign nic_si[IDX(2,2)] = node22_pesi;
  assign nic_di[IDX(2,2)] = node22_pedi;
  assign node22_peri      = nic_ri[IDX(2,2)];
  assign node22_peso      = nic_so[IDX(2,2)];
  assign node22_pedo      = nic_do[IDX(2,2)];
  assign nic_ro[IDX(2,2)] = node22_pero;
  assign node22_polarity  = rpol[IDX(2,2)];

  assign nic_si[IDX(3,2)] = node32_pesi;
  assign nic_di[IDX(3,2)] = node32_pedi;
  assign node32_peri      = nic_ri[IDX(3,2)];
  assign node32_peso      = nic_so[IDX(3,2)];
  assign node32_pedo      = nic_do[IDX(3,2)];
  assign nic_ro[IDX(3,2)] = node32_pero;
  assign node32_polarity  = rpol[IDX(3,2)];

  // y = 3 row: nodes 03,13,23,33
  assign nic_si[IDX(0,3)] = node03_pesi;
  assign nic_di[IDX(0,3)] = node03_pedi;
  assign node03_peri      = nic_ri[IDX(0,3)];
  assign node03_peso      = nic_so[IDX(0,3)];
  assign node03_pedo      = nic_do[IDX(0,3)];
  assign nic_ro[IDX(0,3)] = node03_pero;
  assign node03_polarity  = rpol[IDX(0,3)];

  assign nic_si[IDX(1,3)] = node13_pesi;
  assign nic_di[IDX(1,3)] = node13_pedi;
  assign node13_peri      = nic_ri[IDX(1,3)];
  assign node13_peso      = nic_so[IDX(1,3)];
  assign node13_pedo      = nic_do[IDX(1,3)];
  assign nic_ro[IDX(1,3)] = node13_pero;
  assign node13_polarity  = rpol[IDX(1,3)];

  assign nic_si[IDX(2,3)] = node23_pesi;
  assign nic_di[IDX(2,3)] = node23_pedi;
  assign node23_peri      = nic_ri[IDX(2,3)];
  assign node23_peso      = nic_so[IDX(2,3)];
  assign node23_pedo      = nic_do[IDX(2,3)];
  assign nic_ro[IDX(2,3)] = node23_pero;
  assign node23_polarity  = rpol[IDX(2,3)];

  assign nic_si[IDX(3,3)] = node33_pesi;
  assign nic_di[IDX(3,3)] = node33_pedi;
  assign node33_peri      = nic_ri[IDX(3,3)];
  assign node33_peso      = nic_so[IDX(3,3)];
  assign node33_pedo      = nic_do[IDX(3,3)];
  assign nic_ro[IDX(3,3)] = node33_pero;
  assign node33_polarity  = rpol[IDX(3,3)];

  // ----------------------------------------------------------
  // Generate the 4x4 mesh of gold_router instances
  // ----------------------------------------------------------
  genvar x, y;
  generate
    for (y = 0; y < 4; y = y + 1) begin : GY
      for (x = 0; x < 4; x = x + 1) begin : GX
        localparam integer i = x + 4*y;

        // Up: +Y if exists
        assign up_si[i] = (y < 3) ? down_so[i+4] : 1'b0;
        assign up_di[i] = (y < 3) ? down_do[i+4] : 64'd0;
        assign up_ro[i] = (y < 3) ? down_ri[i+4] : 1'b0;

        // Down: -Y if exists
        assign down_si[i] = (y > 0) ? up_so[i-4] : 1'b0;
        assign down_di[i] = (y > 0) ? up_do[i-4] : 64'd0;
        assign down_ro[i] = (y > 0) ? up_ri[i-4] : 1'b0;

        // Right: +X if exists
        assign right_si[i] = (x < 3) ? left_so[i+1] : 1'b0;
        assign right_di[i] = (x < 3) ? left_do[i+1] : 64'd0;
        assign right_ro[i] = (x < 3) ? left_ri[i+1] : 1'b0;

        // Left: -X if exists
        assign left_si[i] = (x > 0) ? right_so[i-1] : 1'b0;
        assign left_di[i] = (x > 0) ? right_do[i-1] : 64'd0;
        assign left_ro[i] = (x > 0) ? right_ri[i-1] : 1'b0;

        cardinal_router R (
          .clk(clk), .reset(reset),

          .up_si(up_si[i]),     .down_si(down_si[i]),
          .left_si(left_si[i]), .right_si(right_si[i]),
          .NIC_si(nic_si[i]),

          .up_di(up_di[i]),     .down_di(down_di[i]),
          .left_di(left_di[i]), .right_di(right_di[i]),
          .NIC_di(nic_di[i]),

          .up_ri(up_ri[i]),     .down_ri(down_ri[i]),
          .left_ri(left_ri[i]), .right_ri(right_ri[i]),
          .NIC_ri(nic_ri[i]),

          .up_so(up_so[i]),     .down_so(down_so[i]),
          .left_so(left_so[i]), .right_so(right_so[i]),
          .NIC_so(nic_so[i]),

          .up_do(up_do[i]),     .down_do(down_do[i]),
          .left_do(left_do[i]), .right_do(right_do[i]),
          .NIC_do(nic_do[i]),

          .up_ro(up_ro[i]),     .down_ro(down_ro[i]),
          .left_ro(left_ro[i]), .right_ro(right_ro[i]),
          .NIC_ro(nic_ro[i]),

          .polarity_to_NIC(rpol[i])
        );
      end
    end
  endgenerate

endmodule


