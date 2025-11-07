// Code your design here
`timescale 1ns/10ps
`include "./include/DW_sqrt.v"
`include "./include/DW_div.v"


module pipeline_stages (
    input clk, input reset, input en,
    input [0:31] data_in_stage1_IF_ID, output reg [0:31] stage1_IF_ID,
    input [0:159] data_in_stage2_ID_EXMEM, output reg [0:159] stage2_ID_EXMEM,
    input [0:72] data_in_stage3_EXMEM_WB, output reg [0:72] stage3_EXMEM_WB
    );


  always@(posedge clk) begin
    if(reset) begin
      stage1_IF_ID <= 0;
      stage2_ID_EXMEM <= 0;
      stage3_EXMEM_WB <= 0;
    end
    else if (en)begin
      stage1_IF_ID <= data_in_stage1_IF_ID;
      stage2_ID_EXMEM <= data_in_stage2_ID_EXMEM;
      stage3_EXMEM_WB <= data_in_stage3_EXMEM_WB;  
    end
  end
  
endmodule

module counter(
    input wire clk,          // Clock signal
    input wire reset,        // Reset signal
    input wire start,        // Start signal
    input wire [0:2] length, // Length of the count (number of cycles)
    output reg [0:2] count  // Count output
);

    // Internal signal to track counting state
    reg counting;
    reg [0:2] cycle_counter; // Counter to track elapsed cycles

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            counting <= 0;
            cycle_counter <= 0;
        end else begin
            if (start && !counting) begin
                // Start counting when `start` goes high
                counting <= 1;
                cycle_counter <= 0;
                count <= 1; // Reset count at the start of a new cycle
            end else if (counting) begin
                if (cycle_counter < length) begin
                    // Increment count and cycle_counter while counting
                    cycle_counter <= cycle_counter + 1;
                    count <= count + 1;
                end else begin
                    // Stop counting when length cycles are reached
                    counting <= 0;
                    count <= 0;
                end
            end
        end
    end
endmodule

// Note that the parameters here is using ascending order, thus regFile[0] is the MSB
module RegisterFile (
  input clk, 
  input reset, 
  input wrEn, 
  input [0:2] PPP, // partially wirte back mode
  // 1 sync write port (posedge)
  input [0:4] wrAddr, // address of reg destination
  input [0:63] wrData, // the write data to dest reg 
  // 2 aysnc read ports
  input [0:4] rdAddr1, // source reg 1
  output reg [0:63] rdData1, // source reg 1 data
  input [0:4] rdAddr2, // source reg 2
  output reg [0:63] rdData2 // source reg 2 data
);
  reg [0:63] regFile [0:31];
  
  // Combinational Read Logic
  // For "read", the old value always has higher priority then "write" operation
  always @(*) begin
	// If src reg address is zero, then the read value is also zero
	// else send the regFile stored value
    rdData1 = (rdAddr1 == 5'b00000) ? 64'h0000_0000_0000_0000 : regFile[rdAddr1];
    rdData2 = (rdAddr2 == 5'b00000) ? 64'h0000_0000_0000_0000 : regFile[rdAddr2];
  end

  // Sequential sync reset & Write Logic  
  integer i;
  always @(posedge clk) begin
    if (reset) begin // acive HIGH reset
		for (i = 0; i < 32; i = i + 1) begin
			regFile[i] <= 64'h0000_0000_0000_0000;
		end
    end 
	// Write to RegFile timing: wrEn enable & write address is not R0 (cuz R0 is always 0) & legal PPP
	// Split 64bit regdata into 8bytes (B0~B7), B0 is the MSByte
	// PPP = 0 --> write B0~B7
	// PPP = 1 --> wirte upper 4 bytes (B0~B3), lower 4bytes remaining old RegFile stored value
	// PPP = 2 --> wirte lower 4 bytes (B0~B3), upper 4bytes remaining old RegFile stored value
	// PPP = 3 --> wirte even 4 bytes (B0, B2, B4, B6), odd 4bytes remaining old RegFile stored value
	// PPP = 4 --> wirte odd 4 bytes (B1, B3, B5, B7), even 4bytes remaining old RegFile stored value
    else if (wrEn && wrAddr != 5'b00000) begin
		case (PPP)
			// Write all 8 bytes (full 64-bit write)
			3'd0: begin
			  regFile[wrAddr] <= wrData;
			end
			
			// Write upper 32 bits (bytes B0–B3), keep lower 32 bits (bytes B4–B7)
			3'd1: begin
			  regFile[wrAddr] <= {wrData[0:31], regFile[wrAddr][32:63]};
			end
			
			// Write lower 32 bits (bytes B4–B7), keep upper 32 bits (bytes B0–B3)
			3'd2: begin 
			  regFile[wrAddr] <= {regFile[wrAddr][0:31], wrData[32:63]};
			end

			// Write even bytes (B0, B2, B4, B6), keep odd bytes (B1, B3, B5, B7)
			3'd3: begin
			  regFile[wrAddr] <= {
				wrData[0:7],   regFile[wrAddr][8:15],
				wrData[16:23], regFile[wrAddr][24:31],
				wrData[32:39], regFile[wrAddr][40:47],
				wrData[48:55], regFile[wrAddr][56:63]
			  };
			end
			
			// Write odd bytes (B1, B3, B5, B7), keep even bytes (B0, B2, B4, B6)
			3'd4: begin
			  regFile[wrAddr] <= {
				regFile[wrAddr][0:7],   wrData[8:15],
				regFile[wrAddr][16:23], wrData[24:31],
				regFile[wrAddr][32:39], wrData[40:47],
				regFile[wrAddr][48:55], wrData[56:63]
			  };
			end
			
			// Invalid PPP value: issue a warning and keep the current register value
			default: begin
			  $display("WARNING: Invalid PPP value (%0d) detected for register %0d at time %0t",
					   PPP, wrAddr, $time);
			  regFile[wrAddr] <= regFile[wrAddr];
			end
		endcase
	end
	// else, keep RegFile the same
  end
endmodule


module HDU(
    input [0:4] Dest_EX_Stage, Dest_WB_Stage, SR1_ID_Stage, SR2_ID_Stage,
    input Write_Intent_EX, Write_Intent_WB, read_Intent,
    input [0:2] PPP_EX, PPP_WB,
    output Haz_from_EX_to_SR1_B0, Haz_from_EX_to_SR1_B1, Haz_from_EX_to_SR1_B2, Haz_from_EX_to_SR1_B3, Haz_from_EX_to_SR1_B4, Haz_from_EX_to_SR1_B5, Haz_from_EX_to_SR1_B6, Haz_from_EX_to_SR1_B7, 
    output Haz_from_EX_to_SR2_B0, Haz_from_EX_to_SR2_B1, Haz_from_EX_to_SR2_B2, Haz_from_EX_to_SR2_B3, Haz_from_EX_to_SR2_B4, Haz_from_EX_to_SR2_B5, Haz_from_EX_to_SR2_B6, Haz_from_EX_to_SR2_B7,  
    output Haz_from_WB_to_SR1_B0, Haz_from_WB_to_SR1_B1, Haz_from_WB_to_SR1_B2, Haz_from_WB_to_SR1_B3, Haz_from_WB_to_SR1_B4, Haz_from_WB_to_SR1_B5, Haz_from_WB_to_SR1_B6, Haz_from_WB_to_SR1_B7, 
    output Haz_from_WB_to_SR2_B0, Haz_from_WB_to_SR2_B1, Haz_from_WB_to_SR2_B2, Haz_from_WB_to_SR2_B3, Haz_from_WB_to_SR2_B4, Haz_from_WB_to_SR2_B5, Haz_from_WB_to_SR2_B6, Haz_from_WB_to_SR2_B7
);
  assign Haz_from_EX_to_SR1_B0 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 3);
  assign Haz_from_EX_to_SR1_B1 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 4);
  assign Haz_from_EX_to_SR1_B2 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 3);
  assign Haz_from_EX_to_SR1_B3 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 4);
  assign Haz_from_EX_to_SR1_B4 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 3);
  assign Haz_from_EX_to_SR1_B5 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 4);
  assign Haz_from_EX_to_SR1_B6 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 3);
  assign Haz_from_EX_to_SR1_B7 = (Dest_EX_Stage == SR1_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 4);

  assign Haz_from_EX_to_SR2_B0 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 3);
  assign Haz_from_EX_to_SR2_B1 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 4);
  assign Haz_from_EX_to_SR2_B2 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 3);
  assign Haz_from_EX_to_SR2_B3 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 1 || PPP_EX == 4);
  assign Haz_from_EX_to_SR2_B4 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 3);
  assign Haz_from_EX_to_SR2_B5 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 4);
  assign Haz_from_EX_to_SR2_B6 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 3);
  assign Haz_from_EX_to_SR2_B7 = (Dest_EX_Stage == SR2_ID_Stage) && Write_Intent_EX && read_Intent && (PPP_EX == 0 || PPP_EX == 2 || PPP_EX == 4);

  assign Haz_from_WB_to_SR1_B0 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 3);
  assign Haz_from_WB_to_SR1_B1 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 4);
  assign Haz_from_WB_to_SR1_B2 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 3);
  assign Haz_from_WB_to_SR1_B3 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 4);
  assign Haz_from_WB_to_SR1_B4 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 3);
  assign Haz_from_WB_to_SR1_B5 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 4);
  assign Haz_from_WB_to_SR1_B6 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 3);
  assign Haz_from_WB_to_SR1_B7 = (Dest_WB_Stage == SR1_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 4);


  assign Haz_from_WB_to_SR2_B0 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 3);
  assign Haz_from_WB_to_SR2_B1 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 4);
  assign Haz_from_WB_to_SR2_B2 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 3);
  assign Haz_from_WB_to_SR2_B3 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 1 || PPP_WB == 4);
  assign Haz_from_WB_to_SR2_B4 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 3);
  assign Haz_from_WB_to_SR2_B5 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 4);
  assign Haz_from_WB_to_SR2_B6 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 3);
  assign Haz_from_WB_to_SR2_B7 = (Dest_WB_Stage == SR2_ID_Stage) && Write_Intent_WB && read_Intent && (PPP_WB == 0 || PPP_WB == 2 || PPP_WB == 4);


endmodule

//ALU

module ALU(input [0:63] dataA_ALU_in, dataB_ALU_in, input [0:5]function_code, input[0:1]ww, output reg [0:63]data_ALU_out);
  
  integer i;
  integer size;
  integer amt[0:7];
  
  wire [0:63] quotient8;
  wire [0:63] remainder8;
  wire [0:63] quotient16;
  wire [0:63] remainder16;
  wire [0:63] quotient32;
  wire [0:63] remainder32;
  wire [0:63] quotient64;
  wire [0:63] remainder64;
  wire [0:63] sqrt8_out;
  wire [0:31] sqrt16_out;
  wire [0:31] sqrt32_out;
  wire [0:31] sqrt64_out;
  
  //Keep the include statement here
  // DW_sqrt include
  // DW_div include
  
  // Instantiating Divider Module
  // 8-bit Divider Modules
  DW_div div8_0(.a(dataA_ALU_in[0:7]), .b(dataB_ALU_in[0:7]), .quotient(quotient8[0:7]), .remainder(remainder8[0:7]), .divide_by_0());
  DW_div div8_1(.a(dataA_ALU_in[8:15]), .b(dataB_ALU_in[8:15]), .quotient(quotient8[8:15]), .remainder(remainder8[8:15]), .divide_by_0());
  DW_div div8_2(.a(dataA_ALU_in[16:23]), .b(dataB_ALU_in[16:23]), .quotient(quotient8[16:23]), .remainder(remainder8[16:23]), .divide_by_0());
  DW_div div8_3(.a(dataA_ALU_in[24:31]), .b(dataB_ALU_in[24:31]), .quotient(quotient8[24:31]), .remainder(remainder8[24:31]), .divide_by_0());
  DW_div div8_4(.a(dataA_ALU_in[32:39]), .b(dataB_ALU_in[32:39]), .quotient(quotient8[32:39]), .remainder(remainder8[32:39]), .divide_by_0());
  DW_div div8_5(.a(dataA_ALU_in[40:47]), .b(dataB_ALU_in[40:47]), .quotient(quotient8[40:47]), .remainder(remainder8[40:47]), .divide_by_0());
  DW_div div8_6(.a(dataA_ALU_in[48:55]), .b(dataB_ALU_in[48:55]), .quotient(quotient8[48:55]), .remainder(remainder8[48:55]), .divide_by_0());
  DW_div div8_7(.a(dataA_ALU_in[56:63]), .b(dataB_ALU_in[56:63]), .quotient(quotient8[56:63]), .remainder(remainder8[56:63]), .divide_by_0());
  // 16-bit divider Modules
  DW_div #(.a_width(16), .b_width(16)) div16_0(.a(dataA_ALU_in[0:15]), .b(dataB_ALU_in[0:15]), .quotient(quotient16[0:15]), .remainder(remainder16[0:15]), .divide_by_0());
  DW_div #(.a_width(16), .b_width(16)) div16_1(.a(dataA_ALU_in[16:31]), .b(dataB_ALU_in[16:31]), .quotient(quotient16[16:31]), .remainder(remainder16[16:31]), .divide_by_0());
  DW_div #(.a_width(16), .b_width(16)) div16_2(.a(dataA_ALU_in[32:47]), .b(dataB_ALU_in[32:47]), .quotient(quotient16[32:47]), .remainder(remainder16[32:47]), .divide_by_0());
  DW_div #(.a_width(16), .b_width(16)) div16_3(.a(dataA_ALU_in[48:63]), .b(dataB_ALU_in[48:63]), .quotient(quotient16[48:63]), .remainder(remainder16[48:63]), .divide_by_0());
  // 32-bit divider Modules
  DW_div #(.a_width(32), .b_width(32)) div32_0(.a(dataA_ALU_in[0:31]), .b(dataB_ALU_in[0:31]), .quotient(quotient32[0:31]), .remainder(remainder32[0:31]), .divide_by_0());
  DW_div #(.a_width(32), .b_width(32)) div32_1(.a(dataA_ALU_in[32:63]), .b(dataB_ALU_in[32:63]), .quotient(quotient32[32:63]), .remainder(remainder32[32:63]), .divide_by_0());
  // 64-bit divider Modules
  DW_div #(.a_width(64), .b_width(64)) div64_0(.a(dataA_ALU_in[0:63]), .b(dataB_ALU_in[0:63]), .quotient(quotient64[0:63]), .remainder(remainder64[0:63]), .divide_by_0());
  
  // Instantiating Square Root Module
  // 8-bit Square root Modules
  DW_sqrt sqrt8_0(.a(dataA_ALU_in[0:7]), .root(sqrt8_out[4:7]));
  DW_sqrt sqrt8_1(.a(dataA_ALU_in[8:15]), .root(sqrt8_out[12:15]));
  DW_sqrt sqrt8_2(.a(dataA_ALU_in[16:23]), .root(sqrt8_out[20:23]));
  DW_sqrt sqrt8_3(.a(dataA_ALU_in[24:31]), .root(sqrt8_out[28:31]));
  DW_sqrt sqrt8_4(.a(dataA_ALU_in[32:39]), .root(sqrt8_out[36:39]));
  DW_sqrt sqrt8_5(.a(dataA_ALU_in[40:47]), .root(sqrt8_out[44:47]));
  DW_sqrt sqrt8_6(.a(dataA_ALU_in[48:55]), .root(sqrt8_out[52:55]));
  DW_sqrt sqrt8_7(.a(dataA_ALU_in[56:63]), .root(sqrt8_out[60:63]));
  // 16-bit Square root Modules
  DW_sqrt #(.width(16)) sqrt16_0(.a(dataA_ALU_in[0:15]), .root(sqrt16_out[0:7]));
  DW_sqrt #(.width(16)) sqrt16_1(.a(dataA_ALU_in[16:31]), .root(sqrt16_out[8:15]));
  DW_sqrt #(.width(16)) sqrt16_2(.a(dataA_ALU_in[32:47]), .root(sqrt16_out[16:23]));
  DW_sqrt #(.width(16)) sqrt16_3(.a(dataA_ALU_in[48:63]), .root(sqrt16_out[24:31]));
  // 32-bit Square root Modules
  DW_sqrt #(.width(32)) sqrt32_0(.a(dataA_ALU_in[0:31]), .root(sqrt32_out[0:15]));
  DW_sqrt #(.width(32)) sqrt32_1(.a(dataA_ALU_in[32:63]), .root(sqrt32_out[16:31]));
  // 64-bit Square root Modules
  DW_sqrt #(.width(64)) sqrt64_0(.a(dataA_ALU_in[0:63]), .root(sqrt64_out[0:31]));
  
  
  always @ (*) begin
    
    // Setting the width
    // Remove this by implementing directly in if loops
    case (ww)
      2'b00 : size = 8;
      2'b01 : size = 16;
      2'b10 : size = 32;
      2'b11 : size = 64;
      default : size = 64; // This should be a NOP
    endcase
    
    // Sorting by Function Code
    
    //VAND -- bitwise AND
    if (function_code == 6'b000001) begin
      data_ALU_out = dataA_ALU_in & dataB_ALU_in;
    end
    
    // VOR -- bitwise OR
    else if (function_code == 6'b000010) begin
      data_ALU_out = dataA_ALU_in | dataB_ALU_in;
    end
    
    // VXOR -- bitwise XOR
    else if (function_code == 6'b000011) begin
      data_ALU_out = dataA_ALU_in ^ dataB_ALU_in;
    end
    
    // VNOT -- bitwise inversion
    else if (function_code == 6'b000100) begin
      data_ALU_out = ~ dataA_ALU_in;
    end
    
    // VMOV -- Move by N bits
    else if (function_code == 6'b000101) begin
      data_ALU_out = dataA_ALU_in;
    end
    
    // VADD -- Variable Addition function
    else if (function_code == 6'b000110) begin
      
      if (size == 32) begin
        data_ALU_out [0:31] = dataA_ALU_in[0:31] + dataB_ALU_in[0:31];
        data_ALU_out [32:63] = dataA_ALU_in[32:63] + dataB_ALU_in[32:63];
      end
      
      else if (size == 16) begin
        data_ALU_out [0:15] = dataA_ALU_in[0:15] + dataB_ALU_in[0:15];
        data_ALU_out [16:31] = dataA_ALU_in[16:31] + dataB_ALU_in[16:31];
        data_ALU_out [32:47] = dataA_ALU_in[32:47] + dataB_ALU_in[32:47];
        data_ALU_out [48:63] = dataA_ALU_in[48:63] + dataB_ALU_in[48:63];
      end
      
      else if (size == 8) begin
        data_ALU_out [0:7] = dataA_ALU_in[0:7] + dataB_ALU_in[0:7];
        data_ALU_out [8:15] = dataA_ALU_in[8:15] + dataB_ALU_in[8:15];
        data_ALU_out [16:23] = dataA_ALU_in[16:23] + dataB_ALU_in[16:23];
        data_ALU_out [24:31] = dataA_ALU_in[24:31] + dataB_ALU_in[24:31];
        data_ALU_out [32:39] = dataA_ALU_in[32:39] + dataB_ALU_in[32:39];
        data_ALU_out [40:47] = dataA_ALU_in[40:47] + dataB_ALU_in[40:47];
        data_ALU_out [48:55] = dataA_ALU_in[48:55] + dataB_ALU_in[48:55];
        data_ALU_out [56:63] = dataA_ALU_in[56:63] + dataB_ALU_in[56:63];
      end
      
      else begin
        data_ALU_out = dataA_ALU_in + dataB_ALU_in;
      end
      
    end
    
    // VSUB -- Subtract
    else if (function_code == 6'b000111) begin
      
      if (size == 32) begin
        data_ALU_out [0:31] = dataA_ALU_in[0:31] - dataB_ALU_in[0:31];
        data_ALU_out [32:63] = dataA_ALU_in[32:63] - dataB_ALU_in[32:63];
      end
      
      else if (size == 16) begin
        data_ALU_out [0:15] = dataA_ALU_in[0:15] - dataB_ALU_in[0:15];
        data_ALU_out [16:31] = dataA_ALU_in[16:31] - dataB_ALU_in[16:31];
        data_ALU_out [32:47] = dataA_ALU_in[32:47] - dataB_ALU_in[32:47];
        data_ALU_out [48:63] = dataA_ALU_in[48:63] - dataB_ALU_in[48:63];
      end
      
      else if (size == 8) begin
        data_ALU_out [0:7] = dataA_ALU_in[0:7] - dataB_ALU_in[0:7];
        data_ALU_out [8:15] = dataA_ALU_in[8:15] - dataB_ALU_in[8:15];
        data_ALU_out [16:23] = dataA_ALU_in[16:23] - dataB_ALU_in[16:23];
        data_ALU_out [24:31] = dataA_ALU_in[24:31] - dataB_ALU_in[24:31];
        data_ALU_out [32:39] = dataA_ALU_in[32:39] - dataB_ALU_in[32:39];
        data_ALU_out [40:47] = dataA_ALU_in[40:47] - dataB_ALU_in[40:47];
        data_ALU_out [48:55] = dataA_ALU_in[48:55] - dataB_ALU_in[48:55];
        data_ALU_out [56:63] = dataA_ALU_in[56:63] - dataB_ALU_in[56:63];
      end
      
      else begin
        data_ALU_out = dataA_ALU_in - dataB_ALU_in;
      end
      
    end
    
    // VMULEU  -- Multiply Even unsigned
    else if (function_code == 6'b001000) begin
      
      if (size == 8) begin
        data_ALU_out[0:15]  = dataA_ALU_in[0:7]   * dataB_ALU_in[0:7];
        data_ALU_out[16:31] = dataA_ALU_in[16:23] * dataB_ALU_in[16:23];
        data_ALU_out[32:47] = dataA_ALU_in[32:39] * dataB_ALU_in[32:39];
        data_ALU_out[48:63] = dataA_ALU_in[48:55] * dataB_ALU_in[48:55];
      end
      
      else if (size == 16) begin
        data_ALU_out[0:31]  = dataA_ALU_in[0:15]  * dataB_ALU_in[0:15];
        data_ALU_out[32:63] = dataA_ALU_in[32:47] * dataB_ALU_in[32:47];
      end
      
      else if (size == 32) begin
        data_ALU_out = dataA_ALU_in[0:31] * dataB_ALU_in[0:31];
      end
      
      else begin
        data_ALU_out = 64'h0;
        // Should be a NOP
      end
      
    end
    
    // VMULOU  --  Multiply Odd unsigned
    else if (function_code == 6'b001001) begin
      
      if (size == 8) begin
        data_ALU_out[0:15]  = dataA_ALU_in[8:15]  * dataB_ALU_in[8:15];
        data_ALU_out[16:31] = dataA_ALU_in[24:31] * dataB_ALU_in[24:31];
        data_ALU_out[32:47] = dataA_ALU_in[40:47] * dataB_ALU_in[40:47];
        data_ALU_out[48:63] = dataA_ALU_in[56:63] * dataB_ALU_in[56:63];
      end
      
      else if (size == 16) begin
        data_ALU_out[0:31]  = dataA_ALU_in[16:31] * dataB_ALU_in[16:31];
        data_ALU_out[32:63] = dataA_ALU_in[48:63] * dataB_ALU_in[48:63];
      end
      
      else if (size == 32) begin
        data_ALU_out = dataA_ALU_in[32:63] * dataB_ALU_in[32:63];
      end
      
      else begin
        data_ALU_out = 64'h0;
        // Should be a NOP
      end
      
    end
    
    // VSLL  --  Shift Left Logical
    else if (function_code == 6'b001010) begin
      
      if (size == 8) begin
        amt[0] = dataB_ALU_in[5:7];
        amt[1] = dataB_ALU_in[13:15];
        amt[2] = dataB_ALU_in[21:23];
        amt[3] = dataB_ALU_in[29:31];
        amt[4] = dataB_ALU_in[37:39];
        amt[5] = dataB_ALU_in[45:47];
        amt[6] = dataB_ALU_in[53:55];
        amt[7] = dataB_ALU_in[61:63];

        data_ALU_out[0:7] = dataA_ALU_in[0:7]<<amt[0];
        data_ALU_out[8:15] = dataA_ALU_in[8:15]<<amt[1];
        data_ALU_out[16:23] = dataA_ALU_in[16:23]<<amt[2];
        data_ALU_out[24:31] = dataA_ALU_in[24:31]<<amt[3];
        data_ALU_out[32:39] = dataA_ALU_in[32:39]<<amt[4];
        data_ALU_out[40:47] = dataA_ALU_in[40:47]<<amt[5];
        data_ALU_out[48:55] = dataA_ALU_in[48:55]<<amt[6];
        data_ALU_out[56:63] = dataA_ALU_in[56:63]<<amt[7];
      end
      
      else if (size == 16) begin
        amt[0] = dataB_ALU_in[12:15];
        amt[1] = dataB_ALU_in[28:31];
        amt[2] = dataB_ALU_in[44:47];
        amt[3] = dataB_ALU_in[60:63];

        data_ALU_out[0:15] = dataA_ALU_in[0:15]<<amt[0];
        data_ALU_out[16:31] = dataA_ALU_in[16:31]<<amt[1];
        data_ALU_out[32:47] = dataA_ALU_in[32:47]<<amt[2];
        data_ALU_out[48:63] = dataA_ALU_in[48:63]<<amt[3];
      end
      
      else if (size == 32) begin
        amt[0] = dataB_ALU_in[27:31];
        amt[1] = dataB_ALU_in[59:63];

        data_ALU_out[0:31] = dataA_ALU_in[0:31]<<amt[0];
        data_ALU_out[32:63] = dataA_ALU_in[32:63]<<amt[1];
      end
      
      else begin
        amt[0] = dataB_ALU_in[58:63];

		data_ALU_out[0:63] = dataA_ALU_in[0:63]<<amt[0];
      end
      
    end
    
    
    // VSRL  -- Shift Right Logical
    else if (function_code == 6'b001011) begin
      
      if (size == 8) begin
        amt[0] = dataB_ALU_in[5:7];
        amt[1] = dataB_ALU_in[13:15];
        amt[2] = dataB_ALU_in[21:23];
        amt[3] = dataB_ALU_in[29:31];
        amt[4] = dataB_ALU_in[37:39];
        amt[5] = dataB_ALU_in[45:47];
        amt[6] = dataB_ALU_in[53:55];
        amt[7] = dataB_ALU_in[61:63];

        data_ALU_out[0:7] = dataA_ALU_in[0:7]>>amt[0];
        data_ALU_out[8:15] = dataA_ALU_in[8:15]>>amt[1];
        data_ALU_out[16:23] = dataA_ALU_in[16:23]>>amt[2];
        data_ALU_out[24:31] = dataA_ALU_in[24:31]>>amt[3];
        data_ALU_out[32:39] = dataA_ALU_in[32:39]>>amt[4];
        data_ALU_out[40:47] = dataA_ALU_in[40:47]>>amt[5];
        data_ALU_out[48:55] = dataA_ALU_in[48:55]>>amt[6];
        data_ALU_out[56:63] = dataA_ALU_in[56:63]>>amt[7];
      end
      
      else if (size == 16) begin
        amt[0] = dataB_ALU_in[12:15];
        amt[1] = dataB_ALU_in[28:31];
        amt[2] = dataB_ALU_in[44:47];
        amt[3] = dataB_ALU_in[60:63];

        data_ALU_out[0:15] = dataA_ALU_in[0:15]>>amt[0];
        data_ALU_out[16:31] = dataA_ALU_in[16:31]>>amt[1];
        data_ALU_out[32:47] = dataA_ALU_in[32:47]>>amt[2];
        data_ALU_out[48:63] = dataA_ALU_in[48:63]>>amt[3];
      end
      
      else if (size == 32) begin
        amt[0] = dataB_ALU_in[27:31];
        amt[1] = dataB_ALU_in[59:63];

        data_ALU_out[0:31] = dataA_ALU_in[0:31]>>amt[0];
        data_ALU_out[32:63] = dataA_ALU_in[32:63]>>amt[1];
      end
      
      else begin
        amt[0] = dataB_ALU_in[58:63];

		data_ALU_out[0:63] = dataA_ALU_in[0:63]>>amt[0];
      end
      
    end
    
    // VSRA  --  Shift Right Arithmetic
    else if (function_code == 6'b001100) begin
      
      if (size == 8) begin
        amt[0] = dataB_ALU_in[5:7];
        amt[1] = dataB_ALU_in[13:15];
        amt[2] = dataB_ALU_in[21:23];
        amt[3] = dataB_ALU_in[29:31];
        amt[4] = dataB_ALU_in[37:39];
        amt[5] = dataB_ALU_in[45:47];
        amt[6] = dataB_ALU_in[53:55];
        amt[7] = dataB_ALU_in[61:63];

        data_ALU_out[0:7] = $signed(dataA_ALU_in[0:7])>>>amt[0];
        data_ALU_out[8:15] = $signed(dataA_ALU_in[8:15])>>>amt[1];
        data_ALU_out[16:23] = $signed(dataA_ALU_in[16:23])>>>amt[2];
        data_ALU_out[24:31] = $signed(dataA_ALU_in[24:31])>>>amt[3];
        data_ALU_out[32:39] = $signed(dataA_ALU_in[32:39])>>>amt[4];
        data_ALU_out[40:47] = $signed(dataA_ALU_in[40:47])>>>amt[5];
        data_ALU_out[48:55] = $signed(dataA_ALU_in[48:55])>>>amt[6];
        data_ALU_out[56:63] = $signed(dataA_ALU_in[56:63])>>>amt[7];
      end
      
      else if (size == 16) begin
        amt[0] = dataB_ALU_in[12:15];
        amt[1] = dataB_ALU_in[28:31];
        amt[2] = dataB_ALU_in[44:47];
        amt[3] = dataB_ALU_in[60:63];

        data_ALU_out[0:15] = $signed(dataA_ALU_in[0:15])>>>amt[0];
        data_ALU_out[16:31] = $signed(dataA_ALU_in[16:31])>>>amt[1];
        data_ALU_out[32:47] = $signed(dataA_ALU_in[32:47])>>>amt[2];
        data_ALU_out[48:63] = $signed(dataA_ALU_in[48:63])>>>amt[3];
      end
      
      else if (size == 32) begin
        amt[0] = dataB_ALU_in[27:31];
        amt[1] = dataB_ALU_in[59:63];

        data_ALU_out[0:31] = $signed(dataA_ALU_in[0:31])>>>amt[0];
        data_ALU_out[32:63] = $signed(dataA_ALU_in[32:63])>>>amt[1];
      end
      
      else begin
        amt[0] = dataB_ALU_in[58:63];

        data_ALU_out[0:63] = $signed(dataA_ALU_in[0:63])>>>amt[0];
      end
      
    end
    
    // VRTTH  --  Rotate by Half
    else if (function_code == 6'b001101) begin
      
      if (size == 8) begin
        data_ALU_out[0:7] = {dataA_ALU_in[4:7],dataA_ALU_in[0:3]};
        data_ALU_out[8:15] = {dataA_ALU_in[12:15],dataA_ALU_in[8:11]};
        data_ALU_out[16:23] = {dataA_ALU_in[20:23],dataA_ALU_in[16:19]};
        data_ALU_out[24:31] = {dataA_ALU_in[28:31],dataA_ALU_in[24:27]};
        data_ALU_out[32:39] = {dataA_ALU_in[36:39],dataA_ALU_in[32:35]};
        data_ALU_out[40:47] = {dataA_ALU_in[44:47],dataA_ALU_in[40:43]};
        data_ALU_out[48:55] = {dataA_ALU_in[52:55],dataA_ALU_in[48:51]};
        data_ALU_out[56:63] = {dataA_ALU_in[60:63],dataA_ALU_in[56:59]};
      end
      
      else if (size == 16) begin
        data_ALU_out[0:15] = {dataA_ALU_in[8:15],dataA_ALU_in[0:7]};
        data_ALU_out[16:31] = {dataA_ALU_in[24:31],dataA_ALU_in[16:23]};
        data_ALU_out[32:47] = {dataA_ALU_in[40:47],dataA_ALU_in[32:39]};
        data_ALU_out[48:63] = {dataA_ALU_in[56:63],dataA_ALU_in[48:55]};
      end
      
      else if (size == 32) begin
        data_ALU_out[0:31] = {dataA_ALU_in[16:31],dataA_ALU_in[0:15]};
	data_ALU_out[32:63] = {dataA_ALU_in[48:63],dataA_ALU_in[32:47]};
      end
      
      else begin
        data_ALU_out[0:63] = {dataA_ALU_in[32:63],dataA_ALU_in[0:31]};
      end
      
    end
    
    // VDIV  -- Division Integer Unisigned
    else if (function_code == 6'b001110) begin
      
      if (size == 8) begin
        data_ALU_out = quotient8;
      end
      
      else if(size == 16) begin
        data_ALU_out = quotient16;
      end
      
      else if(size == 32) begin
        data_ALU_out = quotient32;
      end
      
      else begin
        data_ALU_out = quotient64;
      end
      
    end
    
    // VMOD  -- Modulo Integer Unsigned
    else if (function_code == 6'b001111) begin
      
      if (size == 8) begin
        data_ALU_out = remainder8;
      end
      
      else if(size == 16) begin
        data_ALU_out = remainder16;
      end
      
      else if(size == 32) begin
        data_ALU_out = remainder32;
      end
      
      else begin
        data_ALU_out = remainder64;
      end
      
    end
    
    // VSQEU  -- Square Even Unsigned
    else if (function_code == 6'b010000) begin
      
      if (size == 8) begin
        data_ALU_out[0:15]  = dataA_ALU_in[0:7]   * dataA_ALU_in[0:7];
        data_ALU_out[16:31] = dataA_ALU_in[16:23] * dataA_ALU_in[16:23];
        data_ALU_out[32:47] = dataA_ALU_in[32:39] * dataA_ALU_in[32:39];
        data_ALU_out[48:63] = dataA_ALU_in[48:55] * dataA_ALU_in[48:55];
      end
      
      else if (size == 16) begin
        data_ALU_out[0:31]  = dataA_ALU_in[0:15]  * dataA_ALU_in[0:15];
        data_ALU_out[32:63] = dataA_ALU_in[32:47] * dataA_ALU_in[32:47];
      end
      
      else if (size == 32) begin
        data_ALU_out = dataA_ALU_in[0:31] * dataA_ALU_in[0:31];
      end
      
      else begin
        data_ALU_out = 64'h0;
        // Should be a NOP
      end
      
    end
    
    // VSQOU  -- Square Odd Unsigned
    else if (function_code == 6'b010001) begin
      
      if (size == 8) begin
        data_ALU_out[0:15]  = dataA_ALU_in[8:15]  * dataA_ALU_in[8:15];
        data_ALU_out[16:31] = dataA_ALU_in[24:31] * dataA_ALU_in[24:31];
        data_ALU_out[32:47] = dataA_ALU_in[40:47] * dataA_ALU_in[40:47];
        data_ALU_out[48:63] = dataA_ALU_in[56:63] * dataA_ALU_in[56:63];
      end
      
      else if (size == 16) begin
        data_ALU_out[0:31]  = dataA_ALU_in[16:31] * dataA_ALU_in[16:31];
        data_ALU_out[32:63] = dataA_ALU_in[48:63] * dataA_ALU_in[48:63];
      end
      
      else if (size == 32) begin
        data_ALU_out = dataA_ALU_in[32:63] * dataA_ALU_in[32:63];
      end
      
      else begin
        data_ALU_out = 64'h0;
        // Should be a NOP
      end
      
    end
    
    // VSQRT  --  Square root
    else if (function_code == 6'b010010) begin
      
      if (size == 8) begin
        data_ALU_out [0:7]  = {4'b0000, sqrt8_out[4:7]};
        data_ALU_out [8:15] = {4'b0000, sqrt8_out[12:15]};
        data_ALU_out [16:23] = {4'b0000, sqrt8_out[20:23]};
        data_ALU_out [24:31] = {4'b0000, sqrt8_out[28:31]};
        data_ALU_out [32:39] = {4'b0000, sqrt8_out[36:39]};
        data_ALU_out [40:47] = {4'b0000, sqrt8_out[44:47]};
        data_ALU_out [48:55] = {4'b0000, sqrt8_out[52:55]};
        data_ALU_out [56:63] = {4'b0000, sqrt8_out[60:63]};
      end
      
      else if (size == 16) begin
        data_ALU_out [0:15] = {8'h0, sqrt16_out[0:7]};
        data_ALU_out [16:31] = {8'h0, sqrt16_out[8:15]};
        data_ALU_out [32:47] = {8'h0, sqrt16_out[16:23]};
        data_ALU_out [48:63] = {8'h0, sqrt16_out[24:31]};
      end
      
      else if (size == 32) begin
        data_ALU_out [0:31] = {16'h0, sqrt32_out[0:15]};
        data_ALU_out [32:63] = {16'h0, sqrt32_out[16:31]};
      end
      
      else begin
        data_ALU_out [0:63] = {32'b00000000000000000000000000000000, sqrt64_out[0:31]};
      end
    end
    
    else begin
      data_ALU_out = 0;
      // Should be a NOP
    end
    
  end
  
endmodule



module TOP(
    input clk, reset,
    input [0:31] Instr_from_imem,
    output reg [0:31] PC,
    output memEn_to_dmem, memWrEn_to_dmem,
    output [0:31] memAddr_to_dmem,
    output [0:63] data_to_dmem,
    input [0:63] data_from_dmem,

    output [0:1] addr_nic,
    output [0:63] din_to_nic,
    input [0:63] dout_from_nic,
    output nicEn,
    output nicWrEn
    
    );
  
  
  
  

  //reg [0:31] PC; // Program Counter
  //wire [0:31] Instr; // Instr comes out of imem, but what goes into the stage1 reg could be different coz it will be changed into NOP if BTaken
  wire [0:31] Instr_to_stage1; // This is what goes as instruction into stage1 reg. This is the modified instr after flush scenario for Instr_from_imem

  wire [0:31] stage1_IF_ID_out; // Stage1 register output
  wire [0:4] rA, rB, rD; // rA, rB, rD extracted from stage1_IF_ID_out
  wire [0:4]rdAddr1_in, rdAddr2_in; // The read addresses that go into reg file. rdAddr1_in could be rD or rA depending on rDType
  wire rDType, BType, BTaken; // signals to indicate if the instruction in stage1 reg is rDType, BType and Branch Taken
  wire [0:63] rdData1_out, rdData2_out; // data that comes out of the reg file. This does not go into stage 2 reg. Forwarding will be done.
  wire [0:31] Instr_to_stage2;
  wire [0:7] data1_to_stage2_B0, data1_to_stage2_B1, data1_to_stage2_B2, data1_to_stage2_B3, data1_to_stage2_B4, data1_to_stage2_B5, data1_to_stage2_B6, data1_to_stage2_B7;
  wire [0:7] data2_to_stage2_B0, data2_to_stage2_B1, data2_to_stage2_B2, data2_to_stage2_B3, data2_to_stage2_B4, data2_to_stage2_B5, data2_to_stage2_B6, data2_to_stage2_B7; // after forwarding byte signals
  wire [0:63] data1_to_stage2, data2_to_stage2; // after forwarding taken care send these data


  wire [0:159] stage2_ID_EXMEM_out;
  wire [0:63] forward_from_EX, forward_from_WB; // data that will be forwarded from EX and WB stage
  //wire Haz_from_EX_to_SR1, Haz_from_EX_to_SR2, Haz_from_WB_to_SR1, Haz_from_WB_to_SR2; // hazard detection signals
  wire Haz_from_EX_to_SR1_B0, Haz_from_EX_to_SR1_B1, Haz_from_EX_to_SR1_B2, Haz_from_EX_to_SR1_B3, Haz_from_EX_to_SR1_B4, Haz_from_EX_to_SR1_B5, Haz_from_EX_to_SR1_B6, Haz_from_EX_to_SR1_B7;
  wire Haz_from_EX_to_SR2_B0, Haz_from_EX_to_SR2_B1, Haz_from_EX_to_SR2_B2, Haz_from_EX_to_SR2_B3, Haz_from_EX_to_SR2_B4, Haz_from_EX_to_SR2_B5, Haz_from_EX_to_SR2_B6, Haz_from_EX_to_SR2_B7;
  
  wire ALU_en;
  wire [0:63] ALU_data_out;
  //wire memEn, memWrEn;
  //wire [0:63] mem_data_out;
  wire [0:63] data_to_stage3;
  wire stall;
  
  wire Haz_from_WB_to_SR1_B0, Haz_from_WB_to_SR1_B1, Haz_from_WB_to_SR1_B2, Haz_from_WB_to_SR1_B3, Haz_from_WB_to_SR1_B4, Haz_from_WB_to_SR1_B5, Haz_from_WB_to_SR1_B6, Haz_from_WB_to_SR1_B7; 
  wire Haz_from_WB_to_SR2_B0, Haz_from_WB_to_SR2_B1, Haz_from_WB_to_SR2_B2, Haz_from_WB_to_SR2_B3, Haz_from_WB_to_SR2_B4, Haz_from_WB_to_SR2_B5, Haz_from_WB_to_SR2_B6, Haz_from_WB_to_SR2_B7;

  
  wire [0:72] stage3_EXMEM_WB_out;
  wire RegWrEn_from_WB;
  wire [0:4] WriteAdd_from_WB;
  wire [0:2] PPP_from_WB;

  pipeline_stages pipe(
    .clk(clk), .reset(reset), .en(~stall),
    .data_in_stage1_IF_ID({Instr_to_stage1}), .stage1_IF_ID(stage1_IF_ID_out),
    .data_in_stage2_ID_EXMEM({Instr_to_stage2, data1_to_stage2, data2_to_stage2}), .stage2_ID_EXMEM(stage2_ID_EXMEM_out),
    .data_in_stage3_EXMEM_WB({(stage2_ID_EXMEM_out[0:5] == 6'b100000 || stage2_ID_EXMEM_out[0:5] == 6'b101010), stage2_ID_EXMEM_out[6:10], stage2_ID_EXMEM_out[21:23] , data_to_stage3}), .stage3_EXMEM_WB(stage3_EXMEM_WB_out) // stage2_ID_EXMEM_out[6:10]: WrAddr, stage2_ID_EXMEM_out[21:24]: PPP, stage2_ID_EXMEM_out[0:5] == 6'b100000 : RegWrEn
    );





  // IF Stage

  always@(posedge clk) begin
    if(reset) begin
      PC <= 0; // PC 0 on reset
    end
    else if (~stall)begin
      PC <= BTaken ? {16'b0000000000000000,stage1_IF_ID_out[16:31]} : PC+4; // If Branch taken, place immediate address in the branch instr into PC else place PC+4
    end
  end
  //imem IM(.memAddr(PC), .dataOut(Instr)); // send PC 32 bit PC, get 32 bit Instr
  wire bad_func_code, invalid_alu_instr, r0_writing, bad_opcode;
  assign bad_func_code = Instr_from_imem[0:5] == 6'b101010 && (Instr_from_imem[26:31] > 18 || Instr_from_imem[26:31] == 0);
  assign invalid_alu_instr = Instr_from_imem[0:5] == 6'b101010 && (Instr_from_imem[26:31] == 8 || Instr_from_imem[26:31] == 9 ||  Instr_from_imem[26:31] == 16 || Instr_from_imem[26:31] == 17) && Instr_from_imem[24:25] == 2'b11;
  assign r0_writing = (Instr_from_imem[0:5] == 6'b101010 || Instr_from_imem[0:5] == 6'b100000) && Instr_from_imem[6:10] == 0;
  assign bad_opcode = Instr_from_imem[0:5] != 6'b101010 && Instr_from_imem[0:5] != 6'b100000 && Instr_from_imem[0:5] != 6'b100001 && Instr_from_imem[0:5] != 6'b100010 && Instr_from_imem[0:5] != 6'b100011;



  assign Instr_to_stage1 = (BTaken || bad_func_code || invalid_alu_instr || r0_writing || bad_opcode) ? {6'b111100, Instr_from_imem[6:31]}: Instr_from_imem; // Turn the instruction's opcode to NOP's opcode if BTaken or if function code is invalid >18 and it's an R Type or opcode is invalid not in the ISA
  // Instr_to_stage1 and PC go to data_in_stage1_IF_ID register

  
  
  
  // ID Stage
  

  assign rA = stage1_IF_ID_out[11:15]; // rA, rB, rD extracted from stage1_IF_ID_out but these won't go to the reg file directly
  assign rB = stage1_IF_ID_out[16:20];
  assign rD = stage1_IF_ID_out[6:10];

  assign BType = (stage1_IF_ID_out[0:5] == 6'b100010 || stage1_IF_ID_out[0:5] == 6'b100011);
  assign rDType = ~stage1_IF_ID_out[2]; // check for invalid opcodes later

  assign rdAddr1_in = (rDType) ? rD : rA; // For rDType instr, we need to read data from register rD for other types read rA
  assign rdAddr2_in = rB; // For rDType, we don't need to read rB at all. It's wasteful but not harmful

  RegisterFile RF(.clk(clk), .reset(reset), .wrEn(RegWrEn_from_WB), .wrAddr(WriteAdd_from_WB), .wrData(stage3_EXMEM_WB_out[9:72]), .rdAddr1(rdAddr1_in), .rdData1(rdData1_out), .rdAddr2(rdAddr2_in), .rdData2(rdData2_out), .PPP(PPP_from_WB));

  assign BTaken = (BType) && ( (data1_to_stage2 == 0 && stage1_IF_ID_out[5] == 0) || (data1_to_stage2 != 0 && stage1_IF_ID_out[5] == 1) ); // update with forwarding values

  // If branch is taken --> Flush IF|ID (When it moves to ID|EX change its opcode to NOP opcode)
  // PC should jump to branch imm add

  // Now check for Hazards

  HDU HDU1(
    .Dest_EX_Stage(stage2_ID_EXMEM_out[6:10]), .Dest_WB_Stage(stage3_EXMEM_WB_out[1:5]), .SR1_ID_Stage(rdAddr1_in), .SR2_ID_Stage(rdAddr2_in),
    .Write_Intent_EX(stage2_ID_EXMEM_out[0:5] == 6'b101010 || stage2_ID_EXMEM_out[0:5] == 6'b100000), 
    .Write_Intent_WB(stage3_EXMEM_WB_out[0]), 
    .read_Intent(~(stage1_IF_ID_out[0:5] == 6'b100000 || stage1_IF_ID_out[0:5] == 6'b111100)),
    .PPP_EX(stage2_ID_EXMEM_out[21:23]), .PPP_WB(PPP_from_WB),
    .Haz_from_EX_to_SR1_B0(Haz_from_EX_to_SR1_B0), .Haz_from_EX_to_SR1_B1(Haz_from_EX_to_SR1_B1), .Haz_from_EX_to_SR1_B2(Haz_from_EX_to_SR1_B2), .Haz_from_EX_to_SR1_B3(Haz_from_EX_to_SR1_B3), .Haz_from_EX_to_SR1_B4(Haz_from_EX_to_SR1_B4), .Haz_from_EX_to_SR1_B5(Haz_from_EX_to_SR1_B5), .Haz_from_EX_to_SR1_B6(Haz_from_EX_to_SR1_B6), .Haz_from_EX_to_SR1_B7(Haz_from_EX_to_SR1_B7),
    .Haz_from_EX_to_SR2_B0(Haz_from_EX_to_SR2_B0), .Haz_from_EX_to_SR2_B1(Haz_from_EX_to_SR2_B1), .Haz_from_EX_to_SR2_B2(Haz_from_EX_to_SR2_B2), .Haz_from_EX_to_SR2_B3(Haz_from_EX_to_SR2_B3), .Haz_from_EX_to_SR2_B4(Haz_from_EX_to_SR2_B4), .Haz_from_EX_to_SR2_B5(Haz_from_EX_to_SR2_B5), .Haz_from_EX_to_SR2_B6(Haz_from_EX_to_SR2_B6), .Haz_from_EX_to_SR2_B7(Haz_from_EX_to_SR2_B7),  
    .Haz_from_WB_to_SR1_B0(Haz_from_WB_to_SR1_B0), .Haz_from_WB_to_SR1_B1(Haz_from_WB_to_SR1_B1), .Haz_from_WB_to_SR1_B2(Haz_from_WB_to_SR1_B2), .Haz_from_WB_to_SR1_B3(Haz_from_WB_to_SR1_B3), .Haz_from_WB_to_SR1_B4(Haz_from_WB_to_SR1_B4), .Haz_from_WB_to_SR1_B5(Haz_from_WB_to_SR1_B5), .Haz_from_WB_to_SR1_B6(Haz_from_WB_to_SR1_B6), .Haz_from_WB_to_SR1_B7(Haz_from_WB_to_SR1_B7), 
    .Haz_from_WB_to_SR2_B0(Haz_from_WB_to_SR2_B0), .Haz_from_WB_to_SR2_B1(Haz_from_WB_to_SR2_B1), .Haz_from_WB_to_SR2_B2(Haz_from_WB_to_SR2_B2), .Haz_from_WB_to_SR2_B3(Haz_from_WB_to_SR2_B3), .Haz_from_WB_to_SR2_B4(Haz_from_WB_to_SR2_B4), .Haz_from_WB_to_SR2_B5(Haz_from_WB_to_SR2_B5), .Haz_from_WB_to_SR2_B6(Haz_from_WB_to_SR2_B6), .Haz_from_WB_to_SR2_B7(Haz_from_WB_to_SR2_B7)
);

  //B0 0:7
  //B1 8:15
  //B2 16:23
  //B3 24:31
  //B4 32:39
  //B5 40:47
  //B6 48:55
  //B7 56:63 data_to_stage3 

  assign forward_from_EX = data_to_stage3;
  assign forward_from_WB = stage3_EXMEM_WB_out[9:72];


  assign Instr_to_stage2 = stage1_IF_ID_out [0:31];
  assign data1_to_stage2_B0 = Haz_from_EX_to_SR1_B0 ? forward_from_EX[0:7] : (Haz_from_WB_to_SR1_B0 ? forward_from_WB[0:7] : rdData1_out[0:7]); // if Haz from WB to source1 data, choose forward_from_WB  again if Haz from Ex to source1 data, choose forward_from_EX, if not hazards, choose rdData1 directly from reg file
  assign data1_to_stage2_B1 = Haz_from_EX_to_SR1_B1 ? forward_from_EX[8:15] : (Haz_from_WB_to_SR1_B1 ? forward_from_WB[8:15] : rdData1_out[8:15]);
  assign data1_to_stage2_B2 = Haz_from_EX_to_SR1_B2 ? forward_from_EX[16:23] : (Haz_from_WB_to_SR1_B2 ? forward_from_WB[16:23] : rdData1_out[16:23]);
  assign data1_to_stage2_B3 = Haz_from_EX_to_SR1_B3 ? forward_from_EX[24:31] : (Haz_from_WB_to_SR1_B3 ? forward_from_WB[24:31] : rdData1_out[24:31]);
  assign data1_to_stage2_B4 = Haz_from_EX_to_SR1_B4 ? forward_from_EX[32:39] : (Haz_from_WB_to_SR1_B4 ? forward_from_WB[32:39] : rdData1_out[32:39]);
  assign data1_to_stage2_B5 = Haz_from_EX_to_SR1_B5 ? forward_from_EX[40:47] : (Haz_from_WB_to_SR1_B5 ? forward_from_WB[40:47] : rdData1_out[40:47]);
  assign data1_to_stage2_B6 = Haz_from_EX_to_SR1_B6 ? forward_from_EX[48:55] : (Haz_from_WB_to_SR1_B6 ? forward_from_WB[48:55] : rdData1_out[48:55]);
  assign data1_to_stage2_B7 = Haz_from_EX_to_SR1_B7 ? forward_from_EX[56:63] : (Haz_from_WB_to_SR1_B7 ? forward_from_WB[56:63] : rdData1_out[56:63]);
  assign data1_to_stage2 = {data1_to_stage2_B0, data1_to_stage2_B1, data1_to_stage2_B2, data1_to_stage2_B3, data1_to_stage2_B4, data1_to_stage2_B5, data1_to_stage2_B6, data1_to_stage2_B7};


  // if Haz from WB to source2 data, choose forward_from_WB  again if Haz from Ex to source2 data, choose forward_from_EX, if not hazards, choose rdData2 directly from reg file 
  assign data2_to_stage2_B0 = Haz_from_EX_to_SR2_B0 ? forward_from_EX[0:7] : (Haz_from_WB_to_SR2_B0 ? forward_from_WB[0:7] : rdData2_out[0:7]);
  assign data2_to_stage2_B1 = Haz_from_EX_to_SR2_B1 ? forward_from_EX[8:15] : (Haz_from_WB_to_SR2_B1 ? forward_from_WB[8:15] : rdData2_out[8:15]);
  assign data2_to_stage2_B2 = Haz_from_EX_to_SR2_B2 ? forward_from_EX[16:23] : (Haz_from_WB_to_SR2_B2 ? forward_from_WB[16:23] : rdData2_out[16:23]);
  assign data2_to_stage2_B3 = Haz_from_EX_to_SR2_B3 ? forward_from_EX[24:31] : (Haz_from_WB_to_SR2_B3 ? forward_from_WB[24:31] : rdData2_out[24:31]);
  assign data2_to_stage2_B4 = Haz_from_EX_to_SR2_B4 ? forward_from_EX[32:39] : (Haz_from_WB_to_SR2_B4 ? forward_from_WB[32:39] : rdData2_out[32:39]);
  assign data2_to_stage2_B5 = Haz_from_EX_to_SR2_B5 ? forward_from_EX[40:47] : (Haz_from_WB_to_SR2_B5 ? forward_from_WB[40:47] : rdData2_out[40:47]);
  assign data2_to_stage2_B6 = Haz_from_EX_to_SR2_B6 ? forward_from_EX[48:55] : (Haz_from_WB_to_SR2_B6 ? forward_from_WB[48:55] : rdData2_out[48:55]);
  assign data2_to_stage2_B7 = Haz_from_EX_to_SR2_B7 ? forward_from_EX[56:63] : (Haz_from_WB_to_SR2_B7 ? forward_from_WB[56:63] : rdData2_out[56:63]);
  assign data2_to_stage2 = {data2_to_stage2_B0, data2_to_stage2_B1, data2_to_stage2_B2, data2_to_stage2_B3, data2_to_stage2_B4, data2_to_stage2_B5, data2_to_stage2_B6, data2_to_stage2_B7};

  //EX Stage

  wire [0:2] count_out;

  counter cntr(.clk(~clk), .reset(reset), .start(memEn_to_dmem), .length(3'b000), .count(count_out));

  assign stall = count_out != 0;


  assign addr_nic = stage2_ID_EXMEM_out[30:31];
  assign din_to_nic = stage2_ID_EXMEM_out[32:95];
  assign nicEn = (stage2_ID_EXMEM_out[16:17] == 2'b11)  && (stage2_ID_EXMEM_out[0:5] == 6'b100000 || stage2_ID_EXMEM_out[0:5] == 6'b100001);
  assign nicWrEn = stage2_ID_EXMEM_out[0:5] == 6'b100001 && stage2_ID_EXMEM_out[16:17] == 2'b11;


  assign ALU_en = (stage2_ID_EXMEM_out[0:5] == 6'b101010) && stage2_ID_EXMEM_out[26:31] <= 18; //  stage2_ID_EXMEM_out[26:31] <= 18 not req coz we already turn invalid inst to nops

  ALU ALU_DUT(.function_code(stage2_ID_EXMEM_out[26:31]), .dataA_ALU_in(stage2_ID_EXMEM_out[32:95]), .dataB_ALU_in(stage2_ID_EXMEM_out[96:159]), .data_ALU_out(ALU_data_out), .ww(stage2_ID_EXMEM_out[24:25]));



  assign memEn_to_dmem = (stage2_ID_EXMEM_out[0:5] == 6'b100000 || stage2_ID_EXMEM_out[0:5] == 6'b100001) && (stage2_ID_EXMEM_out[16:17] != 2'b11); // LD or SD is memEn_to_dmem
  assign memWrEn_to_dmem = stage2_ID_EXMEM_out[0:5] == 6'b100001 && stage2_ID_EXMEM_out[16:17] != 2'b11; // SD is memWrEn_to_dmem
  assign memAddr_to_dmem = {16'b0000000000000000,stage2_ID_EXMEM_out[16:31]};
  assign data_to_dmem = stage2_ID_EXMEM_out[32:95];

  
  //dmem dmem_dut (.clk(clk), .memEn(memEn), .memWrEn(memWrEn), .memAddr(stage2_ID_EXMEM_out[16:31]), .dataIn(stage2_ID_EXMEM_out[32:95]), .dataOut(mem_data_out));

  wire [0:63] nic_or_dmem_dout;
  
  assign nic_or_dmem_dout = stage2_ID_EXMEM_out[16:17] == 2'b11 ? dout_from_nic:data_from_dmem;
  assign data_to_stage3 = stage2_ID_EXMEM_out[0:5] == 6'b100000  ? nic_or_dmem_dout:ALU_data_out; // If it was a load operation then place mem output or place ALU output


  //WB Stage

  assign RegWrEn_from_WB = stage3_EXMEM_WB_out[0] && ~stall;
  assign WriteAdd_from_WB = stage3_EXMEM_WB_out[1:5];
  assign PPP_from_WB = stage3_EXMEM_WB_out[6:8];

endmodule


 
  
