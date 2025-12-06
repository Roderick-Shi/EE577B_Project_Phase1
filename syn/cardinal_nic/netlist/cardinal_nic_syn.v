/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Tue Dec  2 12:54:25 2025
/////////////////////////////////////////////////////////////


module cardinal_nic ( clk, reset, addr, d_in, d_out, nicEn, nicEnWr, net_si, 
        net_ri, net_di, net_so, net_ro, net_do, net_polarity );
  input [1:0] addr;
  input [63:0] d_in;
  output [63:0] d_out;
  input [63:0] net_di;
  output [63:0] net_do;
  input clk, reset, nicEn, nicEnWr, net_si, net_ro, net_polarity;
  output net_ri, net_so;
  wire   out_status, in_status, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509;
  wire   [63:0] input_channel_buf_out;

  DFFPOSX1 out_status_reg ( .D(n414), .CLK(clk), .Q(out_status) );
  DFFPOSX1 net_do_reg_63_ ( .D(n347), .CLK(clk), .Q(net_do[63]) );
  DFFPOSX1 net_do_reg_0_ ( .D(n3), .CLK(clk), .Q(net_do[0]) );
  DFFPOSX1 net_do_reg_1_ ( .D(n4), .CLK(clk), .Q(net_do[1]) );
  DFFPOSX1 net_do_reg_2_ ( .D(n5), .CLK(clk), .Q(net_do[2]) );
  DFFPOSX1 net_do_reg_3_ ( .D(n6), .CLK(clk), .Q(net_do[3]) );
  DFFPOSX1 net_do_reg_4_ ( .D(n7), .CLK(clk), .Q(net_do[4]) );
  DFFPOSX1 net_do_reg_5_ ( .D(n8), .CLK(clk), .Q(net_do[5]) );
  DFFPOSX1 net_do_reg_6_ ( .D(n9), .CLK(clk), .Q(net_do[6]) );
  DFFPOSX1 net_do_reg_7_ ( .D(n10), .CLK(clk), .Q(net_do[7]) );
  DFFPOSX1 net_do_reg_8_ ( .D(n11), .CLK(clk), .Q(net_do[8]) );
  DFFPOSX1 net_do_reg_9_ ( .D(n12), .CLK(clk), .Q(net_do[9]) );
  DFFPOSX1 net_do_reg_10_ ( .D(n13), .CLK(clk), .Q(net_do[10]) );
  DFFPOSX1 net_do_reg_11_ ( .D(n14), .CLK(clk), .Q(net_do[11]) );
  DFFPOSX1 net_do_reg_12_ ( .D(n15), .CLK(clk), .Q(net_do[12]) );
  DFFPOSX1 net_do_reg_13_ ( .D(n16), .CLK(clk), .Q(net_do[13]) );
  DFFPOSX1 net_do_reg_14_ ( .D(n17), .CLK(clk), .Q(net_do[14]) );
  DFFPOSX1 net_do_reg_15_ ( .D(n18), .CLK(clk), .Q(net_do[15]) );
  DFFPOSX1 net_do_reg_16_ ( .D(n19), .CLK(clk), .Q(net_do[16]) );
  DFFPOSX1 net_do_reg_17_ ( .D(n20), .CLK(clk), .Q(net_do[17]) );
  DFFPOSX1 net_do_reg_18_ ( .D(n21), .CLK(clk), .Q(net_do[18]) );
  DFFPOSX1 net_do_reg_19_ ( .D(n22), .CLK(clk), .Q(net_do[19]) );
  DFFPOSX1 net_do_reg_20_ ( .D(n23), .CLK(clk), .Q(net_do[20]) );
  DFFPOSX1 net_do_reg_21_ ( .D(n24), .CLK(clk), .Q(net_do[21]) );
  DFFPOSX1 net_do_reg_22_ ( .D(n25), .CLK(clk), .Q(net_do[22]) );
  DFFPOSX1 net_do_reg_23_ ( .D(n26), .CLK(clk), .Q(net_do[23]) );
  DFFPOSX1 net_do_reg_24_ ( .D(n27), .CLK(clk), .Q(net_do[24]) );
  DFFPOSX1 net_do_reg_25_ ( .D(n28), .CLK(clk), .Q(net_do[25]) );
  DFFPOSX1 net_do_reg_26_ ( .D(n29), .CLK(clk), .Q(net_do[26]) );
  DFFPOSX1 net_do_reg_27_ ( .D(n30), .CLK(clk), .Q(net_do[27]) );
  DFFPOSX1 net_do_reg_28_ ( .D(n31), .CLK(clk), .Q(net_do[28]) );
  DFFPOSX1 net_do_reg_29_ ( .D(n32), .CLK(clk), .Q(net_do[29]) );
  DFFPOSX1 net_do_reg_30_ ( .D(n33), .CLK(clk), .Q(net_do[30]) );
  DFFPOSX1 net_do_reg_31_ ( .D(n34), .CLK(clk), .Q(net_do[31]) );
  DFFPOSX1 net_do_reg_32_ ( .D(n35), .CLK(clk), .Q(net_do[32]) );
  DFFPOSX1 net_do_reg_33_ ( .D(n36), .CLK(clk), .Q(net_do[33]) );
  DFFPOSX1 net_do_reg_34_ ( .D(n37), .CLK(clk), .Q(net_do[34]) );
  DFFPOSX1 net_do_reg_35_ ( .D(n38), .CLK(clk), .Q(net_do[35]) );
  DFFPOSX1 net_do_reg_36_ ( .D(n39), .CLK(clk), .Q(net_do[36]) );
  DFFPOSX1 net_do_reg_37_ ( .D(n40), .CLK(clk), .Q(net_do[37]) );
  DFFPOSX1 net_do_reg_38_ ( .D(n41), .CLK(clk), .Q(net_do[38]) );
  DFFPOSX1 net_do_reg_39_ ( .D(n42), .CLK(clk), .Q(net_do[39]) );
  DFFPOSX1 net_do_reg_40_ ( .D(n43), .CLK(clk), .Q(net_do[40]) );
  DFFPOSX1 net_do_reg_41_ ( .D(n44), .CLK(clk), .Q(net_do[41]) );
  DFFPOSX1 net_do_reg_42_ ( .D(n45), .CLK(clk), .Q(net_do[42]) );
  DFFPOSX1 net_do_reg_43_ ( .D(n46), .CLK(clk), .Q(net_do[43]) );
  DFFPOSX1 net_do_reg_44_ ( .D(n47), .CLK(clk), .Q(net_do[44]) );
  DFFPOSX1 net_do_reg_45_ ( .D(n48), .CLK(clk), .Q(net_do[45]) );
  DFFPOSX1 net_do_reg_46_ ( .D(n49), .CLK(clk), .Q(net_do[46]) );
  DFFPOSX1 net_do_reg_47_ ( .D(n50), .CLK(clk), .Q(net_do[47]) );
  DFFPOSX1 net_do_reg_48_ ( .D(n51), .CLK(clk), .Q(net_do[48]) );
  DFFPOSX1 net_do_reg_49_ ( .D(n52), .CLK(clk), .Q(net_do[49]) );
  DFFPOSX1 net_do_reg_50_ ( .D(n53), .CLK(clk), .Q(net_do[50]) );
  DFFPOSX1 net_do_reg_51_ ( .D(n54), .CLK(clk), .Q(net_do[51]) );
  DFFPOSX1 net_do_reg_52_ ( .D(n55), .CLK(clk), .Q(net_do[52]) );
  DFFPOSX1 net_do_reg_53_ ( .D(n56), .CLK(clk), .Q(net_do[53]) );
  DFFPOSX1 net_do_reg_54_ ( .D(n57), .CLK(clk), .Q(net_do[54]) );
  DFFPOSX1 net_do_reg_55_ ( .D(n58), .CLK(clk), .Q(net_do[55]) );
  DFFPOSX1 net_do_reg_56_ ( .D(n59), .CLK(clk), .Q(net_do[56]) );
  DFFPOSX1 net_do_reg_57_ ( .D(n60), .CLK(clk), .Q(net_do[57]) );
  DFFPOSX1 net_do_reg_58_ ( .D(n61), .CLK(clk), .Q(net_do[58]) );
  DFFPOSX1 net_do_reg_59_ ( .D(n62), .CLK(clk), .Q(net_do[59]) );
  DFFPOSX1 net_do_reg_60_ ( .D(n63), .CLK(clk), .Q(net_do[60]) );
  DFFPOSX1 net_do_reg_61_ ( .D(n64), .CLK(clk), .Q(net_do[61]) );
  DFFPOSX1 net_do_reg_62_ ( .D(n65), .CLK(clk), .Q(net_do[62]) );
  DFFPOSX1 in_status_reg ( .D(n346), .CLK(clk), .Q(in_status) );
  DFFPOSX1 input_channel_buf_out_reg_0_ ( .D(n345), .CLK(clk), .Q(
        input_channel_buf_out[0]) );
  DFFPOSX1 input_channel_buf_out_reg_1_ ( .D(n344), .CLK(clk), .Q(
        input_channel_buf_out[1]) );
  DFFPOSX1 input_channel_buf_out_reg_2_ ( .D(n343), .CLK(clk), .Q(
        input_channel_buf_out[2]) );
  DFFPOSX1 input_channel_buf_out_reg_3_ ( .D(n342), .CLK(clk), .Q(
        input_channel_buf_out[3]) );
  DFFPOSX1 input_channel_buf_out_reg_4_ ( .D(n341), .CLK(clk), .Q(
        input_channel_buf_out[4]) );
  DFFPOSX1 input_channel_buf_out_reg_5_ ( .D(n340), .CLK(clk), .Q(
        input_channel_buf_out[5]) );
  DFFPOSX1 input_channel_buf_out_reg_6_ ( .D(n339), .CLK(clk), .Q(
        input_channel_buf_out[6]) );
  DFFPOSX1 input_channel_buf_out_reg_7_ ( .D(n338), .CLK(clk), .Q(
        input_channel_buf_out[7]) );
  DFFPOSX1 input_channel_buf_out_reg_8_ ( .D(n337), .CLK(clk), .Q(
        input_channel_buf_out[8]) );
  DFFPOSX1 input_channel_buf_out_reg_9_ ( .D(n336), .CLK(clk), .Q(
        input_channel_buf_out[9]) );
  DFFPOSX1 input_channel_buf_out_reg_10_ ( .D(n335), .CLK(clk), .Q(
        input_channel_buf_out[10]) );
  DFFPOSX1 input_channel_buf_out_reg_11_ ( .D(n334), .CLK(clk), .Q(
        input_channel_buf_out[11]) );
  DFFPOSX1 input_channel_buf_out_reg_12_ ( .D(n333), .CLK(clk), .Q(
        input_channel_buf_out[12]) );
  DFFPOSX1 input_channel_buf_out_reg_13_ ( .D(n332), .CLK(clk), .Q(
        input_channel_buf_out[13]) );
  DFFPOSX1 input_channel_buf_out_reg_14_ ( .D(n331), .CLK(clk), .Q(
        input_channel_buf_out[14]) );
  DFFPOSX1 input_channel_buf_out_reg_15_ ( .D(n330), .CLK(clk), .Q(
        input_channel_buf_out[15]) );
  DFFPOSX1 input_channel_buf_out_reg_16_ ( .D(n329), .CLK(clk), .Q(
        input_channel_buf_out[16]) );
  DFFPOSX1 input_channel_buf_out_reg_17_ ( .D(n328), .CLK(clk), .Q(
        input_channel_buf_out[17]) );
  DFFPOSX1 input_channel_buf_out_reg_18_ ( .D(n327), .CLK(clk), .Q(
        input_channel_buf_out[18]) );
  DFFPOSX1 input_channel_buf_out_reg_19_ ( .D(n326), .CLK(clk), .Q(
        input_channel_buf_out[19]) );
  DFFPOSX1 input_channel_buf_out_reg_20_ ( .D(n325), .CLK(clk), .Q(
        input_channel_buf_out[20]) );
  DFFPOSX1 input_channel_buf_out_reg_21_ ( .D(n324), .CLK(clk), .Q(
        input_channel_buf_out[21]) );
  DFFPOSX1 input_channel_buf_out_reg_22_ ( .D(n323), .CLK(clk), .Q(
        input_channel_buf_out[22]) );
  DFFPOSX1 input_channel_buf_out_reg_23_ ( .D(n322), .CLK(clk), .Q(
        input_channel_buf_out[23]) );
  DFFPOSX1 input_channel_buf_out_reg_24_ ( .D(n321), .CLK(clk), .Q(
        input_channel_buf_out[24]) );
  DFFPOSX1 input_channel_buf_out_reg_25_ ( .D(n320), .CLK(clk), .Q(
        input_channel_buf_out[25]) );
  DFFPOSX1 input_channel_buf_out_reg_26_ ( .D(n319), .CLK(clk), .Q(
        input_channel_buf_out[26]) );
  DFFPOSX1 input_channel_buf_out_reg_27_ ( .D(n318), .CLK(clk), .Q(
        input_channel_buf_out[27]) );
  DFFPOSX1 input_channel_buf_out_reg_28_ ( .D(n317), .CLK(clk), .Q(
        input_channel_buf_out[28]) );
  DFFPOSX1 input_channel_buf_out_reg_29_ ( .D(n316), .CLK(clk), .Q(
        input_channel_buf_out[29]) );
  DFFPOSX1 input_channel_buf_out_reg_30_ ( .D(n315), .CLK(clk), .Q(
        input_channel_buf_out[30]) );
  DFFPOSX1 input_channel_buf_out_reg_31_ ( .D(n314), .CLK(clk), .Q(
        input_channel_buf_out[31]) );
  DFFPOSX1 input_channel_buf_out_reg_32_ ( .D(n313), .CLK(clk), .Q(
        input_channel_buf_out[32]) );
  DFFPOSX1 input_channel_buf_out_reg_33_ ( .D(n312), .CLK(clk), .Q(
        input_channel_buf_out[33]) );
  DFFPOSX1 input_channel_buf_out_reg_34_ ( .D(n311), .CLK(clk), .Q(
        input_channel_buf_out[34]) );
  DFFPOSX1 input_channel_buf_out_reg_35_ ( .D(n310), .CLK(clk), .Q(
        input_channel_buf_out[35]) );
  DFFPOSX1 input_channel_buf_out_reg_36_ ( .D(n309), .CLK(clk), .Q(
        input_channel_buf_out[36]) );
  DFFPOSX1 input_channel_buf_out_reg_37_ ( .D(n308), .CLK(clk), .Q(
        input_channel_buf_out[37]) );
  DFFPOSX1 input_channel_buf_out_reg_38_ ( .D(n307), .CLK(clk), .Q(
        input_channel_buf_out[38]) );
  DFFPOSX1 input_channel_buf_out_reg_39_ ( .D(n306), .CLK(clk), .Q(
        input_channel_buf_out[39]) );
  DFFPOSX1 input_channel_buf_out_reg_40_ ( .D(n305), .CLK(clk), .Q(
        input_channel_buf_out[40]) );
  DFFPOSX1 input_channel_buf_out_reg_41_ ( .D(n304), .CLK(clk), .Q(
        input_channel_buf_out[41]) );
  DFFPOSX1 input_channel_buf_out_reg_42_ ( .D(n303), .CLK(clk), .Q(
        input_channel_buf_out[42]) );
  DFFPOSX1 input_channel_buf_out_reg_43_ ( .D(n302), .CLK(clk), .Q(
        input_channel_buf_out[43]) );
  DFFPOSX1 input_channel_buf_out_reg_44_ ( .D(n301), .CLK(clk), .Q(
        input_channel_buf_out[44]) );
  DFFPOSX1 input_channel_buf_out_reg_45_ ( .D(n300), .CLK(clk), .Q(
        input_channel_buf_out[45]) );
  DFFPOSX1 input_channel_buf_out_reg_46_ ( .D(n299), .CLK(clk), .Q(
        input_channel_buf_out[46]) );
  DFFPOSX1 input_channel_buf_out_reg_47_ ( .D(n298), .CLK(clk), .Q(
        input_channel_buf_out[47]) );
  DFFPOSX1 input_channel_buf_out_reg_48_ ( .D(n297), .CLK(clk), .Q(
        input_channel_buf_out[48]) );
  DFFPOSX1 input_channel_buf_out_reg_49_ ( .D(n296), .CLK(clk), .Q(
        input_channel_buf_out[49]) );
  DFFPOSX1 input_channel_buf_out_reg_50_ ( .D(n295), .CLK(clk), .Q(
        input_channel_buf_out[50]) );
  DFFPOSX1 input_channel_buf_out_reg_51_ ( .D(n294), .CLK(clk), .Q(
        input_channel_buf_out[51]) );
  DFFPOSX1 input_channel_buf_out_reg_52_ ( .D(n293), .CLK(clk), .Q(
        input_channel_buf_out[52]) );
  DFFPOSX1 input_channel_buf_out_reg_53_ ( .D(n292), .CLK(clk), .Q(
        input_channel_buf_out[53]) );
  DFFPOSX1 input_channel_buf_out_reg_54_ ( .D(n291), .CLK(clk), .Q(
        input_channel_buf_out[54]) );
  DFFPOSX1 input_channel_buf_out_reg_55_ ( .D(n290), .CLK(clk), .Q(
        input_channel_buf_out[55]) );
  DFFPOSX1 input_channel_buf_out_reg_56_ ( .D(n289), .CLK(clk), .Q(
        input_channel_buf_out[56]) );
  DFFPOSX1 input_channel_buf_out_reg_57_ ( .D(n288), .CLK(clk), .Q(
        input_channel_buf_out[57]) );
  DFFPOSX1 input_channel_buf_out_reg_58_ ( .D(n287), .CLK(clk), .Q(
        input_channel_buf_out[58]) );
  DFFPOSX1 input_channel_buf_out_reg_59_ ( .D(n286), .CLK(clk), .Q(
        input_channel_buf_out[59]) );
  DFFPOSX1 input_channel_buf_out_reg_60_ ( .D(n285), .CLK(clk), .Q(
        input_channel_buf_out[60]) );
  DFFPOSX1 input_channel_buf_out_reg_61_ ( .D(n284), .CLK(clk), .Q(
        input_channel_buf_out[61]) );
  DFFPOSX1 input_channel_buf_out_reg_62_ ( .D(n283), .CLK(clk), .Q(
        input_channel_buf_out[62]) );
  DFFPOSX1 input_channel_buf_out_reg_63_ ( .D(n282), .CLK(clk), .Q(
        input_channel_buf_out[63]) );
  OAI21X1 U141 ( .A(n500), .B(n70), .C(n481), .Y(n282) );
  OAI21X1 U143 ( .A(n499), .B(n71), .C(n476), .Y(n283) );
  OAI21X1 U145 ( .A(n498), .B(n72), .C(n470), .Y(n284) );
  OAI21X1 U147 ( .A(n501), .B(n73), .C(n465), .Y(n285) );
  OAI21X1 U149 ( .A(n501), .B(n74), .C(n460), .Y(n286) );
  OAI21X1 U151 ( .A(n501), .B(n75), .C(n455), .Y(n287) );
  OAI21X1 U153 ( .A(n501), .B(n76), .C(n450), .Y(n288) );
  OAI21X1 U155 ( .A(n501), .B(n77), .C(n445), .Y(n289) );
  OAI21X1 U157 ( .A(n501), .B(n78), .C(n438), .Y(n290) );
  OAI21X1 U159 ( .A(n501), .B(n79), .C(n437), .Y(n291) );
  OAI21X1 U161 ( .A(n501), .B(n80), .C(n436), .Y(n292) );
  OAI21X1 U163 ( .A(n501), .B(n81), .C(n435), .Y(n293) );
  OAI21X1 U165 ( .A(n501), .B(n82), .C(n480), .Y(n294) );
  OAI21X1 U167 ( .A(n501), .B(n83), .C(n475), .Y(n295) );
  OAI21X1 U169 ( .A(n501), .B(n84), .C(n469), .Y(n296) );
  OAI21X1 U171 ( .A(n501), .B(n85), .C(n464), .Y(n297) );
  OAI21X1 U173 ( .A(n500), .B(n86), .C(n459), .Y(n298) );
  OAI21X1 U175 ( .A(n499), .B(n87), .C(n454), .Y(n299) );
  OAI21X1 U177 ( .A(n498), .B(n88), .C(n449), .Y(n300) );
  OAI21X1 U179 ( .A(n501), .B(n89), .C(n444), .Y(n301) );
  OAI21X1 U181 ( .A(n500), .B(n90), .C(n434), .Y(n302) );
  OAI21X1 U183 ( .A(n499), .B(n91), .C(n433), .Y(n303) );
  OAI21X1 U185 ( .A(n498), .B(n92), .C(n432), .Y(n304) );
  OAI21X1 U187 ( .A(n501), .B(n93), .C(n431), .Y(n305) );
  OAI21X1 U189 ( .A(n500), .B(n94), .C(n430), .Y(n306) );
  OAI21X1 U191 ( .A(n499), .B(n95), .C(n479), .Y(n307) );
  OAI21X1 U193 ( .A(n498), .B(n96), .C(n474), .Y(n308) );
  OAI21X1 U195 ( .A(n501), .B(n97), .C(n468), .Y(n309) );
  OAI21X1 U197 ( .A(n500), .B(n98), .C(n463), .Y(n310) );
  OAI21X1 U199 ( .A(n500), .B(n99), .C(n458), .Y(n311) );
  OAI21X1 U201 ( .A(n500), .B(n100), .C(n453), .Y(n312) );
  OAI21X1 U203 ( .A(n500), .B(n101), .C(n448), .Y(n313) );
  OAI21X1 U205 ( .A(n500), .B(n102), .C(n443), .Y(n314) );
  OAI21X1 U207 ( .A(n500), .B(n103), .C(n429), .Y(n315) );
  OAI21X1 U209 ( .A(n500), .B(n104), .C(n428), .Y(n316) );
  OAI21X1 U211 ( .A(n500), .B(n105), .C(n427), .Y(n317) );
  OAI21X1 U213 ( .A(n500), .B(n106), .C(n426), .Y(n318) );
  OAI21X1 U215 ( .A(n500), .B(n107), .C(n425), .Y(n319) );
  OAI21X1 U217 ( .A(n500), .B(n108), .C(n478), .Y(n320) );
  OAI21X1 U219 ( .A(n500), .B(n109), .C(n473), .Y(n321) );
  OAI21X1 U221 ( .A(n499), .B(n110), .C(n467), .Y(n322) );
  OAI21X1 U223 ( .A(n499), .B(n111), .C(n462), .Y(n323) );
  OAI21X1 U225 ( .A(n499), .B(n112), .C(n457), .Y(n324) );
  OAI21X1 U227 ( .A(n499), .B(n113), .C(n452), .Y(n325) );
  OAI21X1 U229 ( .A(n499), .B(n114), .C(n447), .Y(n326) );
  OAI21X1 U231 ( .A(n499), .B(n115), .C(n442), .Y(n327) );
  OAI21X1 U233 ( .A(n499), .B(n116), .C(n424), .Y(n328) );
  OAI21X1 U235 ( .A(n499), .B(n117), .C(n423), .Y(n329) );
  OAI21X1 U237 ( .A(n499), .B(n118), .C(n422), .Y(n330) );
  OAI21X1 U239 ( .A(n499), .B(n119), .C(n421), .Y(n331) );
  OAI21X1 U241 ( .A(n499), .B(n120), .C(n420), .Y(n332) );
  OAI21X1 U243 ( .A(n499), .B(n121), .C(n477), .Y(n333) );
  OAI21X1 U245 ( .A(n498), .B(n122), .C(n472), .Y(n334) );
  OAI21X1 U247 ( .A(n498), .B(n123), .C(n466), .Y(n335) );
  OAI21X1 U249 ( .A(n498), .B(n124), .C(n461), .Y(n336) );
  OAI21X1 U251 ( .A(n498), .B(n125), .C(n456), .Y(n337) );
  OAI21X1 U253 ( .A(n498), .B(n126), .C(n451), .Y(n338) );
  OAI21X1 U255 ( .A(n498), .B(n127), .C(n446), .Y(n339) );
  OAI21X1 U257 ( .A(n498), .B(n128), .C(n441), .Y(n340) );
  OAI21X1 U259 ( .A(n498), .B(n129), .C(n419), .Y(n341) );
  OAI21X1 U261 ( .A(n498), .B(n130), .C(n418), .Y(n342) );
  OAI21X1 U263 ( .A(n498), .B(n131), .C(n417), .Y(n343) );
  OAI21X1 U265 ( .A(n498), .B(n132), .C(n416), .Y(n344) );
  OAI21X1 U267 ( .A(n498), .B(n133), .C(n415), .Y(n345) );
  OAI21X1 U270 ( .A(n135), .B(n206), .C(n487), .Y(n346) );
  NAND3X1 U271 ( .A(net_ri), .B(n136), .C(net_si), .Y(n205) );
  OAI21X1 U272 ( .A(nicEnWr), .B(n412), .C(in_status), .Y(net_ri) );
  OAI21X1 U273 ( .A(nicEnWr), .B(n412), .C(n136), .Y(n206) );
  OAI21X1 U274 ( .A(n1), .B(n509), .C(n471), .Y(n347) );
  AOI22X1 U276 ( .A(d_in[62]), .B(n490), .C(net_do[62]), .D(n208), .Y(n211) );
  AOI22X1 U277 ( .A(d_in[61]), .B(n489), .C(net_do[61]), .D(n208), .Y(n212) );
  AOI22X1 U278 ( .A(d_in[60]), .B(n488), .C(net_do[60]), .D(n208), .Y(n213) );
  AOI22X1 U279 ( .A(d_in[59]), .B(n484), .C(net_do[59]), .D(n508), .Y(n214) );
  AOI22X1 U280 ( .A(d_in[58]), .B(n490), .C(net_do[58]), .D(n508), .Y(n215) );
  AOI22X1 U281 ( .A(d_in[57]), .B(n489), .C(net_do[57]), .D(n508), .Y(n216) );
  AOI22X1 U282 ( .A(d_in[56]), .B(n488), .C(net_do[56]), .D(n508), .Y(n217) );
  AOI22X1 U283 ( .A(d_in[55]), .B(n484), .C(net_do[55]), .D(n508), .Y(n218) );
  AOI22X1 U284 ( .A(d_in[54]), .B(n490), .C(net_do[54]), .D(n508), .Y(n219) );
  AOI22X1 U285 ( .A(d_in[53]), .B(n489), .C(net_do[53]), .D(n508), .Y(n220) );
  AOI22X1 U286 ( .A(d_in[52]), .B(n488), .C(net_do[52]), .D(n508), .Y(n221) );
  AOI22X1 U287 ( .A(d_in[51]), .B(n490), .C(net_do[51]), .D(n508), .Y(n222) );
  AOI22X1 U288 ( .A(d_in[50]), .B(n490), .C(net_do[50]), .D(n508), .Y(n223) );
  AOI22X1 U289 ( .A(d_in[49]), .B(n490), .C(net_do[49]), .D(n508), .Y(n224) );
  AOI22X1 U290 ( .A(d_in[48]), .B(n490), .C(net_do[48]), .D(n508), .Y(n225) );
  AOI22X1 U291 ( .A(d_in[47]), .B(n490), .C(net_do[47]), .D(n507), .Y(n226) );
  AOI22X1 U292 ( .A(d_in[46]), .B(n490), .C(net_do[46]), .D(n507), .Y(n227) );
  AOI22X1 U293 ( .A(d_in[45]), .B(n490), .C(net_do[45]), .D(n507), .Y(n228) );
  AOI22X1 U294 ( .A(d_in[44]), .B(n490), .C(net_do[44]), .D(n507), .Y(n229) );
  AOI22X1 U295 ( .A(d_in[43]), .B(n490), .C(net_do[43]), .D(n507), .Y(n230) );
  AOI22X1 U296 ( .A(d_in[42]), .B(n490), .C(net_do[42]), .D(n507), .Y(n231) );
  AOI22X1 U297 ( .A(d_in[41]), .B(n490), .C(net_do[41]), .D(n507), .Y(n232) );
  AOI22X1 U298 ( .A(d_in[40]), .B(n490), .C(net_do[40]), .D(n507), .Y(n233) );
  AOI22X1 U299 ( .A(d_in[39]), .B(n490), .C(net_do[39]), .D(n507), .Y(n234) );
  AOI22X1 U300 ( .A(d_in[38]), .B(n489), .C(net_do[38]), .D(n507), .Y(n235) );
  AOI22X1 U301 ( .A(d_in[37]), .B(n489), .C(net_do[37]), .D(n507), .Y(n236) );
  AOI22X1 U302 ( .A(d_in[36]), .B(n489), .C(net_do[36]), .D(n507), .Y(n237) );
  AOI22X1 U303 ( .A(d_in[35]), .B(n489), .C(net_do[35]), .D(n506), .Y(n238) );
  AOI22X1 U304 ( .A(d_in[34]), .B(n489), .C(net_do[34]), .D(n506), .Y(n239) );
  AOI22X1 U305 ( .A(d_in[33]), .B(n489), .C(net_do[33]), .D(n506), .Y(n240) );
  AOI22X1 U306 ( .A(d_in[32]), .B(n489), .C(net_do[32]), .D(n506), .Y(n241) );
  AOI22X1 U307 ( .A(d_in[31]), .B(n489), .C(net_do[31]), .D(n506), .Y(n242) );
  AOI22X1 U308 ( .A(d_in[30]), .B(n489), .C(net_do[30]), .D(n506), .Y(n243) );
  AOI22X1 U309 ( .A(d_in[29]), .B(n489), .C(net_do[29]), .D(n506), .Y(n244) );
  AOI22X1 U310 ( .A(d_in[28]), .B(n489), .C(net_do[28]), .D(n506), .Y(n245) );
  AOI22X1 U311 ( .A(d_in[27]), .B(n489), .C(net_do[27]), .D(n506), .Y(n246) );
  AOI22X1 U312 ( .A(d_in[26]), .B(n489), .C(net_do[26]), .D(n506), .Y(n247) );
  AOI22X1 U313 ( .A(d_in[25]), .B(n488), .C(net_do[25]), .D(n506), .Y(n248) );
  AOI22X1 U314 ( .A(d_in[24]), .B(n488), .C(net_do[24]), .D(n506), .Y(n249) );
  AOI22X1 U315 ( .A(d_in[23]), .B(n488), .C(net_do[23]), .D(n505), .Y(n250) );
  AOI22X1 U316 ( .A(d_in[22]), .B(n488), .C(net_do[22]), .D(n505), .Y(n251) );
  AOI22X1 U317 ( .A(d_in[21]), .B(n488), .C(net_do[21]), .D(n505), .Y(n252) );
  AOI22X1 U318 ( .A(d_in[20]), .B(n488), .C(net_do[20]), .D(n505), .Y(n253) );
  AOI22X1 U319 ( .A(d_in[19]), .B(n488), .C(net_do[19]), .D(n505), .Y(n254) );
  AOI22X1 U320 ( .A(d_in[18]), .B(n488), .C(net_do[18]), .D(n505), .Y(n255) );
  AOI22X1 U321 ( .A(d_in[17]), .B(n488), .C(net_do[17]), .D(n505), .Y(n256) );
  AOI22X1 U322 ( .A(d_in[16]), .B(n488), .C(net_do[16]), .D(n505), .Y(n257) );
  AOI22X1 U323 ( .A(d_in[15]), .B(n488), .C(net_do[15]), .D(n505), .Y(n258) );
  AOI22X1 U324 ( .A(d_in[14]), .B(n488), .C(net_do[14]), .D(n505), .Y(n259) );
  AOI22X1 U325 ( .A(d_in[13]), .B(n488), .C(net_do[13]), .D(n505), .Y(n260) );
  AOI22X1 U326 ( .A(d_in[12]), .B(n484), .C(net_do[12]), .D(n505), .Y(n261) );
  AOI22X1 U327 ( .A(d_in[11]), .B(n484), .C(net_do[11]), .D(n504), .Y(n262) );
  AOI22X1 U328 ( .A(d_in[10]), .B(n484), .C(net_do[10]), .D(n504), .Y(n263) );
  AOI22X1 U329 ( .A(d_in[9]), .B(n484), .C(net_do[9]), .D(n504), .Y(n264) );
  AOI22X1 U330 ( .A(d_in[8]), .B(n484), .C(net_do[8]), .D(n504), .Y(n265) );
  AOI22X1 U331 ( .A(d_in[7]), .B(n484), .C(net_do[7]), .D(n504), .Y(n266) );
  AOI22X1 U332 ( .A(d_in[6]), .B(n484), .C(net_do[6]), .D(n504), .Y(n267) );
  AOI22X1 U333 ( .A(d_in[5]), .B(n484), .C(net_do[5]), .D(n504), .Y(n268) );
  AOI22X1 U334 ( .A(d_in[4]), .B(n484), .C(net_do[4]), .D(n504), .Y(n269) );
  AOI22X1 U335 ( .A(d_in[3]), .B(n484), .C(net_do[3]), .D(n504), .Y(n270) );
  AOI22X1 U336 ( .A(d_in[2]), .B(n484), .C(net_do[2]), .D(n504), .Y(n271) );
  AOI22X1 U337 ( .A(d_in[1]), .B(n484), .C(net_do[1]), .D(n504), .Y(n272) );
  AOI22X1 U338 ( .A(d_in[0]), .B(n484), .C(net_do[0]), .D(n504), .Y(n273) );
  NAND3X1 U342 ( .A(addr[1]), .B(nicEn), .C(nicEnWr), .Y(n276) );
  NAND3X1 U343 ( .A(n138), .B(n136), .C(n68), .Y(n275) );
  AOI21X1 U344 ( .A(n278), .B(net_ro), .C(n69), .Y(n277) );
  NAND3X1 U345 ( .A(n486), .B(n136), .C(out_status), .Y(n274) );
  NAND3X1 U346 ( .A(net_ro), .B(n278), .C(out_status), .Y(n139) );
  XOR2X1 U347 ( .A(net_do[63]), .B(net_polarity), .Y(n278) );
  NOR2X1 U348 ( .A(n124), .B(n412), .Y(d_out[9]) );
  NOR2X1 U349 ( .A(n125), .B(n412), .Y(d_out[8]) );
  NOR2X1 U350 ( .A(n126), .B(n412), .Y(d_out[7]) );
  NOR2X1 U351 ( .A(n127), .B(n412), .Y(d_out[6]) );
  NOR2X1 U352 ( .A(n70), .B(n412), .Y(d_out[63]) );
  NOR2X1 U353 ( .A(n71), .B(n412), .Y(d_out[62]) );
  NOR2X1 U354 ( .A(n72), .B(n412), .Y(d_out[61]) );
  NOR2X1 U355 ( .A(n73), .B(n412), .Y(d_out[60]) );
  NOR2X1 U356 ( .A(n128), .B(n412), .Y(d_out[5]) );
  NOR2X1 U357 ( .A(n74), .B(n412), .Y(d_out[59]) );
  NOR2X1 U358 ( .A(n75), .B(n494), .Y(d_out[58]) );
  NOR2X1 U359 ( .A(n76), .B(n494), .Y(d_out[57]) );
  NOR2X1 U360 ( .A(n77), .B(n494), .Y(d_out[56]) );
  NOR2X1 U361 ( .A(n78), .B(n494), .Y(d_out[55]) );
  NOR2X1 U362 ( .A(n79), .B(n495), .Y(d_out[54]) );
  NOR2X1 U363 ( .A(n80), .B(n494), .Y(d_out[53]) );
  NOR2X1 U364 ( .A(n81), .B(n494), .Y(d_out[52]) );
  NOR2X1 U365 ( .A(n82), .B(n494), .Y(d_out[51]) );
  NOR2X1 U366 ( .A(n83), .B(n494), .Y(d_out[50]) );
  NOR2X1 U367 ( .A(n129), .B(n494), .Y(d_out[4]) );
  NOR2X1 U368 ( .A(n84), .B(n494), .Y(d_out[49]) );
  NOR2X1 U369 ( .A(n85), .B(n494), .Y(d_out[48]) );
  NOR2X1 U370 ( .A(n86), .B(n494), .Y(d_out[47]) );
  NOR2X1 U371 ( .A(n87), .B(n494), .Y(d_out[46]) );
  NOR2X1 U372 ( .A(n88), .B(n494), .Y(d_out[45]) );
  NOR2X1 U373 ( .A(n89), .B(n494), .Y(d_out[44]) );
  NOR2X1 U374 ( .A(n90), .B(n495), .Y(d_out[43]) );
  NOR2X1 U375 ( .A(n91), .B(n495), .Y(d_out[42]) );
  NOR2X1 U376 ( .A(n92), .B(n495), .Y(d_out[41]) );
  NOR2X1 U377 ( .A(n93), .B(n495), .Y(d_out[40]) );
  NOR2X1 U378 ( .A(n130), .B(n495), .Y(d_out[3]) );
  NOR2X1 U379 ( .A(n94), .B(n495), .Y(d_out[39]) );
  NOR2X1 U380 ( .A(n95), .B(n495), .Y(d_out[38]) );
  NOR2X1 U381 ( .A(n96), .B(n495), .Y(d_out[37]) );
  NOR2X1 U382 ( .A(n97), .B(n495), .Y(d_out[36]) );
  NOR2X1 U383 ( .A(n98), .B(n495), .Y(d_out[35]) );
  NOR2X1 U384 ( .A(n99), .B(n495), .Y(d_out[34]) );
  NOR2X1 U385 ( .A(n100), .B(n495), .Y(d_out[33]) );
  NOR2X1 U386 ( .A(n101), .B(n495), .Y(d_out[32]) );
  NOR2X1 U387 ( .A(n102), .B(n495), .Y(d_out[31]) );
  NOR2X1 U388 ( .A(n103), .B(n496), .Y(d_out[30]) );
  NOR2X1 U389 ( .A(n131), .B(n496), .Y(d_out[2]) );
  NOR2X1 U390 ( .A(n104), .B(n496), .Y(d_out[29]) );
  NOR2X1 U391 ( .A(n105), .B(n496), .Y(d_out[28]) );
  NOR2X1 U392 ( .A(n106), .B(n496), .Y(d_out[27]) );
  NOR2X1 U393 ( .A(n107), .B(n496), .Y(d_out[26]) );
  NOR2X1 U394 ( .A(n108), .B(n496), .Y(d_out[25]) );
  NOR2X1 U395 ( .A(n109), .B(n496), .Y(d_out[24]) );
  NOR2X1 U396 ( .A(n110), .B(n496), .Y(d_out[23]) );
  NOR2X1 U397 ( .A(n111), .B(n496), .Y(d_out[22]) );
  NOR2X1 U398 ( .A(n112), .B(n496), .Y(d_out[21]) );
  NOR2X1 U399 ( .A(n113), .B(n496), .Y(d_out[20]) );
  NOR2X1 U400 ( .A(n132), .B(n496), .Y(d_out[1]) );
  NOR2X1 U401 ( .A(n114), .B(n496), .Y(d_out[19]) );
  NOR2X1 U402 ( .A(n115), .B(n496), .Y(d_out[18]) );
  NOR2X1 U403 ( .A(n116), .B(n412), .Y(d_out[17]) );
  NOR2X1 U404 ( .A(n117), .B(n412), .Y(d_out[16]) );
  NOR2X1 U405 ( .A(n118), .B(n412), .Y(d_out[15]) );
  NOR2X1 U406 ( .A(n119), .B(n412), .Y(d_out[14]) );
  NOR2X1 U407 ( .A(n120), .B(n412), .Y(d_out[13]) );
  NOR2X1 U408 ( .A(n121), .B(n412), .Y(d_out[12]) );
  NOR2X1 U409 ( .A(n122), .B(n412), .Y(d_out[11]) );
  NOR2X1 U410 ( .A(n123), .B(n412), .Y(d_out[10]) );
  OAI21X1 U411 ( .A(n412), .B(n133), .C(n482), .Y(d_out[0]) );
  NAND3X1 U412 ( .A(nicEn), .B(n280), .C(addr[0]), .Y(n279) );
  OAI21X1 U413 ( .A(addr[1]), .B(n135), .C(n483), .Y(n280) );
  NAND3X1 U415 ( .A(n138), .B(n137), .C(nicEn), .Y(n207) );
  OR2X1 U416 ( .A(n440), .B(n485), .Y(n210) );
  BUFX2 U417 ( .A(n273), .Y(n349) );
  BUFX2 U418 ( .A(n272), .Y(n350) );
  BUFX2 U419 ( .A(n271), .Y(n351) );
  BUFX2 U420 ( .A(n270), .Y(n352) );
  BUFX2 U421 ( .A(n269), .Y(n353) );
  BUFX2 U422 ( .A(n268), .Y(n354) );
  BUFX2 U423 ( .A(n267), .Y(n355) );
  BUFX2 U424 ( .A(n266), .Y(n356) );
  BUFX2 U425 ( .A(n265), .Y(n357) );
  BUFX2 U426 ( .A(n264), .Y(n358) );
  BUFX2 U427 ( .A(n263), .Y(n359) );
  BUFX2 U428 ( .A(n262), .Y(n360) );
  BUFX2 U429 ( .A(n261), .Y(n361) );
  BUFX2 U430 ( .A(n260), .Y(n362) );
  BUFX2 U431 ( .A(n259), .Y(n363) );
  BUFX2 U432 ( .A(n258), .Y(n364) );
  BUFX2 U433 ( .A(n257), .Y(n365) );
  BUFX2 U434 ( .A(n256), .Y(n366) );
  BUFX2 U435 ( .A(n255), .Y(n367) );
  BUFX2 U436 ( .A(n254), .Y(n368) );
  BUFX2 U437 ( .A(n253), .Y(n369) );
  BUFX2 U438 ( .A(n252), .Y(n370) );
  BUFX2 U439 ( .A(n251), .Y(n371) );
  BUFX2 U440 ( .A(n250), .Y(n372) );
  BUFX2 U441 ( .A(n249), .Y(n373) );
  BUFX2 U442 ( .A(n248), .Y(n374) );
  BUFX2 U443 ( .A(n247), .Y(n375) );
  BUFX2 U444 ( .A(n246), .Y(n376) );
  BUFX2 U445 ( .A(n245), .Y(n377) );
  BUFX2 U446 ( .A(n244), .Y(n378) );
  BUFX2 U447 ( .A(n243), .Y(n379) );
  BUFX2 U448 ( .A(n242), .Y(n380) );
  BUFX2 U449 ( .A(n241), .Y(n381) );
  BUFX2 U450 ( .A(n240), .Y(n382) );
  BUFX2 U451 ( .A(n239), .Y(n383) );
  BUFX2 U452 ( .A(n238), .Y(n384) );
  BUFX2 U453 ( .A(n237), .Y(n385) );
  BUFX2 U454 ( .A(n236), .Y(n386) );
  BUFX2 U455 ( .A(n235), .Y(n387) );
  BUFX2 U456 ( .A(n234), .Y(n388) );
  BUFX2 U457 ( .A(n233), .Y(n389) );
  BUFX2 U458 ( .A(n232), .Y(n390) );
  BUFX2 U459 ( .A(n231), .Y(n391) );
  BUFX2 U460 ( .A(n230), .Y(n392) );
  BUFX2 U461 ( .A(n229), .Y(n393) );
  BUFX2 U462 ( .A(n228), .Y(n394) );
  BUFX2 U463 ( .A(n227), .Y(n395) );
  BUFX2 U464 ( .A(n226), .Y(n396) );
  BUFX2 U465 ( .A(n225), .Y(n397) );
  BUFX2 U466 ( .A(n224), .Y(n398) );
  BUFX2 U467 ( .A(n223), .Y(n399) );
  BUFX2 U468 ( .A(n222), .Y(n400) );
  BUFX2 U469 ( .A(n221), .Y(n401) );
  BUFX2 U470 ( .A(n220), .Y(n402) );
  BUFX2 U471 ( .A(n219), .Y(n403) );
  BUFX2 U472 ( .A(n218), .Y(n404) );
  BUFX2 U473 ( .A(n217), .Y(n405) );
  BUFX2 U474 ( .A(n216), .Y(n406) );
  BUFX2 U475 ( .A(n215), .Y(n407) );
  BUFX2 U476 ( .A(n214), .Y(n408) );
  BUFX2 U477 ( .A(n213), .Y(n409) );
  BUFX2 U478 ( .A(n212), .Y(n410) );
  BUFX2 U479 ( .A(n211), .Y(n411) );
  BUFX2 U480 ( .A(n207), .Y(n412) );
  BUFX2 U481 ( .A(n277), .Y(n413) );
  AND2X1 U482 ( .A(n136), .B(n487), .Y(n140) );
  AND2X1 U483 ( .A(n439), .B(n210), .Y(n348) );
  INVX1 U484 ( .A(n348), .Y(n414) );
  AND2X1 U485 ( .A(net_di[0]), .B(n502), .Y(n204) );
  INVX1 U486 ( .A(n204), .Y(n415) );
  AND2X1 U487 ( .A(net_di[1]), .B(n502), .Y(n203) );
  INVX1 U488 ( .A(n203), .Y(n416) );
  AND2X1 U489 ( .A(net_di[2]), .B(n502), .Y(n202) );
  INVX1 U490 ( .A(n202), .Y(n417) );
  AND2X1 U491 ( .A(net_di[3]), .B(n502), .Y(n201) );
  INVX1 U492 ( .A(n201), .Y(n418) );
  AND2X1 U493 ( .A(net_di[4]), .B(n502), .Y(n200) );
  INVX1 U494 ( .A(n200), .Y(n419) );
  AND2X1 U495 ( .A(net_di[13]), .B(n502), .Y(n191) );
  INVX1 U496 ( .A(n191), .Y(n420) );
  AND2X1 U497 ( .A(net_di[14]), .B(n503), .Y(n190) );
  INVX1 U498 ( .A(n190), .Y(n421) );
  AND2X1 U499 ( .A(net_di[15]), .B(n502), .Y(n189) );
  INVX1 U500 ( .A(n189), .Y(n422) );
  AND2X1 U501 ( .A(net_di[16]), .B(n503), .Y(n188) );
  INVX1 U502 ( .A(n188), .Y(n423) );
  AND2X1 U503 ( .A(net_di[17]), .B(n502), .Y(n187) );
  INVX1 U504 ( .A(n187), .Y(n424) );
  AND2X1 U505 ( .A(net_di[26]), .B(n503), .Y(n178) );
  INVX1 U506 ( .A(n178), .Y(n425) );
  AND2X1 U507 ( .A(net_di[27]), .B(n503), .Y(n177) );
  INVX1 U508 ( .A(n177), .Y(n426) );
  AND2X1 U509 ( .A(net_di[28]), .B(n503), .Y(n176) );
  INVX1 U510 ( .A(n176), .Y(n427) );
  AND2X1 U511 ( .A(net_di[29]), .B(n503), .Y(n175) );
  INVX1 U512 ( .A(n175), .Y(n428) );
  AND2X1 U513 ( .A(net_di[30]), .B(n503), .Y(n174) );
  INVX1 U514 ( .A(n174), .Y(n429) );
  AND2X1 U515 ( .A(net_di[39]), .B(n502), .Y(n165) );
  INVX1 U516 ( .A(n165), .Y(n430) );
  AND2X1 U517 ( .A(net_di[40]), .B(n503), .Y(n164) );
  INVX1 U518 ( .A(n164), .Y(n431) );
  AND2X1 U519 ( .A(net_di[41]), .B(n503), .Y(n163) );
  INVX1 U520 ( .A(n163), .Y(n432) );
  AND2X1 U521 ( .A(net_di[42]), .B(n502), .Y(n162) );
  INVX1 U522 ( .A(n162), .Y(n433) );
  AND2X1 U523 ( .A(net_di[43]), .B(n503), .Y(n161) );
  INVX1 U524 ( .A(n161), .Y(n434) );
  AND2X1 U525 ( .A(net_di[52]), .B(n503), .Y(n152) );
  INVX1 U526 ( .A(n152), .Y(n435) );
  AND2X1 U527 ( .A(net_di[53]), .B(n503), .Y(n151) );
  INVX1 U528 ( .A(n151), .Y(n436) );
  AND2X1 U529 ( .A(net_di[54]), .B(n503), .Y(n150) );
  INVX1 U530 ( .A(n150), .Y(n437) );
  AND2X1 U531 ( .A(net_di[55]), .B(n502), .Y(n149) );
  INVX1 U532 ( .A(n149), .Y(n438) );
  BUFX2 U533 ( .A(n274), .Y(n439) );
  BUFX2 U534 ( .A(n275), .Y(n440) );
  AND2X1 U535 ( .A(net_di[5]), .B(n502), .Y(n199) );
  INVX1 U536 ( .A(n199), .Y(n441) );
  AND2X1 U537 ( .A(net_di[18]), .B(n503), .Y(n186) );
  INVX1 U538 ( .A(n186), .Y(n442) );
  AND2X1 U539 ( .A(net_di[31]), .B(n503), .Y(n173) );
  INVX1 U540 ( .A(n173), .Y(n443) );
  AND2X1 U541 ( .A(net_di[44]), .B(n502), .Y(n160) );
  INVX1 U542 ( .A(n160), .Y(n444) );
  AND2X1 U543 ( .A(net_di[56]), .B(n502), .Y(n148) );
  INVX1 U544 ( .A(n148), .Y(n445) );
  AND2X1 U545 ( .A(net_di[6]), .B(n502), .Y(n198) );
  INVX1 U546 ( .A(n198), .Y(n446) );
  AND2X1 U547 ( .A(net_di[19]), .B(n502), .Y(n185) );
  INVX1 U548 ( .A(n185), .Y(n447) );
  AND2X1 U549 ( .A(net_di[32]), .B(n503), .Y(n172) );
  INVX1 U550 ( .A(n172), .Y(n448) );
  AND2X1 U551 ( .A(net_di[45]), .B(n502), .Y(n159) );
  INVX1 U552 ( .A(n159), .Y(n449) );
  AND2X1 U553 ( .A(net_di[57]), .B(n503), .Y(n147) );
  INVX1 U554 ( .A(n147), .Y(n450) );
  AND2X1 U555 ( .A(net_di[7]), .B(n502), .Y(n197) );
  INVX1 U556 ( .A(n197), .Y(n451) );
  AND2X1 U557 ( .A(net_di[20]), .B(n503), .Y(n184) );
  INVX1 U558 ( .A(n184), .Y(n452) );
  AND2X1 U559 ( .A(net_di[33]), .B(n503), .Y(n171) );
  INVX1 U560 ( .A(n171), .Y(n453) );
  AND2X1 U561 ( .A(net_di[46]), .B(n503), .Y(n158) );
  INVX1 U562 ( .A(n158), .Y(n454) );
  AND2X1 U563 ( .A(net_di[58]), .B(n502), .Y(n146) );
  INVX1 U564 ( .A(n146), .Y(n455) );
  AND2X1 U565 ( .A(net_di[8]), .B(n502), .Y(n196) );
  INVX1 U566 ( .A(n196), .Y(n456) );
  AND2X1 U567 ( .A(net_di[21]), .B(n502), .Y(n183) );
  INVX1 U568 ( .A(n183), .Y(n457) );
  AND2X1 U569 ( .A(net_di[34]), .B(n503), .Y(n170) );
  INVX1 U570 ( .A(n170), .Y(n458) );
  AND2X1 U571 ( .A(net_di[47]), .B(n503), .Y(n157) );
  INVX1 U572 ( .A(n157), .Y(n459) );
  AND2X1 U573 ( .A(net_di[59]), .B(n502), .Y(n145) );
  INVX1 U574 ( .A(n145), .Y(n460) );
  AND2X1 U575 ( .A(net_di[9]), .B(n502), .Y(n195) );
  INVX1 U576 ( .A(n195), .Y(n461) );
  AND2X1 U577 ( .A(net_di[22]), .B(n503), .Y(n182) );
  INVX1 U578 ( .A(n182), .Y(n462) );
  AND2X1 U579 ( .A(net_di[35]), .B(n503), .Y(n169) );
  INVX1 U580 ( .A(n169), .Y(n463) );
  AND2X1 U581 ( .A(net_di[48]), .B(n502), .Y(n156) );
  INVX1 U582 ( .A(n156), .Y(n464) );
  AND2X1 U583 ( .A(net_di[60]), .B(n503), .Y(n144) );
  INVX1 U584 ( .A(n144), .Y(n465) );
  AND2X1 U585 ( .A(net_di[10]), .B(n502), .Y(n194) );
  INVX1 U586 ( .A(n194), .Y(n466) );
  AND2X1 U587 ( .A(net_di[23]), .B(n502), .Y(n181) );
  INVX1 U588 ( .A(n181), .Y(n467) );
  AND2X1 U589 ( .A(net_di[36]), .B(n503), .Y(n168) );
  INVX1 U590 ( .A(n168), .Y(n468) );
  AND2X1 U591 ( .A(net_di[49]), .B(n503), .Y(n155) );
  INVX1 U592 ( .A(n155), .Y(n469) );
  AND2X1 U593 ( .A(net_di[61]), .B(n503), .Y(n143) );
  INVX1 U594 ( .A(n143), .Y(n470) );
  AND2X1 U595 ( .A(d_in[63]), .B(n484), .Y(n209) );
  INVX1 U596 ( .A(n209), .Y(n471) );
  AND2X1 U597 ( .A(net_di[11]), .B(n502), .Y(n193) );
  INVX1 U598 ( .A(n193), .Y(n472) );
  AND2X1 U599 ( .A(net_di[24]), .B(n503), .Y(n180) );
  INVX1 U600 ( .A(n180), .Y(n473) );
  AND2X1 U601 ( .A(net_di[37]), .B(n503), .Y(n167) );
  INVX1 U602 ( .A(n167), .Y(n474) );
  AND2X1 U603 ( .A(net_di[50]), .B(n502), .Y(n154) );
  INVX1 U604 ( .A(n154), .Y(n475) );
  AND2X1 U605 ( .A(net_di[62]), .B(n503), .Y(n142) );
  INVX1 U606 ( .A(n142), .Y(n476) );
  AND2X1 U607 ( .A(net_di[12]), .B(n502), .Y(n192) );
  INVX1 U608 ( .A(n192), .Y(n477) );
  AND2X1 U609 ( .A(net_di[25]), .B(n502), .Y(n179) );
  INVX1 U610 ( .A(n179), .Y(n478) );
  AND2X1 U611 ( .A(net_di[38]), .B(n503), .Y(n166) );
  INVX1 U612 ( .A(n166), .Y(n479) );
  AND2X1 U613 ( .A(net_di[51]), .B(n502), .Y(n153) );
  INVX1 U614 ( .A(n153), .Y(n480) );
  AND2X1 U615 ( .A(net_di[63]), .B(n502), .Y(n141) );
  INVX1 U616 ( .A(n141), .Y(n481) );
  BUFX2 U617 ( .A(n279), .Y(n482) );
  AND2X1 U618 ( .A(addr[1]), .B(out_status), .Y(n281) );
  INVX1 U619 ( .A(n281), .Y(n483) );
  AND2X1 U620 ( .A(n136), .B(n210), .Y(n208) );
  INVX1 U621 ( .A(n210), .Y(n484) );
  BUFX2 U622 ( .A(n276), .Y(n485) );
  BUFX2 U623 ( .A(n139), .Y(n486) );
  BUFX2 U624 ( .A(n205), .Y(n487) );
  INVX1 U625 ( .A(n509), .Y(n508) );
  INVX1 U626 ( .A(n509), .Y(n507) );
  INVX1 U627 ( .A(n509), .Y(n506) );
  INVX1 U628 ( .A(n509), .Y(n505) );
  INVX1 U629 ( .A(n509), .Y(n504) );
  INVX1 U630 ( .A(n208), .Y(n509) );
  INVX1 U631 ( .A(n487), .Y(n503) );
  INVX1 U632 ( .A(n487), .Y(n502) );
  INVX1 U633 ( .A(n140), .Y(n501) );
  INVX1 U634 ( .A(n140), .Y(n500) );
  INVX1 U635 ( .A(n140), .Y(n499) );
  INVX1 U636 ( .A(n140), .Y(n498) );
  INVX1 U637 ( .A(n497), .Y(n496) );
  INVX1 U638 ( .A(n497), .Y(n495) );
  INVX1 U639 ( .A(n497), .Y(n494) );
  INVX1 U640 ( .A(n486), .Y(net_so) );
  INVX1 U641 ( .A(n412), .Y(n497) );
  INVX1 U642 ( .A(n491), .Y(n490) );
  INVX1 U643 ( .A(n484), .Y(n491) );
  INVX1 U644 ( .A(n492), .Y(n489) );
  INVX1 U645 ( .A(n484), .Y(n492) );
  INVX1 U646 ( .A(n493), .Y(n488) );
  INVX1 U647 ( .A(n484), .Y(n493) );
  INVX1 U648 ( .A(addr[1]), .Y(n137) );
  INVX1 U649 ( .A(addr[0]), .Y(n138) );
  INVX1 U650 ( .A(n411), .Y(n65) );
  INVX1 U651 ( .A(n410), .Y(n64) );
  INVX1 U652 ( .A(n409), .Y(n63) );
  INVX1 U653 ( .A(n408), .Y(n62) );
  INVX1 U654 ( .A(n407), .Y(n61) );
  INVX1 U655 ( .A(n406), .Y(n60) );
  INVX1 U656 ( .A(n405), .Y(n59) );
  INVX1 U657 ( .A(n404), .Y(n58) );
  INVX1 U658 ( .A(n403), .Y(n57) );
  INVX1 U659 ( .A(n402), .Y(n56) );
  INVX1 U660 ( .A(n401), .Y(n55) );
  INVX1 U661 ( .A(n400), .Y(n54) );
  INVX1 U662 ( .A(n399), .Y(n53) );
  INVX1 U663 ( .A(n398), .Y(n52) );
  INVX1 U664 ( .A(n397), .Y(n51) );
  INVX1 U665 ( .A(n396), .Y(n50) );
  INVX1 U666 ( .A(n395), .Y(n49) );
  INVX1 U667 ( .A(n394), .Y(n48) );
  INVX1 U668 ( .A(n393), .Y(n47) );
  INVX1 U669 ( .A(n392), .Y(n46) );
  INVX1 U670 ( .A(n391), .Y(n45) );
  INVX1 U671 ( .A(n390), .Y(n44) );
  INVX1 U672 ( .A(n389), .Y(n43) );
  INVX1 U673 ( .A(n388), .Y(n42) );
  INVX1 U674 ( .A(n387), .Y(n41) );
  INVX1 U675 ( .A(n386), .Y(n40) );
  INVX1 U676 ( .A(n385), .Y(n39) );
  INVX1 U677 ( .A(n384), .Y(n38) );
  INVX1 U678 ( .A(n383), .Y(n37) );
  INVX1 U679 ( .A(n382), .Y(n36) );
  INVX1 U680 ( .A(n381), .Y(n35) );
  INVX1 U681 ( .A(n380), .Y(n34) );
  INVX1 U682 ( .A(n379), .Y(n33) );
  INVX1 U683 ( .A(n378), .Y(n32) );
  INVX1 U684 ( .A(n377), .Y(n31) );
  INVX1 U685 ( .A(n376), .Y(n30) );
  INVX1 U686 ( .A(n375), .Y(n29) );
  INVX1 U687 ( .A(n374), .Y(n28) );
  INVX1 U688 ( .A(n373), .Y(n27) );
  INVX1 U689 ( .A(n372), .Y(n26) );
  INVX1 U690 ( .A(n371), .Y(n25) );
  INVX1 U691 ( .A(n370), .Y(n24) );
  INVX1 U692 ( .A(n369), .Y(n23) );
  INVX1 U693 ( .A(n368), .Y(n22) );
  INVX1 U694 ( .A(n367), .Y(n21) );
  INVX1 U695 ( .A(n366), .Y(n20) );
  INVX1 U696 ( .A(n365), .Y(n19) );
  INVX1 U697 ( .A(n364), .Y(n18) );
  INVX1 U698 ( .A(n363), .Y(n17) );
  INVX1 U699 ( .A(n362), .Y(n16) );
  INVX1 U700 ( .A(n361), .Y(n15) );
  INVX1 U701 ( .A(n360), .Y(n14) );
  INVX1 U702 ( .A(n359), .Y(n13) );
  INVX1 U703 ( .A(n358), .Y(n12) );
  INVX1 U704 ( .A(n357), .Y(n11) );
  INVX1 U705 ( .A(n356), .Y(n10) );
  INVX1 U706 ( .A(n355), .Y(n9) );
  INVX1 U707 ( .A(n354), .Y(n8) );
  INVX1 U708 ( .A(n353), .Y(n7) );
  INVX1 U709 ( .A(n352), .Y(n6) );
  INVX1 U710 ( .A(n351), .Y(n5) );
  INVX1 U711 ( .A(n350), .Y(n4) );
  INVX1 U712 ( .A(n349), .Y(n3) );
  INVX1 U713 ( .A(net_do[63]), .Y(n1) );
  INVX1 U714 ( .A(n413), .Y(n68) );
  INVX1 U715 ( .A(out_status), .Y(n69) );
  INVX1 U716 ( .A(reset), .Y(n136) );
  INVX1 U717 ( .A(in_status), .Y(n135) );
  INVX1 U718 ( .A(input_channel_buf_out[0]), .Y(n133) );
  INVX1 U719 ( .A(input_channel_buf_out[63]), .Y(n70) );
  INVX1 U720 ( .A(input_channel_buf_out[62]), .Y(n71) );
  INVX1 U721 ( .A(input_channel_buf_out[61]), .Y(n72) );
  INVX1 U722 ( .A(input_channel_buf_out[60]), .Y(n73) );
  INVX1 U723 ( .A(input_channel_buf_out[59]), .Y(n74) );
  INVX1 U724 ( .A(input_channel_buf_out[58]), .Y(n75) );
  INVX1 U725 ( .A(input_channel_buf_out[57]), .Y(n76) );
  INVX1 U726 ( .A(input_channel_buf_out[56]), .Y(n77) );
  INVX1 U727 ( .A(input_channel_buf_out[55]), .Y(n78) );
  INVX1 U728 ( .A(input_channel_buf_out[54]), .Y(n79) );
  INVX1 U729 ( .A(input_channel_buf_out[53]), .Y(n80) );
  INVX1 U730 ( .A(input_channel_buf_out[52]), .Y(n81) );
  INVX1 U731 ( .A(input_channel_buf_out[51]), .Y(n82) );
  INVX1 U732 ( .A(input_channel_buf_out[50]), .Y(n83) );
  INVX1 U733 ( .A(input_channel_buf_out[49]), .Y(n84) );
  INVX1 U734 ( .A(input_channel_buf_out[48]), .Y(n85) );
  INVX1 U735 ( .A(input_channel_buf_out[47]), .Y(n86) );
  INVX1 U736 ( .A(input_channel_buf_out[46]), .Y(n87) );
  INVX1 U737 ( .A(input_channel_buf_out[45]), .Y(n88) );
  INVX1 U738 ( .A(input_channel_buf_out[44]), .Y(n89) );
  INVX1 U739 ( .A(input_channel_buf_out[43]), .Y(n90) );
  INVX1 U740 ( .A(input_channel_buf_out[42]), .Y(n91) );
  INVX1 U741 ( .A(input_channel_buf_out[41]), .Y(n92) );
  INVX1 U742 ( .A(input_channel_buf_out[40]), .Y(n93) );
  INVX1 U743 ( .A(input_channel_buf_out[39]), .Y(n94) );
  INVX1 U744 ( .A(input_channel_buf_out[38]), .Y(n95) );
  INVX1 U745 ( .A(input_channel_buf_out[37]), .Y(n96) );
  INVX1 U746 ( .A(input_channel_buf_out[36]), .Y(n97) );
  INVX1 U747 ( .A(input_channel_buf_out[35]), .Y(n98) );
  INVX1 U748 ( .A(input_channel_buf_out[34]), .Y(n99) );
  INVX1 U749 ( .A(input_channel_buf_out[33]), .Y(n100) );
  INVX1 U750 ( .A(input_channel_buf_out[32]), .Y(n101) );
  INVX1 U751 ( .A(input_channel_buf_out[31]), .Y(n102) );
  INVX1 U752 ( .A(input_channel_buf_out[30]), .Y(n103) );
  INVX1 U753 ( .A(input_channel_buf_out[29]), .Y(n104) );
  INVX1 U754 ( .A(input_channel_buf_out[28]), .Y(n105) );
  INVX1 U755 ( .A(input_channel_buf_out[27]), .Y(n106) );
  INVX1 U756 ( .A(input_channel_buf_out[26]), .Y(n107) );
  INVX1 U757 ( .A(input_channel_buf_out[25]), .Y(n108) );
  INVX1 U758 ( .A(input_channel_buf_out[24]), .Y(n109) );
  INVX1 U759 ( .A(input_channel_buf_out[23]), .Y(n110) );
  INVX1 U760 ( .A(input_channel_buf_out[22]), .Y(n111) );
  INVX1 U761 ( .A(input_channel_buf_out[21]), .Y(n112) );
  INVX1 U762 ( .A(input_channel_buf_out[20]), .Y(n113) );
  INVX1 U763 ( .A(input_channel_buf_out[19]), .Y(n114) );
  INVX1 U764 ( .A(input_channel_buf_out[18]), .Y(n115) );
  INVX1 U765 ( .A(input_channel_buf_out[17]), .Y(n116) );
  INVX1 U766 ( .A(input_channel_buf_out[16]), .Y(n117) );
  INVX1 U767 ( .A(input_channel_buf_out[15]), .Y(n118) );
  INVX1 U768 ( .A(input_channel_buf_out[14]), .Y(n119) );
  INVX1 U769 ( .A(input_channel_buf_out[13]), .Y(n120) );
  INVX1 U770 ( .A(input_channel_buf_out[12]), .Y(n121) );
  INVX1 U771 ( .A(input_channel_buf_out[11]), .Y(n122) );
  INVX1 U772 ( .A(input_channel_buf_out[10]), .Y(n123) );
  INVX1 U773 ( .A(input_channel_buf_out[9]), .Y(n124) );
  INVX1 U774 ( .A(input_channel_buf_out[8]), .Y(n125) );
  INVX1 U775 ( .A(input_channel_buf_out[7]), .Y(n126) );
  INVX1 U776 ( .A(input_channel_buf_out[6]), .Y(n127) );
  INVX1 U777 ( .A(input_channel_buf_out[5]), .Y(n128) );
  INVX1 U778 ( .A(input_channel_buf_out[4]), .Y(n129) );
  INVX1 U779 ( .A(input_channel_buf_out[3]), .Y(n130) );
  INVX1 U780 ( .A(input_channel_buf_out[2]), .Y(n131) );
  INVX1 U781 ( .A(input_channel_buf_out[1]), .Y(n132) );
endmodule

