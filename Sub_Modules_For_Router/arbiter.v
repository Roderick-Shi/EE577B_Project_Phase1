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
