`timescale 1ns/1ps

module tb_gold_mesh;

  // ---------------------------------------
  // Clock & Reset
  // ---------------------------------------
  reg clk, reset, polarity;
  initial clk = 1'b0;
  always #2 clk = ~clk; // 250 MHz

  initial begin
    reset    = 1'b1;
    polarity = 1'b0; // mesh input; routers toggle internally anyway
    repeat (5) @(posedge clk);
    reset = 1'b0;
  end

  // ---------------------------------------
  // NIC ports for all 16 tiles (00..33)
  // ---------------------------------------
  reg        NIC_si_00, NIC_si_01, NIC_si_02, NIC_si_03;
  reg        NIC_si_10, NIC_si_11, NIC_si_12, NIC_si_13;
  reg        NIC_si_20, NIC_si_21, NIC_si_22, NIC_si_23;
  reg        NIC_si_30, NIC_si_31, NIC_si_32, NIC_si_33;

  reg  [63:0] NIC_di_00, NIC_di_01, NIC_di_02, NIC_di_03;
  reg  [63:0] NIC_di_10, NIC_di_11, NIC_di_12, NIC_di_13;
  reg  [63:0] NIC_di_20, NIC_di_21, NIC_di_22, NIC_di_23;
  reg  [63:0] NIC_di_30, NIC_di_31, NIC_di_32, NIC_di_33;

  wire       NIC_ri_00, NIC_ri_01, NIC_ri_02, NIC_ri_03;
  wire       NIC_ri_10, NIC_ri_11, NIC_ri_12, NIC_ri_13;
  wire       NIC_ri_20, NIC_ri_21, NIC_ri_22, NIC_ri_23;
  wire       NIC_ri_30, NIC_ri_31, NIC_ri_32, NIC_ri_33;

  wire       NIC_so_00, NIC_so_01, NIC_so_02, NIC_so_03;
  wire       NIC_so_10, NIC_so_11, NIC_so_12, NIC_so_13;
  wire       NIC_so_20, NIC_so_21, NIC_so_22, NIC_so_23;
  wire       NIC_so_30, NIC_so_31, NIC_so_32, NIC_so_33;

  wire [63:0] NIC_do_00, NIC_do_01, NIC_do_02, NIC_do_03;
  wire [63:0] NIC_do_10, NIC_do_11, NIC_do_12, NIC_do_13;
  wire [63:0] NIC_do_20, NIC_do_21, NIC_do_22, NIC_do_23;
  wire [63:0] NIC_do_30, NIC_do_31, NIC_do_32, NIC_do_33;

  reg       NIC_ro_00, NIC_ro_01, NIC_ro_02, NIC_ro_03;
  reg       NIC_ro_10, NIC_ro_11, NIC_ro_12, NIC_ro_13;
  reg       NIC_ro_20, NIC_ro_21, NIC_ro_22, NIC_ro_23;
  reg       NIC_ro_30, NIC_ro_31, NIC_ro_32, NIC_ro_33;

  // ---------------------------------------
  // DUT
  // ---------------------------------------
  gold_mesh UUT (
    .clk(clk), .reset(reset), .polarity(polarity),

    .NIC_si_00(NIC_si_00), .NIC_si_01(NIC_si_01), .NIC_si_02(NIC_si_02), .NIC_si_03(NIC_si_03),
    .NIC_si_10(NIC_si_10), .NIC_si_11(NIC_si_11), .NIC_si_12(NIC_si_12), .NIC_si_13(NIC_si_13),
    .NIC_si_20(NIC_si_20), .NIC_si_21(NIC_si_21), .NIC_si_22(NIC_si_22), .NIC_si_23(NIC_si_23),
    .NIC_si_30(NIC_si_30), .NIC_si_31(NIC_si_31), .NIC_si_32(NIC_si_32), .NIC_si_33(NIC_si_33),

    .NIC_di_00(NIC_di_00), .NIC_di_01(NIC_di_01), .NIC_di_02(NIC_di_02), .NIC_di_03(NIC_di_03),
    .NIC_di_10(NIC_di_10), .NIC_di_11(NIC_di_11), .NIC_di_12(NIC_di_12), .NIC_di_13(NIC_di_13),
    .NIC_di_20(NIC_di_20), .NIC_di_21(NIC_di_21), .NIC_di_22(NIC_di_22), .NIC_di_23(NIC_di_23),
    .NIC_di_30(NIC_di_30), .NIC_di_31(NIC_di_31), .NIC_di_32(NIC_di_32), .NIC_di_33(NIC_di_33),

    .NIC_ri_00(NIC_ri_00), .NIC_ri_01(NIC_ri_01), .NIC_ri_02(NIC_ri_02), .NIC_ri_03(NIC_ri_03),
    .NIC_ri_10(NIC_ri_10), .NIC_ri_11(NIC_ri_11), .NIC_ri_12(NIC_ri_12), .NIC_ri_13(NIC_ri_13),
    .NIC_ri_20(NIC_ri_20), .NIC_ri_21(NIC_ri_21), .NIC_ri_22(NIC_ri_22), .NIC_ri_23(NIC_ri_23),
    .NIC_ri_30(NIC_ri_30), .NIC_ri_31(NIC_ri_31), .NIC_ri_32(NIC_ri_32), .NIC_ri_33(NIC_ri_33),

    .NIC_so_00(NIC_so_00), .NIC_so_01(NIC_so_01), .NIC_so_02(NIC_so_02), .NIC_so_03(NIC_so_03),
    .NIC_so_10(NIC_so_10), .NIC_so_11(NIC_so_11), .NIC_so_12(NIC_so_12), .NIC_so_13(NIC_so_13),
    .NIC_so_20(NIC_so_20), .NIC_so_21(NIC_so_21), .NIC_so_22(NIC_so_22), .NIC_so_23(NIC_so_23),
    .NIC_so_30(NIC_so_30), .NIC_so_31(NIC_so_31), .NIC_so_32(NIC_so_32), .NIC_so_33(NIC_so_33),

    .NIC_do_00(NIC_do_00), .NIC_do_01(NIC_do_01), .NIC_do_02(NIC_do_02), .NIC_do_03(NIC_do_03),
    .NIC_do_10(NIC_do_10), .NIC_do_11(NIC_do_11), .NIC_do_12(NIC_do_12), .NIC_do_13(NIC_do_13),
    .NIC_do_20(NIC_do_20), .NIC_do_21(NIC_do_21), .NIC_do_22(NIC_do_22), .NIC_do_23(NIC_do_23),
    .NIC_do_30(NIC_do_30), .NIC_do_31(NIC_do_31), .NIC_do_32(NIC_do_32), .NIC_do_33(NIC_do_33),

    .NIC_ro_00(NIC_ro_00), .NIC_ro_01(NIC_ro_01), .NIC_ro_02(NIC_ro_02), .NIC_ro_03(NIC_ro_03),
    .NIC_ro_10(NIC_ro_10), .NIC_ro_11(NIC_ro_11), .NIC_ro_12(NIC_ro_12), .NIC_ro_13(NIC_ro_13),
    .NIC_ro_20(NIC_ro_20), .NIC_ro_21(NIC_ro_21), .NIC_ro_22(NIC_ro_22), .NIC_ro_23(NIC_ro_23),
    .NIC_ro_30(NIC_ro_30), .NIC_ro_31(NIC_ro_31), .NIC_ro_32(NIC_ro_32), .NIC_ro_33(NIC_ro_33)
  );

  // ---------------------------------------
  // Helper Flit Constructor
  // ---------------------------------------
  function [63:0] FLIT;
    input vc, xdir, ydir;
    input [3:0] hopX;
    input [3:0] hopY;
    input [47:0] payload;
  begin
    FLIT = {vc, xdir, ydir, 5'b0, hopX, hopY, payload};
  end
  endfunction

  // ---------------------------------------
  // Tasks
  // ---------------------------------------
  task drive_all_ro(input bit on);
  begin
    NIC_ro_00=on; NIC_ro_01=on; NIC_ro_02=on; NIC_ro_03=on;
    NIC_ro_10=on; NIC_ro_11=on; NIC_ro_12=on; NIC_ro_13=on;
    NIC_ro_20=on; NIC_ro_21=on; NIC_ro_22=on; NIC_ro_23=on;
    NIC_ro_30=on; NIC_ro_31=on; NIC_ro_32=on; NIC_ro_33=on;
  end
  endtask

  task clear_all_inputs;
  begin
    NIC_si_00=0; NIC_si_01=0; NIC_si_02=0; NIC_si_03=0;
    NIC_si_10=0; NIC_si_11=0; NIC_si_12=0; NIC_si_13=0;
    NIC_si_20=0; NIC_si_21=0; NIC_si_22=0; NIC_si_23=0;
    NIC_si_30=0; NIC_si_31=0; NIC_si_32=0; NIC_si_33=0;

    NIC_di_00=0; NIC_di_01=0; NIC_di_02=0; NIC_di_03=0;
    NIC_di_10=0; NIC_di_11=0; NIC_di_12=0; NIC_di_13=0;
    NIC_di_20=0; NIC_di_21=0; NIC_di_22=0; NIC_di_23=0;
    NIC_di_30=0; NIC_di_31=0; NIC_di_32=0; NIC_di_33=0;
  end
  endtask

  task nic_send(input integer x, input integer y, input [63:0] flit);
  begin
    @(negedge clk);
    if (reset) @(negedge clk);

    case ({y[1:0],x[1:0]})
      4'h0: begin while(!NIC_ri_00) @(posedge clk); @(negedge clk); NIC_di_00=flit; NIC_si_00=1; @(posedge clk); NIC_si_00=0; end
      4'h1: begin while(!NIC_ri_10) @(posedge clk); @(negedge clk); NIC_di_10=flit; NIC_si_10=1; @(posedge clk); NIC_si_10=0; end
      4'h2: begin while(!NIC_ri_20) @(posedge clk); @(negedge clk); NIC_di_20=flit; NIC_si_20=1; @(posedge clk); NIC_si_20=0; end
      4'h3: begin while(!NIC_ri_30) @(posedge clk); @(negedge clk); NIC_di_30=flit; NIC_si_30=1; @(posedge clk); NIC_si_30=0; end

      4'h4: begin while(!NIC_ri_01) @(posedge clk); @(negedge clk); NIC_di_01=flit; NIC_si_01=1; @(posedge clk); NIC_si_01=0; end
      4'h5: begin while(!NIC_ri_11) @(posedge clk); @(negedge clk); NIC_di_11=flit; NIC_si_11=1; @(posedge clk); NIC_si_11=0; end
      4'h6: begin while(!NIC_ri_21) @(posedge clk); @(negedge clk); NIC_di_21=flit; NIC_si_21=1; @(posedge clk); NIC_si_21=0; end
      4'h7: begin while(!NIC_ri_31) @(posedge clk); @(negedge clk); NIC_di_31=flit; NIC_si_31=1; @(posedge clk); NIC_si_31=0; end

      4'h8: begin while(!NIC_ri_02) @(posedge clk); @(negedge clk); NIC_di_02=flit; NIC_si_02=1; @(posedge clk); NIC_si_02=0; end
      4'h9: begin while(!NIC_ri_12) @(posedge clk); @(negedge clk); NIC_di_12=flit; NIC_si_12=1; @(posedge clk); NIC_si_12=0; end
      4'hA: begin while(!NIC_ri_22) @(posedge clk); @(negedge clk); NIC_di_22=flit; NIC_si_22=1; @(posedge clk); NIC_si_22=0; end
      4'hB: begin while(!NIC_ri_32) @(posedge clk); @(negedge clk); NIC_di_32=flit; NIC_si_32=1; @(posedge clk); NIC_si_32=0; end

      4'hC: begin while(!NIC_ri_03) @(posedge clk); @(negedge clk); NIC_di_03=flit; NIC_si_03=1; @(posedge clk); NIC_si_03=0; end
      4'hD: begin while(!NIC_ri_13) @(posedge clk); @(negedge clk); NIC_di_13=flit; NIC_si_13=1; @(posedge clk); NIC_si_13=0; end
      4'hE: begin while(!NIC_ri_23) @(posedge clk); @(negedge clk); NIC_di_23=flit; NIC_si_23=1; @(posedge clk); NIC_si_23=0; end
      4'hF: begin while(!NIC_ri_33) @(posedge clk); @(negedge clk); NIC_di_33=flit; NIC_si_33=1; @(posedge clk); NIC_si_33=0; end
    endcase
  end
  endtask

  task wait_recv(input integer x, input integer y);
  begin
    case ({y[1:0],x[1:0]})
      4'h0: begin while(!NIC_so_00) @(posedge clk); end
      4'h1: begin while(!NIC_so_10) @(posedge clk); end
      4'h2: begin while(!NIC_so_20) @(posedge clk); end
      4'h3: begin while(!NIC_so_30) @(posedge clk); end
      4'h4: begin while(!NIC_so_01) @(posedge clk); end
      4'h5: begin while(!NIC_so_11) @(posedge clk); end
      4'h6: begin while(!NIC_so_21) @(posedge clk); end
      4'h7: begin while(!NIC_so_31) @(posedge clk); end
      4'h8: begin while(!NIC_so_02) @(posedge clk); end
      4'h9: begin while(!NIC_so_12) @(posedge clk); end
      4'hA: begin while(!NIC_so_22) @(posedge clk); end
      4'hB: begin while(!NIC_so_32) @(posedge clk); end
      4'hC: begin while(!NIC_so_03) @(posedge clk); end
      4'hD: begin while(!NIC_so_13) @(posedge clk); end
      4'hE: begin while(!NIC_so_23) @(posedge clk); end
      4'hF: begin while(!NIC_so_33) @(posedge clk); end
    endcase
    $display("T=%0t : Packet arrived at (%0d,%0d)", $time, x, y);
  end
  endtask

  // ---------------------------------------
  // Dump Waves
  // ---------------------------------------
  initial begin
    $dumpfile("gold_mesh.vcd");
    $dumpvars(0, tb_gold_mesh);
  end

  // ---------------------------------------
  // Init All NIC Interfaces
  // ---------------------------------------
  initial begin
    clear_all_inputs();
    drive_all_ro(1'b1);
  end

  // ---------------------------------------
  // Tests
  // ---------------------------------------
  initial begin
    @(negedge reset);
    $display("===== TESTS BEGIN =====");

    repeat (4) @(posedge clk);

    // TEST 2: 00 -> 33
    $display("T2: 00->33");
    nic_send(0,0, FLIT(1'b1, 1'b0, 1'b0, 4'd3, 4'd3, 48'h0000_0000_00AA));
    wait_recv(3,3);
    repeat (4) @(posedge clk);

    // TEST 3: 30 -> 03
    $display("T3: 30->03");
    nic_send(3,0, FLIT(1'b1, 1'b1, 1'b0, 4'd3, 4'd3, 48'h0000_0000_00BB));
    wait_recv(0,3);
    repeat (4) @(posedge clk);

    // TEST 4: 20 -> 23 (used right 1 hop; your wait was 3,0 — I preserved it)
    $display("T4: 20->23");
    nic_send(2,0, FLIT(1'b1, 1'b0, 1'b0, 4'd1, 4'd0, 48'h0000_0000_00CC));
    wait_recv(3,0);
    repeat (4) @(posedge clk);

    // TEST 5: Backpressure
    $display("T5: Backpressure (10->11), hold ro low then release");
    NIC_ro_11 = 1'b0;
    @(posedge clk);
    nic_send(1,0, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd1, 48'h0000_0000_B10B));
    repeat (10) @(posedge clk);
    NIC_ro_11 = 1'b1;
    wait_recv(1,1);
    repeat (4) @(posedge clk);

    // TEST 6: Contention
    $display("T6: Contention toward (3,1)");
    fork
      nic_send(1,1, FLIT(1'b1, 1'b0, 1'b0, 4'd2, 4'd0, 48'h0000_0000_CA11));
      nic_send(3,1, FLIT(1'b1, 1'b1, 1'b0, 4'd0, 4'd0, 48'h0000_0000_CB22));
    join
    wait_recv(3,1);
    repeat (8) @(posedge clk);

    $display("===== TESTS END =====");
    $finish;
  end
endmodule
