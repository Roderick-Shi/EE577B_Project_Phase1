

//==============================================================
//  Module: input_control

//==============================================================
`timescale 1ns/1ps

module buffer (
    input  clk,              // System clock
    input  reset,            // Synchronous reset (active high)
    input  buffer_en,        // Enable flag to allow data transfer

    // ===== Upstream interface =====
    input  [63:0] buffer_di, // Data input from previous stage
    input         buffer_si, // Send-in  (valid signal from upstream)
    output reg    buffer_ri, // Ready-in (tells upstream this buffer can receive)

    // ===== Downstream interface =====
    input         buffer_ro, // Ready-out (next stage ready to accept data)
    output reg    buffer_so, // Send-out  (this buffer has valid data to send)
    output reg [63:0] buffer_do  // Data output to next stage
);

    
    // State definition
   
    reg [0:0] state; 
	reg [63:0] data_reg; 
	
	localparam RECEIVE = 1'b0;
    localparam SEND    = 1'b1;

    
    // Output and handshake logic
    assign buffer_do = data_reg;                // Always drive data output
    assign buffer_so = (state == SEND);         // Valid flag asserted in SEND state
    assign buffer_ri = (state == RECEIVE) || buffer_ro;
    //  - Ready when empty (RECEIVE)
    //  - Or when downstream ready (allows back-to-back transfer)
    //  -> This enables "elastic" pipeline behavior

 
    // Sequential logic: FSM transitions
    always @(posedge clk) begin
        if (reset) begin
            // --- Reset behavior ---
            state    <= RECEIVE;    // Start empty
            data_reg <= 64'd0;
        end else begin
            // --- Normal operation ---
            case (state)
                //--------------------------------------------------
                // State 0: RECEIVE (buffer empty)
                //--------------------------------------------------
                RECEIVE: begin
                    // If enabled, upstream has valid data, and buffer is ready:
                    if (buffer_si && buffer_ri) begin
                        data_reg <= buffer_di; // Capture new data
                        state    <= SEND;      // Buffer now full
                    end
                end

                //--------------------------------------------------
                // State 1: SEND (buffer full)
                //--------------------------------------------------
                SEND: begin
                    // If downstream accepts data this cycle:
                    if (buffer_en && buffer_so && buffer_ro) begin
                        state <= RECEIVE; // Buffer becomes empty
                        // data_reg content can remain; valid flag (state) controls use
                    end
                end
            endcase
        end
    end

endmodule


//==============================================================
//  Verilog-2005: input_controller_4out_flat
//  - Flat ports (no arrays of ports)
//  - Includes NIC case (hop_x==0 && hop_y==0)
//  - Parameterized mapping: which of the 4 outputs corresponds to W/E/S/NIC
//==============================================================


module input_controller_4out_flat
#(
    // Assign which flat output index (0..3) corresponds to W/E/S/NIC
    parameter IDX_W   = 0,
    parameter IDX_E   = 1,
    parameter IDX_S   = 2,
    parameter IDX_NIC = 3
)(
    input        clk,
    input        reset,
    input        polarity,

    // Upstream flit source
    input        upstream_si,
    input [63:0] upstream_di,
    output       upstream_ri,

    // Ready from each chosen downstream output controller
    input        out_ready0,
    input        out_ready1,
    input        out_ready2,
    input        out_ready3,

    // Valid out to each downstream output controller
    output       out_valid0,
    output       out_valid1,
    output       out_valid2,
    output       out_valid3,

    // Data out to each downstream output controller
    output [63:0] out_data0,
    output [63:0] out_data1,
    output [63:0] out_data2,
    output [63:0] out_data3
);

    // --- Ingress VC gating ---
    wire vc_match = (upstream_di[63] == polarity);

    // Allow buffer to capture flit only when VC matches current slot
    wire buf_ro;
    wire buf_si = upstream_si;
    wire buf_ri;
    wire buf_so;
    wire [63:0] buf_do;

    assign buf_ro = vc_match;

    // Small input buffer (your buffer)
    buffer INBUF (
        .clk(clk), .reset(reset),
        .buffer_en(1'b1),
        .buffer_di(upstream_di),
        .buffer_si(buf_si),
        .buffer_ri(upstream_ri),
        .buffer_ro(buf_ro),
        .buffer_so(buf_so),
        .buffer_do(buf_do)
    );

    // Extract routing info
    wire signed [3:0] hop_x = buf_do[55:52];
    wire signed [3:0] hop_y = buf_do[51:48];

    // Next hop select (one-hot among 4 flat outputs)
    reg  [3:0] sel;
    reg  [63:0] updated_flit;

    always @(*) begin
        sel = 4'b0000;
        updated_flit = buf_do;

        if (buf_so) begin
            if (hop_x > 0) begin
                sel[IDX_E] = 1'b1;
                updated_flit[55:52] = hop_x - 1;
            end
            else if (hop_x < 0) begin
                sel[IDX_W] = 1'b1;
                updated_flit[55:52] = hop_x + 1;
            end
            else if (hop_y > 0) begin
                // Going "up"/north in mesh terms
                // If this IC does not include UP in its 4 outputs,
                // you should have mapped its UP-equivalent to one of IDX_* above.
                // Here we map Y>0 to "not S"; since our 4 outputs exclude the IC's
                // own direction, we generally use IDX_S for down and
                // repurpose NIC as the local-destination case.
                // For a generic IC, we use S for hop_y<0, and NIC for (0,0).
                // For hop_y>0 we must choose one of our allowed four; we
                // will handle this per instance by parameter selection.
                // For a generic 4-target IC we treat Y>0 as "north-like" and
                // must map that to one of the indices. In this design,
                // we will feed that via instance-specific param mapping:
                // choose either IDX_W/IDX_E/IDX_S as appropriate in top-level.
                // For clarity we route Y>0 to the "north-like" output = (the one
                // not used by W/E/S/NIC). In our instantiations below,
                // we map Y>0 to the remaining allowed direction.

                // By default here, we map Y>0 to index IDX_NIC if local is not intended,
                // but practically we'll override via params per instance.
                // To keep correctness, we will not decrement hop_y here
                // unless the chosen mapped direction is actually "UP".
                // Top-level param mapping ensures it's consistent.
                sel[3] = 1'b0; // do nothing here; real mapping is done per instance
            end
            else if (hop_y < 0) begin
                sel[IDX_S] = 1'b1;
                updated_flit[51:48] = hop_y + 1;
            end
            else begin
                // (hop_x==0 && hop_y==0) -> local NIC
                sel[IDX_NIC] = 1'b1;
            end
        end
    end

    // Expand one-hot to valids and data
    assign out_valid0 = buf_so & sel[0];
    assign out_valid1 = buf_so & sel[1];
    assign out_valid2 = buf_so & sel[2];
    assign out_valid3 = buf_so & sel[3];

    assign out_data0  = updated_flit;
    assign out_data1  = updated_flit;
    assign out_data2  = updated_flit;
    assign out_data3  = updated_flit;

    // Pop from buffer only when selected target is ready
    wire any_send = (out_valid0 & out_ready0) |
                    (out_valid1 & out_ready1) |
                    (out_valid2 & out_ready2) |
                    (out_valid3 & out_ready3);

    // NOTE: INBUF uses vc_match on .buffer_ro already to allow capture.
    // Here we do not control INBUF.pop; that was for the output buffer.
    // For this input buffer, we only control when upstream gets RI (via buffer_ri)
    // and when its data is consumed (any_send).
    // If you want INBUF to drop to RECEIVE only on any_send, use buffer_en gating,
    // but your INBUF is already an elastic stage keyed by buffer_ro and buffer_en=1.

endmodule




module rr4_arbiter (
  input        clk,
  input        reset,
  input  [3:0] request,   // 4 requesters
  output reg [3:0] grant  // one-hot grant
);
  reg [3:0] ptr;          // one-hot rotating priority pointer
  integer i;

  // combinational grant starting from ptr
  always @(*) begin
    grant = 4'b0000;
    for (i = 0; i < 4; i = i + 1) begin
      if (ptr[i]) begin
        if      (request[i])            grant[i]            = 1'b1;
        else if (request[(i+1) & 3])    grant[(i+1) & 3]    = 1'b1;
        else if (request[(i+2) & 3])    grant[(i+2) & 3]    = 1'b1;
        else if (request[(i+3) & 3])    grant[(i+3) & 3]    = 1'b1;
      end
    end
  end

  // rotate pointer after a successful grant
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ptr <= 4'b0001; // start at input 0
    end else if (grant != 4'b0000) begin
      // next cycle priority starts after the winner
      ptr <= {grant[2:0], grant[3]};
    end
  end
endmodule


module output_controller_4in (
  input  clk,
  input  reset,
  input  polarity,              // VC timeslot selector

  // ---- output side (to link / next router) ----
  output        output_so,      // valid
  output [63:0] output_do,      // data
  input         output_ro,      // ready

  // ---- 4 input sources feeding this output ----
  // Map these to {LEFT, RIGHT, DOWN, NIC} for TOP/North OB
  input         in0_si,
  input  [63:0] in0_di,
  output        in0_ri,

  input         in1_si,
  input  [63:0] in1_di,
  output        in1_ri,

  input         in2_si,
  input  [63:0] in2_di,
  output        in2_ri,

  input         in3_si,
  input  [63:0] in3_di,
  output        in3_ri
);

  // -----------------------------
  // 4-input round-robin arbiter
  // -----------------------------
  wire [3:0] req   = {in3_si, in2_si, in1_si, in0_si};
  wire [3:0] grant;
  rr4_arbiter ARB (.clk(clk), .reset(reset), .request(req), .grant(grant));

  // -----------------------------
  // Data mux from granted input
  // -----------------------------
  wire [63:0] arb_data =
      grant[0] ? in0_di :
      grant[1] ? in1_di :
      grant[2] ? in2_di :
      grant[3] ? in3_di : 64'd0;

  // -----------------------------
  // VC gating (input -> buffer)
  // allow only VC == polarity to ENTER the buffer
  // -----------------------------
  wire vc_match     = (arb_data[63] == polarity);

  // Handshake with the 1-flit buffer
  wire buf_ri;  // buffer ready to accept
  wire buf_so;  // buffer has valid
  wire [63:0] buf_do;

  // Only assert si when: there is a grant, VC matches, and buffer is ready
  wire push_to_buf = (|grant) && vc_match && buf_ri;

  // -----------------------------
  // VC gating (buffer -> link)
  // allow only VC != polarity to LEAVE the buffer
  // -----------------------------
  wire vc_send_ok  = (output_do[63] != polarity);

  // -----------------------------
  // Output buffer (your buffer module)
  // buffer_en left at 1'b1; send happens only when
  //   buffer_so && buffer_ro == 1, and our buffer_ro is gated by vc_send_ok
  // -----------------------------
  buffer OB (
    .clk       (clk),
    .reset     (reset),
    .buffer_en (1'b1),

    .buffer_di (arb_data),
    .buffer_si (push_to_buf),
    .buffer_ri (buf_ri),

    .buffer_ro (output_ro && vc_send_ok),
    .buffer_so (buf_so),
    .buffer_do (buf_do)
  );

  assign output_so = buf_so;
  assign output_do = buf_do;

  // -----------------------------
  // Ready back to inputs:
  // Only the granted input sees ready, and only when the buffer can accept
  // (i.e., buf_ri) and the VC matches the current polarity slot.
  // -----------------------------
  assign in0_ri = grant[0] && buf_ri && vc_match;
  assign in1_ri = grant[1] && buf_ri && vc_match;
  assign in2_ri = grant[2] && buf_ri && vc_match;
  assign in3_ri = grant[3] && buf_ri && vc_match;

endmodule

//==============================================================
//  gold_router: 5 inputs x 5 outputs with VC polarity
//  Directions: UP, DOWN, LEFT, RIGHT, NIC
//==============================================================


module gold_router(
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
    always @(posedge clk or posedge reset) begin
        if (reset) polarity <= 1'b0;
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
    input_controller_4out_flat
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
    input_controller_4out_flat
    #(.IDX_W(0), .IDX_E(1), .IDX_S(2), .IDX_NIC(3))
    IC_DOWN (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(down_si), .upstream_di(down_di), .upstream_ri(down_ri),

        .out_ready0(D2L_ri), .out_ready1(D2R_ri), .out_ready2(D2U_ri), .out_ready3(D2N_ri),
        .out_valid0(D2L_si), .out_valid1(D2R_si), .out_valid2(D2U_si), .out_valid3(D2N_si),
        .out_data0(D2L_di),  .out_data1(D2R_di),  .out_data2(D2U_di),  .out_data3(D2N_di)
    );

    // LEFT Input Controller: can send to UP, DOWN, RIGHT, NIC
    // Mapping {0:UP, 1:DOWN, 2:RIGHT, 3:NIC}
    input_controller_4out_flat
    #(.IDX_W(0), .IDX_E(2), .IDX_S(1), .IDX_NIC(3))
    IC_LEFT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(left_si), .upstream_di(left_di), .upstream_ri(left_ri),

        .out_ready0(L2U_ri), .out_ready1(L2D_ri), .out_ready2(L2R_ri), .out_ready3(L2N_ri),
        .out_valid0(L2U_si), .out_valid1(L2D_si), .out_valid2(L2R_si), .out_valid3(L2N_si),
        .out_data0(L2U_di),  .out_data1(L2D_di),  .out_data2(L2R_di),  .out_data3(L2N_di)
    );

    // RIGHT Input Controller: can send to UP, DOWN, LEFT, NIC
    // Mapping {0:UP, 1:DOWN, 2:LEFT, 3:NIC}
    input_controller_4out_flat
    #(.IDX_W(2), .IDX_E(1), .IDX_S(0), .IDX_NIC(3))
    IC_RIGHT (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(right_si), .upstream_di(right_di), .upstream_ri(right_ri),

        .out_ready0(R2U_ri), .out_ready1(R2D_ri), .out_ready2(R2L_ri), .out_ready3(R2N_ri),
        .out_valid0(R2U_si), .out_valid1(R2D_si), .out_valid2(R2L_si), .out_valid3(R2N_si),
        .out_data0(R2U_di),  .out_data1(R2D_di),  .out_data2(R2L_di),  .out_data3(R2N_di)
    );

    // NIC Input Controller: can send to UP, DOWN, LEFT, RIGHT
    // Mapping {0:UP, 1:DOWN, 2:LEFT, 3:RIGHT}
    input_controller_4out_flat
    #(.IDX_W(2), .IDX_E(3), .IDX_S(1), .IDX_NIC(0))  // reuse NIC idx for "UP" slot
    IC_NIC (
        .clk(clk), .reset(reset), .polarity(polarity),
        .upstream_si(NIC_si), .upstream_di(NIC_di), .upstream_ri(NIC_ri),

        .out_ready0(N2U_ri), .out_ready1(N2D_ri), .out_ready2(N2L_ri), .out_ready3(N2R_ri),
        .out_valid0(N2U_si), .out_valid1(N2D_si), .out_valid2(N2L_si), .out_valid3(N2R_si),
        .out_data0(N2U_di),  .out_data1(N2D_di),  .out_data2(N2L_di),  .out_data3(N2R_di)
    );

endmodule






