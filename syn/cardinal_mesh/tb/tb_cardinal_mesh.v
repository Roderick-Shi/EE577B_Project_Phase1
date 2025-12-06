`timescale 1ns/1ps

module tb_cardinal_mesh;

  // ---------------------------------------
  // Clock & Reset
  // ---------------------------------------
  reg clk, reset;
  initial clk = 1'b0;
  always #2 clk = ~clk; // 250 MHz

  initial begin
    reset = 1'b1;
    repeat (5) @(posedge clk);
    reset = 1'b0;
  end

  // ---------------------------------------
  // NIC ports for all 16 tiles (00..33)
  // (testbench-side signals)
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

  // Polarity outputs from each router to NIC (we don’t use them in tests,
  // but we wire them up for completeness)
  wire node00_polarity, node01_polarity, node02_polarity, node03_polarity;
  wire node10_polarity, node11_polarity, node12_polarity, node13_polarity;
  wire node20_polarity, node21_polarity, node22_polarity, node23_polarity;
  wire node30_polarity, node31_polarity, node32_polarity, node33_polarity;

  // ---------------------------------------
  // DUT: cardinal_mesh with nodeXY_* ports
  // ---------------------------------------
  cardinal_mesh UUT (
    .clk(clk),
    .reset(reset),

    // node00 (x=0,y=0)
    .node00_pesi    (NIC_si_00),
    .node00_pero    (NIC_ro_00),
    .node00_pedi    (NIC_di_00),
    .node00_peri    (NIC_ri_00),
    .node00_peso    (NIC_so_00),
    .node00_pedo    (NIC_do_00),
    .node00_polarity(node00_polarity),

    // node01 (x=0,y=1)
    .node01_pesi    (NIC_si_01),
    .node01_pero    (NIC_ro_01),
    .node01_pedi    (NIC_di_01),
    .node01_peri    (NIC_ri_01),
    .node01_peso    (NIC_so_01),
    .node01_pedo    (NIC_do_01),
    .node01_polarity(node01_polarity),

    // node02 (x=0,y=2)
    .node02_pesi    (NIC_si_02),
    .node02_pero    (NIC_ro_02),
    .node02_pedi    (NIC_di_02),
    .node02_peri    (NIC_ri_02),
    .node02_peso    (NIC_so_02),
    .node02_pedo    (NIC_do_02),
    .node02_polarity(node02_polarity),

    // node03 (x=0,y=3)
    .node03_pesi    (NIC_si_03),
    .node03_pero    (NIC_ro_03),
    .node03_pedi    (NIC_di_03),
    .node03_peri    (NIC_ri_03),
    .node03_peso    (NIC_so_03),
    .node03_pedo    (NIC_do_03),
    .node03_polarity(node03_polarity),

    // node10 (x=1,y=0)
    .node10_pesi    (NIC_si_10),
    .node10_pero    (NIC_ro_10),
    .node10_pedi    (NIC_di_10),
    .node10_peri    (NIC_ri_10),
    .node10_peso    (NIC_so_10),
    .node10_pedo    (NIC_do_10),
    .node10_polarity(node10_polarity),

    // node11
    .node11_pesi    (NIC_si_11),
    .node11_pero    (NIC_ro_11),
    .node11_pedi    (NIC_di_11),
    .node11_peri    (NIC_ri_11),
    .node11_peso    (NIC_so_11),
    .node11_pedo    (NIC_do_11),
    .node11_polarity(node11_polarity),

    // node12
    .node12_pesi    (NIC_si_12),
    .node12_pero    (NIC_ro_12),
    .node12_pedi    (NIC_di_12),
    .node12_peri    (NIC_ri_12),
    .node12_peso    (NIC_so_12),
    .node12_pedo    (NIC_do_12),
    .node12_polarity(node12_polarity),

    // node13
    .node13_pesi    (NIC_si_13),
    .node13_pero    (NIC_ro_13),
    .node13_pedi    (NIC_di_13),
    .node13_peri    (NIC_ri_13),
    .node13_peso    (NIC_so_13),
    .node13_pedo    (NIC_do_13),
    .node13_polarity(node13_polarity),

    // node20 (x=2,y=0)
    .node20_pesi    (NIC_si_20),
    .node20_pero    (NIC_ro_20),
    .node20_pedi    (NIC_di_20),
    .node20_peri    (NIC_ri_20),
    .node20_peso    (NIC_so_20),
    .node20_pedo    (NIC_do_20),
    .node20_polarity(node20_polarity),

    // node21
    .node21_pesi    (NIC_si_21),
    .node21_pero    (NIC_ro_21),
    .node21_pedi    (NIC_di_21),
    .node21_peri    (NIC_ri_21),
    .node21_peso    (NIC_so_21),
    .node21_pedo    (NIC_do_21),
    .node21_polarity(node21_polarity),

    // node22
    .node22_pesi    (NIC_si_22),
    .node22_pero    (NIC_ro_22),
    .node22_pedi    (NIC_di_22),
    .node22_peri    (NIC_ri_22),
    .node22_peso    (NIC_so_22),
    .node22_pedo    (NIC_do_22),
    .node22_polarity(node22_polarity),

    // node23
    .node23_pesi    (NIC_si_23),
    .node23_pero    (NIC_ro_23),
    .node23_pedi    (NIC_di_23),
    .node23_peri    (NIC_ri_23),
    .node23_peso    (NIC_so_23),
    .node23_pedo    (NIC_do_23),
    .node23_polarity(node23_polarity),

    // node30 (x=3,y=0)
    .node30_pesi    (NIC_si_30),
    .node30_pero    (NIC_ro_30),
    .node30_pedi    (NIC_di_30),
    .node30_peri    (NIC_ri_30),
    .node30_peso    (NIC_so_30),
    .node30_pedo    (NIC_do_30),
    .node30_polarity(node30_polarity),

    // node31
    .node31_pesi    (NIC_si_31),
    .node31_pero    (NIC_ro_31),
    .node31_pedi    (NIC_di_31),
    .node31_peri    (NIC_ri_31),
    .node31_peso    (NIC_so_31),
    .node31_pedo    (NIC_do_31),
    .node31_polarity(node31_polarity),

    // node32
    .node32_pesi    (NIC_si_32),
    .node32_pero    (NIC_ro_32),
    .node32_pedi    (NIC_di_32),
    .node32_peri    (NIC_ri_32),
    .node32_peso    (NIC_so_32),
    .node32_pedo    (NIC_do_32),
    .node32_polarity(node32_polarity),

    // node33
    .node33_pesi    (NIC_si_33),
    .node33_pero    (NIC_ro_33),
    .node33_pedi    (NIC_di_33),
    .node33_peri    (NIC_ri_33),
    .node33_peso    (NIC_so_33),
    .node33_pedo    (NIC_do_33),
    .node33_polarity(node33_polarity)
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
  task drive_all_ro;
    input on;
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

  task nic_send;
    input integer x;
    input integer y;
    input [63:0] flit;
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

  task wait_recv;
    input integer x;
    input integer y;
    reg done;
    begin
      done = 1'b0;
      while (!done) begin
        @(posedge clk);
        case ({y[1:0], x[1:0]})
          4'h0:  done = NIC_so_00;
          4'h1:  done = NIC_so_10;
          4'h2:  done = NIC_so_20;
          4'h3:  done = NIC_so_30;
  
          4'h4:  done = NIC_so_01;
          4'h5:  done = NIC_so_11;
          4'h6:  done = NIC_so_21;
          4'h7:  done = NIC_so_31;
  
          4'h8:  done = NIC_so_02;
          4'h9:  done = NIC_so_12;
          4'hA:  done = NIC_so_22;
          4'hB:  done = NIC_so_32;
  
          4'hC:  done = NIC_so_03;
          4'hD:  done = NIC_so_13;
          4'hE:  done = NIC_so_23;
          4'hF:  done = NIC_so_33;
        endcase
      end
      $display("T=%0t : Packet arrived at (%0d,%0d)", $time, x, y);
    end
  endtask






  // ---------------------------------------
  // Dump Waves
  // ---------------------------------------
  initial begin
    $dumpfile("cardinal_mesh.vcd");
    $dumpvars(0, tb_cardinal_mesh);
  end

  // ---------------------------------------
  // Init All NIC Interfaces
  // ---------------------------------------
  initial begin
    clear_all_inputs;
    drive_all_ro(1'b1);
  end

  // ---------------------------------------
  // Tests
  // ---------------------------------------
  initial begin
    @(negedge reset);
    $display("===== TESTS BEGIN =====");

    repeat (4) @(posedge clk);
    
    // TEST 1: 00 -> 01 (one hop up)
    $display("T1: 00->01");
    nic_send(0,0, FLIT(
                      1'b1,       // vc
                      1'b0,       // xdir (unused since hopX=0)
                      1'b0,       // ydir = 0 => Up
                      4'd0,       // hopX = 0
                      4'd1,       // hopY = 1 (one hop in Y)
                      48'h0000_0000_0001  // payload
                      ));
    wait_recv(0,1);
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

    // TEST 4: 20 -> 23 (one hop right along +X)
    $display("T4: 20->23");
    nic_send(2,0, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd3, 48'h0000_0000_00CC));
    wait_recv(2,3);
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
    
/*    // TEST 6: Many-to-one contention toward (1,1)
    $display("T6: Many-to-one contention toward (1,1)");

    // 4 packets all destined for (1,1):
    // (0,1) -> (1,1): +X
    // (2,1) -> (1,1): -X
    // (1,0) -> (1,1): +Y
    // (1,2) -> (1,1): -Y

    fork
      // From (0,1) to (1,1): +X one hop
      begin
        nic_send(0,1, FLIT(
                          1'b1,      // vc
                          1'b0,      // xdir = Right
                          1'b0,      // ydir (unused, hopY=0)
                          4'd1,      // hopX = 1
                          4'd0,      // hopY = 0
                          48'h0000_0000_C601
                        ));
      end

      // From (2,1) to (1,1): -X one hop
      begin
        nic_send(2,1, FLIT(
                          1'b1,
                          1'b1,      // xdir = Left
                          1'b0,      // ydir (unused)
                          4'd1,      // hopX = 1
                          4'd0,      // hopY = 0
                          48'h0000_0000_C602
                        ));
      end

      // From (1,0) to (1,1): +Y one hop
      begin
        nic_send(1,0, FLIT(
                          1'b1,
                          1'b0,      // xdir (unused, hopX=0)
                          1'b0,      // ydir = Up
                          4'd0,      // hopX = 0
                          4'd1,      // hopY = 1
                          48'h0000_0000_C603
                        ));
      end

      // From (1,2) to (1,1): -Y one hop
      begin
        nic_send(1,2, FLIT(
                          1'b1,
                          1'b0,      // xdir (unused, hopX=0)
                          1'b1,      // ydir = Down
                          4'd0,      // hopX = 0
                          4'd1,      // hopY = 1
                          48'h0000_0000_C604
                        ));
      end
    join

    // We expect 4 arrivals *at (1,1)*, in some order
    wait_recv(1,1);
    wait_recv(1,1);
    wait_recv(1,1);
    wait_recv(1,1);

    repeat (8) @(posedge clk);

*/

    
    // TEST 7: 01 -> 00 (one hop down)
    $display("T7: 01->00");
    nic_send(0,1, FLIT(
                      1'b1,      // vc
                      1'b0,      // xdir (unused, hopX=0)
                      1'b1,      // ydir = 1 => Down
                      4'd0,      // hopX = 0
                      4'd1,      // hopY = 1
                      48'h0000_0000_D00A 
                    ));
    wait_recv(0,0);
    repeat (4) @(posedge clk);
      
    // TEST 8: 11 -> 22 (interior, +X and +Y)
    $display("T8: 11->22");
    nic_send(1,1, FLIT(
                      1'b1,
                      1'b0,      // xdir = Right
                      1'b0,      // ydir = Up
                      4'd1,      // hopX = 1
                      4'd1,      // hopY = 1
                      48'h0000_0000_1E11
                    ));
    wait_recv(2,2);
    repeat (4) @(posedge clk);
  
    // TEST 9: pipeline two packets 00->33
    $display("T9: pipeline 00->33");
    nic_send(0,0, FLIT(1'b1, 1'b0, 1'b0, 4'd3, 4'd3, 48'h0000_0000_AA01));
    nic_send(0,0, FLIT(1'b1, 1'b0, 1'b0, 4'd3, 4'd3, 48'h0000_0000_AA02));
    wait_recv(3,3);  // first
    wait_recv(3,3);  // second
    repeat (8) @(posedge clk);
  
    $display("===== TESTS END =====");
    $finish;
  end
  
  // Debug monitor: prints any NIC output with non-zero payload in TEST 6+
  always @(posedge clk) begin
    if (!reset) begin
      if (NIC_so_11)
        $display("MONITOR: (1,1) got flit %h at T=%0t", NIC_do_11, $time);
      if (NIC_so_01)
        $display("MONITOR: (0,1) got flit %h at T=%0t", NIC_do_01, $time);
      if (NIC_so_21)
        $display("MONITOR: (2,1) got flit %h at T=%0t", NIC_do_21, $time);
      if (NIC_so_10)
        $display("MONITOR: (1,0) got flit %h at T=%0t", NIC_do_10, $time);
      if (NIC_so_12)
        $display("MONITOR: (1,2) got flit %h at T=%0t", NIC_do_12, $time);
    end
  end
  
    

endmodule

