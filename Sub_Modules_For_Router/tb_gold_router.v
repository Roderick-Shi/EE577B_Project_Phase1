`timescale 1ns/1ns

module tb_gold_router;

  reg clk, reset;
  reg NIB_si, SIB_si, WIB_si, EIB_si, PEIB_si;
  reg [63:0] NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di;
  wire NIB_ri, SIB_ri, WIB_ri, EIB_ri, PEIB_ri;
  wire NOB_so, SOB_so, WOB_so, EOB_so, PEOB_so;
  wire [63:0] NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do;
  reg  NOB_ro, SOB_ro, WOB_ro, EOB_ro, PEOB_ro;
  wire polarity_to_NIC;

  integer fd;

  //----------------------------------------
  // Flit Construction Helper
  //----------------------------------------
  function [63:0] make_flit;
    input vc;
    input dirX;  // 0=Right, 1=Left
    input dirY;  // 0=Up,    1=Down
    input [3:0] hopX;
    input [3:0] hopY;
  begin
    make_flit = { vc,
                  dirX, dirY,
                  5'b0,       // reserved [60:56]
                  hopX, hopY, // [55:48]
                  48'b0 };    // payload for now
  end
  endfunction


  //----------------------------------------
  // DUT
  //----------------------------------------
  gold_router uut (
      .clk(clk),
      .reset(reset),
      .up_si(NIB_si), .down_si(SIB_si), .left_si(WIB_si), .right_si(EIB_si), .NIC_si(PEIB_si),
      .up_di(NIB_di), .down_di(SIB_di), .left_di(WIB_di), .right_di(EIB_di), .NIC_di(PEIB_di),
      .up_ri(NIB_ri), .down_ri(SIB_ri), .left_ri(WIB_ri), .right_ri(EIB_ri), .NIC_ri(PEIB_ri),
      .up_so(NOB_so), .down_so(SOB_so), .left_so(WOB_so), .right_so(EOB_so), .NIC_so(PEOB_so),
      .up_do(NOB_do), .down_do(SOB_do), .left_do(WOB_do), .right_do(EOB_do), .NIC_do(PEOB_do),
      .up_ro(NOB_ro), .down_ro(SOB_ro), .left_ro(WOB_ro), .right_ro(EOB_ro), .NIC_ro(PEOB_ro),
      .polarity_to_NIC(polarity_to_NIC)
  );


  //----------------------------------------
  // Clock
  //----------------------------------------
  initial begin
    clk = 0;
    forever #2 clk = ~clk; //250MHz
  end


  //----------------------------------------
  // Main Stimulus
  //----------------------------------------
  initial begin
    fd = $fopen("tb_gold_router.txt","w");

    {NIB_si,SIB_si,WIB_si,EIB_si,PEIB_si} = 5'b0;
    {NIB_di,SIB_di,WIB_di,EIB_di,PEIB_di} = 0;
    {NOB_ro,SOB_ro,WOB_ro,EOB_ro,PEOB_ro} = 5'b1; // allow output initially

    reset = 1'b1;
    #16 reset = 1'b0;

    $display("===== TEST START =====");

    //-------------------------------------------------
    // CASE 1: South → Up (Y direction)
    //-------------------------------------------------
    SIB_si = 1;
    SIB_di = make_flit(1, 0, 0, 4'd0, 4'd3);  // hopY=3 upward
    #8 SIB_si = 0;

    //-------------------------------------------------
    // CASE 2: North → Down (Y direction)
    //-------------------------------------------------
    NIB_si = 1;
    NIB_di = make_flit(1, 0, 1, 4'd0, 4'd3);  // hopY=3 downward
    #8 NIB_si = 0;

    //-------------------------------------------------
    // CASE 3: East → West → Up (X then Y)
    //-------------------------------------------------
    EIB_si = 1;
    EIB_di = make_flit(1, 1, 0, 4'd2, 4'd1);  // 2 left, then up
    #8 EIB_si = 0;

    //-------------------------------------------------
    // CASE 4: West → East → PE (local)
    //-------------------------------------------------
    WIB_si = 1;
    WIB_di = make_flit(1, 0, 1, 4'd1, 4'd0);  // 1 right then NIC
    #8 WIB_si = 0;

    //-------------------------------------------------
    // CASE 5: PE → East (inject from NIC port)
    //-------------------------------------------------
    PEIB_si = 1;
    PEIB_di = make_flit(1, 0, 1, 4'd2, 4'd0);
    #8 PEIB_si = 0;

    //-------------------------------------------------
    // Conflict Test (West & PE both want East)
    //-------------------------------------------------
    WIB_si = 1;
    PEIB_si = 1;
    WIB_di = make_flit(1, 0, 0, 4'd3, 4'd1);
    PEIB_di = make_flit(1, 0, 1, 4'd2, 4'd0);
    #8 {WIB_si,PEIB_si}=0;

    //-------------------------------------------------
    // Handshake stall + resume
    //-------------------------------------------------
    EOB_ro = 0; // backpressure
    WIB_si = 1;
    WIB_di = make_flit(1,0,0,4'd2,4'd1);
    #8 WIB_si = 0;

    EOB_ro = 1; // release
    #8;

    //-------------------------------------------------
    #50;
    $display("===== TEST DONE =====");
    $finish();
    $fclose(fd);
  end


  //----------------------------------------
  // Monitor
  //----------------------------------------
  initial begin
    $monitor("T=%0t | UP:%h  DN:%h  LT:%h  RT:%h  NIC:%h || OUT => U:%h D:%h L:%h R:%h NIC:%h",
      $time,
      NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di,
      NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do);
  end

  //----------------------------------------
  // VCD dump
  //----------------------------------------
  initial begin
    $dumpfile("gold_router.vcd");
    $dumpvars(0,tb_gold_router);
  end

endmodule
