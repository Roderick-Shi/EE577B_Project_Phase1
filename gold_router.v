/* /////////////////////////////////////////////


gold_router design 


//////////////////////////////////////////////*/



module gold_router(
	input wire clk,
	input wire reset, //syn active high 
	output reg polarity, //0 during reset; toggles each cycle after 
	
	//clockwise input channel
	input wire           cwsi, //“Send in” from upstream CW router. Indicates a valid packet is being sent.
	output reg           cwri, //“Ready in” — tells the upstream CW router whether this router’s CW input buffer has space (1 = empty).
	input wire [63:0]    cwdi, //64-bit packet data from upstream CW router. Latched into input buffer when cwsi=1 and cwri=1.
	
	//clockwise output channel
	output reg           cwso, //“Send out” — asserted when router sends a valid packet to the next CW router.
	input wire           cwro, //“Ready out” — indicates that the next CW router has buffer space (i.e., its cwri = 1). If cwro=0, this router must hold the flit.
	output reg [63:0]    cwdo, //64-bit packet data driven on CW output channel when cwso=1 and cwro=1.
	
	//couter-clockwise input 
	input wire           ccwsi, //“Send in” from upstream CCW router. Indicates valid packet data incoming.
	output reg           ccwri, //“Ready in” — signals buffer availability to upstream CCW router (1 = can accept).
	input wire [63:0]    ccwdi, //64-bit data bus from upstream CCW router. Latched on ccwsi & ccwri rising edge.
	
	//counter clockwise output channel
	output reg           ccwso, //“Send out” — asserted when router forwards a packet to next CCW router.
	input wire           ccwro, //“Ready out” — indicates downstream CCW router can receive data. 
	output reg [63:0]    ccwdo, //64-bit packet data from this router to next CCW router.
	
	//PE input channel
	input wire           pesi, //send in from the PE, when 1, means the PE/NIC is sending a valid packet to the router
	output reg           peri, //read in, router tells PE it's ready to accept a packet, 1 = buffer empty, 0 = buffer full
	input wire [63:0]    pedi, //64 bits packet data from PE into router input buffer 
	
	//PE output channel
	output reg           peso, //“Send out” — router asserts this when it is outputting a valid packet to the PE.
	input wire           pero, //“Ready out” — PE indicates it can accept a packet. For the testbench, this is always 1, meaning PE never blocks
	output reg [63:0]    pedo  //64-bit packet data sent to PE when peso=1 and pero=1.
	

);

