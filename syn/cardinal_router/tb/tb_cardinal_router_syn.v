`timescale 1ns/1ps

// Include standard-cell library for gate-level netlist
`include "./include/gscl45nm.v"

//============================================================
// tb_cardinal_router_syn
//  - Pure gate-level testbench for cardinal_router_syn
//  - No RTL instance, no comparison logic
//  - Optional SDF back-annotation with USE_SDF
//============================================================

module tb_cardinal_router_syn;

  reg clk, reset;

  // Inputs to router
  reg        NIB_si, SIB_si, WIB_si, EIB_si, PEIB_si;
  reg [63:0] NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di;

  // Readies back to sources
  wire NIB_ri, SIB_ri, WIB_ri, EIB_ri, PEIB_ri;

  // Outputs of router
  wire       NOB_so, SOB_so, WOB_so, EOB_so, PEOB_so;
  wire [63:0] NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do;

  // Downstream readies (always ready here)
  reg  NOB_ro, SOB_ro, WOB_ro, EOB_ro, PEOB_ro;

  wire polarity_to_NIC;

  //==========================================================
  // DUT: post-synthesis gate-level router
  //  If your netlist module is not called 'cardinal_router_syn',
  //  change the name here to match the module in your netlist.
  //==========================================================
  cardinal_router uut (
    .clk(clk),
    .reset(reset),

    .up_si   (NIB_si),
    .down_si (SIB_si),
    .left_si (WIB_si),
    .right_si(EIB_si),
    .NIC_si  (PEIB_si),

    .up_di   (NIB_di),
    .down_di (SIB_di),
    .left_di (WIB_di),
    .right_di(EIB_di),
    .NIC_di  (PEIB_di),

    .up_ri   (NIB_ri),
    .down_ri (SIB_ri),
    .left_ri (WIB_ri),
    .right_ri(EIB_ri),
    .NIC_ri  (PEIB_ri),

    .up_so   (NOB_so),
    .down_so (SOB_so),
    .left_so (WOB_so),
    .right_so(EOB_so),
    .NIC_so  (PEOB_so),

    .up_do   (NOB_do),
    .down_do (SOB_do),
    .left_do (WOB_do),
    .right_do(EOB_do),
    .NIC_do  (PEOB_do),

    .up_ro   (NOB_ro),
    .down_ro (SOB_ro),
    .left_ro (WOB_ro),
    .right_ro(EOB_ro),
    .NIC_ro  (PEOB_ro),

    .polarity_to_NIC(polarity_to_NIC)
  );

`ifdef USE_SDF
  // Optional SDF back-annotation
  // Make sure the SDF file name/path is correct.
  initial begin
    $display("INFO: SDF annotation on uut (cardinal_router_syn)");
    $sdf_annotate("cardinal_router_syn.sdf", uut);
  end
`endif

  //==========================================================
  // 250 MHz clock
  //==========================================================
  initial clk = 1'b0;
  always #4 clk = ~clk;

  //==========================================================
  // FLIT builder (same as RTL testbench)
  //==========================================================
  function [63:0] FLIT;
    input       vc;
    input       xdir;
    input       ydir;
    input [3:0] hopX;
    input [3:0] hopY;
    input [47:0] payload;
    begin
      FLIT = {vc, xdir, ydir, 5'b00000, hopX, hopY, payload};
    end
  endfunction

  //==========================================================
  // Task: send one flit
  // which: 0=N,1=S,2=W,3=E,4=NIC
  //==========================================================
  task send_on;
    input [2:0] which;
    input [63:0] data;
    begin
      case (which)
        3'd0: while (!NIB_ri)  @(posedge clk);
        3'd1: while (!SIB_ri)  @(posedge clk);
        3'd2: while (!WIB_ri)  @(posedge clk);
        3'd3: while (!EIB_ri)  @(posedge clk);
        3'd4: while (!PEIB_ri) @(posedge clk);
      endcase

      @(negedge clk);
      case (which)
        3'd0: begin NIB_di = data; NIB_si = 1'b1; end
        3'd1: begin SIB_di = data; SIB_si = 1'b1; end
        3'd2: begin WIB_di = data; WIB_si = 1'b1; end
        3'd3: begin EIB_di = data; EIB_si = 1'b1; end
        3'd4: begin PEIB_di = data; PEIB_si = 1'b1; end
      endcase

      @(posedge clk);
      NIB_si <= 1'b0;
      SIB_si <= 1'b0;
      WIB_si <= 1'b0;
      EIB_si <= 1'b0;
      PEIB_si <= 1'b0;
    end
  endtask

  //==========================================================
  // Wave dump
  //==========================================================
  initial begin
    $dumpfile("cardinal_router_syn.vcd");
    $dumpvars(0, tb_cardinal_router_syn);
  end

  //==========================================================
  // Monitor
  //==========================================================
  initial begin
    $display("===== tb_cardinal_router_syn START =====");
    $monitor("T=%0t | IN  U:%b(%h) D:%b(%h) L:%b(%h) R:%b(%h) NIC:%b(%h) | OUT U:%b(%h) D:%b(%h) L:%b(%h) R:%b(%h) NIC:%b(%h)",
      $time,
      NIB_si, NIB_di,
      SIB_si, SIB_di,
      WIB_si, WIB_di,
      EIB_si, EIB_di,
      PEIB_si, PEIB_di,
      NOB_so, NOB_do,
      SOB_so, SOB_do,
      WOB_so, WOB_do,
      EOB_so, EOB_do,
      PEOB_so, PEOB_do
    );
  end

  //==========================================================
  // Stimulus (same pattern as RTL tb)
  //==========================================================
  initial begin
    // defaults
    NIB_si = 0; SIB_si = 0; WIB_si = 0; EIB_si = 0; PEIB_si = 0;
    NIB_di = 0; SIB_di = 0; WIB_di = 0; EIB_di = 0; PEIB_di = 0;

    NOB_ro = 1; SOB_ro = 1; WOB_ro = 1; EOB_ro = 1; PEOB_ro = 1;

    reset = 1'b1;
    repeat (4) @(posedge clk);
    reset = 1'b0;

    // 1) S -> Up (hopY = 2)
    send_on(3'd1, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd2, 48'h0));

    // 2) N -> Down
    send_on(3'd0, FLIT(1'b1, 1'b0, 1'b1, 4'd0, 4'd2, 48'h0));

    // 3) W -> Right then Down (first hop Right)
    send_on(3'd2, FLIT(1'b1, 1'b0, 1'b1, 4'd3, 4'd1, 48'h0));

    // 4) E -> Left then Up (first hop Left)
    send_on(3'd3, FLIT(1'b1, 1'b1, 1'b0, 4'd2, 4'd1, 48'h0));

    // 5) NIC -> East
    send_on(3'd4, FLIT(1'b1, 1'b0, 1'b1, 4'd2, 4'd2, 48'h0));

    // 6) Local delivery to NIC (hopX = 0, hopY = 0)
    send_on(3'd1, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd0, 48'hDEAD_BEEF_CAFE));

    repeat (40) @(posedge clk);
    $display("===== tb_cardinal_router_syn DONE =====");
    $finish;
  end

endmodule
