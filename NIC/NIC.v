module NIC(
    input clk, reset,
	input [1:0] addr,
	input [63:0] d_in,
	output reg [63:0] d_out,
    input nicEn, nicWrEn,
	input net_si,
	output net_ri,
	input [63:0] net_di,
	output net_so,
	input net_ro,
    output reg [63:0] net_do,
    input net_polarity,
    output reg out_status,
    output reg in_status,
    output buff_en
);
    
    //=====[Network Output Channel: Processor -> NIC -> Router]======
    wire polarity_vc_match = (net_do[63] != net_polarity); //when the polarity of current packet & Router match (all the external signals for router should has oppsite polarity to be in the same VC)
    assign net_so = (out_status && net_ro) && polarity_vc_match; //when can NIC send packet to Router (there's packet in output buffer && Router is empty && polarity match)
    wire out_buff_en = (nicEn && nicWrEn) && ((out_status == 0) || net_so) && (addr == 2'b10); //when output buffer can be updated (when PE is writing d_in to NIC && output buffer is/is going to be empty && writing address=output buffer)
    
    assign buff_en = out_buff_en;
	
	// Output Channel Buffer
    always @(posedge clk or posedge reset) begin
        if (reset) net_do <= 0;
        else if (out_buff_en) net_do <= d_in;
    end
    
	//Output Status Register
    always @(posedge clk or posedge reset) begin
        if (reset) out_status <= 0;
        else if (out_buff_en) out_status <= 1;
        else if (net_so && ~out_buff_en) out_status <= 0;
    end
    
	//=====[Network Input Channel: Router -> NIC -> Processor]======
	// Input Channel Buffer
    reg [63:0] input_channel_buf_out;
    wire pe_read_InBuffer = nicEn && ~nicWrEn && (addr == 2'b00); //When PE is reading input buffer of NIC
    assign net_ri = ~in_status || pe_read_InBuffer; //If nothing in the input stauts register || Input buffer will be empty (since PE is reading), then input NIC channel is ready (net_ri=1)
    wire in_buff_en = net_si && net_ri; // new packet allowed to be written to NIC
    always @(posedge clk or posedge reset) begin
        if (reset) input_channel_buf_out <= 0;
		else if (in_buff_en) input_channel_buf_out <= net_di; //ps. router will let net_si=1 when it sees net_ri=1 (NIC ready to receive)
    end
	
    //Input Status Register
    always @(posedge clk or posedge reset) begin
        if (reset) in_status <= 0;
		else if (in_buff_en) in_status <= 1; // new packet written in --> full
        else if (pe_read_InBuffer) in_status <= 0; //PE takes in the input channel buffer's packet but no new pacekt --> back to empty
    end
    
	//=====[NIC Register Address -> NIC Internal Registers]=====
	// d_out = the packet is sent into the processor
    always @(*) begin
		if(!nicEn)
			d_out = 64'b0;
		else begin
			case (addr)
				//PE is reading data/ receiving packets
				2'b00: d_out = input_channel_buf_out; //send Input Channel Buffer packet into PE
				2'b01: d_out = {63'b0, in_status}; //send Input Channle Status into PE
				2'b11: d_out = {63'b0, out_status}; //send Output Channel Status into PE
				//PE is writing the packet to NIC
				2'b10: d_out = 64'b0; //now PE is writing to Output Buffer, not reading. Thus, d_out is ignored.
				default: begin 
					d_out = 64'b0;
					`ifndef SYNTHESIS
						$display("Warning: unexpected address addr=%b detected.", addr);
					`endif
				end 
			endcase
		end 
    end
    
endmodule



