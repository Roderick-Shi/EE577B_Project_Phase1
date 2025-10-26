
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
