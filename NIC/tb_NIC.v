`timescale 1ns/1ns

module tb;

  // Declare variables for the NIC inputs and outputs
  reg [63:0] d_in;
  reg nicEn, nicWrEn, clk, reset;
  wire [63:0] net_do;
  reg net_ro;
  wire net_so;
  reg net_polarity;
  
  wire [63:0] d_out;
  reg [1:0] addr;
  reg [63:0] net_di;
  reg net_si;
  wire net_ri;

  wire in_status, out_status;

  wire buff_en;

  NIC uut (
    .d_in(d_in),
    .nicEn(nicEn),
    .nicWrEn(nicWrEn),
    .clk(clk),
    .reset(reset),
    .net_do(net_do),
    .net_ro(net_ro),
    .net_so(net_so),
    .net_polarity(net_polarity),
    .d_out(d_out),
    .addr(addr),
    .net_di(net_di),
    .net_si(net_si),
    .net_ri(net_ri),
    .in_status(in_status),
    .out_status(out_status),
    .buff_en(buff_en)
  );
  
  initial begin
    clk = 0;
  end
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    nicEn = 0;
    nicWrEn = 0;
    d_in = 64'h0;
    addr = 2'b00;
    net_ro = 0;
    net_si = 0;
    net_polarity = 0;
    net_di = 64'h0;
    
    // reset for 2 cycles
    #4; reset = 0;

    // =====[Test 1: PE write to NIC when output buffer is empty]=====
    // now net_do = 0 (VC bit = 0 = even) & router is using even VC for receiving external --> VC match
    // processor wants to write and output_buffer is empty (out_status = 0) so, d_in data should latch to net_do
    // net_so should be 1, cuz external of router = even && vc bit in d_in
    nicEn = 1; nicWrEn = 1;    // PE is writing to NIC
    d_in = 64'd1234;           // vc bit = d_in[63] = 0 = even
    addr = 2'b10;              // write to output buffer of NIC
    net_ro = 1;                // router is ready to receive
    net_si = 0; net_di = 64'd0;// router is not sending packet to NIC
    net_polarity = 1;          // router is using odd VC for internal; using even VC for receiving external data
    #2; 
    
    // =====[Test 2: PE write to NIC when output buffer is not empty]=====
    // output buffer is occupied after Test 1 
    // now net_do = 64'd1234 (VC bit = 0 = even) & router is using odd VC for receiving external --> VC mismatch--> output buffer is not going to be empty
    // output buffer is not empty & is not going to be empty --> d_in data should be ignored
    nicEn = 1; nicWrEn = 1;    // PE is writing to NIC
    d_in = 64'd1111;           // vc bit = d_in[63] = 0 = even
    addr = 2'b10;              // write to output buffer of NIC
    net_ro = 1;                // router is ready to receive
    net_si = 0;                // router is not sending packet to NIC
    net_polarity = 0;          // router is using even VC for internal; using odd VC for receiving external data
    net_di = 64'd1738;
    #2; 
    
    // =====[Test 3: PE write to NIC when output buffer is not empty (using even VC)]=====
    // output buffer is occupied after Test 1 
    // now net_do = 64'd1234 (VC bit = 0 = even) & router is using even VC for receiving external --> VC match! --> output buffer is going to be empty
    // output buffer is not empty, but is going to be empty! --> d_in data can be latched to net_do & pull up net_so
    nicEn = 1; nicWrEn = 1;    // PE is writing to NIC
    d_in = {1'b1, 63'd0};      // vc bit = d_in[63] = 1 = odd
    addr = 2'b10;              // write to output buffer of NIC
    net_ro = 1;                // router is ready to receive
    net_si = 0;                // router is not sending packet to NIC
    net_polarity = 1;          // router is using odd VC for internal; using even VC for receiving external data
    net_di = 64'd1738;
    #2; 
    
    
    // =====[Test 4: PE write to NIC when output buffer is not empty (using odd VC)]=====
    // output buffer is occupied after Test 3 
    // now net_do = {1'b1, 63'd0} (VC bit = 1 = odd) & router is using odd VC for receiving external --> VC match --> output buffer is going to be empty
    // output buffer is not empty, but is going to be empty --> d_in data can be latched to net_do & pull up net_so
    nicEn = 1; nicWrEn = 1;   // PE is writing to NIC
    d_in = 64'd3333;          // vc bit = d_in[63] = 0 = even
    addr = 2'b10;             // write to output buffer of NIC
    net_ro = 1;               // router is ready to receive
    net_si = 0;               // router is not sending packet to NIC
    net_polarity = 0;         // router is using even VC for internal; using odd VC for receiving external data
    net_di = 64'd1738;
    #2; 
    
    
    // =====[Test 5: PE write to NIC when output buffer is not empty]=====
    // output buffer is occupied after Test 4 
    // now net_do = 64'd3333 (VC bit = 0 = even) & router is using even VC for receiving external --> VC match --> output buffer is not going to be empty
    // output buffer is not empty, but is going to be empty --> d_in data can be latched to net_do & pull up net_so
    nicEn = 1; nicWrEn = 1;   // PE is writing to NIC
    d_in = {1'b1, 63'd4};     // vc bit = d_in[63] = 1 = odd
    addr = 2'b10;             // write to output buffer of NIC
    net_ro = 1;               // router is ready to receive
    net_si = 0;               // router is not sending packet to NIC
    net_polarity = 1;         // router is using odd VC for internal; using even VC for receiving external data
    net_di = 64'd1738;
    #2; 
    
    // =====[Test 6: PE write but to wrong address]=====
    // PE is writing but the address is not to the output buffer (wrong address) 
    // --> d_in should not go to net_do & this wrong data 64'd5555 will be ignored
    // Since no more paceket writing into ouput buffer, after Test 5 packet is sent to router, out_status = empty
    nicEn = 1; nicWrEn = 1;
    d_in = 64'd5555; 
    addr = 2'b00; //wrong address
    net_ro = 1;
    net_si = 0;
    net_polarity = 0;
    net_di = 64'd1738;
    #2; 
 
    // =====[Test 7: Router send packet to NIC & PE wants to read from NIC]=====
    // Read before Write: PE read the old packet data from input buffer, then Router write new pacekt to input buffer
    // old d_out --> PE
    // new pacekte net_di --> update d_out
    // For input buffer, old packet is consumed but new packet enters --> full now --> in_status = 1
    nicEn = 1; nicWrEn = 0;       // PE is reading
    addr = 2'b00;                 // NIC send "Input Channel Buffer" data (input_channel_buf_out) to d_out
    d_in = 64'd6666;              // now reading thus buff_en off --> this data will be ignored
    net_polarity = 1;             // NIC not sending to router --> unused
    net_ro = 1;                   // NIC not sending to router --> unused    
    net_si = 1;                   // Router has packet to send in NIC
    net_di = 64'd1314;            // Since Router say net_si=1, net_di is allowed to latch in input buffer
    #2; 
    // !!!! Issue [Solved]: if the router wants to write the input buffer and PE also want to read the input buffer data
    // We should read before write, but now the write will overwirte the read value
    // should I also build an input buffer enable = (input buffer is empty) & net_si --> then allow router send the packet in
    
    // =====[Test 8: PE wants to read input status from NIC]=====
    // Now input status register should be full becasue of Test 7 --> d_out = in_status = 1(full)
    nicEn = 1; nicWrEn = 0;      // PE is reading
    addr = 2'b01;                // Read Input status register
    d_in = 64'd7777;             // now reading thus buff_en off --> this data will be ignored (input_channel_buf_out stays still)
    net_polarity = 0;            // NIC not sending to router --> unused 
    net_ro = 0;                  // NIC not sending to router --> unused   
    net_si = 0;                  // in_status is full (net_ri not ready), so net_si should = 0
    net_di = 64'd1492;           // Router is not sending to NIC --> unused 
    #2; 
    
    // =====[Test 9: PE wants to read output status from NIC]=====
    // Now input status register should be empty after Test 5 --> d_out = out_status = 0 (empty)
    nicEn = 1; nicWrEn = 0;      // PE is reading
    addr = 2'b11;                // Read Output status register
    d_in = 64'd7777;             // now reading thus buff_en off --> this data will be ignored (input_channel_buf_out stays still)
    net_polarity = 1;            // NIC not sending to router --> unused 
    net_ro = 0;                  // NIC not sending to router --> unused   
    net_si = 0;                  // in_status is full (net_ri not ready), so net_si should = 0
    net_di = 64'd1492;           // Router is not sending to NIC --> unused 
    #2; 
    
    // =====[Test 10: PE consumes the input channel packet & let input buffer back to empty]=====
    // in_status should go back to 0 (empty) after this since the packet is consumed
    nicEn = 1; nicWrEn = 0;      // PE is reading
    addr = 2'b00;                // Read Input Channel Buffer
    d_in = 64'd7777;             // now PE is reading thus output buff_en off --> this data will be ignored 
    net_polarity = 0;            // NIC not sending to router --> unused 
    net_ro = 0;                  // NIC not sending to router --> unused 
    net_si = 0;                  // in_status is full (net_ri not ready), so net_si should = 0
    net_di = 64'd1492;           // Router is not sending to NIC --> unused 
    #2;                          // using the old packet value net_di = 1314 as d_out
       
    // =====[Reset in the end]=====
    reset = 1;
    #2;
    
    $finish;
  end
endmodule











