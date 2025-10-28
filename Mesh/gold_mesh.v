`timescale 1ns/1ps

// For Router:
// Input side signals: Indicate the direction where the packet comes from
// Output side signals: Indicate the direction that the packet is passing to

//(y)
// ↑
// | N03  N13  N23  N33
// | N02  N12  N22  N32
// | N01  N11  N21  N31
// | N00  N10  N20  N30
// +-------------------- → x


module gold_mesh(
  input clk, reset, polarity,
  
  // Inputs for NIC_si from 00 to 33
  input NIC_si_00, NIC_si_01, NIC_si_02, NIC_si_03,
  input NIC_si_10, NIC_si_11, NIC_si_12, NIC_si_13,
  input NIC_si_20, NIC_si_21, NIC_si_22, NIC_si_23,
  input NIC_si_30, NIC_si_31, NIC_si_32, NIC_si_33,
  
  // Inputs for NIC_di from 00 to 33
  input [63:0] NIC_di_00, NIC_di_01, NIC_di_02, NIC_di_03,
  input [63:0] NIC_di_10, NIC_di_11, NIC_di_12, NIC_di_13,
  input [63:0] NIC_di_20, NIC_di_21, NIC_di_22, NIC_di_23,
  input [63:0] NIC_di_30, NIC_di_31, NIC_di_32, NIC_di_33,

  // Outputs for NIC_ri from 00 to 33
  output NIC_ri_00, NIC_ri_01, NIC_ri_02, NIC_ri_03,
  output NIC_ri_10, NIC_ri_11, NIC_ri_12, NIC_ri_13,
  output NIC_ri_20, NIC_ri_21, NIC_ri_22, NIC_ri_23,
  output NIC_ri_30, NIC_ri_31, NIC_ri_32, NIC_ri_33,

  // Outputs for NIC_so from 00 to 33
  output NIC_so_00, NIC_so_01, NIC_so_02, NIC_so_03,
  output NIC_so_10, NIC_so_11, NIC_so_12, NIC_so_13,
  output NIC_so_20, NIC_so_21, NIC_so_22, NIC_so_23,
  output NIC_so_30, NIC_so_31, NIC_so_32, NIC_so_33,

  // Outputs for NIC_do from 00 to 33
  output [63:0] NIC_do_00, NIC_do_01, NIC_do_02, NIC_do_03,
  output [63:0] NIC_do_10, NIC_do_11, NIC_do_12, NIC_do_13,
  output [63:0] NIC_do_20, NIC_do_21, NIC_do_22, NIC_do_23,
  output [63:0] NIC_do_30, NIC_do_31, NIC_do_32, NIC_do_33,

  // Inputs for NIC_ro from 00 to 33
  input NIC_ro_00, NIC_ro_01, NIC_ro_02, NIC_ro_03,
  input NIC_ro_10, NIC_ro_11, NIC_ro_12, NIC_ro_13,
  input NIC_ro_20, NIC_ro_21, NIC_ro_22, NIC_ro_23,
  input NIC_ro_30, NIC_ro_31, NIC_ro_32, NIC_ro_33


);

// Input ready signals from neighboring nodes
wire up_si_00, up_si_01, up_si_02, up_si_03; // North input ready signals
wire down_si_00, down_si_01, down_si_02, down_si_03; // South input ready signals
wire left_si_00, left_si_01, left_si_02, left_si_03; // West input ready signals
wire right_si_00, right_si_01, right_si_02, right_si_03; // East input ready signals

// Input data signals (64-bit)
wire [63:0] up_di_00, up_di_01, up_di_02, up_di_03; // Data from North
wire [63:0] down_di_00, down_di_01, down_di_02, down_di_03; // Data from South
wire [63:0] left_di_00, left_di_01, left_di_02, left_di_03; // Data from West
wire [63:0] right_di_00, right_di_01, right_di_02, right_di_03; // Data from East

// Output ready signals to neighboring nodes
wire up_ro_00, up_ro_01, up_ro_02, up_ro_03; // North output ready signals
wire down_ro_00, down_ro_01, down_ro_02, down_ro_03; // South output ready signals
wire left_ro_00, left_ro_01, left_ro_02, left_ro_03; // West output ready signals
wire right_ro_00, right_ro_01, right_ro_02, right_ro_03; // East output ready signals

// Output ready signals from nodes
wire up_ri_00, up_ri_01, up_ri_02, up_ri_03; // North input ready signals
wire down_ri_00, down_ri_01, down_ri_02, down_ri_03; // South input ready signals
wire left_ri_00, left_ri_01, left_ri_02, left_ri_03; // West input ready signals
wire right_ri_00, right_ri_01, right_ri_02, right_ri_03; // East input ready signals

// Output data signals (64-bit)
wire [63:0] up_do_00, up_do_01, up_do_02, up_do_03; // Data to North
wire [63:0] down_do_00, down_do_01, down_do_02, down_do_03; // Data to South
wire [63:0] left_do_00, left_do_01, left_do_02, left_do_03; // Data to West
wire [63:0] right_do_00, right_do_01, right_do_02, right_do_03; // Data to East

// Output valid signals from nodes (added XOB_so signals)
wire up_so_00, up_so_01, up_so_02, up_so_03; // North output valid signals
wire down_so_00, down_so_01, down_so_02, down_so_03; // South output valid signals
wire left_so_00, left_so_01, left_so_02, left_so_03; // West output valid signals
wire right_so_00, right_so_01, right_so_02, right_so_03; // East output valid signals

// Repeat for all rows (01, 02, 03) and all nodes
// Input ready signals from neighboring nodes
wire up_si_10, up_si_11, up_si_12, up_si_13; // North input ready signals
wire down_si_10, down_si_11, down_si_12, down_si_13; // South input ready signals
wire left_si_10, left_si_11, left_si_12, left_si_13; // West input ready signals
wire right_si_10, right_si_11, right_si_12, right_si_13; // East input ready signals

// Input data signals (64-bit)
wire [63:0] up_di_10, up_di_11, up_di_12, up_di_13; // Data from North
wire [63:0] down_di_10, down_di_11, down_di_12, down_di_13; // Data from South
wire [63:0] left_di_10, left_di_11, left_di_12, left_di_13; // Data from West
wire [63:0] right_di_10, right_di_11, right_di_12, right_di_13; // Data from East

// Output ready signals to neighboring nodes
wire up_ro_10, up_ro_11, up_ro_12, up_ro_13; // North output ready signals
wire down_ro_10, down_ro_11, down_ro_12, down_ro_13; // South output ready signals
wire left_ro_10, left_ro_11, left_ro_12, left_ro_13; // West output ready signals
wire right_ro_10, right_ro_11, right_ro_12, right_ro_13; // East output ready signals

// Output ready signals from nodes
wire up_ri_10, up_ri_11, up_ri_12, up_ri_13; // North input ready signals
wire down_ri_10, down_ri_11, down_ri_12, down_ri_13; // South input ready signals
wire left_ri_10, left_ri_11, left_ri_12, left_ri_13; // West input ready signals
wire right_ri_10, right_ri_11, right_ri_12, right_ri_13; // East input ready signals

// Output data signals (64-bit)
wire [63:0] up_do_10, up_do_11, up_do_12, up_do_13; // Data to North
wire [63:0] down_do_10, down_do_11, down_do_12, down_do_13; // Data to South
wire [63:0] left_do_10, left_do_11, left_do_12, left_do_13; // Data to West
wire [63:0] right_do_10, right_do_11, right_do_12, right_do_13; // Data to East

// Output valid signals from nodes (added XOB_so signals)
wire up_so_10, up_so_11, up_so_12, up_so_13; // North output valid signals
wire down_so_10, down_so_11, down_so_12, down_so_13; // South output valid signals
wire left_so_10, left_so_11, left_so_12, left_so_13; // West output valid signals
wire right_so_10, right_so_11, right_so_12, right_so_13; // East output valid signals

// Repeat for nodes 20 to 33
// Input ready signals from neighboring nodes
wire up_si_20, up_si_21, up_si_22, up_si_23; // North input ready signals
wire down_si_20, down_si_21, down_si_22, down_si_23; // South input ready signals
wire left_si_20, left_si_21, left_si_22, left_si_23; // West input ready signals
wire right_si_20, right_si_21, right_si_22, right_si_23; // East input ready signals

// Input data signals (64-bit)
wire [63:0] up_di_20, up_di_21, up_di_22, up_di_23; // Data from North
wire [63:0] down_di_20, down_di_21, down_di_22, down_di_23; // Data from South
wire [63:0] left_di_20, left_di_21, left_di_22, left_di_23; // Data from West
wire [63:0] right_di_20, right_di_21, right_di_22, right_di_23; // Data from East

// Output ready signals to neighboring nodes
wire up_ro_20, up_ro_21, up_ro_22, up_ro_23; // North output ready signals
wire down_ro_20, down_ro_21, down_ro_22, down_ro_23; // South output ready signals
wire left_ro_20, left_ro_21, left_ro_22, left_ro_23; // West output ready signals
wire right_ro_20, right_ro_21, right_ro_22, right_ro_23; // East output ready signals

// Output ready signals from nodes
wire up_ri_20, up_ri_21, up_ri_22, up_ri_23; // North input ready signals
wire down_ri_20, down_ri_21, down_ri_22, down_ri_23; // South input ready signals
wire left_ri_20, left_ri_21, left_ri_22, left_ri_23; // West input ready signals
wire right_ri_20, right_ri_21, right_ri_22, right_ri_23; // East input ready signals

// Output data signals (64-bit)
wire [63:0] up_do_20, up_do_21, up_do_22, up_do_23; // Data to North
wire [63:0] down_do_20, down_do_21, down_do_22, down_do_23; // Data to South
wire [63:0] left_do_20, left_do_21, left_do_22, left_do_23; // Data to West
wire [63:0] right_do_20, right_do_21, right_do_22, right_do_23; // Data to East

// Output valid signals from nodes (added XOB_so signals)
wire up_so_20, up_so_21, up_so_22, up_so_23; // North output valid signals
wire down_so_20, down_so_21, down_so_22, down_so_23; // South output valid signals
wire left_so_20, left_so_21, left_so_22, left_so_23; // West output valid signals
wire right_so_20, right_so_21, right_so_22, right_so_23; // East output valid signals

// Input ready signals from neighboring nodes
wire up_si_30, up_si_31, up_si_32, up_si_33; // North input ready signals
wire down_si_30, down_si_31, down_si_32, down_si_33; // South input ready signals
wire left_si_30, left_si_31, left_si_32, left_si_33; // West input ready signals
wire right_si_30, right_si_31, right_si_32, right_si_33; // East input ready signals

// Input data signals (64-bit)
wire [63:0] up_di_30, up_di_31, up_di_32, up_di_33; // Data from North
wire [63:0] down_di_30, down_di_31, down_di_32, down_di_33; // Data from South
wire [63:0] left_di_30, left_di_31, left_di_32, left_di_33; // Data from West
wire [63:0] right_di_30, right_di_31, right_di_32, right_di_33; // Data from East

// Output ready signals to neighboring nodes
wire up_ro_30, up_ro_31, up_ro_32, up_ro_33; // North output ready signals
wire down_ro_30, down_ro_31, down_ro_32, down_ro_33; // South output ready signals
wire left_ro_30, left_ro_31, left_ro_32, left_ro_33; // West output ready signals
wire right_ro_30, right_ro_31, right_ro_32, right_ro_33; // East output ready signals

// Output ready signals from nodes
wire up_ri_30, up_ri_31, up_ri_32, up_ri_33; // North input ready signals
wire down_ri_30, down_ri_31, down_ri_32, down_ri_33; // South input ready signals
wire left_ri_30, left_ri_31, left_ri_32, left_ri_33; // West input ready signals
wire right_ri_30, right_ri_31, right_ri_32, right_ri_33; // East input ready signals

// Output data signals (64-bit)
wire [63:0] up_do_30, up_do_31, up_do_32, up_do_33; // Data to North
wire [63:0] down_do_30, down_do_31, down_do_32, down_do_33; // Data to South
wire [63:0] left_do_30, left_do_31, left_do_32, left_do_33; // Data to West
wire [63:0] right_do_30, right_do_31, right_do_32, right_do_33; // Data to East

// Output valid signals from nodes (added XOB_so signals)
wire up_so_30, up_so_31, up_so_32, up_so_33; // North output valid signals
wire down_so_30, down_so_31, down_so_32, down_so_33; // South output valid signals
wire left_so_30, left_so_31, left_so_32, left_so_33; // West output valid signals
wire right_so_30, right_so_31, right_so_32, right_so_33; // East output valid signals

// polarity from node to NIC 
wire polarity_00, polarity_01, polarity_02, polarity_03;
wire polarity_10, polarity_11, polarity_12, polarity_13;
wire polarity_20, polarity_21, polarity_22, polarity_23;
wire polarity_30, polarity_31, polarity_32, polarity_33;


gold_router N00 (clk, reset, up_si_00, down_si_00, left_si_00, right_si_00, NIC_si_00, 
                 up_di_00, down_di_00, left_di_00, right_di_00, NIC_di_00,
                 up_ri_00, down_ri_00, left_ri_00, right_ri_00, NIC_ri_00,
                 up_so_00, down_so_00, left_so_00, right_so_00, NIC_so_00,
                 up_do_00, down_do_00, left_do_00, right_do_00, NIC_do_00,
                 up_ro_00, down_ro_00, left_ro_00, right_ro_00, NIC_ro_00, polarity_00);


gold_router N01 (clk, reset, up_si_01, down_si_01, left_si_01, right_si_01, NIC_si_01,
                 up_di_01, down_di_01, left_di_01, right_di_01, NIC_di_01,
                 up_ri_01, down_ri_01, left_ri_01, right_ri_01, NIC_ri_01,
                 up_so_01, down_so_01, left_so_01, right_so_01, NIC_so_01,
                 up_do_01, down_do_01, left_do_01, right_do_01, NIC_do_01,
                 up_ro_01, down_ro_01, left_ro_01, right_ro_01, NIC_ro_01, polarity_01);


gold_router N02 (clk, reset, up_si_02, down_si_02, left_si_02, right_si_02, NIC_si_02,
                 up_di_02, down_di_02, left_di_02, right_di_02, NIC_di_02,
                 up_ri_02, down_ri_02, left_ri_02, right_ri_02, NIC_ri_02,
                 up_so_02, down_so_02, left_so_02, right_so_02, NIC_so_02,
                 up_do_02, down_do_02, left_do_02, right_do_02, NIC_do_02,
                 up_ro_02, down_ro_02, left_ro_02, right_ro_02, NIC_ro_02, polarity_02);


gold_router N03 (clk, reset, up_si_03, down_si_03, left_si_03, right_si_03, NIC_si_03,
                 up_di_03, down_di_03, left_di_03, right_di_03, NIC_di_03,
                 up_ri_03, down_ri_03, left_ri_03, right_ri_03, NIC_ri_03,
                 up_so_03, down_so_03, left_so_03, right_so_03, NIC_so_03,
                 up_do_03, down_do_03, left_do_03, right_do_03, NIC_do_03,
                 up_ro_03, down_ro_03, left_ro_03, right_ro_03, NIC_ro_03, polarity_03);

// Row 1

gold_router N10 (clk, reset, up_si_10, down_si_10, left_si_10, right_si_10, NIC_si_10,
                 up_di_10, down_di_10, left_di_10, right_di_10, NIC_di_10,
                 up_ri_10, down_ri_10, left_ri_10, right_ri_10, NIC_ri_10,
                 up_so_10, down_so_10, left_so_10, right_so_10, NIC_so_10,
                 up_do_10, down_do_10, left_do_10, right_do_10, NIC_do_10,
                 up_ro_10, down_ro_10, left_ro_10, right_ro_10, NIC_ro_10, polarity_10);


gold_router N11 (clk, reset, up_si_11, down_si_11, left_si_11, right_si_11, NIC_si_11,
                 up_di_11, down_di_11, left_di_11, right_di_11, NIC_di_11,
                 up_ri_11, down_ri_11, left_ri_11, right_ri_11, NIC_ri_11,
                 up_so_11, down_so_11, left_so_11, right_so_11, NIC_so_11,
                 up_do_11, down_do_11, left_do_11, right_do_11, NIC_do_11,
                 up_ro_11, down_ro_11, left_ro_11, right_ro_11, NIC_ro_11, polarity_11);


gold_router N12 (clk, reset, up_si_12, down_si_12, left_si_12, right_si_12, NIC_si_12,
                 up_di_12, down_di_12, left_di_12, right_di_12, NIC_di_12,
                 up_ri_12, down_ri_12, left_ri_12, right_ri_12, NIC_ri_12,
                 up_so_12, down_so_12, left_so_12, right_so_12, NIC_so_12,
                 up_do_12, down_do_12, left_do_12, right_do_12, NIC_do_12,
                 up_ro_12, down_ro_12, left_ro_12, right_ro_12, NIC_ro_12, polarity_12);


gold_router N13 (clk, reset, up_si_13, down_si_13, left_si_13, right_si_13, NIC_si_13,
                 up_di_13, down_di_13, left_di_13, right_di_13, NIC_di_13,
                 up_ri_13, down_ri_13, left_ri_13, right_ri_13, NIC_ri_13,
                 up_so_13, down_so_13, left_so_13, right_so_13, NIC_so_13,
                 up_do_13, down_do_13, left_do_13, right_do_13, NIC_do_13,
                 up_ro_13, down_ro_13, left_ro_13, right_ro_13, NIC_ro_13, polarity_13);

// Row 2

gold_router N20 (clk, reset, up_si_20, down_si_20, left_si_20, right_si_20, NIC_si_20,
                 up_di_20, down_di_20, left_di_20, right_di_20, NIC_di_20,
                 up_ri_20, down_ri_20, left_ri_20, right_ri_20, NIC_ri_20,
                 up_so_20, down_so_20, left_so_20, right_so_20, NIC_so_20,
                 up_do_20, down_do_20, left_do_20, right_do_20, NIC_do_20,
                 up_ro_20, down_ro_20, left_ro_20, right_ro_20, NIC_ro_20, polarity_20);


gold_router N21 (clk, reset, up_si_21, down_si_21, left_si_21, right_si_21, NIC_si_21,
                 up_di_21, down_di_21, left_di_21, right_di_21, NIC_di_21,
                 up_ri_21, down_ri_21, left_ri_21, right_ri_21, NIC_ri_21,
                 up_so_21, down_so_21, left_so_21, right_so_21, NIC_so_21,
                 up_do_21, down_do_21, left_do_21, right_do_21, NIC_do_21,
                 up_ro_21, down_ro_21, left_ro_21, right_ro_21, NIC_ro_21, polarity_21);


gold_router N22 (clk, reset, up_si_22, down_si_22, left_si_22, right_si_22, NIC_si_22,
                 up_di_22, down_di_22, left_di_22, right_di_22, NIC_di_22,
                 up_ri_22, down_ri_22, left_ri_22, right_ri_22, NIC_ri_22,
                 up_so_22, down_so_22, left_so_22, right_so_22, NIC_so_22,
                 up_do_22, down_do_22, left_do_22, right_do_22, NIC_do_22,
                 up_ro_22, down_ro_22, left_ro_22, right_ro_22, NIC_ro_22, polarity_22);


gold_router N23 (clk, reset, up_si_23, down_si_23, left_si_23, right_si_23, NIC_si_23,
                 up_di_23, down_di_23, left_di_23, right_di_23, NIC_di_23,
                 up_ri_23, down_ri_23, left_ri_23, right_ri_23, NIC_ri_23,
                 up_so_23, down_so_23, left_so_23, right_so_23, NIC_so_23,
                 up_do_23, down_do_23, left_do_23, right_do_23, NIC_do_23,
                 up_ro_23, down_ro_23, left_ro_23, right_ro_23, NIC_ro_23, polarity_23);

// Row 3

gold_router N30 (clk, reset, up_si_30, down_si_30, left_si_30, right_si_30, NIC_si_30,
                 up_di_30, down_di_30, left_di_30, right_di_30, NIC_di_30,
                 up_ri_30, down_ri_30, left_ri_30, right_ri_30, NIC_ri_30,
                 up_so_30, down_so_30, left_so_30, right_so_30, NIC_so_30,
                 up_do_30, down_do_30, left_do_30, right_do_30, NIC_do_30,
                 up_ro_30, down_ro_30, left_ro_30, right_ro_30, NIC_ro_30, polarity_30);


gold_router N31 (clk, reset, up_si_31, down_si_31, left_si_31, right_si_31, NIC_si_31,
                 up_di_31, down_di_31, left_di_31, right_di_31, NIC_di_31,
                 up_ri_31, down_ri_31, left_ri_31, right_ri_31, NIC_ri_31,
                 up_so_31, down_so_31, left_so_31, right_so_31, NIC_so_31,
                 up_do_31, down_do_31, left_do_31, right_do_31, NIC_do_31,
                 up_ro_31, down_ro_31, left_ro_31, right_ro_31, NIC_ro_31, polarity_31);


gold_router N32 (clk, reset, up_si_32, down_si_32, left_si_32, right_si_32, NIC_si_32,
                 up_di_32, down_di_32, left_di_32, right_di_32, NIC_di_32,
                 up_ri_32, down_ri_32, left_ri_32, right_ri_32, NIC_ri_32,
                 up_so_32, down_so_32, left_so_32, right_so_32, NIC_so_32,
                 up_do_32, down_do_32, left_do_32, right_do_32, NIC_do_32,
                 up_ro_32, down_ro_32, left_ro_32, right_ro_32, NIC_ro_32, polarity_32);


gold_router N33 (clk, reset, up_si_33, down_si_33, left_si_33, right_si_33, NIC_si_33,
                 up_di_33, down_di_33, left_di_33, right_di_33, NIC_di_33,
                 up_ri_33, down_ri_33, left_ri_33, right_ri_33, NIC_ri_33,
                 up_so_33, down_so_33, left_so_33, right_so_33, NIC_so_33,
                 up_do_33, down_do_33, left_do_33, right_do_33, NIC_do_33,
                 up_ro_33, down_ro_33, left_ro_33, right_ro_33, NIC_ro_33, polarity_33);
//corner nodes
// Node (00)
assign up_si_00 = down_so_01;  
assign up_di_00 = down_do_01;  
assign up_ro_00 = down_ri_01;  // Ready output connection

assign down_si_00 = 0;  
assign down_di_00 = 0;  
assign down_ro_00 = 0;  

assign left_si_00 = 0;  
assign left_di_00 = 0;  
assign left_ro_00 = 0;  

assign right_si_00 = left_so_10;  
assign right_di_00 = left_do_10;  
assign right_ro_00 = left_ri_10;  

// Node (30) //lower right corner
assign up_si_30 = down_so_31;  
assign up_di_30 = down_do_31;  
assign up_ro_30 = down_ri_31;  // Ready output connection

assign down_si_30 = 0;  
assign down_di_30 = 0;  
assign down_ro_30 = 0;  

assign left_si_30 = right_so_20;  
assign left_di_30 = right_do_20;  
assign left_ro_30 = right_ri_20;  

assign right_si_30 = 0;  
assign right_di_30 = 0;  
assign right_ro_30 = 0; 

// Node (03) upper left corner
assign up_si_03 = 0;  
assign up_di_03= 0;  
assign up_ro_03 = 0;    // Ready output connection

assign down_si_03 = up_so_02;  
assign down_di_03 = up_do_02;  
assign down_ro_03 = up_ri_02; 

assign left_si_03 = 0;  
assign left_di_03 = 0;  
assign left_ro_03 = 0;   

assign right_si_03 = left_so_13;  
assign right_di_03 = left_do_13;  
assign right_ro_03 = left_ri_13;  

// Node (33) upper right
assign up_si_33 = 0;  
assign up_di_33 = 0;  
assign up_ro_33 = 0;    // Ready output connection

assign down_si_33 = up_so_32;  
assign down_di_33 = up_do_32;  
assign down_ro_33 = up_ri_32; 

assign left_si_33 = right_so_23;  
assign left_di_33 = right_do_23;  
assign left_ro_33 = right_ri_23;   

assign right_si_33 = 0;  
assign right_di_33 = 0;  
assign right_ro_33 = 0;  

//centre nodes
// Node (11)
assign up_si_11 = down_so_12;  
assign up_di_11 = down_do_12;  
assign up_ro_11 = down_ri_12;  

assign down_si_11 = up_so_10;  
assign down_di_11 = up_do_10;  
assign down_ro_11 = up_ri_10; 

assign left_si_11 = right_so_01;  
assign left_di_11 = right_do_01;  
assign left_ro_11 = right_ri_01; 

assign right_si_11 = left_so_21;  
assign right_di_11 = left_do_21;  
assign right_ro_11 = left_ri_21; 

// Node (12)
assign up_si_12 = down_so_13;  
assign up_di_12 = down_do_13;  
assign up_ro_12 = down_ri_13;  

assign down_si_12 = up_so_11;  
assign down_di_12 = up_do_11;  
assign down_ro_12 = up_ri_11; 

assign left_si_12 = right_so_02;  
assign left_di_12 = right_do_02;  
assign left_ro_12 = right_ri_02; 

assign right_si_12 = left_so_22;  
assign right_di_12 = left_do_22;  
assign right_ro_12 = left_ri_22; 

// Node (21)
assign up_si_21 = down_so_22;  
assign up_di_21 = down_do_22;  
assign up_ro_21 = down_ri_22;  

assign down_si_21 = up_so_20;  
assign down_di_21 = up_do_20;  
assign down_ro_21 = up_ri_20; 

assign left_si_21 = right_so_11;  
assign left_di_21 = right_do_11;  
assign left_ro_21 = right_ri_11; 

assign right_si_21 = left_so_31;  
assign right_di_21 = left_do_31;  
assign right_ro_21 = left_ri_31; 

// Node (22)
assign up_si_22 = down_so_23;  
assign up_di_22 = down_do_23;  
assign up_ro_22 = down_ri_23;  

assign down_si_22 = up_so_21;  
assign down_di_22 = up_do_21;  
assign down_ro_22 = up_ri_21;  

assign left_si_22 = right_so_12;  
assign left_di_22 = right_do_12;  
assign left_ro_22 = right_ri_12; 

assign right_si_22 = left_so_32;  
assign right_di_22 = left_do_32;  
assign right_ro_22 = left_ri_32; 


//lower nodes
// Node (10)
assign up_si_10 = down_so_11;  
assign up_di_10 = down_do_11;  
assign up_ro_10 = down_ri_11;  

assign down_si_10 = 0;  
assign down_di_10 = 0;  
assign down_ro_10 = 0; 

assign left_si_10 = right_so_00;  
assign left_di_10 = right_do_00;  
assign left_ro_10 = right_ri_00; 

assign right_si_10 = left_so_20;  
assign right_di_10 = left_do_20;  
assign right_ro_10 = left_ri_20; 

// Node (20)
assign up_si_20 = down_so_21;  
assign up_di_20 = down_do_21;  
assign up_ro_20 = down_ri_21;  

assign down_si_20 = 0;  
assign down_di_20 = 0;  
assign down_ro_20 = 0; 

assign left_si_20 = right_so_10;  
assign left_di_20 = right_do_10;  
assign left_ro_20 = right_ri_10; 

assign right_si_20 = left_so_30;  
assign right_di_20 = left_do_30;  
assign right_ro_20 = left_ri_30; 

//left side nodes

//Node (01)
assign up_si_01 = down_so_02;  
assign up_di_01 = down_do_02;  
assign up_ro_01 = down_ri_02;  

assign down_si_01 = up_so_00;  
assign down_di_01 = up_do_00;  
assign down_ro_01 = up_ri_00; 

assign left_si_01 = 0;  
assign left_di_01 = 0;  
assign left_ro_01 = 0; 

assign right_si_01 = left_so_11;  
assign right_di_01 = left_do_11;  
assign right_ro_01 = left_ri_11; 

//Node (02)
assign up_si_02 = down_so_03;  
assign up_di_02 = down_do_03;  
assign up_ro_02 = down_ri_03;  

assign down_si_02 = up_so_01;  
assign down_di_02 = up_do_01;  
assign down_ro_02 = up_ri_01; 

assign left_si_02 = 0;  
assign left_di_02 = 0;  
assign left_ro_02 = 0; 

assign right_si_02 = left_so_12;  
assign right_di_02 = left_do_12;  
assign right_ro_02 = left_ri_12; 

//Right side nodes 31, 32
// Node (31)
assign up_si_31 = down_so_32;  
assign up_di_31 = down_do_32;  
assign up_ro_31 = down_ri_32;  

assign down_si_31 = up_so_30;  
assign down_di_31 = up_do_30;  
assign down_ro_31 = up_ri_30; 

assign left_si_31 = right_so_21;  
assign left_di_31 = right_do_21;  
assign left_ro_31 = right_ri_21; 

assign right_si_31 = 0;  
assign right_di_31 = 0;  
assign right_ro_31 = 0; 

// Node (32)
assign up_si_32 = down_so_33;  
assign up_di_32 = down_do_33;  
assign up_ro_32 = down_ri_33;  

assign down_si_32 = up_so_31;  
assign down_di_32 = up_do_31;  
assign down_ro_32 = up_ri_31; 

assign left_si_32 = right_so_22;  
assign left_di_32 = right_do_22;  
assign left_ro_32 = right_ri_22; 

assign right_si_32 = 0;  
assign right_di_32 = 0;  
assign right_ro_32 = 0; 
 

//Upper nodes : 13, 23

//Node 13
assign up_si_13 = 0;  
assign up_di_13 = 0;  
assign up_ro_13 = 0;  

assign down_si_13 = up_so_12;  
assign down_di_13 = up_do_12;  
assign down_ro_13 = up_ri_12; 

assign left_si_13 = right_so_03;  
assign left_di_13 = right_do_03;  
assign left_ro_13 = right_ri_03; 

assign right_si_13 = left_so_23;  
assign right_di_13 = left_do_23;  
assign right_ro_13 = left_ri_23; 


//Node 23
assign up_si_23 = 0;  
assign up_di_23 = 0;  
assign up_ro_23 = 0;  

assign down_si_23 = up_so_22;  
assign down_di_23 = up_do_22;  
assign down_ro_23 = up_ri_22; 

assign left_si_23 = right_so_13;  
assign left_di_23 = right_do_13;  
assign left_ro_23 = right_ri_13; 

assign right_si_23 = left_so_33;  
assign right_di_23 = left_do_33;  
assign right_ro_23 = left_ri_33; 

endmodule