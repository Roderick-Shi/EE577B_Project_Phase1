`timescale 1ns/1ns

module tb_cardinal_nic;

  // Declare variables for the NIC inputs and outputs
  reg  [63:0] d_in;
  reg         nicEn, nicEnWr, clk, reset;
  wire [63:0] net_do;
  reg         net_ro;
  wire        net_so;
  reg         net_polarity;
  
  wire [63:0] d_out;
  reg  [1:0]  addr;
  reg  [63:0] net_di;
  reg         net_si;
  wire        net_ri;

  // Instantiate the DUT with spec-compliant name and ports
  cardinal_nic uut (
    .clk        (clk),
    .reset      (reset),

    // CPU side
    .addr       (addr),
    .d_in       (d_in),
    .d_out      (d_out),
    .nicEn      (nicEn),
    .nicEnWr    (nicEnWr),

    // Router side
    .net_si     (net_si),
    .net_ri     (net_ri),
    .net_di     (net_di),
    .net_so     (net_so),
    .net_ro     (net_ro),
    .net_do     (net_do),
    .net_polarity(net_polarity)
  );
  
  // Clock gen
  initial clk = 0;
  always #2 clk = ~clk;

  // ---------- LOG FILE ----------
  integer logf;

  initial begin
      logf = $fopen("nic_tb.log", "w");
      if (logf == 0) begin
          $display("ERROR: Could not open log file.");
          $finish;
      end
  end

  task log_state(input [127:0] tag);
  begin
      $fwrite(logf,
        "%s T=%0t | addr=%0b nicEn=%0b nicEnWr=%0b | d_in=%0d | d_out=%0d | net_do=%0d | net_so=%0b | net_ri=%0b | net_si=%0b | net_ro=%0b | polarity=%0b\n",
        tag, $time, addr, nicEn, nicEnWr, d_in, d_out,
        net_do, net_so, net_ri, net_si, net_ro, net_polarity
      );
  end
  endtask
  // ------------------------------

  // Console monitor (terminal)
  initial begin
    $monitor(
      "T=%0t | addr=%0b nicEn=%0b nicEnWr=%0b | d_in=%0d | d_out=%0d | net_do=%0d | net_so=%0b | net_ri=%0b | net_si=%0b | net_ro=%0b | polarity=%0b",
      $time, addr, nicEn, nicEnWr, d_in, d_out,
      net_do, net_so, net_ri, net_si, net_ro, net_polarity
    );
  end

  initial begin
    // init
    reset        = 1;
    nicEn        = 0;
    nicEnWr      = 0;
    d_in         = 64'h0;
    addr         = 2'b00;
    net_ro       = 0;
    net_si       = 0;
    net_polarity = 0;
    net_di       = 64'h0;
    
    // reset for 2 cycles
    #8; reset = 0;

    // =====[Test 1: PE write to NIC when output buffer is empty]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = 64'd1234;
    addr         = 2'b10;
    net_ro       = 1;
    net_si       = 0; net_di = 64'd0;
    net_polarity = 1;
    #4; log_state("TEST1");

    // =====[Test 2]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = 64'd1111;
    addr         = 2'b10;
    net_ro       = 1;
    net_si       = 0;
    net_polarity = 0;
    net_di       = 64'd1738;
    #4; log_state("TEST2");

    // =====[Test 3]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = {1'b1, 63'd0};
    addr         = 2'b10;
    net_ro       = 1;
    net_si       = 0;
    net_polarity = 1;
    net_di       = 64'd1738;
    #4; log_state("TEST3");

    // =====[Test 4]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = 64'd3333;
    addr         = 2'b10;
    net_ro       = 1;
    net_si       = 0;
    net_polarity = 0;
    net_di       = 64'd1738;
    #4; log_state("TEST4");

    // =====[Test 5]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = {1'b1, 63'd4};
    addr         = 2'b10;
    net_ro       = 1;
    net_si       = 0;
    net_polarity = 1;
    net_di       = 64'd1738;
    #4; log_state("TEST5");

    // =====[Test 6]=====
    nicEn        = 1; nicEnWr = 1;
    d_in         = 64'd5555; 
    addr         = 2'b00; // wrong address
    net_ro       = 1;
    net_si       = 0;
    net_polarity = 0;
    net_di       = 64'd1738;
    #4; log_state("TEST6");

    // =====[Test 7]=====
    nicEn        = 1; nicEnWr = 0;
    addr         = 2'b00;
    d_in         = 64'd6666;
    net_polarity = 1;
    net_ro       = 1;
    net_si       = 1;
    net_di       = 64'd1314;
    #4; log_state("TEST7");

    // =====[Test 8]=====
    nicEn        = 1; nicEnWr = 0;
    addr         = 2'b01;
    d_in         = 64'd7777;
    net_polarity = 0;
    net_ro       = 0;
    net_si       = 0;
    net_di       = 64'd1492;
    #4; log_state("TEST8");

    // =====[Test 9]=====
    nicEn        = 1; nicEnWr = 0;
    addr         = 2'b11;
    d_in         = 64'd7777;
    net_polarity = 1;
    net_ro       = 0;
    net_si       = 0;
    net_di       = 64'd1492;
    #4; log_state("TEST9");

    // =====[Test 10]=====
    nicEn        = 1; nicEnWr = 0;
    addr         = 2'b00;
    d_in         = 64'd7777;
    net_polarity = 0;
    net_ro       = 0;
    net_si       = 0;
    net_di       = 64'd1492;
    #4; log_state("TEST10");
       
    // =====[Reset in the end]=====
    reset = 1;
    #4;

    $fclose(logf);
    $finish;
  end
endmodule
