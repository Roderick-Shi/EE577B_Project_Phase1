`timescale 1ns/1ps

module tb_cardinal_router;
  reg clk, reset;

  // Inputs to router
  reg  NIB_si, SIB_si, WIB_si, EIB_si, PEIB_si;
  reg  [63:0] NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di;

  // Readies back to sources
  wire NIB_ri, SIB_ri, WIB_ri, EIB_ri, PEIB_ri;

  // Outputs of router
  wire NOB_so, SOB_so, WOB_so, EOB_so, PEOB_so;
  wire [63:0] NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do;

  // Downstream readies (always ready here)
  reg  NOB_ro, SOB_ro, WOB_ro, EOB_ro, PEOB_ro;

  wire polarity_to_NIC;

  // ====== DUT ======
  cardinal_router uut (
    .clk(clk), .reset(reset),

    .up_si(NIB_si), .down_si(SIB_si), .left_si(WIB_si), .right_si(EIB_si), .NIC_si(PEIB_si),
    .up_di(NIB_di), .down_di(SIB_di), .left_di(WIB_di), .right_di(EIB_di), .NIC_di(PEIB_di),
    .up_ri(NIB_ri), .down_ri(SIB_ri), .left_ri(WIB_ri), .right_ri(EIB_ri), .NIC_ri(PEIB_ri),

    .up_so(NOB_so), .down_so(SOB_so), .left_so(WOB_so), .right_so(EOB_so), .NIC_so(PEOB_so),
    .up_do(NOB_do), .down_do(SOB_do), .left_do(WOB_do), .right_do(EOB_do), .NIC_do(PEOB_do),
    .up_ro(NOB_ro), .down_ro(SOB_ro), .left_ro(WOB_ro), .right_ro(EOB_ro), .NIC_ro(PEOB_ro),

    .polarity_to_NIC(polarity_to_NIC)
  );

  // 250 MHz clock
  initial clk = 0;
  always #2 clk = ~clk;

  // Verilog-2001 FLIT builder
  function [63:0] FLIT;
    input vc;
    input xdir;
    input ydir;
    input [3:0] hopX;
    input [3:0] hopY;
    input [47:0] payload;
    begin
      FLIT = {vc, xdir, ydir, 5'b00000, hopX, hopY, payload};
    end
  endfunction

  // Task: send one flit
  task send_on;
    input [2:0] which; // 0=N,1=S,2=W,3=E,4=NIC
    input [63:0] data;
    begin
      case (which)
        3'd0: while (!NIB_ri) @(posedge clk);
        3'd1: while (!SIB_ri) @(posedge clk);
        3'd2: while (!WIB_ri) @(posedge clk);
        3'd3: while (!EIB_ri) @(posedge clk);
        3'd4: while (!PEIB_ri) @(posedge clk);
      endcase

      @(negedge clk);
      case (which)
        3'd0: begin NIB_di=data; NIB_si=1; end
        3'd1: begin SIB_di=data; SIB_si=1; end
        3'd2: begin WIB_di=data; WIB_si=1; end
        3'd3: begin EIB_di=data; EIB_si=1; end
        3'd4: begin PEIB_di=data; PEIB_si=1; end
      endcase

      @(posedge clk);
      NIB_si<=0; SIB_si<=0; WIB_si<=0; EIB_si<=0; PEIB_si<=0;
    end
  endtask

  // Dump waves
  initial begin
    $dumpfile("cardinal_router.vcd");
    $dumpvars(0, tb_cardinal_router);
  end

  initial begin
    $display("===== TEST BEGIN =====");

      $monitor("T=%0t | N:%h S:%h W:%h E:%h NIC:%h || OUT N:%h(%b) S:%h(%b) W:%h(%b) E:%h(%b) NIC:%h(%b)",
         $time, NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di,
         NOB_do, NOB_so, SOB_do, SOB_so, WOB_do, WOB_so,
         EOB_do, EOB_so, PEOB_do, PEOB_so);


  end

  // Stimulus
  initial begin
    // defaults
    NIB_si=0; SIB_si=0; WIB_si=0; EIB_si=0; PEIB_si=0;
    NIB_di=0; SIB_di=0; WIB_di=0; EIB_di=0; PEIB_di=0;

    NOB_ro=1; SOB_ro=1; WOB_ro=1; EOB_ro=1; PEOB_ro=1;

    reset = 1;
    repeat(4) @(posedge clk);
    reset = 0;

    // 1) S ? Up x-first policy
    send_on(1, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd2, 48'h0));


    // 2) N ? Down
    send_on(0, FLIT(1'b1, 1'b0, 1'b1, 4'd0, 4'd2, 48'h0));

    // 3) W ? Right then Down
    send_on(2, FLIT(1'b1, 1'b0, 1'b1, 4'd3, 4'd1, 48'h0));

    // 4) E ? Left then Up
    send_on(3, FLIT(1'b1, 1'b1, 1'b0, 4'd2, 4'd1, 48'h0));

    // 5) NIC ? East
    send_on(4, FLIT(1'b1, 1'b0, 1'b1, 4'd2, 4'd2, 48'h0));
    
    // 6) Local delivery test:
    // hopX = 0, hopY = 0 ? must go to NIC output directly
    // VC=1, Xdir=don't care, Ydir=don't care
    send_on(1, FLIT(1'b1, 1'b0, 1'b0, 4'd0, 4'd0, 48'hDEAD_BEEF_CAFE));


    repeat(40) @(posedge clk);
    $display("===== TEST DONE =====");
    $finish;
  end
  
  //-----------------------------------------------------
  // DEBUG LOGGING BLOCK � ADD THIS BEFORE `endmodule`
  //-----------------------------------------------------
  initial begin : DEBUG_LOG
      integer fd;
      fd = $fopen("router_debug.log", "w");
  
      // Single-line header string
      $fwrite(fd,
          "TIME | S.si S.ri | S.di | IC_DOWN: ib_so ib_en sel[3:0] D2L D2R D2U D2N | OC_UP: req[3:0] grant[3:0] push so do\n"
      );
  
      // Log every cycle AFTER reset
      forever begin
          @(posedge clk);
          if (!reset) begin
              $fwrite(fd,
                  "%0t | %b   %b   | %h | %b     %b     %b%b%b%b   %b   %b   %b   %b | %b%b%b%b   %b%b%b%b   %b     %b   %h\n",
  
                  // TIME
                  $time,
  
                  // ----- TB INPUT (DOWN/S) -----
                  SIB_si,
                  SIB_ri,
                  SIB_di,
  
                  // ----- IC_DOWN -----
                  uut.IC_DOWN.ib_so,
                  uut.IC_DOWN.ib_en,
                  uut.IC_DOWN.sel[3], uut.IC_DOWN.sel[2],
                  uut.IC_DOWN.sel[1], uut.IC_DOWN.sel[0],
                  uut.D2L_si, uut.D2R_si, uut.D2U_si, uut.D2N_si,
  
                  // ----- OC_UP -----
                  uut.OC_UP.req[3], uut.OC_UP.req[2],
                  uut.OC_UP.req[1], uut.OC_UP.req[0],
  
                  uut.OC_UP.grant[3], uut.OC_UP.grant[2],
                  uut.OC_UP.grant[1], uut.OC_UP.grant[0],
  
                  uut.OC_UP.push_to_buf,
  
                  uut.up_so,
                  uut.up_do
              );
          end
      end
  end



  
endmodule