`timescale 1ns / 1ns

module tb;
  
  reg clk, reset;
//   reg polarity;
  reg NIB_si, SIB_si, WIB_si, EIB_si, PEIB_si;
  reg [63:0] NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di;
  wire NIB_ri, SIB_ri, WIB_ri, EIB_ri, PEIB_ri;
  wire NOB_so, SOB_so, WOB_so, EOB_so, PEOB_so;
  wire [63:0] NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do;
  reg  NOB_ro, SOB_ro, WOB_ro, EOB_ro, PEOB_ro;
  wire polarity_to_NIC;
  integer fd;
  
       gold_router uut (
          .clk(clk),
          .reset(reset),

          // Input side mapping
          .up_si(NIB_si),
          .down_si(SIB_si),
          .left_si(WIB_si),
          .right_si(EIB_si),
          .NIC_si(PEIB_si),

          .up_di(NIB_di),
          .down_di(SIB_di),
          .left_di(WIB_di),
          .right_di(EIB_di),
          .NIC_di(PEIB_di),

          .up_ri(NIB_ri),
          .down_ri(SIB_ri),
          .left_ri(WIB_ri),
          .right_ri(EIB_ri),
          .NIC_ri(PEIB_ri),

          // Output side mapping
          .up_so(NOB_so),
          .down_so(SOB_so),
          .left_so(WOB_so),
          .right_so(EOB_so),
          .NIC_so(PEOB_so),

          .up_do(NOB_do),
          .down_do(SOB_do),
          .left_do(WOB_do),
          .right_do(EOB_do),
          .NIC_do(PEOB_do),

          .up_ro(NOB_ro),
          .down_ro(SOB_ro),
          .left_ro(WOB_ro),
          .right_ro(EOB_ro),
          .NIC_ro(PEOB_ro),

          .polarity_to_NIC(polarity_to_NIC)
      );


  // Clock generation
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
  end
  
//   initial begin
//     polarity = 0;
//     forever #4 polarity = ~polarity;
//   end
  
  initial begin
    fd = $fopen("tb_gold_router.txt","w");
    //Asserting Rest for few cycles
    NIB_di	= 0;
    SIB_di	= 0;
    WIB_di	= 0;
    EIB_di	= 0;
    PEIB_di	= 0;
    reset = 1'b1;
    #16;
    reset = 1'b0;
    
    $monitor(fd,"Time = %0t, NIB_di = %0h, SIB_di = %0h, WIB_di = %0h, EIB_di = %0h, PEIB_di = %0h, NOB_do = %0h, SOB_do = %0h, WOB_do = %0h, EOB_do = %0h, PEOB_do = %0h", $time, NIB_di, SIB_di, WIB_di, EIB_di, PEIB_di, NOB_do, SOB_do, WOB_do, EOB_do, PEOB_do);
    
    $fwrite(fd,"Testing Routing and switching\n");
    
    // South to North
    SIB_si = 1'b1;
    SIB_di = 64'h8003_0000_0000_0000;
    
    #8;
    SIB_si = 1'b0;
    SIB_di = 64'h0;
    
    // North to South
    NIB_si = 1'b1;
    NIB_di = 64'h800c_0000_0000_0000;
    
    #8;
    NIB_si = 1'b0;
    NIB_di = 64'h0;
    
    
    // East to South
    EIB_si = 1'b1;
    EIB_di = 64'h000c_0000_0000_0000;
    
    #8;
    EIB_si = 1'b0;
    
    EIB_di = 64'b0;
    #8;
    
    // West to East
    WIB_si = 1'b1;
    WIB_di = 64'h8033_0000_0000_0000;
    
    #8;
    
    // West to PE
    WIB_si = 1'b1;
    WIB_di = 64'h8000_0000_0000_0000;
    
    #8;
    WIB_si = 1'b0;
    WIB_di = 64'b0;
    
    // PE to East
    PEIB_si = 1'b1;
    PEIB_di = 64'h8022_0000_0000_0000;
    
    #8
    PEIB_si = 1'b0;
    PEIB_di = 64'h0;
    
    //Conflict
    $fwrite(fd,"\n\nConflict Test\n");
    
    PEIB_si = 1'b1;
    PEIB_di = 64'h8022_0000_0000_0000;
    
    WIB_si = 1'b1;
    WIB_di = 64'h8033_0000_0000_0000;
    
    #8;
    PEIB_si = 1'b0;
    PEIB_di = 64'h0;
    WIB_si = 1'b0;
    WIB_di = 64'b0;
    
    #30;
    
    //Non - Blocking handshake
    $fwrite(fd,"\n\nNon-Blocking Handshake\n");
    $monitor(fd,"time = %0t, WIB_si = %0b, WIB_di = %0h, EOB_so = %0h, EOB_do = %0h", $time, WIB_si, WIB_di, EOB_so, EOB_do);
    #6;
    EOB_ro = 1'b1;
    WIB_si = 1'b1;
    WIB_di = 64'h0033_0000_0000_0000;
    
    #4;
    WIB_si = 1'b0;
    WIB_di = 64'h0;
    
    #8;
    WIB_si = 1'b1;
    WIB_di = 64'h8033_0000_0000_0000;
    
    #4;
    WIB_si = 1'b0;
    WIB_di = 64'h0;
    
    #16;
    // Blocking Handshake
    $fwrite(fd,"\n\nBlocking Handshake\n");
    EOB_ro = 1'b0;
    WIB_si = 1'b1;
    WIB_di = 64'h0033_0000_0000_0000;
    
    #4;
    WIB_si = 1'b0;
    WIB_di = 64'h0;
    
    #8;
    WIB_si = 1'b1;
    WIB_di = 64'h8033_0000_0000_0000;
    
    #4;
    WIB_si = 1'b0;
    WIB_di = 64'h0;
    EOB_ro = 1'b1;
    
    #4;
    EOB_ro = 1'b0;
    #8;
    EOB_ro = 1'b1;
    #4;
    EOB_ro = 1'b0;
    
    #16;
    #20;
    
    $finish();
    $fclose(fd);
  end
  
endmodule
