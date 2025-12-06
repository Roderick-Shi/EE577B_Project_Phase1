/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Sat Dec  6 11:31:26 2025
/////////////////////////////////////////////////////////////


module rr4_arbiter_4 ( clk, reset, request, advance, grant );
  input [3:0] request;
  output [3:0] grant;
  input clk, reset, advance;
  wire   n42, n40, n48, n2, n44, n35, n5, n6, n1, n50, n67, n65, n8, n7, n47,
         n10, n43, n37, n12, n13, n9, n49, n66, n64, n15, n14, n16, n38, n39,
         n18, n4, n56, n51, n21, n36, n23, n63, n53, n70, n26, n25, n27, n28,
         n71, n29, n20, n19, n30, n31, n32, n73, n24, n33, n46, n45, n72, n22,
         n17, n11, n3, n55, n58, n59, n57, n69;
  wire   [3:0] ptr;

  DFFSR ptr_reg_0_ ( .D(n42), .CLK(clk), .R(1'b1), .S(n40), .Q(ptr[0]) );
  OAI21X1 U3 ( .A(n48), .B(n2), .C(n44), .Y(n35) );
  AOI21X1 U5 ( .A(advance), .B(n5), .C(n6), .Y(n1) );
  NOR3X1 U6 ( .A(n50), .B(request[3]), .C(request[2]), .Y(n6) );
  AOI22X1 U7 ( .A(n67), .B(advance), .C(n65), .D(n8), .Y(n7) );
  OAI21X1 U8 ( .A(n47), .B(n10), .C(n43), .Y(n37) );
  AOI21X1 U10 ( .A(advance), .B(n12), .C(n13), .Y(n9) );
  NOR3X1 U11 ( .A(n49), .B(request[1]), .C(request[0]), .Y(n13) );
  AOI22X1 U12 ( .A(n66), .B(advance), .C(n64), .D(n15), .Y(n14) );
  OAI21X1 U13 ( .A(n16), .B(n8), .C(n38), .Y(n39) );
  INVX1 U15 ( .A(n18), .Y(n16) );
  OAI21X1 U16 ( .A(n4), .B(n56), .C(n51), .Y(n18) );
  INVX1 U17 ( .A(reset), .Y(n40) );
  OAI21X1 U18 ( .A(n21), .B(n15), .C(n36), .Y(n42) );
  INVX1 U20 ( .A(n23), .Y(n21) );
  OAI21X1 U21 ( .A(n4), .B(n63), .C(n53), .Y(n23) );
  INVX1 U22 ( .A(advance), .Y(n4) );
  AOI21X1 U23 ( .A(n63), .B(n53), .C(n15), .Y(n70) );
  NAND3X1 U24 ( .A(n66), .B(n2), .C(n26), .Y(n25) );
  AND2X1 U25 ( .A(n10), .B(n8), .Y(n26) );
  AOI21X1 U26 ( .A(n27), .B(n28), .C(n10), .Y(n71) );
  OR2X1 U27 ( .A(n56), .B(request[1]), .Y(n28) );
  INVX1 U28 ( .A(n67), .Y(n27) );
  NAND3X1 U30 ( .A(n67), .B(n2), .C(n29), .Y(n20) );
  AND2X1 U31 ( .A(n15), .B(n10), .Y(n29) );
  AOI21X1 U32 ( .A(n2), .B(n5), .C(n65), .Y(n19) );
  INVX1 U33 ( .A(n30), .Y(n5) );
  AOI21X1 U34 ( .A(n15), .B(n64), .C(n66), .Y(n30) );
  INVX1 U35 ( .A(request[3]), .Y(n15) );
  AOI21X1 U36 ( .A(n31), .B(n32), .C(n2), .Y(n73) );
  INVX1 U37 ( .A(request[0]), .Y(n2) );
  AOI21X1 U39 ( .A(n10), .B(n12), .C(n64), .Y(n24) );
  INVX1 U40 ( .A(n33), .Y(n12) );
  AOI21X1 U41 ( .A(n8), .B(n65), .C(n67), .Y(n33) );
  INVX1 U42 ( .A(request[1]), .Y(n8) );
  INVX1 U43 ( .A(request[2]), .Y(n10) );
  INVX1 U44 ( .A(n66), .Y(n31) );
  DFFSR ptr_reg_3_ ( .D(n37), .CLK(clk), .R(n40), .S(1'b1), .Q(ptr[3]) );
  DFFSR ptr_reg_1_ ( .D(n35), .CLK(clk), .R(n40), .S(1'b1), .Q(ptr[1]) );
  DFFSR ptr_reg_2_ ( .D(n39), .CLK(clk), .R(n40), .S(1'b1), .Q(ptr[2]) );
  OR2X1 U4 ( .A(n63), .B(request[3]), .Y(n32) );
  AND2X1 U9 ( .A(n46), .B(n45), .Y(n72) );
  INVX1 U14 ( .A(n72), .Y(grant[1]) );
  AND2X1 U19 ( .A(n66), .B(n4), .Y(n22) );
  INVX1 U29 ( .A(n22), .Y(n36) );
  AND2X1 U38 ( .A(n67), .B(n4), .Y(n17) );
  INVX1 U45 ( .A(n17), .Y(n38) );
  AND2X1 U46 ( .A(n64), .B(n4), .Y(n11) );
  INVX1 U47 ( .A(n11), .Y(n43) );
  AND2X1 U49 ( .A(n65), .B(n4), .Y(n3) );
  INVX1 U50 ( .A(n3), .Y(n44) );
  AND2X1 U51 ( .A(request[1]), .B(n55), .Y(n58) );
  INVX1 U52 ( .A(n58), .Y(n45) );
  AND2X1 U53 ( .A(request[1]), .B(n59), .Y(n57) );
  INVX1 U54 ( .A(n57), .Y(n46) );
  BUFX2 U55 ( .A(n9), .Y(n47) );
  BUFX2 U56 ( .A(n1), .Y(n48) );
  BUFX2 U57 ( .A(n14), .Y(n49) );
  BUFX2 U58 ( .A(n7), .Y(n50) );
  BUFX2 U59 ( .A(n20), .Y(n51) );
  BUFX2 U60 ( .A(n70), .Y(grant[3]) );
  BUFX2 U61 ( .A(n25), .Y(n53) );
  BUFX2 U62 ( .A(n71), .Y(grant[2]) );
  INVX1 U63 ( .A(n56), .Y(n55) );
  BUFX2 U64 ( .A(n19), .Y(n56) );
  INVX1 U65 ( .A(n51), .Y(n59) );
  BUFX2 U69 ( .A(n24), .Y(n63) );
  BUFX2 U70 ( .A(ptr[3]), .Y(n64) );
  BUFX2 U71 ( .A(ptr[1]), .Y(n65) );
  BUFX2 U72 ( .A(ptr[0]), .Y(n66) );
  BUFX2 U73 ( .A(ptr[2]), .Y(n67) );
  INVX1 U74 ( .A(n69), .Y(grant[0]) );
  INVX1 U75 ( .A(n73), .Y(n69) );
endmodule


module buffer_9 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n65, n274, n271, n132, n268, n134, n133, n135, n273, n272, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n276, n147,
         n275, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n270, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n269, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n128, n277, n341,
         n129, n342, n2, n279, n127, n340, n130, n343, n74, n287, n75, n288,
         n76, n289, n77, n290, n78, n291, n79, n292, n80, n293, n81, n294, n82,
         n295, n83, n296, n84, n297, n85, n298, n86, n299, n87, n300, n88,
         n301, n89, n302, n90, n303, n91, n304, n92, n305, n93, n306, n94,
         n307, n95, n308, n96, n309, n97, n310, n98, n311, n99, n312, n100,
         n313, n101, n314, n102, n315, n103, n316, n104, n317, n105, n318,
         n106, n319, n107, n320, n108, n321, n109, n322, n110, n323, n111,
         n324, n112, n325, n113, n326, n114, n327, n115, n328, n116, n329,
         n117, n330, n118, n331, n119, n332, n120, n333, n121, n334, n122,
         n335, n123, n336, n124, n337, n125, n338, n126, n339, n67, n280, n68,
         n281, n69, n282, n70, n283, n71, n284, n72, n285, n73, n286, n1, n278,
         n197, n198, n202, n200;

  INVX1 U67 ( .A(reset), .Y(n65) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n271), .Y(
        n132) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n274), .C(buffer_di[1]), .D(n268), .Y(
        n134) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n274), .C(buffer_di[2]), .D(n133), .Y(
        n135) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n272), .Y(
        n136) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n272), .Y(
        n137) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n272), .Y(
        n138) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n272), .Y(
        n139) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n272), .Y(
        n140) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n272), .Y(
        n141) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n272), .Y(
        n142) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n272), .Y(
        n143) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n272), .Y(
        n144) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n272), .Y(
        n145) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n272), .Y(
        n146) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n276), .C(buffer_di[14]), .D(n272), .Y(
        n147) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n275), .C(buffer_di[15]), .D(n272), .Y(
        n148) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n271), .Y(
        n149) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n276), .C(buffer_di[17]), .D(n271), .Y(
        n150) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n275), .C(buffer_di[18]), .D(n271), .Y(
        n151) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n271), .Y(
        n152) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n271), .Y(
        n153) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n271), .Y(
        n154) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n271), .Y(
        n155) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n271), .Y(
        n156) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n271), .Y(
        n157) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n271), .Y(
        n158) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n271), .Y(
        n159) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n271), .Y(
        n160) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n270), .Y(
        n161) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n270), .Y(
        n162) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n270), .Y(
        n163) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n270), .Y(
        n164) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n270), .Y(
        n165) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n270), .Y(
        n166) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n270), .Y(
        n167) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n270), .Y(
        n168) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n270), .Y(
        n169) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n270), .Y(
        n170) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n270), .Y(
        n171) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n270), .Y(
        n172) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n269), .Y(
        n173) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n269), .Y(
        n174) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n269), .Y(
        n175) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n269), .Y(
        n176) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n269), .Y(
        n177) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n269), .Y(
        n178) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n269), .Y(
        n179) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n269), .Y(
        n180) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n269), .Y(
        n181) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n269), .Y(
        n182) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n269), .Y(
        n183) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n269), .Y(
        n184) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n268), .Y(
        n185) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n268), .Y(
        n186) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n268), .Y(
        n187) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n268), .Y(
        n188) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n268), .Y(
        n189) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n274), .C(buffer_di[57]), .D(n268), .Y(
        n190) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n268), .Y(
        n191) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n274), .C(buffer_di[59]), .D(n268), .Y(
        n192) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n274), .C(buffer_di[60]), .D(n268), .Y(
        n193) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n274), .C(buffer_di[61]), .D(n268), .Y(
        n194) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n268), .Y(
        n195) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n274), .C(buffer_di[63]), .D(n268), .Y(
        n196) );
  DFFSR data_q_reg_2_ ( .D(n128), .CLK(clk), .R(n277), .S(1'b1), .Q(n341) );
  DFFSR data_q_reg_1_ ( .D(n129), .CLK(clk), .R(n277), .S(1'b1), .Q(n342) );
  DFFSR full_reg ( .D(n2), .CLK(clk), .R(n277), .S(1'b1), .Q(n279) );
  DFFSR data_q_reg_3_ ( .D(n127), .CLK(clk), .R(n277), .S(1'b1), .Q(n340) );
  DFFSR data_q_reg_0_ ( .D(n130), .CLK(clk), .R(n277), .S(1'b1), .Q(n343) );
  DFFSR data_q_reg_56_ ( .D(n74), .CLK(clk), .R(n277), .S(1'b1), .Q(n287) );
  DFFSR data_q_reg_55_ ( .D(n75), .CLK(clk), .R(n277), .S(1'b1), .Q(n288) );
  DFFSR data_q_reg_54_ ( .D(n76), .CLK(clk), .R(n277), .S(1'b1), .Q(n289) );
  DFFSR data_q_reg_53_ ( .D(n77), .CLK(clk), .R(n277), .S(1'b1), .Q(n290) );
  DFFSR data_q_reg_52_ ( .D(n78), .CLK(clk), .R(n277), .S(1'b1), .Q(n291) );
  DFFSR data_q_reg_51_ ( .D(n79), .CLK(clk), .R(n277), .S(1'b1), .Q(n292) );
  DFFSR data_q_reg_50_ ( .D(n80), .CLK(clk), .R(n277), .S(1'b1), .Q(n293) );
  DFFSR data_q_reg_49_ ( .D(n81), .CLK(clk), .R(n277), .S(1'b1), .Q(n294) );
  DFFSR data_q_reg_48_ ( .D(n82), .CLK(clk), .R(n277), .S(1'b1), .Q(n295) );
  DFFSR data_q_reg_47_ ( .D(n83), .CLK(clk), .R(n277), .S(1'b1), .Q(n296) );
  DFFSR data_q_reg_46_ ( .D(n84), .CLK(clk), .R(n277), .S(1'b1), .Q(n297) );
  DFFSR data_q_reg_45_ ( .D(n85), .CLK(clk), .R(n277), .S(1'b1), .Q(n298) );
  DFFSR data_q_reg_44_ ( .D(n86), .CLK(clk), .R(n277), .S(1'b1), .Q(n299) );
  DFFSR data_q_reg_43_ ( .D(n87), .CLK(clk), .R(n277), .S(1'b1), .Q(n300) );
  DFFSR data_q_reg_42_ ( .D(n88), .CLK(clk), .R(n277), .S(1'b1), .Q(n301) );
  DFFSR data_q_reg_41_ ( .D(n89), .CLK(clk), .R(n277), .S(1'b1), .Q(n302) );
  DFFSR data_q_reg_40_ ( .D(n90), .CLK(clk), .R(n277), .S(1'b1), .Q(n303) );
  DFFSR data_q_reg_39_ ( .D(n91), .CLK(clk), .R(n277), .S(1'b1), .Q(n304) );
  DFFSR data_q_reg_38_ ( .D(n92), .CLK(clk), .R(n277), .S(1'b1), .Q(n305) );
  DFFSR data_q_reg_37_ ( .D(n93), .CLK(clk), .R(n277), .S(1'b1), .Q(n306) );
  DFFSR data_q_reg_36_ ( .D(n94), .CLK(clk), .R(n277), .S(1'b1), .Q(n307) );
  DFFSR data_q_reg_35_ ( .D(n95), .CLK(clk), .R(n277), .S(1'b1), .Q(n308) );
  DFFSR data_q_reg_34_ ( .D(n96), .CLK(clk), .R(n277), .S(1'b1), .Q(n309) );
  DFFSR data_q_reg_33_ ( .D(n97), .CLK(clk), .R(n277), .S(1'b1), .Q(n310) );
  DFFSR data_q_reg_32_ ( .D(n98), .CLK(clk), .R(n277), .S(1'b1), .Q(n311) );
  DFFSR data_q_reg_31_ ( .D(n99), .CLK(clk), .R(n277), .S(1'b1), .Q(n312) );
  DFFSR data_q_reg_30_ ( .D(n100), .CLK(clk), .R(n277), .S(1'b1), .Q(n313) );
  DFFSR data_q_reg_29_ ( .D(n101), .CLK(clk), .R(n277), .S(1'b1), .Q(n314) );
  DFFSR data_q_reg_28_ ( .D(n102), .CLK(clk), .R(n277), .S(1'b1), .Q(n315) );
  DFFSR data_q_reg_27_ ( .D(n103), .CLK(clk), .R(n277), .S(1'b1), .Q(n316) );
  DFFSR data_q_reg_26_ ( .D(n104), .CLK(clk), .R(n277), .S(1'b1), .Q(n317) );
  DFFSR data_q_reg_25_ ( .D(n105), .CLK(clk), .R(n277), .S(1'b1), .Q(n318) );
  DFFSR data_q_reg_24_ ( .D(n106), .CLK(clk), .R(n277), .S(1'b1), .Q(n319) );
  DFFSR data_q_reg_23_ ( .D(n107), .CLK(clk), .R(n277), .S(1'b1), .Q(n320) );
  DFFSR data_q_reg_22_ ( .D(n108), .CLK(clk), .R(n277), .S(1'b1), .Q(n321) );
  DFFSR data_q_reg_21_ ( .D(n109), .CLK(clk), .R(n277), .S(1'b1), .Q(n322) );
  DFFSR data_q_reg_20_ ( .D(n110), .CLK(clk), .R(n277), .S(1'b1), .Q(n323) );
  DFFSR data_q_reg_19_ ( .D(n111), .CLK(clk), .R(n277), .S(1'b1), .Q(n324) );
  DFFSR data_q_reg_18_ ( .D(n112), .CLK(clk), .R(n277), .S(1'b1), .Q(n325) );
  DFFSR data_q_reg_17_ ( .D(n113), .CLK(clk), .R(n277), .S(1'b1), .Q(n326) );
  DFFSR data_q_reg_16_ ( .D(n114), .CLK(clk), .R(n277), .S(1'b1), .Q(n327) );
  DFFSR data_q_reg_15_ ( .D(n115), .CLK(clk), .R(n277), .S(1'b1), .Q(n328) );
  DFFSR data_q_reg_14_ ( .D(n116), .CLK(clk), .R(n277), .S(1'b1), .Q(n329) );
  DFFSR data_q_reg_13_ ( .D(n117), .CLK(clk), .R(n277), .S(1'b1), .Q(n330) );
  DFFSR data_q_reg_12_ ( .D(n118), .CLK(clk), .R(n277), .S(1'b1), .Q(n331) );
  DFFSR data_q_reg_11_ ( .D(n119), .CLK(clk), .R(n65), .S(1'b1), .Q(n332) );
  DFFSR data_q_reg_10_ ( .D(n120), .CLK(clk), .R(n65), .S(1'b1), .Q(n333) );
  DFFSR data_q_reg_9_ ( .D(n121), .CLK(clk), .R(n65), .S(1'b1), .Q(n334) );
  DFFSR data_q_reg_8_ ( .D(n122), .CLK(clk), .R(n65), .S(1'b1), .Q(n335) );
  DFFSR data_q_reg_7_ ( .D(n123), .CLK(clk), .R(n65), .S(1'b1), .Q(n336) );
  DFFSR data_q_reg_6_ ( .D(n124), .CLK(clk), .R(n65), .S(1'b1), .Q(n337) );
  DFFSR data_q_reg_5_ ( .D(n125), .CLK(clk), .R(n65), .S(1'b1), .Q(n338) );
  DFFSR data_q_reg_4_ ( .D(n126), .CLK(clk), .R(n65), .S(1'b1), .Q(n339) );
  DFFSR data_q_reg_63_ ( .D(n67), .CLK(clk), .R(n277), .S(1'b1), .Q(n280) );
  DFFSR data_q_reg_62_ ( .D(n68), .CLK(clk), .R(n277), .S(1'b1), .Q(n281) );
  DFFSR data_q_reg_61_ ( .D(n69), .CLK(clk), .R(n277), .S(1'b1), .Q(n282) );
  DFFSR data_q_reg_60_ ( .D(n70), .CLK(clk), .R(n277), .S(1'b1), .Q(n283) );
  DFFSR data_q_reg_59_ ( .D(n71), .CLK(clk), .R(n65), .S(1'b1), .Q(n284) );
  DFFSR data_q_reg_58_ ( .D(n72), .CLK(clk), .R(n65), .S(1'b1), .Q(n285) );
  DFFSR data_q_reg_57_ ( .D(n73), .CLK(clk), .R(n65), .S(1'b1), .Q(n286) );
  AND2X1 U3 ( .A(buffer_so), .B(n1), .Y(n278) );
  AND2X1 U4 ( .A(buffer_si), .B(buffer_ri), .Y(n133) );
  AND2X1 U5 ( .A(buffer_ro), .B(buffer_en), .Y(n197) );
  INVX1 U6 ( .A(n197), .Y(n1) );
  AND2X1 U7 ( .A(buffer_ri), .B(n274), .Y(n198) );
  INVX1 U8 ( .A(n198), .Y(n2) );
  BUFX2 U9 ( .A(n279), .Y(buffer_so) );
  BUFX2 U10 ( .A(n286), .Y(buffer_do[57]) );
  BUFX2 U11 ( .A(n285), .Y(buffer_do[58]) );
  BUFX2 U12 ( .A(n284), .Y(buffer_do[59]) );
  BUFX2 U13 ( .A(n283), .Y(buffer_do[60]) );
  BUFX2 U14 ( .A(n282), .Y(buffer_do[61]) );
  BUFX2 U15 ( .A(n281), .Y(buffer_do[62]) );
  BUFX2 U16 ( .A(n280), .Y(buffer_do[63]) );
  BUFX2 U17 ( .A(n339), .Y(buffer_do[4]) );
  BUFX2 U18 ( .A(n338), .Y(buffer_do[5]) );
  BUFX2 U19 ( .A(n337), .Y(buffer_do[6]) );
  BUFX2 U20 ( .A(n336), .Y(buffer_do[7]) );
  BUFX2 U21 ( .A(n335), .Y(buffer_do[8]) );
  BUFX2 U22 ( .A(n334), .Y(buffer_do[9]) );
  BUFX2 U23 ( .A(n333), .Y(buffer_do[10]) );
  BUFX2 U24 ( .A(n332), .Y(buffer_do[11]) );
  BUFX2 U25 ( .A(n331), .Y(buffer_do[12]) );
  BUFX2 U26 ( .A(n330), .Y(buffer_do[13]) );
  BUFX2 U27 ( .A(n329), .Y(buffer_do[14]) );
  BUFX2 U28 ( .A(n328), .Y(buffer_do[15]) );
  BUFX2 U29 ( .A(n327), .Y(buffer_do[16]) );
  BUFX2 U30 ( .A(n326), .Y(buffer_do[17]) );
  BUFX2 U31 ( .A(n325), .Y(buffer_do[18]) );
  BUFX2 U32 ( .A(n324), .Y(buffer_do[19]) );
  BUFX2 U33 ( .A(n323), .Y(buffer_do[20]) );
  BUFX2 U34 ( .A(n322), .Y(buffer_do[21]) );
  BUFX2 U35 ( .A(n321), .Y(buffer_do[22]) );
  BUFX2 U36 ( .A(n320), .Y(buffer_do[23]) );
  BUFX2 U37 ( .A(n319), .Y(buffer_do[24]) );
  BUFX2 U38 ( .A(n318), .Y(buffer_do[25]) );
  BUFX2 U39 ( .A(n317), .Y(buffer_do[26]) );
  BUFX2 U40 ( .A(n316), .Y(buffer_do[27]) );
  BUFX2 U41 ( .A(n315), .Y(buffer_do[28]) );
  BUFX2 U42 ( .A(n314), .Y(buffer_do[29]) );
  BUFX2 U43 ( .A(n313), .Y(buffer_do[30]) );
  BUFX2 U44 ( .A(n312), .Y(buffer_do[31]) );
  BUFX2 U45 ( .A(n311), .Y(buffer_do[32]) );
  BUFX2 U46 ( .A(n310), .Y(buffer_do[33]) );
  BUFX2 U47 ( .A(n309), .Y(buffer_do[34]) );
  BUFX2 U48 ( .A(n308), .Y(buffer_do[35]) );
  BUFX2 U49 ( .A(n307), .Y(buffer_do[36]) );
  BUFX2 U50 ( .A(n306), .Y(buffer_do[37]) );
  BUFX2 U51 ( .A(n305), .Y(buffer_do[38]) );
  BUFX2 U52 ( .A(n304), .Y(buffer_do[39]) );
  BUFX2 U53 ( .A(n303), .Y(buffer_do[40]) );
  BUFX2 U54 ( .A(n302), .Y(buffer_do[41]) );
  BUFX2 U55 ( .A(n301), .Y(buffer_do[42]) );
  BUFX2 U56 ( .A(n300), .Y(buffer_do[43]) );
  BUFX2 U57 ( .A(n299), .Y(buffer_do[44]) );
  BUFX2 U58 ( .A(n298), .Y(buffer_do[45]) );
  BUFX2 U59 ( .A(n297), .Y(buffer_do[46]) );
  BUFX2 U60 ( .A(n296), .Y(buffer_do[47]) );
  BUFX2 U61 ( .A(n295), .Y(buffer_do[48]) );
  BUFX2 U62 ( .A(n294), .Y(buffer_do[49]) );
  BUFX2 U63 ( .A(n293), .Y(buffer_do[50]) );
  BUFX2 U64 ( .A(n292), .Y(buffer_do[51]) );
  BUFX2 U65 ( .A(n291), .Y(buffer_do[52]) );
  BUFX2 U66 ( .A(n290), .Y(buffer_do[53]) );
  BUFX2 U68 ( .A(n289), .Y(buffer_do[54]) );
  BUFX2 U69 ( .A(n288), .Y(buffer_do[55]) );
  BUFX2 U70 ( .A(n287), .Y(buffer_do[56]) );
  BUFX2 U71 ( .A(n343), .Y(buffer_do[0]) );
  BUFX2 U72 ( .A(n340), .Y(buffer_do[3]) );
  BUFX2 U73 ( .A(n342), .Y(buffer_do[1]) );
  BUFX2 U74 ( .A(n341), .Y(buffer_do[2]) );
  INVX1 U75 ( .A(n202), .Y(n200) );
  INVX1 U76 ( .A(n200), .Y(buffer_ri) );
  INVX1 U77 ( .A(n278), .Y(n202) );
  INVX2 U78 ( .A(reset), .Y(n277) );
  INVX1 U208 ( .A(n276), .Y(n272) );
  INVX1 U209 ( .A(n273), .Y(n271) );
  INVX1 U210 ( .A(n273), .Y(n270) );
  INVX1 U211 ( .A(n276), .Y(n269) );
  INVX1 U212 ( .A(n275), .Y(n268) );
  INVX1 U213 ( .A(n133), .Y(n273) );
  INVX1 U214 ( .A(n133), .Y(n274) );
  INVX1 U215 ( .A(n133), .Y(n275) );
  INVX1 U216 ( .A(n133), .Y(n276) );
  INVX1 U217 ( .A(n132), .Y(n130) );
  INVX1 U218 ( .A(n134), .Y(n129) );
  INVX1 U219 ( .A(n135), .Y(n128) );
  INVX1 U220 ( .A(n136), .Y(n127) );
  INVX1 U221 ( .A(n137), .Y(n126) );
  INVX1 U222 ( .A(n138), .Y(n125) );
  INVX1 U223 ( .A(n139), .Y(n124) );
  INVX1 U224 ( .A(n140), .Y(n123) );
  INVX1 U225 ( .A(n141), .Y(n122) );
  INVX1 U226 ( .A(n142), .Y(n121) );
  INVX1 U227 ( .A(n143), .Y(n120) );
  INVX1 U228 ( .A(n144), .Y(n119) );
  INVX1 U229 ( .A(n145), .Y(n118) );
  INVX1 U230 ( .A(n146), .Y(n117) );
  INVX1 U231 ( .A(n147), .Y(n116) );
  INVX1 U232 ( .A(n148), .Y(n115) );
  INVX1 U233 ( .A(n149), .Y(n114) );
  INVX1 U234 ( .A(n150), .Y(n113) );
  INVX1 U235 ( .A(n151), .Y(n112) );
  INVX1 U236 ( .A(n152), .Y(n111) );
  INVX1 U237 ( .A(n153), .Y(n110) );
  INVX1 U238 ( .A(n154), .Y(n109) );
  INVX1 U239 ( .A(n155), .Y(n108) );
  INVX1 U240 ( .A(n156), .Y(n107) );
  INVX1 U241 ( .A(n157), .Y(n106) );
  INVX1 U242 ( .A(n158), .Y(n105) );
  INVX1 U243 ( .A(n159), .Y(n104) );
  INVX1 U244 ( .A(n160), .Y(n103) );
  INVX1 U245 ( .A(n161), .Y(n102) );
  INVX1 U246 ( .A(n162), .Y(n101) );
  INVX1 U247 ( .A(n163), .Y(n100) );
  INVX1 U248 ( .A(n164), .Y(n99) );
  INVX1 U249 ( .A(n165), .Y(n98) );
  INVX1 U250 ( .A(n166), .Y(n97) );
  INVX1 U251 ( .A(n167), .Y(n96) );
  INVX1 U252 ( .A(n168), .Y(n95) );
  INVX1 U253 ( .A(n169), .Y(n94) );
  INVX1 U254 ( .A(n170), .Y(n93) );
  INVX1 U255 ( .A(n171), .Y(n92) );
  INVX1 U256 ( .A(n172), .Y(n91) );
  INVX1 U257 ( .A(n173), .Y(n90) );
  INVX1 U258 ( .A(n174), .Y(n89) );
  INVX1 U259 ( .A(n175), .Y(n88) );
  INVX1 U260 ( .A(n176), .Y(n87) );
  INVX1 U261 ( .A(n177), .Y(n86) );
  INVX1 U262 ( .A(n178), .Y(n85) );
  INVX1 U263 ( .A(n179), .Y(n84) );
  INVX1 U264 ( .A(n180), .Y(n83) );
  INVX1 U265 ( .A(n181), .Y(n82) );
  INVX1 U266 ( .A(n182), .Y(n81) );
  INVX1 U267 ( .A(n183), .Y(n80) );
  INVX1 U268 ( .A(n184), .Y(n79) );
  INVX1 U269 ( .A(n185), .Y(n78) );
  INVX1 U270 ( .A(n186), .Y(n77) );
  INVX1 U271 ( .A(n187), .Y(n76) );
  INVX1 U272 ( .A(n188), .Y(n75) );
  INVX1 U273 ( .A(n189), .Y(n74) );
  INVX1 U274 ( .A(n190), .Y(n73) );
  INVX1 U275 ( .A(n191), .Y(n72) );
  INVX1 U276 ( .A(n192), .Y(n71) );
  INVX1 U277 ( .A(n193), .Y(n70) );
  INVX1 U278 ( .A(n194), .Y(n69) );
  INVX1 U279 ( .A(n195), .Y(n68) );
  INVX1 U280 ( .A(n196), .Y(n67) );
endmodule


module output_controller_4in_4 ( clk, reset, polarity, output_so, output_do, 
        output_ro, in0_si, in0_di, in0_ri, in1_si, in1_di, in1_ri, in2_si, 
        in2_di, in2_ri, in3_si, in3_di, in3_ri );
  output [63:0] output_do;
  input [63:0] in0_di;
  input [63:0] in1_di;
  input [63:0] in2_di;
  input [63:0] in3_di;
  input clk, reset, polarity, output_ro, in0_si, in1_si, in2_si, in3_si;
  output output_so, in0_ri, in1_ri, in2_ri, in3_ri;
  wire   n330, buf_ri, n324, n323, n322, n321, n319, n318, n317, n316, n315,
         n314, n313, n312, n311, n310, n308, n307, n306, n305, n304, n303,
         n302, n301, n300, n299, n297, n296, n295, n294, n293, n292, n291,
         n290, n289, n288, n286, n285, n284, n283, n282, n281, n280, n279,
         n278, n277, n275, n274, n273, n272, n271, n270, n269, n268, n267,
         n266, n328, n327, n326, n325, n320, n309, n298, n287, n276, n265, n7,
         n334, n6, n9, n5, n8, n11, n10, n13, n12, n15, n14, n17, n16, n19,
         n18, n336, n21, n20, n23, n22, n25, n24, n27, n26, n29, n28, n31, n30,
         n33, n32, n35, n34, n37, n36, n39, n38, n41, n40, n43, n42, n45, n44,
         n47, n46, n49, n48, n51, n50, n53, n52, n55, n54, n57, n56, n59, n58,
         n61, n332, n60, n63, n62, n65, n64, n67, n66, n69, n68, n71, n70, n73,
         n72, n75, n74, n77, n76, n79, n78, n81, n80, n83, n82, n85, n84, n87,
         n86, n89, n88, n91, n90, n93, n92, n95, n94, n97, n96, n99, n98, n101,
         n100, n103, n102, n105, n104, n107, n106, n109, n108, n111, n110,
         n113, n112, n115, n114, n117, n116, n119, n118, n121, n120, n123,
         n122, n125, n124, n127, n126, n129, n128, n131, n130, n133, n132,
         n135, n4, n329, n134, n189, n253, n190, n254, n191, n255, n193, n257,
         n194, n258, n195, n259, n196, n260, n181, n245, n192, n256, n197,
         n261, n198, n262, n199, n263, n200, n264, n2, n202, n3, n203, n140,
         n204, n141, n205, n142, n206, n143, n207, n144, n208, n145, n209,
         n146, n210, n147, n211, n149, n213, n150, n214, n151, n215, n152,
         n216, n153, n217, n154, n218, n155, n219, n156, n220, n157, n221,
         n158, n222, n160, n224, n161, n225, n162, n226, n163, n227, n164,
         n228, n165, n229, n166, n230, n167, n231, n168, n232, n169, n233,
         n171, n235, n172, n236, n173, n237, n174, n238, n175, n239, n176,
         n240, n177, n241, n178, n242, n179, n243, n180, n244, n182, n246,
         n183, n247, n184, n248, n185, n249, n186, n250, n187, n251, n188,
         n252, n1, n201, n170, n234, n148, n212, n159, n223, n338, n331, n139,
         n136, n333, n335, n337;
  wire   [3:0] grant;
  wire   [63:0] sel_data;

  rr4_arbiter_4 ARB ( .clk(clk), .reset(reset), .request({in3_si, in2_si, 
        in1_si, in0_si}), .advance(n330), .grant(grant) );
  buffer_9 OB ( .clk(clk), .reset(reset), .buffer_en(1'b1), .buffer_di({n324, 
        n323, n322, n321, n319, n318, n317, n316, n315, n314, n313, n312, n311, 
        n310, n308, n307, n306, n305, n304, n303, n302, n301, n300, n299, n297, 
        n296, n295, n294, n293, n292, n291, n290, n289, n288, n286, n285, n284, 
        n283, n282, n281, n280, n279, n278, n277, n275, n274, n273, n272, n271, 
        n270, n269, n268, n267, n266, n328, n327, n326, n325, n320, n309, n298, 
        n287, n276, n265}), .buffer_si(n330), .buffer_ri(buf_ri), .buffer_ro(
        output_ro), .buffer_so(output_so), .buffer_do(output_do) );
  AOI22X1 U11 ( .A(in3_di[9]), .B(n7), .C(in2_di[9]), .D(n334), .Y(n6) );
  AOI22X1 U12 ( .A(in1_di[9]), .B(n9), .C(in0_di[9]), .D(grant[0]), .Y(n5) );
  AOI22X1 U14 ( .A(in3_di[8]), .B(n7), .C(in2_di[8]), .D(n8), .Y(n11) );
  AOI22X1 U15 ( .A(in1_di[8]), .B(n9), .C(in0_di[8]), .D(grant[0]), .Y(n10) );
  AOI22X1 U17 ( .A(in3_di[7]), .B(n7), .C(in2_di[7]), .D(n334), .Y(n13) );
  AOI22X1 U18 ( .A(in1_di[7]), .B(n9), .C(in0_di[7]), .D(grant[0]), .Y(n12) );
  AOI22X1 U20 ( .A(in3_di[6]), .B(n7), .C(in2_di[6]), .D(n8), .Y(n15) );
  AOI22X1 U21 ( .A(in1_di[6]), .B(n9), .C(in0_di[6]), .D(grant[0]), .Y(n14) );
  AOI22X1 U23 ( .A(in3_di[63]), .B(n7), .C(in2_di[63]), .D(n334), .Y(n17) );
  AOI22X1 U24 ( .A(in1_di[63]), .B(n9), .C(in0_di[63]), .D(grant[0]), .Y(n16)
         );
  AOI22X1 U26 ( .A(in3_di[62]), .B(n7), .C(in2_di[62]), .D(n334), .Y(n19) );
  AOI22X1 U27 ( .A(in1_di[62]), .B(n9), .C(in0_di[62]), .D(grant[0]), .Y(n18)
         );
  AOI22X1 U29 ( .A(in3_di[61]), .B(n336), .C(in2_di[61]), .D(n8), .Y(n21) );
  AOI22X1 U30 ( .A(in1_di[61]), .B(n9), .C(in0_di[61]), .D(grant[0]), .Y(n20)
         );
  AOI22X1 U32 ( .A(in3_di[60]), .B(n336), .C(in2_di[60]), .D(n8), .Y(n23) );
  AOI22X1 U33 ( .A(in1_di[60]), .B(n9), .C(in0_di[60]), .D(grant[0]), .Y(n22)
         );
  AOI22X1 U35 ( .A(in3_di[5]), .B(n7), .C(in2_di[5]), .D(n8), .Y(n25) );
  AOI22X1 U36 ( .A(in1_di[5]), .B(n9), .C(in0_di[5]), .D(grant[0]), .Y(n24) );
  AOI22X1 U38 ( .A(in3_di[59]), .B(n7), .C(in2_di[59]), .D(n8), .Y(n27) );
  AOI22X1 U39 ( .A(in1_di[59]), .B(n9), .C(in0_di[59]), .D(grant[0]), .Y(n26)
         );
  AOI22X1 U41 ( .A(in3_di[58]), .B(n7), .C(in2_di[58]), .D(n8), .Y(n29) );
  AOI22X1 U42 ( .A(in1_di[58]), .B(n9), .C(in0_di[58]), .D(grant[0]), .Y(n28)
         );
  AOI22X1 U44 ( .A(in3_di[57]), .B(n7), .C(in2_di[57]), .D(n8), .Y(n31) );
  AOI22X1 U45 ( .A(in1_di[57]), .B(n9), .C(in0_di[57]), .D(grant[0]), .Y(n30)
         );
  AOI22X1 U47 ( .A(in3_di[56]), .B(n336), .C(in2_di[56]), .D(n8), .Y(n33) );
  AOI22X1 U48 ( .A(in1_di[56]), .B(n9), .C(in0_di[56]), .D(grant[0]), .Y(n32)
         );
  AOI22X1 U50 ( .A(in3_di[55]), .B(n7), .C(in2_di[55]), .D(n8), .Y(n35) );
  AOI22X1 U51 ( .A(in1_di[55]), .B(n9), .C(in0_di[55]), .D(grant[0]), .Y(n34)
         );
  AOI22X1 U53 ( .A(in3_di[54]), .B(n336), .C(in2_di[54]), .D(n8), .Y(n37) );
  AOI22X1 U54 ( .A(in1_di[54]), .B(n9), .C(in0_di[54]), .D(grant[0]), .Y(n36)
         );
  AOI22X1 U56 ( .A(in3_di[53]), .B(n7), .C(in2_di[53]), .D(n8), .Y(n39) );
  AOI22X1 U57 ( .A(in1_di[53]), .B(n9), .C(in0_di[53]), .D(grant[0]), .Y(n38)
         );
  AOI22X1 U59 ( .A(in3_di[52]), .B(n7), .C(in2_di[52]), .D(n334), .Y(n41) );
  AOI22X1 U60 ( .A(in1_di[52]), .B(n9), .C(in0_di[52]), .D(grant[0]), .Y(n40)
         );
  AOI22X1 U62 ( .A(in3_di[51]), .B(n7), .C(in2_di[51]), .D(n334), .Y(n43) );
  AOI22X1 U63 ( .A(in1_di[51]), .B(n9), .C(in0_di[51]), .D(grant[0]), .Y(n42)
         );
  AOI22X1 U65 ( .A(in3_di[50]), .B(n7), .C(in2_di[50]), .D(n334), .Y(n45) );
  AOI22X1 U66 ( .A(in1_di[50]), .B(n9), .C(in0_di[50]), .D(grant[0]), .Y(n44)
         );
  AOI22X1 U68 ( .A(in3_di[4]), .B(n7), .C(in2_di[4]), .D(n334), .Y(n47) );
  AOI22X1 U69 ( .A(in1_di[4]), .B(n9), .C(in0_di[4]), .D(grant[0]), .Y(n46) );
  AOI22X1 U71 ( .A(in3_di[49]), .B(n7), .C(in2_di[49]), .D(n334), .Y(n49) );
  AOI22X1 U72 ( .A(in1_di[49]), .B(n9), .C(in0_di[49]), .D(grant[0]), .Y(n48)
         );
  AOI22X1 U74 ( .A(in3_di[48]), .B(n7), .C(in2_di[48]), .D(n334), .Y(n51) );
  AOI22X1 U75 ( .A(in1_di[48]), .B(n9), .C(in0_di[48]), .D(grant[0]), .Y(n50)
         );
  AOI22X1 U77 ( .A(in3_di[47]), .B(n7), .C(in2_di[47]), .D(n334), .Y(n53) );
  AOI22X1 U78 ( .A(in1_di[47]), .B(n9), .C(in0_di[47]), .D(grant[0]), .Y(n52)
         );
  AOI22X1 U80 ( .A(in3_di[46]), .B(n7), .C(in2_di[46]), .D(n334), .Y(n55) );
  AOI22X1 U81 ( .A(in1_di[46]), .B(n9), .C(in0_di[46]), .D(grant[0]), .Y(n54)
         );
  AOI22X1 U83 ( .A(in3_di[45]), .B(n7), .C(in2_di[45]), .D(n334), .Y(n57) );
  AOI22X1 U84 ( .A(in1_di[45]), .B(n9), .C(in0_di[45]), .D(grant[0]), .Y(n56)
         );
  AOI22X1 U86 ( .A(in3_di[44]), .B(n7), .C(in2_di[44]), .D(n334), .Y(n59) );
  AOI22X1 U87 ( .A(in1_di[44]), .B(n9), .C(in0_di[44]), .D(grant[0]), .Y(n58)
         );
  AOI22X1 U89 ( .A(in3_di[43]), .B(n7), .C(in2_di[43]), .D(n334), .Y(n61) );
  AOI22X1 U90 ( .A(in1_di[43]), .B(n332), .C(in0_di[43]), .D(grant[0]), .Y(n60) );
  AOI22X1 U92 ( .A(in3_di[42]), .B(n7), .C(in2_di[42]), .D(n334), .Y(n63) );
  AOI22X1 U93 ( .A(in1_di[42]), .B(n9), .C(in0_di[42]), .D(grant[0]), .Y(n62)
         );
  AOI22X1 U95 ( .A(in3_di[41]), .B(n7), .C(in2_di[41]), .D(n334), .Y(n65) );
  AOI22X1 U96 ( .A(in1_di[41]), .B(n9), .C(in0_di[41]), .D(grant[0]), .Y(n64)
         );
  AOI22X1 U98 ( .A(in3_di[40]), .B(n7), .C(in2_di[40]), .D(n334), .Y(n67) );
  AOI22X1 U99 ( .A(in1_di[40]), .B(n9), .C(in0_di[40]), .D(grant[0]), .Y(n66)
         );
  AOI22X1 U101 ( .A(in3_di[3]), .B(n7), .C(in2_di[3]), .D(n334), .Y(n69) );
  AOI22X1 U102 ( .A(in1_di[3]), .B(n9), .C(in0_di[3]), .D(grant[0]), .Y(n68)
         );
  AOI22X1 U104 ( .A(in3_di[39]), .B(n7), .C(in2_di[39]), .D(n334), .Y(n71) );
  AOI22X1 U105 ( .A(in1_di[39]), .B(n9), .C(in0_di[39]), .D(grant[0]), .Y(n70)
         );
  AOI22X1 U107 ( .A(in3_di[38]), .B(n7), .C(in2_di[38]), .D(n334), .Y(n73) );
  AOI22X1 U108 ( .A(in1_di[38]), .B(n9), .C(in0_di[38]), .D(grant[0]), .Y(n72)
         );
  AOI22X1 U110 ( .A(in3_di[37]), .B(n7), .C(in2_di[37]), .D(n334), .Y(n75) );
  AOI22X1 U111 ( .A(in1_di[37]), .B(n9), .C(in0_di[37]), .D(grant[0]), .Y(n74)
         );
  AOI22X1 U113 ( .A(in3_di[36]), .B(n7), .C(in2_di[36]), .D(n334), .Y(n77) );
  AOI22X1 U114 ( .A(in1_di[36]), .B(n9), .C(in0_di[36]), .D(grant[0]), .Y(n76)
         );
  AOI22X1 U116 ( .A(in3_di[35]), .B(n7), .C(in2_di[35]), .D(n334), .Y(n79) );
  AOI22X1 U117 ( .A(in1_di[35]), .B(n9), .C(in0_di[35]), .D(grant[0]), .Y(n78)
         );
  AOI22X1 U119 ( .A(in3_di[34]), .B(n7), .C(in2_di[34]), .D(n334), .Y(n81) );
  AOI22X1 U120 ( .A(in1_di[34]), .B(n9), .C(in0_di[34]), .D(grant[0]), .Y(n80)
         );
  AOI22X1 U122 ( .A(in3_di[33]), .B(n7), .C(in2_di[33]), .D(n334), .Y(n83) );
  AOI22X1 U123 ( .A(in1_di[33]), .B(n9), .C(in0_di[33]), .D(grant[0]), .Y(n82)
         );
  AOI22X1 U125 ( .A(in3_di[32]), .B(n336), .C(in2_di[32]), .D(n334), .Y(n85)
         );
  AOI22X1 U126 ( .A(in1_di[32]), .B(n9), .C(in0_di[32]), .D(grant[0]), .Y(n84)
         );
  AOI22X1 U128 ( .A(in3_di[31]), .B(n336), .C(in2_di[31]), .D(n334), .Y(n87)
         );
  AOI22X1 U129 ( .A(in1_di[31]), .B(n332), .C(in0_di[31]), .D(grant[0]), .Y(
        n86) );
  AOI22X1 U131 ( .A(in3_di[30]), .B(n336), .C(in2_di[30]), .D(n8), .Y(n89) );
  AOI22X1 U132 ( .A(in1_di[30]), .B(n332), .C(in0_di[30]), .D(grant[0]), .Y(
        n88) );
  AOI22X1 U134 ( .A(in3_di[2]), .B(n336), .C(in2_di[2]), .D(n8), .Y(n91) );
  AOI22X1 U135 ( .A(in1_di[2]), .B(n332), .C(in0_di[2]), .D(grant[0]), .Y(n90)
         );
  AOI22X1 U137 ( .A(in3_di[29]), .B(n336), .C(in2_di[29]), .D(n8), .Y(n93) );
  AOI22X1 U138 ( .A(in1_di[29]), .B(n332), .C(in0_di[29]), .D(grant[0]), .Y(
        n92) );
  AOI22X1 U140 ( .A(in3_di[28]), .B(n336), .C(in2_di[28]), .D(n8), .Y(n95) );
  AOI22X1 U141 ( .A(in1_di[28]), .B(n332), .C(in0_di[28]), .D(grant[0]), .Y(
        n94) );
  AOI22X1 U143 ( .A(in3_di[27]), .B(n336), .C(in2_di[27]), .D(n8), .Y(n97) );
  AOI22X1 U144 ( .A(in1_di[27]), .B(n332), .C(in0_di[27]), .D(grant[0]), .Y(
        n96) );
  AOI22X1 U146 ( .A(in3_di[26]), .B(n336), .C(in2_di[26]), .D(n8), .Y(n99) );
  AOI22X1 U147 ( .A(in1_di[26]), .B(n332), .C(in0_di[26]), .D(grant[0]), .Y(
        n98) );
  AOI22X1 U149 ( .A(in3_di[25]), .B(n336), .C(in2_di[25]), .D(n8), .Y(n101) );
  AOI22X1 U150 ( .A(in1_di[25]), .B(n332), .C(in0_di[25]), .D(grant[0]), .Y(
        n100) );
  AOI22X1 U152 ( .A(in3_di[24]), .B(n336), .C(in2_di[24]), .D(n8), .Y(n103) );
  AOI22X1 U153 ( .A(in1_di[24]), .B(n332), .C(in0_di[24]), .D(grant[0]), .Y(
        n102) );
  AOI22X1 U155 ( .A(in3_di[23]), .B(n336), .C(in2_di[23]), .D(n8), .Y(n105) );
  AOI22X1 U156 ( .A(in1_di[23]), .B(n332), .C(in0_di[23]), .D(grant[0]), .Y(
        n104) );
  AOI22X1 U158 ( .A(in3_di[22]), .B(n336), .C(in2_di[22]), .D(n8), .Y(n107) );
  AOI22X1 U159 ( .A(in1_di[22]), .B(n332), .C(in0_di[22]), .D(grant[0]), .Y(
        n106) );
  AOI22X1 U161 ( .A(in3_di[21]), .B(n336), .C(in2_di[21]), .D(n8), .Y(n109) );
  AOI22X1 U162 ( .A(in1_di[21]), .B(n332), .C(in0_di[21]), .D(grant[0]), .Y(
        n108) );
  AOI22X1 U164 ( .A(in3_di[20]), .B(n336), .C(in2_di[20]), .D(n8), .Y(n111) );
  AOI22X1 U165 ( .A(in1_di[20]), .B(n332), .C(in0_di[20]), .D(grant[0]), .Y(
        n110) );
  AOI22X1 U167 ( .A(in3_di[1]), .B(n336), .C(in2_di[1]), .D(n8), .Y(n113) );
  AOI22X1 U168 ( .A(in1_di[1]), .B(n9), .C(in0_di[1]), .D(grant[0]), .Y(n112)
         );
  AOI22X1 U170 ( .A(in3_di[19]), .B(n336), .C(in2_di[19]), .D(n8), .Y(n115) );
  AOI22X1 U171 ( .A(in1_di[19]), .B(n9), .C(in0_di[19]), .D(grant[0]), .Y(n114) );
  AOI22X1 U173 ( .A(in3_di[18]), .B(n336), .C(in2_di[18]), .D(n8), .Y(n117) );
  AOI22X1 U174 ( .A(in1_di[18]), .B(n9), .C(in0_di[18]), .D(grant[0]), .Y(n116) );
  AOI22X1 U176 ( .A(in3_di[17]), .B(n336), .C(in2_di[17]), .D(n8), .Y(n119) );
  AOI22X1 U177 ( .A(in1_di[17]), .B(n9), .C(in0_di[17]), .D(grant[0]), .Y(n118) );
  AOI22X1 U179 ( .A(in3_di[16]), .B(n336), .C(in2_di[16]), .D(n8), .Y(n121) );
  AOI22X1 U180 ( .A(in1_di[16]), .B(n9), .C(in0_di[16]), .D(grant[0]), .Y(n120) );
  AOI22X1 U182 ( .A(in3_di[15]), .B(n336), .C(in2_di[15]), .D(n8), .Y(n123) );
  AOI22X1 U183 ( .A(in1_di[15]), .B(n9), .C(in0_di[15]), .D(grant[0]), .Y(n122) );
  AOI22X1 U185 ( .A(in3_di[14]), .B(n336), .C(in2_di[14]), .D(n8), .Y(n125) );
  AOI22X1 U186 ( .A(in1_di[14]), .B(n9), .C(in0_di[14]), .D(grant[0]), .Y(n124) );
  AOI22X1 U188 ( .A(in3_di[13]), .B(n336), .C(in2_di[13]), .D(n8), .Y(n127) );
  AOI22X1 U189 ( .A(in1_di[13]), .B(n9), .C(in0_di[13]), .D(grant[0]), .Y(n126) );
  AOI22X1 U191 ( .A(in3_di[12]), .B(n336), .C(in2_di[12]), .D(n334), .Y(n129)
         );
  AOI22X1 U192 ( .A(in1_di[12]), .B(n9), .C(in0_di[12]), .D(grant[0]), .Y(n128) );
  AOI22X1 U194 ( .A(in3_di[11]), .B(n336), .C(in2_di[11]), .D(n334), .Y(n131)
         );
  AOI22X1 U195 ( .A(in1_di[11]), .B(n9), .C(in0_di[11]), .D(grant[0]), .Y(n130) );
  AOI22X1 U197 ( .A(in3_di[10]), .B(n336), .C(in2_di[10]), .D(n334), .Y(n133)
         );
  AOI22X1 U198 ( .A(in1_di[10]), .B(n332), .C(in0_di[10]), .D(grant[0]), .Y(
        n132) );
  AOI22X1 U200 ( .A(in3_di[0]), .B(n336), .C(in2_di[0]), .D(n334), .Y(n135) );
  NOR3X1 U201 ( .A(grant[0]), .B(grant[1]), .C(n4), .Y(n8) );
  NOR3X1 U202 ( .A(grant[1]), .B(grant[2]), .C(n329), .Y(n7) );
  AOI22X1 U204 ( .A(in1_di[0]), .B(n9), .C(in0_di[0]), .D(grant[0]), .Y(n134)
         );
  AND2X1 U3 ( .A(buf_ri), .B(grant[3]), .Y(in3_ri) );
  AND2X1 U4 ( .A(n189), .B(n253), .Y(sel_data[57]) );
  AND2X1 U5 ( .A(n190), .B(n254), .Y(sel_data[58]) );
  AND2X1 U6 ( .A(n191), .B(n255), .Y(sel_data[59]) );
  AND2X1 U7 ( .A(n193), .B(n257), .Y(sel_data[60]) );
  AND2X1 U8 ( .A(n194), .B(n258), .Y(sel_data[61]) );
  AND2X1 U9 ( .A(n195), .B(n259), .Y(sel_data[62]) );
  AND2X1 U10 ( .A(n196), .B(n260), .Y(sel_data[63]) );
  AND2X1 U13 ( .A(n181), .B(n245), .Y(sel_data[4]) );
  AND2X1 U16 ( .A(n192), .B(n256), .Y(sel_data[5]) );
  AND2X1 U19 ( .A(n197), .B(n261), .Y(sel_data[6]) );
  AND2X1 U22 ( .A(n198), .B(n262), .Y(sel_data[7]) );
  AND2X1 U25 ( .A(n199), .B(n263), .Y(sel_data[8]) );
  AND2X1 U28 ( .A(n200), .B(n264), .Y(sel_data[9]) );
  AND2X1 U31 ( .A(n2), .B(n202), .Y(sel_data[10]) );
  AND2X1 U34 ( .A(n3), .B(n203), .Y(sel_data[11]) );
  AND2X1 U37 ( .A(n140), .B(n204), .Y(sel_data[12]) );
  AND2X1 U40 ( .A(n141), .B(n205), .Y(sel_data[13]) );
  AND2X1 U43 ( .A(n142), .B(n206), .Y(sel_data[14]) );
  AND2X1 U46 ( .A(n143), .B(n207), .Y(sel_data[15]) );
  AND2X1 U49 ( .A(n144), .B(n208), .Y(sel_data[16]) );
  AND2X1 U52 ( .A(n145), .B(n209), .Y(sel_data[17]) );
  AND2X1 U55 ( .A(n146), .B(n210), .Y(sel_data[18]) );
  AND2X1 U58 ( .A(n147), .B(n211), .Y(sel_data[19]) );
  AND2X1 U61 ( .A(n149), .B(n213), .Y(sel_data[20]) );
  AND2X1 U64 ( .A(n150), .B(n214), .Y(sel_data[21]) );
  AND2X1 U67 ( .A(n151), .B(n215), .Y(sel_data[22]) );
  AND2X1 U70 ( .A(n152), .B(n216), .Y(sel_data[23]) );
  AND2X1 U73 ( .A(n153), .B(n217), .Y(sel_data[24]) );
  AND2X1 U76 ( .A(n154), .B(n218), .Y(sel_data[25]) );
  AND2X1 U79 ( .A(n155), .B(n219), .Y(sel_data[26]) );
  AND2X1 U82 ( .A(n156), .B(n220), .Y(sel_data[27]) );
  AND2X1 U85 ( .A(n157), .B(n221), .Y(sel_data[28]) );
  AND2X1 U88 ( .A(n158), .B(n222), .Y(sel_data[29]) );
  AND2X1 U91 ( .A(n160), .B(n224), .Y(sel_data[30]) );
  AND2X1 U94 ( .A(n161), .B(n225), .Y(sel_data[31]) );
  AND2X1 U97 ( .A(n162), .B(n226), .Y(sel_data[32]) );
  AND2X1 U100 ( .A(n163), .B(n227), .Y(sel_data[33]) );
  AND2X1 U103 ( .A(n164), .B(n228), .Y(sel_data[34]) );
  AND2X1 U106 ( .A(n165), .B(n229), .Y(sel_data[35]) );
  AND2X1 U109 ( .A(n166), .B(n230), .Y(sel_data[36]) );
  AND2X1 U112 ( .A(n167), .B(n231), .Y(sel_data[37]) );
  AND2X1 U115 ( .A(n168), .B(n232), .Y(sel_data[38]) );
  AND2X1 U118 ( .A(n169), .B(n233), .Y(sel_data[39]) );
  AND2X1 U121 ( .A(n171), .B(n235), .Y(sel_data[40]) );
  AND2X1 U124 ( .A(n172), .B(n236), .Y(sel_data[41]) );
  AND2X1 U127 ( .A(n173), .B(n237), .Y(sel_data[42]) );
  AND2X1 U130 ( .A(n174), .B(n238), .Y(sel_data[43]) );
  AND2X1 U133 ( .A(n175), .B(n239), .Y(sel_data[44]) );
  AND2X1 U136 ( .A(n176), .B(n240), .Y(sel_data[45]) );
  AND2X1 U139 ( .A(n177), .B(n241), .Y(sel_data[46]) );
  AND2X1 U142 ( .A(n178), .B(n242), .Y(sel_data[47]) );
  AND2X1 U145 ( .A(n179), .B(n243), .Y(sel_data[48]) );
  AND2X1 U148 ( .A(n180), .B(n244), .Y(sel_data[49]) );
  AND2X1 U151 ( .A(n182), .B(n246), .Y(sel_data[50]) );
  AND2X1 U154 ( .A(n183), .B(n247), .Y(sel_data[51]) );
  AND2X1 U157 ( .A(n184), .B(n248), .Y(sel_data[52]) );
  AND2X1 U160 ( .A(n185), .B(n249), .Y(sel_data[53]) );
  AND2X1 U163 ( .A(n186), .B(n250), .Y(sel_data[54]) );
  AND2X1 U166 ( .A(n187), .B(n251), .Y(sel_data[55]) );
  AND2X1 U169 ( .A(n188), .B(n252), .Y(sel_data[56]) );
  AND2X1 U172 ( .A(n1), .B(n201), .Y(sel_data[0]) );
  AND2X1 U175 ( .A(n170), .B(n234), .Y(sel_data[3]) );
  AND2X1 U178 ( .A(n148), .B(n212), .Y(sel_data[1]) );
  AND2X1 U181 ( .A(n159), .B(n223), .Y(sel_data[2]) );
  AND2X1 U184 ( .A(grant[1]), .B(n338), .Y(n9) );
  OR2X1 U187 ( .A(in0_ri), .B(n331), .Y(n330) );
  OR2X1 U190 ( .A(n139), .B(in1_ri), .Y(n331) );
  OR2X1 U193 ( .A(in2_ri), .B(in3_ri), .Y(n139) );
  AND2X1 U196 ( .A(buf_ri), .B(grant[2]), .Y(in2_ri) );
  BUFX2 U199 ( .A(n134), .Y(n1) );
  BUFX2 U203 ( .A(n132), .Y(n2) );
  BUFX2 U205 ( .A(n130), .Y(n3) );
  BUFX2 U206 ( .A(n128), .Y(n140) );
  BUFX2 U207 ( .A(n126), .Y(n141) );
  BUFX2 U208 ( .A(n124), .Y(n142) );
  BUFX2 U209 ( .A(n122), .Y(n143) );
  BUFX2 U210 ( .A(n120), .Y(n144) );
  BUFX2 U211 ( .A(n118), .Y(n145) );
  BUFX2 U212 ( .A(n116), .Y(n146) );
  BUFX2 U213 ( .A(n114), .Y(n147) );
  BUFX2 U214 ( .A(n112), .Y(n148) );
  BUFX2 U215 ( .A(n110), .Y(n149) );
  BUFX2 U216 ( .A(n108), .Y(n150) );
  BUFX2 U217 ( .A(n106), .Y(n151) );
  BUFX2 U218 ( .A(n104), .Y(n152) );
  BUFX2 U219 ( .A(n102), .Y(n153) );
  BUFX2 U220 ( .A(n100), .Y(n154) );
  BUFX2 U221 ( .A(n98), .Y(n155) );
  BUFX2 U222 ( .A(n96), .Y(n156) );
  BUFX2 U223 ( .A(n94), .Y(n157) );
  BUFX2 U224 ( .A(n92), .Y(n158) );
  BUFX2 U225 ( .A(n90), .Y(n159) );
  BUFX2 U226 ( .A(n88), .Y(n160) );
  BUFX2 U227 ( .A(n86), .Y(n161) );
  BUFX2 U228 ( .A(n84), .Y(n162) );
  BUFX2 U229 ( .A(n82), .Y(n163) );
  BUFX2 U230 ( .A(n80), .Y(n164) );
  BUFX2 U231 ( .A(n78), .Y(n165) );
  BUFX2 U232 ( .A(n76), .Y(n166) );
  BUFX2 U233 ( .A(n74), .Y(n167) );
  BUFX2 U234 ( .A(n72), .Y(n168) );
  BUFX2 U235 ( .A(n70), .Y(n169) );
  BUFX2 U236 ( .A(n68), .Y(n170) );
  BUFX2 U237 ( .A(n66), .Y(n171) );
  BUFX2 U238 ( .A(n64), .Y(n172) );
  BUFX2 U239 ( .A(n62), .Y(n173) );
  BUFX2 U240 ( .A(n60), .Y(n174) );
  BUFX2 U241 ( .A(n58), .Y(n175) );
  BUFX2 U242 ( .A(n56), .Y(n176) );
  BUFX2 U243 ( .A(n54), .Y(n177) );
  BUFX2 U244 ( .A(n52), .Y(n178) );
  BUFX2 U245 ( .A(n50), .Y(n179) );
  BUFX2 U246 ( .A(n48), .Y(n180) );
  BUFX2 U247 ( .A(n46), .Y(n181) );
  BUFX2 U248 ( .A(n44), .Y(n182) );
  BUFX2 U249 ( .A(n42), .Y(n183) );
  BUFX2 U250 ( .A(n40), .Y(n184) );
  BUFX2 U251 ( .A(n38), .Y(n185) );
  BUFX2 U252 ( .A(n36), .Y(n186) );
  BUFX2 U253 ( .A(n34), .Y(n187) );
  BUFX2 U254 ( .A(n32), .Y(n188) );
  BUFX2 U255 ( .A(n30), .Y(n189) );
  BUFX2 U256 ( .A(n28), .Y(n190) );
  BUFX2 U257 ( .A(n26), .Y(n191) );
  BUFX2 U258 ( .A(n24), .Y(n192) );
  BUFX2 U259 ( .A(n22), .Y(n193) );
  BUFX2 U260 ( .A(n20), .Y(n194) );
  BUFX2 U261 ( .A(n18), .Y(n195) );
  BUFX2 U262 ( .A(n16), .Y(n196) );
  BUFX2 U263 ( .A(n14), .Y(n197) );
  BUFX2 U264 ( .A(n12), .Y(n198) );
  BUFX2 U265 ( .A(n10), .Y(n199) );
  BUFX2 U266 ( .A(n5), .Y(n200) );
  BUFX2 U267 ( .A(n135), .Y(n201) );
  BUFX2 U268 ( .A(n133), .Y(n202) );
  BUFX2 U269 ( .A(n131), .Y(n203) );
  BUFX2 U270 ( .A(n129), .Y(n204) );
  BUFX2 U271 ( .A(n127), .Y(n205) );
  BUFX2 U272 ( .A(n125), .Y(n206) );
  BUFX2 U273 ( .A(n123), .Y(n207) );
  BUFX2 U274 ( .A(n121), .Y(n208) );
  BUFX2 U275 ( .A(n119), .Y(n209) );
  BUFX2 U276 ( .A(n117), .Y(n210) );
  BUFX2 U277 ( .A(n115), .Y(n211) );
  BUFX2 U278 ( .A(n113), .Y(n212) );
  BUFX2 U279 ( .A(n111), .Y(n213) );
  BUFX2 U280 ( .A(n109), .Y(n214) );
  BUFX2 U281 ( .A(n107), .Y(n215) );
  BUFX2 U282 ( .A(n105), .Y(n216) );
  BUFX2 U283 ( .A(n103), .Y(n217) );
  BUFX2 U284 ( .A(n101), .Y(n218) );
  BUFX2 U285 ( .A(n99), .Y(n219) );
  BUFX2 U286 ( .A(n97), .Y(n220) );
  BUFX2 U287 ( .A(n95), .Y(n221) );
  BUFX2 U288 ( .A(n93), .Y(n222) );
  BUFX2 U289 ( .A(n91), .Y(n223) );
  BUFX2 U290 ( .A(n89), .Y(n224) );
  BUFX2 U291 ( .A(n87), .Y(n225) );
  BUFX2 U292 ( .A(n85), .Y(n226) );
  BUFX2 U293 ( .A(n83), .Y(n227) );
  BUFX2 U294 ( .A(n81), .Y(n228) );
  BUFX2 U295 ( .A(n79), .Y(n229) );
  BUFX2 U296 ( .A(n77), .Y(n230) );
  BUFX2 U297 ( .A(n75), .Y(n231) );
  BUFX2 U298 ( .A(n73), .Y(n232) );
  BUFX2 U299 ( .A(n71), .Y(n233) );
  BUFX2 U300 ( .A(n69), .Y(n234) );
  BUFX2 U301 ( .A(n67), .Y(n235) );
  BUFX2 U302 ( .A(n65), .Y(n236) );
  BUFX2 U303 ( .A(n63), .Y(n237) );
  BUFX2 U304 ( .A(n61), .Y(n238) );
  BUFX2 U305 ( .A(n59), .Y(n239) );
  BUFX2 U306 ( .A(n57), .Y(n240) );
  BUFX2 U307 ( .A(n55), .Y(n241) );
  BUFX2 U308 ( .A(n53), .Y(n242) );
  BUFX2 U309 ( .A(n51), .Y(n243) );
  BUFX2 U310 ( .A(n49), .Y(n244) );
  BUFX2 U311 ( .A(n47), .Y(n245) );
  BUFX2 U312 ( .A(n45), .Y(n246) );
  BUFX2 U313 ( .A(n43), .Y(n247) );
  BUFX2 U314 ( .A(n41), .Y(n248) );
  BUFX2 U315 ( .A(n39), .Y(n249) );
  BUFX2 U316 ( .A(n37), .Y(n250) );
  BUFX2 U317 ( .A(n35), .Y(n251) );
  BUFX2 U318 ( .A(n33), .Y(n252) );
  BUFX2 U319 ( .A(n31), .Y(n253) );
  BUFX2 U320 ( .A(n29), .Y(n254) );
  BUFX2 U321 ( .A(n27), .Y(n255) );
  BUFX2 U322 ( .A(n25), .Y(n256) );
  BUFX2 U323 ( .A(n23), .Y(n257) );
  BUFX2 U324 ( .A(n21), .Y(n258) );
  BUFX2 U325 ( .A(n19), .Y(n259) );
  BUFX2 U326 ( .A(n17), .Y(n260) );
  BUFX2 U327 ( .A(n15), .Y(n261) );
  BUFX2 U328 ( .A(n13), .Y(n262) );
  BUFX2 U329 ( .A(n11), .Y(n263) );
  BUFX2 U330 ( .A(n6), .Y(n264) );
  INVX1 U331 ( .A(sel_data[0]), .Y(n265) );
  INVX1 U332 ( .A(sel_data[10]), .Y(n266) );
  INVX1 U333 ( .A(sel_data[11]), .Y(n267) );
  INVX1 U334 ( .A(sel_data[12]), .Y(n268) );
  INVX1 U335 ( .A(sel_data[13]), .Y(n269) );
  INVX1 U336 ( .A(sel_data[14]), .Y(n270) );
  INVX1 U337 ( .A(sel_data[15]), .Y(n271) );
  INVX1 U338 ( .A(sel_data[16]), .Y(n272) );
  INVX1 U339 ( .A(sel_data[17]), .Y(n273) );
  INVX1 U340 ( .A(sel_data[18]), .Y(n274) );
  INVX1 U341 ( .A(sel_data[19]), .Y(n275) );
  INVX1 U342 ( .A(sel_data[1]), .Y(n276) );
  INVX1 U343 ( .A(sel_data[20]), .Y(n277) );
  INVX1 U344 ( .A(sel_data[21]), .Y(n278) );
  INVX1 U345 ( .A(sel_data[22]), .Y(n279) );
  INVX1 U346 ( .A(sel_data[23]), .Y(n280) );
  INVX1 U347 ( .A(sel_data[24]), .Y(n281) );
  INVX1 U348 ( .A(sel_data[25]), .Y(n282) );
  INVX1 U349 ( .A(sel_data[26]), .Y(n283) );
  INVX1 U350 ( .A(sel_data[27]), .Y(n284) );
  INVX1 U351 ( .A(sel_data[28]), .Y(n285) );
  INVX1 U352 ( .A(sel_data[29]), .Y(n286) );
  INVX1 U353 ( .A(sel_data[2]), .Y(n287) );
  INVX1 U354 ( .A(sel_data[30]), .Y(n288) );
  INVX1 U355 ( .A(sel_data[31]), .Y(n289) );
  INVX1 U356 ( .A(sel_data[32]), .Y(n290) );
  INVX1 U357 ( .A(sel_data[33]), .Y(n291) );
  INVX1 U358 ( .A(sel_data[34]), .Y(n292) );
  INVX1 U359 ( .A(sel_data[35]), .Y(n293) );
  INVX1 U360 ( .A(sel_data[36]), .Y(n294) );
  INVX1 U361 ( .A(sel_data[37]), .Y(n295) );
  INVX1 U362 ( .A(sel_data[38]), .Y(n296) );
  INVX1 U363 ( .A(sel_data[39]), .Y(n297) );
  INVX1 U364 ( .A(sel_data[3]), .Y(n298) );
  INVX1 U365 ( .A(sel_data[40]), .Y(n299) );
  INVX1 U366 ( .A(sel_data[41]), .Y(n300) );
  INVX1 U367 ( .A(sel_data[42]), .Y(n301) );
  INVX1 U368 ( .A(sel_data[43]), .Y(n302) );
  INVX1 U369 ( .A(sel_data[44]), .Y(n303) );
  INVX1 U370 ( .A(sel_data[45]), .Y(n304) );
  INVX1 U371 ( .A(sel_data[46]), .Y(n305) );
  INVX1 U372 ( .A(sel_data[47]), .Y(n306) );
  INVX1 U373 ( .A(sel_data[48]), .Y(n307) );
  INVX1 U374 ( .A(sel_data[49]), .Y(n308) );
  INVX1 U375 ( .A(sel_data[4]), .Y(n309) );
  INVX1 U376 ( .A(sel_data[50]), .Y(n310) );
  INVX1 U377 ( .A(sel_data[51]), .Y(n311) );
  INVX1 U378 ( .A(sel_data[52]), .Y(n312) );
  INVX1 U379 ( .A(sel_data[53]), .Y(n313) );
  INVX1 U380 ( .A(sel_data[54]), .Y(n314) );
  INVX1 U381 ( .A(sel_data[55]), .Y(n315) );
  INVX1 U382 ( .A(sel_data[56]), .Y(n316) );
  INVX1 U383 ( .A(sel_data[57]), .Y(n317) );
  INVX1 U384 ( .A(sel_data[58]), .Y(n318) );
  INVX1 U385 ( .A(sel_data[59]), .Y(n319) );
  INVX1 U386 ( .A(sel_data[5]), .Y(n320) );
  INVX1 U387 ( .A(sel_data[60]), .Y(n321) );
  INVX1 U388 ( .A(sel_data[61]), .Y(n322) );
  INVX1 U389 ( .A(sel_data[62]), .Y(n323) );
  INVX1 U390 ( .A(sel_data[63]), .Y(n324) );
  INVX1 U391 ( .A(sel_data[6]), .Y(n325) );
  INVX1 U392 ( .A(sel_data[7]), .Y(n326) );
  INVX1 U393 ( .A(sel_data[8]), .Y(n327) );
  INVX1 U394 ( .A(sel_data[9]), .Y(n328) );
  AND2X1 U395 ( .A(n338), .B(grant[3]), .Y(n136) );
  INVX1 U396 ( .A(n136), .Y(n329) );
  AND2X1 U397 ( .A(buf_ri), .B(grant[0]), .Y(in0_ri) );
  AND2X1 U398 ( .A(buf_ri), .B(grant[1]), .Y(in1_ri) );
  INVX1 U399 ( .A(n333), .Y(n332) );
  INVX1 U400 ( .A(n9), .Y(n333) );
  INVX1 U401 ( .A(n335), .Y(n334) );
  INVX1 U402 ( .A(n337), .Y(n336) );
  INVX1 U403 ( .A(n8), .Y(n335) );
  INVX1 U404 ( .A(n7), .Y(n337) );
  INVX1 U405 ( .A(grant[2]), .Y(n4) );
  INVX1 U406 ( .A(grant[0]), .Y(n338) );
endmodule


module rr4_arbiter_3 ( clk, reset, request, advance, grant );
  input [3:0] request;
  output [3:0] grant;
  input clk, reset, advance;
  wire   n70, n72, n73, n75, n77, n51, n110, n47, n107, n106, n111, n53, n67,
         n65, n104, n105, n50, n102, n46, n100, n99, n103, n52, n66, n64, n97,
         n98, n96, n45, n94, n108, n59, n54, n91, n44, n89, n63, n56, n112,
         n86, n87, n85, n84, n113, n83, n92, n93, n82, n81, n80, n115, n88,
         n79, n49, n48, n114, n90, n95, n101, n109, n58, n61, n62, n60, n69;
  wire   [3:0] ptr;

  DFFSR ptr_reg_0_ ( .D(n70), .CLK(clk), .R(1'b1), .S(n72), .Q(ptr[0]) );
  DFFSR ptr_reg_2_ ( .D(n73), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[2]) );
  DFFSR ptr_reg_3_ ( .D(n75), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[3]) );
  DFFSR ptr_reg_1_ ( .D(n77), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[1]) );
  OAI21X1 U3 ( .A(n51), .B(n110), .C(n47), .Y(n77) );
  AOI21X1 U5 ( .A(advance), .B(n107), .C(n106), .Y(n111) );
  NOR3X1 U6 ( .A(n53), .B(request[3]), .C(request[2]), .Y(n106) );
  AOI22X1 U7 ( .A(n67), .B(advance), .C(n65), .D(n104), .Y(n105) );
  OAI21X1 U8 ( .A(n50), .B(n102), .C(n46), .Y(n75) );
  AOI21X1 U10 ( .A(advance), .B(n100), .C(n99), .Y(n103) );
  NOR3X1 U11 ( .A(n52), .B(request[1]), .C(request[0]), .Y(n99) );
  AOI22X1 U12 ( .A(n66), .B(advance), .C(n64), .D(n97), .Y(n98) );
  OAI21X1 U13 ( .A(n96), .B(n104), .C(n45), .Y(n73) );
  INVX1 U15 ( .A(n94), .Y(n96) );
  OAI21X1 U16 ( .A(n108), .B(n59), .C(n54), .Y(n94) );
  INVX1 U17 ( .A(reset), .Y(n72) );
  OAI21X1 U18 ( .A(n91), .B(n97), .C(n44), .Y(n70) );
  INVX1 U20 ( .A(n89), .Y(n91) );
  OAI21X1 U21 ( .A(n108), .B(n63), .C(n56), .Y(n89) );
  INVX1 U22 ( .A(advance), .Y(n108) );
  AOI21X1 U23 ( .A(n63), .B(n56), .C(n97), .Y(n112) );
  NAND3X1 U24 ( .A(n66), .B(n110), .C(n86), .Y(n87) );
  AND2X1 U25 ( .A(n102), .B(n104), .Y(n86) );
  AOI21X1 U26 ( .A(n85), .B(n84), .C(n102), .Y(n113) );
  OR2X1 U27 ( .A(n59), .B(request[1]), .Y(n84) );
  INVX1 U28 ( .A(n67), .Y(n85) );
  NAND3X1 U30 ( .A(n67), .B(n110), .C(n83), .Y(n92) );
  AND2X1 U31 ( .A(n97), .B(n102), .Y(n83) );
  AOI21X1 U32 ( .A(n110), .B(n107), .C(n65), .Y(n93) );
  INVX1 U33 ( .A(n82), .Y(n107) );
  AOI21X1 U34 ( .A(n97), .B(n64), .C(n66), .Y(n82) );
  INVX1 U35 ( .A(request[3]), .Y(n97) );
  AOI21X1 U36 ( .A(n81), .B(n80), .C(n110), .Y(n115) );
  INVX1 U37 ( .A(request[0]), .Y(n110) );
  AOI21X1 U39 ( .A(n102), .B(n100), .C(n64), .Y(n88) );
  INVX1 U40 ( .A(n79), .Y(n100) );
  AOI21X1 U41 ( .A(n104), .B(n65), .C(n67), .Y(n79) );
  INVX1 U42 ( .A(request[1]), .Y(n104) );
  INVX1 U43 ( .A(request[2]), .Y(n102) );
  INVX1 U44 ( .A(n66), .Y(n81) );
  OR2X1 U4 ( .A(n63), .B(request[3]), .Y(n80) );
  AND2X1 U9 ( .A(n49), .B(n48), .Y(n114) );
  INVX1 U14 ( .A(n114), .Y(grant[1]) );
  AND2X1 U19 ( .A(n66), .B(n108), .Y(n90) );
  INVX1 U29 ( .A(n90), .Y(n44) );
  AND2X1 U38 ( .A(n67), .B(n108), .Y(n95) );
  INVX1 U49 ( .A(n95), .Y(n45) );
  AND2X1 U50 ( .A(n64), .B(n108), .Y(n101) );
  INVX1 U51 ( .A(n101), .Y(n46) );
  AND2X1 U52 ( .A(n65), .B(n108), .Y(n109) );
  INVX1 U53 ( .A(n109), .Y(n47) );
  AND2X1 U54 ( .A(request[1]), .B(n58), .Y(n61) );
  INVX1 U55 ( .A(n61), .Y(n48) );
  AND2X1 U56 ( .A(request[1]), .B(n62), .Y(n60) );
  INVX1 U57 ( .A(n60), .Y(n49) );
  BUFX2 U58 ( .A(n103), .Y(n50) );
  BUFX2 U59 ( .A(n111), .Y(n51) );
  BUFX2 U60 ( .A(n98), .Y(n52) );
  BUFX2 U61 ( .A(n105), .Y(n53) );
  BUFX2 U62 ( .A(n92), .Y(n54) );
  BUFX2 U63 ( .A(n112), .Y(grant[3]) );
  BUFX2 U64 ( .A(n87), .Y(n56) );
  BUFX2 U65 ( .A(n113), .Y(grant[2]) );
  INVX1 U66 ( .A(n59), .Y(n58) );
  BUFX2 U67 ( .A(n93), .Y(n59) );
  INVX1 U68 ( .A(n54), .Y(n62) );
  BUFX2 U69 ( .A(n88), .Y(n63) );
  BUFX2 U70 ( .A(ptr[3]), .Y(n64) );
  BUFX2 U71 ( .A(ptr[1]), .Y(n65) );
  BUFX2 U72 ( .A(ptr[0]), .Y(n66) );
  BUFX2 U73 ( .A(ptr[2]), .Y(n67) );
  INVX1 U74 ( .A(n69), .Y(grant[0]) );
  INVX1 U75 ( .A(n115), .Y(n69) );
endmodule


module buffer_8 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n7, n278, n417, n349, n478, n348, n479, n347, n480, n346, n481, n411,
         n275, n344, n345, n273, n343, n274, n342, n341, n340, n339, n338,
         n337, n336, n335, n334, n333, n332, n331, n330, n329, n272, n328,
         n327, n326, n325, n324, n323, n322, n321, n320, n319, n318, n317,
         n271, n316, n315, n314, n313, n312, n311, n310, n276, n309, n308,
         n307, n306, n305, n270, n304, n303, n302, n301, n300, n299, n277,
         n298, n297, n296, n295, n294, n293, n269, n292, n291, n290, n289,
         n288, n287, n286, n285, n284, n283, n282, n281, n402, n425, n401,
         n426, n400, n427, n399, n428, n398, n429, n397, n430, n396, n431,
         n395, n432, n394, n433, n393, n434, n392, n435, n391, n436, n390,
         n437, n389, n438, n388, n439, n387, n440, n386, n441, n385, n442,
         n384, n443, n383, n444, n382, n445, n381, n446, n380, n447, n379,
         n448, n378, n449, n377, n450, n376, n451, n375, n452, n374, n453,
         n373, n454, n372, n455, n371, n456, n370, n457, n369, n458, n368,
         n459, n367, n460, n366, n461, n365, n462, n364, n463, n363, n464,
         n362, n465, n361, n466, n360, n467, n359, n468, n358, n469, n357,
         n470, n356, n471, n355, n472, n354, n473, n353, n474, n352, n475,
         n351, n476, n350, n477, n409, n418, n408, n419, n407, n420, n406,
         n421, n405, n422, n404, n423, n403, n424, n6, n416, n5, n280, n279,
         n208, n206;

  DFFSR full_reg ( .D(n7), .CLK(clk), .R(n278), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_3_ ( .D(n349), .CLK(clk), .R(n278), .S(1'b1), .Q(n478) );
  DFFSR data_q_reg_2_ ( .D(n348), .CLK(clk), .R(n278), .S(1'b1), .Q(n479) );
  DFFSR data_q_reg_1_ ( .D(n347), .CLK(clk), .R(n278), .S(1'b1), .Q(n480) );
  DFFSR data_q_reg_0_ ( .D(n346), .CLK(clk), .R(n278), .S(1'b1), .Q(n481) );
  INVX1 U67 ( .A(reset), .Y(n411) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n275), .C(buffer_di[0]), .D(n344), .Y(
        n345) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n273), .C(buffer_di[1]), .D(n344), .Y(
        n343) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n274), .C(buffer_di[2]), .D(n344), .Y(
        n342) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n344), .Y(
        n341) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n344), .Y(
        n340) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n344), .Y(
        n339) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n344), .Y(
        n338) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n344), .Y(
        n337) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n344), .Y(
        n336) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n344), .Y(
        n335) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n344), .Y(
        n334) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n344), .Y(
        n333) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n344), .Y(
        n332) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n344), .Y(
        n331) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n274), .C(buffer_di[14]), .D(n344), .Y(
        n330) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n274), .C(buffer_di[15]), .D(n344), .Y(
        n329) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n274), .C(buffer_di[16]), .D(n272), .Y(
        n328) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n274), .C(buffer_di[17]), .D(n272), .Y(
        n327) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n274), .C(buffer_di[18]), .D(n272), .Y(
        n326) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n272), .Y(
        n325) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n272), .Y(
        n324) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n272), .Y(
        n323) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n272), .Y(
        n322) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n272), .Y(
        n321) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n272), .Y(
        n320) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n275), .C(buffer_di[25]), .D(n272), .Y(
        n319) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n275), .C(buffer_di[26]), .D(n272), .Y(
        n318) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n275), .C(buffer_di[27]), .D(n272), .Y(
        n317) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n275), .C(buffer_di[28]), .D(n271), .Y(
        n316) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n275), .C(buffer_di[29]), .D(n271), .Y(
        n315) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n275), .C(buffer_di[30]), .D(n271), .Y(
        n314) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n275), .C(buffer_di[31]), .D(n271), .Y(
        n313) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n275), .C(buffer_di[32]), .D(n271), .Y(
        n312) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n275), .C(buffer_di[33]), .D(n271), .Y(
        n311) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n275), .C(buffer_di[34]), .D(n271), .Y(
        n310) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n276), .C(buffer_di[35]), .D(n271), .Y(
        n309) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n276), .C(buffer_di[36]), .D(n271), .Y(
        n308) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n276), .C(buffer_di[37]), .D(n271), .Y(
        n307) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n276), .C(buffer_di[38]), .D(n271), .Y(
        n306) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n276), .C(buffer_di[39]), .D(n271), .Y(
        n305) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n276), .C(buffer_di[40]), .D(n270), .Y(
        n304) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n276), .C(buffer_di[41]), .D(n270), .Y(
        n303) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n276), .C(buffer_di[42]), .D(n270), .Y(
        n302) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n276), .C(buffer_di[43]), .D(n270), .Y(
        n301) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n276), .C(buffer_di[44]), .D(n270), .Y(
        n300) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n276), .C(buffer_di[45]), .D(n270), .Y(
        n299) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n277), .C(buffer_di[46]), .D(n270), .Y(
        n298) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n277), .C(buffer_di[47]), .D(n270), .Y(
        n297) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n277), .C(buffer_di[48]), .D(n270), .Y(
        n296) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n277), .C(buffer_di[49]), .D(n270), .Y(
        n295) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n277), .C(buffer_di[50]), .D(n270), .Y(
        n294) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n277), .C(buffer_di[51]), .D(n270), .Y(
        n293) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n277), .C(buffer_di[52]), .D(n269), .Y(
        n292) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n277), .C(buffer_di[53]), .D(n269), .Y(
        n291) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n277), .C(buffer_di[54]), .D(n269), .Y(
        n290) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n277), .C(buffer_di[55]), .D(n269), .Y(
        n289) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n277), .C(buffer_di[56]), .D(n269), .Y(
        n288) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n273), .C(buffer_di[57]), .D(n269), .Y(
        n287) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n277), .C(buffer_di[58]), .D(n269), .Y(
        n286) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n276), .C(buffer_di[59]), .D(n269), .Y(
        n285) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n275), .C(buffer_di[60]), .D(n269), .Y(
        n284) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n277), .C(buffer_di[61]), .D(n269), .Y(
        n283) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n276), .C(buffer_di[62]), .D(n269), .Y(
        n282) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n275), .C(buffer_di[63]), .D(n269), .Y(
        n281) );
  DFFSR data_q_reg_56_ ( .D(n402), .CLK(clk), .R(n278), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_55_ ( .D(n401), .CLK(clk), .R(n278), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_54_ ( .D(n400), .CLK(clk), .R(n278), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_53_ ( .D(n399), .CLK(clk), .R(n278), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_52_ ( .D(n398), .CLK(clk), .R(n278), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_51_ ( .D(n397), .CLK(clk), .R(n278), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_50_ ( .D(n396), .CLK(clk), .R(n278), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_49_ ( .D(n395), .CLK(clk), .R(n278), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_48_ ( .D(n394), .CLK(clk), .R(n278), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_47_ ( .D(n393), .CLK(clk), .R(n278), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_46_ ( .D(n392), .CLK(clk), .R(n278), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_45_ ( .D(n391), .CLK(clk), .R(n278), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_44_ ( .D(n390), .CLK(clk), .R(n278), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_43_ ( .D(n389), .CLK(clk), .R(n278), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_42_ ( .D(n388), .CLK(clk), .R(n278), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_41_ ( .D(n387), .CLK(clk), .R(n278), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_40_ ( .D(n386), .CLK(clk), .R(n278), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_39_ ( .D(n385), .CLK(clk), .R(n278), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_38_ ( .D(n384), .CLK(clk), .R(n278), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_37_ ( .D(n383), .CLK(clk), .R(n278), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_36_ ( .D(n382), .CLK(clk), .R(n278), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_35_ ( .D(n381), .CLK(clk), .R(n278), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_34_ ( .D(n380), .CLK(clk), .R(n278), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_33_ ( .D(n379), .CLK(clk), .R(n278), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_32_ ( .D(n378), .CLK(clk), .R(n278), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_31_ ( .D(n377), .CLK(clk), .R(n278), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_30_ ( .D(n376), .CLK(clk), .R(n278), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_29_ ( .D(n375), .CLK(clk), .R(n278), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_28_ ( .D(n374), .CLK(clk), .R(n278), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_27_ ( .D(n373), .CLK(clk), .R(n278), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_26_ ( .D(n372), .CLK(clk), .R(n278), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_25_ ( .D(n371), .CLK(clk), .R(n278), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_24_ ( .D(n370), .CLK(clk), .R(n278), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_23_ ( .D(n369), .CLK(clk), .R(n278), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_22_ ( .D(n368), .CLK(clk), .R(n278), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_21_ ( .D(n367), .CLK(clk), .R(n278), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_20_ ( .D(n366), .CLK(clk), .R(n278), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_19_ ( .D(n365), .CLK(clk), .R(n278), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_18_ ( .D(n364), .CLK(clk), .R(n278), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_17_ ( .D(n363), .CLK(clk), .R(n278), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_16_ ( .D(n362), .CLK(clk), .R(n278), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_15_ ( .D(n361), .CLK(clk), .R(n278), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_14_ ( .D(n360), .CLK(clk), .R(n278), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_13_ ( .D(n359), .CLK(clk), .R(n278), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_12_ ( .D(n358), .CLK(clk), .R(n278), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_11_ ( .D(n357), .CLK(clk), .R(n411), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_10_ ( .D(n356), .CLK(clk), .R(n411), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_9_ ( .D(n355), .CLK(clk), .R(n411), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_8_ ( .D(n354), .CLK(clk), .R(n411), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_7_ ( .D(n353), .CLK(clk), .R(n411), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_6_ ( .D(n352), .CLK(clk), .R(n411), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_5_ ( .D(n351), .CLK(clk), .R(n411), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_4_ ( .D(n350), .CLK(clk), .R(n411), .S(1'b1), .Q(n477) );
  DFFSR data_q_reg_63_ ( .D(n409), .CLK(clk), .R(n278), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_62_ ( .D(n408), .CLK(clk), .R(n278), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_61_ ( .D(n407), .CLK(clk), .R(n278), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_60_ ( .D(n406), .CLK(clk), .R(n278), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_59_ ( .D(n405), .CLK(clk), .R(n278), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_58_ ( .D(n404), .CLK(clk), .R(n278), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_57_ ( .D(n403), .CLK(clk), .R(n278), .S(1'b1), .Q(n424) );
  AND2X1 U7 ( .A(buffer_so), .B(n6), .Y(n416) );
  AND2X1 U8 ( .A(buffer_si), .B(buffer_ri), .Y(n344) );
  INVX1 U9 ( .A(n344), .Y(n5) );
  AND2X1 U10 ( .A(buffer_ro), .B(buffer_en), .Y(n280) );
  INVX1 U11 ( .A(n280), .Y(n6) );
  AND2X1 U12 ( .A(buffer_ri), .B(n274), .Y(n279) );
  INVX1 U13 ( .A(n279), .Y(n7) );
  BUFX2 U14 ( .A(n417), .Y(buffer_so) );
  BUFX2 U15 ( .A(n424), .Y(buffer_do[57]) );
  BUFX2 U16 ( .A(n423), .Y(buffer_do[58]) );
  BUFX2 U17 ( .A(n422), .Y(buffer_do[59]) );
  BUFX2 U18 ( .A(n421), .Y(buffer_do[60]) );
  BUFX2 U19 ( .A(n420), .Y(buffer_do[61]) );
  BUFX2 U20 ( .A(n419), .Y(buffer_do[62]) );
  BUFX2 U21 ( .A(n418), .Y(buffer_do[63]) );
  BUFX2 U22 ( .A(n477), .Y(buffer_do[4]) );
  BUFX2 U23 ( .A(n476), .Y(buffer_do[5]) );
  BUFX2 U24 ( .A(n475), .Y(buffer_do[6]) );
  BUFX2 U25 ( .A(n474), .Y(buffer_do[7]) );
  BUFX2 U26 ( .A(n473), .Y(buffer_do[8]) );
  BUFX2 U27 ( .A(n472), .Y(buffer_do[9]) );
  BUFX2 U28 ( .A(n471), .Y(buffer_do[10]) );
  BUFX2 U29 ( .A(n470), .Y(buffer_do[11]) );
  BUFX2 U30 ( .A(n469), .Y(buffer_do[12]) );
  BUFX2 U31 ( .A(n468), .Y(buffer_do[13]) );
  BUFX2 U32 ( .A(n467), .Y(buffer_do[14]) );
  BUFX2 U33 ( .A(n466), .Y(buffer_do[15]) );
  BUFX2 U34 ( .A(n465), .Y(buffer_do[16]) );
  BUFX2 U35 ( .A(n464), .Y(buffer_do[17]) );
  BUFX2 U36 ( .A(n463), .Y(buffer_do[18]) );
  BUFX2 U37 ( .A(n462), .Y(buffer_do[19]) );
  BUFX2 U38 ( .A(n461), .Y(buffer_do[20]) );
  BUFX2 U39 ( .A(n460), .Y(buffer_do[21]) );
  BUFX2 U40 ( .A(n459), .Y(buffer_do[22]) );
  BUFX2 U41 ( .A(n458), .Y(buffer_do[23]) );
  BUFX2 U42 ( .A(n457), .Y(buffer_do[24]) );
  BUFX2 U43 ( .A(n456), .Y(buffer_do[25]) );
  BUFX2 U44 ( .A(n455), .Y(buffer_do[26]) );
  BUFX2 U45 ( .A(n454), .Y(buffer_do[27]) );
  BUFX2 U46 ( .A(n453), .Y(buffer_do[28]) );
  BUFX2 U47 ( .A(n452), .Y(buffer_do[29]) );
  BUFX2 U48 ( .A(n451), .Y(buffer_do[30]) );
  BUFX2 U49 ( .A(n450), .Y(buffer_do[31]) );
  BUFX2 U50 ( .A(n449), .Y(buffer_do[32]) );
  BUFX2 U51 ( .A(n448), .Y(buffer_do[33]) );
  BUFX2 U52 ( .A(n447), .Y(buffer_do[34]) );
  BUFX2 U53 ( .A(n446), .Y(buffer_do[35]) );
  BUFX2 U54 ( .A(n445), .Y(buffer_do[36]) );
  BUFX2 U55 ( .A(n444), .Y(buffer_do[37]) );
  BUFX2 U56 ( .A(n443), .Y(buffer_do[38]) );
  BUFX2 U57 ( .A(n442), .Y(buffer_do[39]) );
  BUFX2 U58 ( .A(n441), .Y(buffer_do[40]) );
  BUFX2 U59 ( .A(n440), .Y(buffer_do[41]) );
  BUFX2 U60 ( .A(n439), .Y(buffer_do[42]) );
  BUFX2 U61 ( .A(n438), .Y(buffer_do[43]) );
  BUFX2 U62 ( .A(n437), .Y(buffer_do[44]) );
  BUFX2 U63 ( .A(n436), .Y(buffer_do[45]) );
  BUFX2 U64 ( .A(n435), .Y(buffer_do[46]) );
  BUFX2 U65 ( .A(n434), .Y(buffer_do[47]) );
  BUFX2 U66 ( .A(n433), .Y(buffer_do[48]) );
  BUFX2 U69 ( .A(n432), .Y(buffer_do[49]) );
  BUFX2 U70 ( .A(n431), .Y(buffer_do[50]) );
  BUFX2 U71 ( .A(n430), .Y(buffer_do[51]) );
  BUFX2 U72 ( .A(n429), .Y(buffer_do[52]) );
  BUFX2 U73 ( .A(n428), .Y(buffer_do[53]) );
  BUFX2 U74 ( .A(n427), .Y(buffer_do[54]) );
  BUFX2 U75 ( .A(n426), .Y(buffer_do[55]) );
  BUFX2 U76 ( .A(n425), .Y(buffer_do[56]) );
  BUFX2 U77 ( .A(n481), .Y(buffer_do[0]) );
  BUFX2 U78 ( .A(n480), .Y(buffer_do[1]) );
  BUFX2 U79 ( .A(n479), .Y(buffer_do[2]) );
  BUFX2 U80 ( .A(n478), .Y(buffer_do[3]) );
  INVX1 U81 ( .A(n208), .Y(n206) );
  INVX1 U82 ( .A(n206), .Y(buffer_ri) );
  INVX1 U83 ( .A(n416), .Y(n208) );
  INVX2 U84 ( .A(reset), .Y(n278) );
  INVX1 U209 ( .A(n5), .Y(n272) );
  INVX1 U210 ( .A(n5), .Y(n271) );
  INVX1 U211 ( .A(n5), .Y(n270) );
  INVX1 U212 ( .A(n5), .Y(n269) );
  INVX1 U213 ( .A(n344), .Y(n273) );
  INVX1 U214 ( .A(n344), .Y(n274) );
  INVX1 U215 ( .A(n344), .Y(n275) );
  INVX1 U216 ( .A(n344), .Y(n276) );
  INVX1 U217 ( .A(n344), .Y(n277) );
  INVX1 U218 ( .A(n345), .Y(n346) );
  INVX1 U219 ( .A(n343), .Y(n347) );
  INVX1 U220 ( .A(n342), .Y(n348) );
  INVX1 U221 ( .A(n341), .Y(n349) );
  INVX1 U222 ( .A(n340), .Y(n350) );
  INVX1 U223 ( .A(n339), .Y(n351) );
  INVX1 U224 ( .A(n338), .Y(n352) );
  INVX1 U225 ( .A(n337), .Y(n353) );
  INVX1 U226 ( .A(n336), .Y(n354) );
  INVX1 U227 ( .A(n335), .Y(n355) );
  INVX1 U228 ( .A(n334), .Y(n356) );
  INVX1 U229 ( .A(n333), .Y(n357) );
  INVX1 U230 ( .A(n332), .Y(n358) );
  INVX1 U231 ( .A(n331), .Y(n359) );
  INVX1 U232 ( .A(n330), .Y(n360) );
  INVX1 U233 ( .A(n329), .Y(n361) );
  INVX1 U234 ( .A(n328), .Y(n362) );
  INVX1 U235 ( .A(n327), .Y(n363) );
  INVX1 U236 ( .A(n326), .Y(n364) );
  INVX1 U237 ( .A(n325), .Y(n365) );
  INVX1 U238 ( .A(n324), .Y(n366) );
  INVX1 U239 ( .A(n323), .Y(n367) );
  INVX1 U240 ( .A(n322), .Y(n368) );
  INVX1 U241 ( .A(n321), .Y(n369) );
  INVX1 U242 ( .A(n320), .Y(n370) );
  INVX1 U243 ( .A(n319), .Y(n371) );
  INVX1 U244 ( .A(n318), .Y(n372) );
  INVX1 U245 ( .A(n317), .Y(n373) );
  INVX1 U246 ( .A(n316), .Y(n374) );
  INVX1 U247 ( .A(n315), .Y(n375) );
  INVX1 U248 ( .A(n314), .Y(n376) );
  INVX1 U249 ( .A(n313), .Y(n377) );
  INVX1 U250 ( .A(n312), .Y(n378) );
  INVX1 U251 ( .A(n311), .Y(n379) );
  INVX1 U252 ( .A(n310), .Y(n380) );
  INVX1 U253 ( .A(n309), .Y(n381) );
  INVX1 U254 ( .A(n308), .Y(n382) );
  INVX1 U255 ( .A(n307), .Y(n383) );
  INVX1 U256 ( .A(n306), .Y(n384) );
  INVX1 U257 ( .A(n305), .Y(n385) );
  INVX1 U258 ( .A(n304), .Y(n386) );
  INVX1 U259 ( .A(n303), .Y(n387) );
  INVX1 U260 ( .A(n302), .Y(n388) );
  INVX1 U261 ( .A(n301), .Y(n389) );
  INVX1 U262 ( .A(n300), .Y(n390) );
  INVX1 U263 ( .A(n299), .Y(n391) );
  INVX1 U264 ( .A(n298), .Y(n392) );
  INVX1 U265 ( .A(n297), .Y(n393) );
  INVX1 U266 ( .A(n296), .Y(n394) );
  INVX1 U267 ( .A(n295), .Y(n395) );
  INVX1 U268 ( .A(n294), .Y(n396) );
  INVX1 U269 ( .A(n293), .Y(n397) );
  INVX1 U270 ( .A(n292), .Y(n398) );
  INVX1 U271 ( .A(n291), .Y(n399) );
  INVX1 U272 ( .A(n290), .Y(n400) );
  INVX1 U273 ( .A(n289), .Y(n401) );
  INVX1 U274 ( .A(n288), .Y(n402) );
  INVX1 U275 ( .A(n287), .Y(n403) );
  INVX1 U276 ( .A(n286), .Y(n404) );
  INVX1 U277 ( .A(n285), .Y(n405) );
  INVX1 U278 ( .A(n284), .Y(n406) );
  INVX1 U279 ( .A(n283), .Y(n407) );
  INVX1 U280 ( .A(n282), .Y(n408) );
  INVX1 U281 ( .A(n281), .Y(n409) );
endmodule


module output_controller_4in_3 ( clk, reset, polarity, output_so, output_do, 
        output_ro, in0_si, in0_di, in0_ri, in1_si, in1_di, in1_ri, in2_si, 
        in2_di, in2_ri, in3_si, in3_di, in3_ri );
  output [63:0] output_do;
  input [63:0] in0_di;
  input [63:0] in1_di;
  input [63:0] in2_di;
  input [63:0] in3_di;
  input clk, reset, polarity, output_ro, in0_si, in1_si, in2_si, in3_si;
  output output_so, in0_ri, in1_ri, in2_ri, in3_ri;
  wire   n330, buf_ri, n324, n323, n322, n321, n319, n318, n317, n316, n315,
         n314, n313, n312, n311, n310, n308, n307, n306, n305, n304, n303,
         n302, n301, n300, n299, n297, n296, n295, n294, n293, n292, n291,
         n290, n289, n288, n286, n285, n284, n283, n282, n281, n280, n279,
         n278, n277, n275, n274, n273, n272, n271, n270, n269, n268, n267,
         n266, n328, n327, n326, n325, n320, n309, n298, n287, n276, n265,
         n471, n334, n472, n469, n473, n467, n468, n470, n465, n466, n463,
         n464, n336, n461, n462, n459, n460, n457, n458, n455, n456, n453,
         n454, n451, n452, n449, n450, n447, n448, n445, n446, n443, n444,
         n441, n442, n439, n440, n437, n438, n435, n436, n433, n434, n431,
         n432, n429, n430, n427, n428, n425, n426, n423, n424, n421, n422,
         n419, n420, n417, n332, n418, n415, n416, n413, n414, n411, n412,
         n409, n410, n407, n408, n405, n406, n403, n404, n401, n402, n399,
         n400, n397, n398, n395, n396, n393, n394, n391, n392, n389, n390,
         n387, n388, n385, n386, n383, n384, n381, n382, n379, n380, n377,
         n378, n375, n376, n373, n374, n371, n372, n369, n370, n367, n368,
         n365, n366, n363, n364, n361, n362, n359, n360, n357, n358, n355,
         n356, n353, n354, n351, n352, n349, n350, n347, n348, n345, n346,
         n343, n474, n329, n344, n189, n253, n190, n254, n191, n255, n193,
         n257, n194, n258, n195, n259, n196, n260, n181, n245, n192, n256,
         n197, n261, n198, n262, n199, n263, n200, n264, n2, n202, n3, n203,
         n140, n204, n141, n205, n142, n206, n143, n207, n144, n208, n145,
         n209, n146, n210, n147, n211, n149, n213, n150, n214, n151, n215,
         n152, n216, n153, n217, n154, n218, n155, n219, n156, n220, n157,
         n221, n158, n222, n160, n224, n161, n225, n162, n226, n163, n227,
         n164, n228, n165, n229, n166, n230, n167, n231, n168, n232, n169,
         n233, n171, n235, n172, n236, n173, n237, n174, n238, n175, n239,
         n176, n240, n177, n241, n178, n242, n179, n243, n180, n244, n182,
         n246, n183, n247, n184, n248, n185, n249, n186, n250, n187, n251,
         n188, n252, n1, n201, n148, n212, n159, n223, n170, n234, n338, n331,
         n339, n342, n333, n335, n337;
  wire   [3:0] grant;
  wire   [63:0] sel_data;

  rr4_arbiter_3 ARB ( .clk(clk), .reset(reset), .request({in3_si, in2_si, 
        in1_si, in0_si}), .advance(n330), .grant(grant) );
  buffer_8 OB ( .clk(clk), .reset(reset), .buffer_en(1'b1), .buffer_di({n324, 
        n323, n322, n321, n319, n318, n317, n316, n315, n314, n313, n312, n311, 
        n310, n308, n307, n306, n305, n304, n303, n302, n301, n300, n299, n297, 
        n296, n295, n294, n293, n292, n291, n290, n289, n288, n286, n285, n284, 
        n283, n282, n281, n280, n279, n278, n277, n275, n274, n273, n272, n271, 
        n270, n269, n268, n267, n266, n328, n327, n326, n325, n320, n309, n298, 
        n287, n276, n265}), .buffer_si(n330), .buffer_ri(buf_ri), .buffer_ro(
        output_ro), .buffer_so(output_so), .buffer_do(output_do) );
  AOI22X1 U11 ( .A(in3_di[9]), .B(n471), .C(in2_di[9]), .D(n334), .Y(n472) );
  AOI22X1 U12 ( .A(in1_di[9]), .B(n469), .C(in0_di[9]), .D(grant[0]), .Y(n473)
         );
  AOI22X1 U14 ( .A(in3_di[8]), .B(n471), .C(in2_di[8]), .D(n334), .Y(n467) );
  AOI22X1 U15 ( .A(in1_di[8]), .B(n469), .C(in0_di[8]), .D(grant[0]), .Y(n468)
         );
  AOI22X1 U17 ( .A(in3_di[7]), .B(n471), .C(in2_di[7]), .D(n470), .Y(n465) );
  AOI22X1 U18 ( .A(in1_di[7]), .B(n469), .C(in0_di[7]), .D(grant[0]), .Y(n466)
         );
  AOI22X1 U20 ( .A(in3_di[6]), .B(n471), .C(in2_di[6]), .D(n334), .Y(n463) );
  AOI22X1 U21 ( .A(in1_di[6]), .B(n469), .C(in0_di[6]), .D(grant[0]), .Y(n464)
         );
  AOI22X1 U23 ( .A(in3_di[63]), .B(n336), .C(in2_di[63]), .D(n470), .Y(n461)
         );
  AOI22X1 U24 ( .A(in1_di[63]), .B(n469), .C(in0_di[63]), .D(grant[0]), .Y(
        n462) );
  AOI22X1 U26 ( .A(in3_di[62]), .B(n336), .C(in2_di[62]), .D(n470), .Y(n459)
         );
  AOI22X1 U27 ( .A(in1_di[62]), .B(n469), .C(in0_di[62]), .D(grant[0]), .Y(
        n460) );
  AOI22X1 U29 ( .A(in3_di[61]), .B(n336), .C(in2_di[61]), .D(n470), .Y(n457)
         );
  AOI22X1 U30 ( .A(in1_di[61]), .B(n469), .C(in0_di[61]), .D(grant[0]), .Y(
        n458) );
  AOI22X1 U32 ( .A(in3_di[60]), .B(n471), .C(in2_di[60]), .D(n470), .Y(n455)
         );
  AOI22X1 U33 ( .A(in1_di[60]), .B(n469), .C(in0_di[60]), .D(grant[0]), .Y(
        n456) );
  AOI22X1 U35 ( .A(in3_di[5]), .B(n471), .C(in2_di[5]), .D(n470), .Y(n453) );
  AOI22X1 U36 ( .A(in1_di[5]), .B(n469), .C(in0_di[5]), .D(grant[0]), .Y(n454)
         );
  AOI22X1 U38 ( .A(in3_di[59]), .B(n471), .C(in2_di[59]), .D(n334), .Y(n451)
         );
  AOI22X1 U39 ( .A(in1_di[59]), .B(n469), .C(in0_di[59]), .D(grant[0]), .Y(
        n452) );
  AOI22X1 U41 ( .A(in3_di[58]), .B(n471), .C(in2_di[58]), .D(n334), .Y(n449)
         );
  AOI22X1 U42 ( .A(in1_di[58]), .B(n469), .C(in0_di[58]), .D(grant[0]), .Y(
        n450) );
  AOI22X1 U44 ( .A(in3_di[57]), .B(n471), .C(in2_di[57]), .D(n334), .Y(n447)
         );
  AOI22X1 U45 ( .A(in1_di[57]), .B(n469), .C(in0_di[57]), .D(grant[0]), .Y(
        n448) );
  AOI22X1 U47 ( .A(in3_di[56]), .B(n336), .C(in2_di[56]), .D(n470), .Y(n445)
         );
  AOI22X1 U48 ( .A(in1_di[56]), .B(n469), .C(in0_di[56]), .D(grant[0]), .Y(
        n446) );
  AOI22X1 U50 ( .A(in3_di[55]), .B(n471), .C(in2_di[55]), .D(n470), .Y(n443)
         );
  AOI22X1 U51 ( .A(in1_di[55]), .B(n469), .C(in0_di[55]), .D(grant[0]), .Y(
        n444) );
  AOI22X1 U53 ( .A(in3_di[54]), .B(n471), .C(in2_di[54]), .D(n470), .Y(n441)
         );
  AOI22X1 U54 ( .A(in1_di[54]), .B(n469), .C(in0_di[54]), .D(grant[0]), .Y(
        n442) );
  AOI22X1 U56 ( .A(in3_di[53]), .B(n471), .C(in2_di[53]), .D(n470), .Y(n439)
         );
  AOI22X1 U57 ( .A(in1_di[53]), .B(n469), .C(in0_di[53]), .D(grant[0]), .Y(
        n440) );
  AOI22X1 U59 ( .A(in3_di[52]), .B(n471), .C(in2_di[52]), .D(n334), .Y(n437)
         );
  AOI22X1 U60 ( .A(in1_di[52]), .B(n469), .C(in0_di[52]), .D(grant[0]), .Y(
        n438) );
  AOI22X1 U62 ( .A(in3_di[51]), .B(n471), .C(in2_di[51]), .D(n334), .Y(n435)
         );
  AOI22X1 U63 ( .A(in1_di[51]), .B(n469), .C(in0_di[51]), .D(grant[0]), .Y(
        n436) );
  AOI22X1 U65 ( .A(in3_di[50]), .B(n471), .C(in2_di[50]), .D(n334), .Y(n433)
         );
  AOI22X1 U66 ( .A(in1_di[50]), .B(n469), .C(in0_di[50]), .D(grant[0]), .Y(
        n434) );
  AOI22X1 U68 ( .A(in3_di[4]), .B(n471), .C(in2_di[4]), .D(n334), .Y(n431) );
  AOI22X1 U69 ( .A(in1_di[4]), .B(n469), .C(in0_di[4]), .D(grant[0]), .Y(n432)
         );
  AOI22X1 U71 ( .A(in3_di[49]), .B(n471), .C(in2_di[49]), .D(n334), .Y(n429)
         );
  AOI22X1 U72 ( .A(in1_di[49]), .B(n469), .C(in0_di[49]), .D(grant[0]), .Y(
        n430) );
  AOI22X1 U74 ( .A(in3_di[48]), .B(n471), .C(in2_di[48]), .D(n334), .Y(n427)
         );
  AOI22X1 U75 ( .A(in1_di[48]), .B(n469), .C(in0_di[48]), .D(grant[0]), .Y(
        n428) );
  AOI22X1 U77 ( .A(in3_di[47]), .B(n471), .C(in2_di[47]), .D(n334), .Y(n425)
         );
  AOI22X1 U78 ( .A(in1_di[47]), .B(n469), .C(in0_di[47]), .D(grant[0]), .Y(
        n426) );
  AOI22X1 U80 ( .A(in3_di[46]), .B(n471), .C(in2_di[46]), .D(n334), .Y(n423)
         );
  AOI22X1 U81 ( .A(in1_di[46]), .B(n469), .C(in0_di[46]), .D(grant[0]), .Y(
        n424) );
  AOI22X1 U83 ( .A(in3_di[45]), .B(n471), .C(in2_di[45]), .D(n334), .Y(n421)
         );
  AOI22X1 U84 ( .A(in1_di[45]), .B(n469), .C(in0_di[45]), .D(grant[0]), .Y(
        n422) );
  AOI22X1 U86 ( .A(in3_di[44]), .B(n471), .C(in2_di[44]), .D(n334), .Y(n419)
         );
  AOI22X1 U87 ( .A(in1_di[44]), .B(n469), .C(in0_di[44]), .D(grant[0]), .Y(
        n420) );
  AOI22X1 U89 ( .A(in3_di[43]), .B(n471), .C(in2_di[43]), .D(n334), .Y(n417)
         );
  AOI22X1 U90 ( .A(in1_di[43]), .B(n332), .C(in0_di[43]), .D(grant[0]), .Y(
        n418) );
  AOI22X1 U92 ( .A(in3_di[42]), .B(n471), .C(in2_di[42]), .D(n334), .Y(n415)
         );
  AOI22X1 U93 ( .A(in1_di[42]), .B(n469), .C(in0_di[42]), .D(grant[0]), .Y(
        n416) );
  AOI22X1 U95 ( .A(in3_di[41]), .B(n471), .C(in2_di[41]), .D(n334), .Y(n413)
         );
  AOI22X1 U96 ( .A(in1_di[41]), .B(n469), .C(in0_di[41]), .D(grant[0]), .Y(
        n414) );
  AOI22X1 U98 ( .A(in3_di[40]), .B(n471), .C(in2_di[40]), .D(n334), .Y(n411)
         );
  AOI22X1 U99 ( .A(in1_di[40]), .B(n469), .C(in0_di[40]), .D(grant[0]), .Y(
        n412) );
  AOI22X1 U101 ( .A(in3_di[3]), .B(n471), .C(in2_di[3]), .D(n334), .Y(n409) );
  AOI22X1 U102 ( .A(in1_di[3]), .B(n469), .C(in0_di[3]), .D(grant[0]), .Y(n410) );
  AOI22X1 U104 ( .A(in3_di[39]), .B(n471), .C(in2_di[39]), .D(n334), .Y(n407)
         );
  AOI22X1 U105 ( .A(in1_di[39]), .B(n469), .C(in0_di[39]), .D(grant[0]), .Y(
        n408) );
  AOI22X1 U107 ( .A(in3_di[38]), .B(n471), .C(in2_di[38]), .D(n334), .Y(n405)
         );
  AOI22X1 U108 ( .A(in1_di[38]), .B(n469), .C(in0_di[38]), .D(grant[0]), .Y(
        n406) );
  AOI22X1 U110 ( .A(in3_di[37]), .B(n471), .C(in2_di[37]), .D(n334), .Y(n403)
         );
  AOI22X1 U111 ( .A(in1_di[37]), .B(n469), .C(in0_di[37]), .D(grant[0]), .Y(
        n404) );
  AOI22X1 U113 ( .A(in3_di[36]), .B(n471), .C(in2_di[36]), .D(n334), .Y(n401)
         );
  AOI22X1 U114 ( .A(in1_di[36]), .B(n469), .C(in0_di[36]), .D(grant[0]), .Y(
        n402) );
  AOI22X1 U116 ( .A(in3_di[35]), .B(n471), .C(in2_di[35]), .D(n334), .Y(n399)
         );
  AOI22X1 U117 ( .A(in1_di[35]), .B(n469), .C(in0_di[35]), .D(grant[0]), .Y(
        n400) );
  AOI22X1 U119 ( .A(in3_di[34]), .B(n471), .C(in2_di[34]), .D(n334), .Y(n397)
         );
  AOI22X1 U120 ( .A(in1_di[34]), .B(n469), .C(in0_di[34]), .D(grant[0]), .Y(
        n398) );
  AOI22X1 U122 ( .A(in3_di[33]), .B(n471), .C(in2_di[33]), .D(n334), .Y(n395)
         );
  AOI22X1 U123 ( .A(in1_di[33]), .B(n469), .C(in0_di[33]), .D(grant[0]), .Y(
        n396) );
  AOI22X1 U125 ( .A(in3_di[32]), .B(n336), .C(in2_di[32]), .D(n334), .Y(n393)
         );
  AOI22X1 U126 ( .A(in1_di[32]), .B(n469), .C(in0_di[32]), .D(grant[0]), .Y(
        n394) );
  AOI22X1 U128 ( .A(in3_di[31]), .B(n336), .C(in2_di[31]), .D(n334), .Y(n391)
         );
  AOI22X1 U129 ( .A(in1_di[31]), .B(n332), .C(in0_di[31]), .D(grant[0]), .Y(
        n392) );
  AOI22X1 U131 ( .A(in3_di[30]), .B(n336), .C(in2_di[30]), .D(n334), .Y(n389)
         );
  AOI22X1 U132 ( .A(in1_di[30]), .B(n332), .C(in0_di[30]), .D(grant[0]), .Y(
        n390) );
  AOI22X1 U134 ( .A(in3_di[2]), .B(n336), .C(in2_di[2]), .D(n334), .Y(n387) );
  AOI22X1 U135 ( .A(in1_di[2]), .B(n332), .C(in0_di[2]), .D(grant[0]), .Y(n388) );
  AOI22X1 U137 ( .A(in3_di[29]), .B(n336), .C(in2_di[29]), .D(n470), .Y(n385)
         );
  AOI22X1 U138 ( .A(in1_di[29]), .B(n332), .C(in0_di[29]), .D(grant[0]), .Y(
        n386) );
  AOI22X1 U140 ( .A(in3_di[28]), .B(n336), .C(in2_di[28]), .D(n470), .Y(n383)
         );
  AOI22X1 U141 ( .A(in1_di[28]), .B(n332), .C(in0_di[28]), .D(grant[0]), .Y(
        n384) );
  AOI22X1 U143 ( .A(in3_di[27]), .B(n336), .C(in2_di[27]), .D(n470), .Y(n381)
         );
  AOI22X1 U144 ( .A(in1_di[27]), .B(n332), .C(in0_di[27]), .D(grant[0]), .Y(
        n382) );
  AOI22X1 U146 ( .A(in3_di[26]), .B(n336), .C(in2_di[26]), .D(n470), .Y(n379)
         );
  AOI22X1 U147 ( .A(in1_di[26]), .B(n332), .C(in0_di[26]), .D(grant[0]), .Y(
        n380) );
  AOI22X1 U149 ( .A(in3_di[25]), .B(n336), .C(in2_di[25]), .D(n470), .Y(n377)
         );
  AOI22X1 U150 ( .A(in1_di[25]), .B(n332), .C(in0_di[25]), .D(grant[0]), .Y(
        n378) );
  AOI22X1 U152 ( .A(in3_di[24]), .B(n336), .C(in2_di[24]), .D(n470), .Y(n375)
         );
  AOI22X1 U153 ( .A(in1_di[24]), .B(n332), .C(in0_di[24]), .D(grant[0]), .Y(
        n376) );
  AOI22X1 U155 ( .A(in3_di[23]), .B(n336), .C(in2_di[23]), .D(n470), .Y(n373)
         );
  AOI22X1 U156 ( .A(in1_di[23]), .B(n332), .C(in0_di[23]), .D(grant[0]), .Y(
        n374) );
  AOI22X1 U158 ( .A(in3_di[22]), .B(n336), .C(in2_di[22]), .D(n470), .Y(n371)
         );
  AOI22X1 U159 ( .A(in1_di[22]), .B(n332), .C(in0_di[22]), .D(grant[0]), .Y(
        n372) );
  AOI22X1 U161 ( .A(in3_di[21]), .B(n336), .C(in2_di[21]), .D(n470), .Y(n369)
         );
  AOI22X1 U162 ( .A(in1_di[21]), .B(n332), .C(in0_di[21]), .D(grant[0]), .Y(
        n370) );
  AOI22X1 U164 ( .A(in3_di[20]), .B(n336), .C(in2_di[20]), .D(n470), .Y(n367)
         );
  AOI22X1 U165 ( .A(in1_di[20]), .B(n332), .C(in0_di[20]), .D(grant[0]), .Y(
        n368) );
  AOI22X1 U167 ( .A(in3_di[1]), .B(n336), .C(in2_di[1]), .D(n470), .Y(n365) );
  AOI22X1 U168 ( .A(in1_di[1]), .B(n469), .C(in0_di[1]), .D(grant[0]), .Y(n366) );
  AOI22X1 U170 ( .A(in3_di[19]), .B(n336), .C(in2_di[19]), .D(n470), .Y(n363)
         );
  AOI22X1 U171 ( .A(in1_di[19]), .B(n469), .C(in0_di[19]), .D(grant[0]), .Y(
        n364) );
  AOI22X1 U173 ( .A(in3_di[18]), .B(n336), .C(in2_di[18]), .D(n470), .Y(n361)
         );
  AOI22X1 U174 ( .A(in1_di[18]), .B(n469), .C(in0_di[18]), .D(grant[0]), .Y(
        n362) );
  AOI22X1 U176 ( .A(in3_di[17]), .B(n336), .C(in2_di[17]), .D(n470), .Y(n359)
         );
  AOI22X1 U177 ( .A(in1_di[17]), .B(n469), .C(in0_di[17]), .D(grant[0]), .Y(
        n360) );
  AOI22X1 U179 ( .A(in3_di[16]), .B(n336), .C(in2_di[16]), .D(n470), .Y(n357)
         );
  AOI22X1 U180 ( .A(in1_di[16]), .B(n469), .C(in0_di[16]), .D(grant[0]), .Y(
        n358) );
  AOI22X1 U182 ( .A(in3_di[15]), .B(n336), .C(in2_di[15]), .D(n470), .Y(n355)
         );
  AOI22X1 U183 ( .A(in1_di[15]), .B(n469), .C(in0_di[15]), .D(grant[0]), .Y(
        n356) );
  AOI22X1 U185 ( .A(in3_di[14]), .B(n336), .C(in2_di[14]), .D(n470), .Y(n353)
         );
  AOI22X1 U186 ( .A(in1_di[14]), .B(n469), .C(in0_di[14]), .D(grant[0]), .Y(
        n354) );
  AOI22X1 U188 ( .A(in3_di[13]), .B(n336), .C(in2_di[13]), .D(n470), .Y(n351)
         );
  AOI22X1 U189 ( .A(in1_di[13]), .B(n469), .C(in0_di[13]), .D(grant[0]), .Y(
        n352) );
  AOI22X1 U191 ( .A(in3_di[12]), .B(n336), .C(in2_di[12]), .D(n470), .Y(n349)
         );
  AOI22X1 U192 ( .A(in1_di[12]), .B(n469), .C(in0_di[12]), .D(grant[0]), .Y(
        n350) );
  AOI22X1 U194 ( .A(in3_di[11]), .B(n336), .C(in2_di[11]), .D(n470), .Y(n347)
         );
  AOI22X1 U195 ( .A(in1_di[11]), .B(n469), .C(in0_di[11]), .D(grant[0]), .Y(
        n348) );
  AOI22X1 U197 ( .A(in3_di[10]), .B(n336), .C(in2_di[10]), .D(n470), .Y(n345)
         );
  AOI22X1 U198 ( .A(in1_di[10]), .B(n469), .C(in0_di[10]), .D(grant[0]), .Y(
        n346) );
  AOI22X1 U200 ( .A(in3_di[0]), .B(n336), .C(in2_di[0]), .D(n470), .Y(n343) );
  NOR3X1 U201 ( .A(grant[0]), .B(grant[1]), .C(n474), .Y(n470) );
  NOR3X1 U202 ( .A(grant[1]), .B(grant[2]), .C(n329), .Y(n471) );
  AOI22X1 U204 ( .A(in1_di[0]), .B(n332), .C(in0_di[0]), .D(grant[0]), .Y(n344) );
  AND2X1 U3 ( .A(n189), .B(n253), .Y(sel_data[57]) );
  AND2X1 U4 ( .A(n190), .B(n254), .Y(sel_data[58]) );
  AND2X1 U5 ( .A(n191), .B(n255), .Y(sel_data[59]) );
  AND2X1 U6 ( .A(n193), .B(n257), .Y(sel_data[60]) );
  AND2X1 U7 ( .A(n194), .B(n258), .Y(sel_data[61]) );
  AND2X1 U8 ( .A(n195), .B(n259), .Y(sel_data[62]) );
  AND2X1 U9 ( .A(n196), .B(n260), .Y(sel_data[63]) );
  AND2X1 U10 ( .A(n181), .B(n245), .Y(sel_data[4]) );
  AND2X1 U13 ( .A(n192), .B(n256), .Y(sel_data[5]) );
  AND2X1 U16 ( .A(n197), .B(n261), .Y(sel_data[6]) );
  AND2X1 U19 ( .A(n198), .B(n262), .Y(sel_data[7]) );
  AND2X1 U22 ( .A(n199), .B(n263), .Y(sel_data[8]) );
  AND2X1 U25 ( .A(n200), .B(n264), .Y(sel_data[9]) );
  AND2X1 U28 ( .A(n2), .B(n202), .Y(sel_data[10]) );
  AND2X1 U31 ( .A(n3), .B(n203), .Y(sel_data[11]) );
  AND2X1 U34 ( .A(n140), .B(n204), .Y(sel_data[12]) );
  AND2X1 U37 ( .A(n141), .B(n205), .Y(sel_data[13]) );
  AND2X1 U40 ( .A(n142), .B(n206), .Y(sel_data[14]) );
  AND2X1 U43 ( .A(n143), .B(n207), .Y(sel_data[15]) );
  AND2X1 U46 ( .A(n144), .B(n208), .Y(sel_data[16]) );
  AND2X1 U49 ( .A(n145), .B(n209), .Y(sel_data[17]) );
  AND2X1 U52 ( .A(n146), .B(n210), .Y(sel_data[18]) );
  AND2X1 U55 ( .A(n147), .B(n211), .Y(sel_data[19]) );
  AND2X1 U58 ( .A(n149), .B(n213), .Y(sel_data[20]) );
  AND2X1 U61 ( .A(n150), .B(n214), .Y(sel_data[21]) );
  AND2X1 U64 ( .A(n151), .B(n215), .Y(sel_data[22]) );
  AND2X1 U67 ( .A(n152), .B(n216), .Y(sel_data[23]) );
  AND2X1 U70 ( .A(n153), .B(n217), .Y(sel_data[24]) );
  AND2X1 U73 ( .A(n154), .B(n218), .Y(sel_data[25]) );
  AND2X1 U76 ( .A(n155), .B(n219), .Y(sel_data[26]) );
  AND2X1 U79 ( .A(n156), .B(n220), .Y(sel_data[27]) );
  AND2X1 U82 ( .A(n157), .B(n221), .Y(sel_data[28]) );
  AND2X1 U85 ( .A(n158), .B(n222), .Y(sel_data[29]) );
  AND2X1 U88 ( .A(n160), .B(n224), .Y(sel_data[30]) );
  AND2X1 U91 ( .A(n161), .B(n225), .Y(sel_data[31]) );
  AND2X1 U94 ( .A(n162), .B(n226), .Y(sel_data[32]) );
  AND2X1 U97 ( .A(n163), .B(n227), .Y(sel_data[33]) );
  AND2X1 U100 ( .A(n164), .B(n228), .Y(sel_data[34]) );
  AND2X1 U103 ( .A(n165), .B(n229), .Y(sel_data[35]) );
  AND2X1 U106 ( .A(n166), .B(n230), .Y(sel_data[36]) );
  AND2X1 U109 ( .A(n167), .B(n231), .Y(sel_data[37]) );
  AND2X1 U112 ( .A(n168), .B(n232), .Y(sel_data[38]) );
  AND2X1 U115 ( .A(n169), .B(n233), .Y(sel_data[39]) );
  AND2X1 U118 ( .A(n171), .B(n235), .Y(sel_data[40]) );
  AND2X1 U121 ( .A(n172), .B(n236), .Y(sel_data[41]) );
  AND2X1 U124 ( .A(n173), .B(n237), .Y(sel_data[42]) );
  AND2X1 U127 ( .A(n174), .B(n238), .Y(sel_data[43]) );
  AND2X1 U130 ( .A(n175), .B(n239), .Y(sel_data[44]) );
  AND2X1 U133 ( .A(n176), .B(n240), .Y(sel_data[45]) );
  AND2X1 U136 ( .A(n177), .B(n241), .Y(sel_data[46]) );
  AND2X1 U139 ( .A(n178), .B(n242), .Y(sel_data[47]) );
  AND2X1 U142 ( .A(n179), .B(n243), .Y(sel_data[48]) );
  AND2X1 U145 ( .A(n180), .B(n244), .Y(sel_data[49]) );
  AND2X1 U148 ( .A(n182), .B(n246), .Y(sel_data[50]) );
  AND2X1 U151 ( .A(n183), .B(n247), .Y(sel_data[51]) );
  AND2X1 U154 ( .A(n184), .B(n248), .Y(sel_data[52]) );
  AND2X1 U157 ( .A(n185), .B(n249), .Y(sel_data[53]) );
  AND2X1 U160 ( .A(n186), .B(n250), .Y(sel_data[54]) );
  AND2X1 U163 ( .A(n187), .B(n251), .Y(sel_data[55]) );
  AND2X1 U166 ( .A(n188), .B(n252), .Y(sel_data[56]) );
  AND2X1 U169 ( .A(n1), .B(n201), .Y(sel_data[0]) );
  AND2X1 U172 ( .A(n148), .B(n212), .Y(sel_data[1]) );
  AND2X1 U175 ( .A(n159), .B(n223), .Y(sel_data[2]) );
  AND2X1 U178 ( .A(n170), .B(n234), .Y(sel_data[3]) );
  AND2X1 U181 ( .A(grant[1]), .B(n338), .Y(n469) );
  AND2X1 U184 ( .A(buf_ri), .B(grant[3]), .Y(in3_ri) );
  OR2X1 U187 ( .A(in0_ri), .B(n331), .Y(n330) );
  OR2X1 U190 ( .A(n339), .B(in1_ri), .Y(n331) );
  OR2X1 U193 ( .A(in2_ri), .B(in3_ri), .Y(n339) );
  AND2X1 U196 ( .A(buf_ri), .B(grant[2]), .Y(in2_ri) );
  BUFX2 U199 ( .A(n344), .Y(n1) );
  BUFX2 U203 ( .A(n346), .Y(n2) );
  BUFX2 U205 ( .A(n348), .Y(n3) );
  BUFX2 U206 ( .A(n350), .Y(n140) );
  BUFX2 U207 ( .A(n352), .Y(n141) );
  BUFX2 U208 ( .A(n354), .Y(n142) );
  BUFX2 U209 ( .A(n356), .Y(n143) );
  BUFX2 U210 ( .A(n358), .Y(n144) );
  BUFX2 U211 ( .A(n360), .Y(n145) );
  BUFX2 U212 ( .A(n362), .Y(n146) );
  BUFX2 U213 ( .A(n364), .Y(n147) );
  BUFX2 U214 ( .A(n366), .Y(n148) );
  BUFX2 U215 ( .A(n368), .Y(n149) );
  BUFX2 U216 ( .A(n370), .Y(n150) );
  BUFX2 U217 ( .A(n372), .Y(n151) );
  BUFX2 U218 ( .A(n374), .Y(n152) );
  BUFX2 U219 ( .A(n376), .Y(n153) );
  BUFX2 U220 ( .A(n378), .Y(n154) );
  BUFX2 U221 ( .A(n380), .Y(n155) );
  BUFX2 U222 ( .A(n382), .Y(n156) );
  BUFX2 U223 ( .A(n384), .Y(n157) );
  BUFX2 U224 ( .A(n386), .Y(n158) );
  BUFX2 U225 ( .A(n388), .Y(n159) );
  BUFX2 U226 ( .A(n390), .Y(n160) );
  BUFX2 U227 ( .A(n392), .Y(n161) );
  BUFX2 U228 ( .A(n394), .Y(n162) );
  BUFX2 U229 ( .A(n396), .Y(n163) );
  BUFX2 U230 ( .A(n398), .Y(n164) );
  BUFX2 U231 ( .A(n400), .Y(n165) );
  BUFX2 U232 ( .A(n402), .Y(n166) );
  BUFX2 U233 ( .A(n404), .Y(n167) );
  BUFX2 U234 ( .A(n406), .Y(n168) );
  BUFX2 U235 ( .A(n408), .Y(n169) );
  BUFX2 U236 ( .A(n410), .Y(n170) );
  BUFX2 U237 ( .A(n412), .Y(n171) );
  BUFX2 U238 ( .A(n414), .Y(n172) );
  BUFX2 U239 ( .A(n416), .Y(n173) );
  BUFX2 U240 ( .A(n418), .Y(n174) );
  BUFX2 U241 ( .A(n420), .Y(n175) );
  BUFX2 U242 ( .A(n422), .Y(n176) );
  BUFX2 U243 ( .A(n424), .Y(n177) );
  BUFX2 U244 ( .A(n426), .Y(n178) );
  BUFX2 U245 ( .A(n428), .Y(n179) );
  BUFX2 U246 ( .A(n430), .Y(n180) );
  BUFX2 U247 ( .A(n432), .Y(n181) );
  BUFX2 U248 ( .A(n434), .Y(n182) );
  BUFX2 U249 ( .A(n436), .Y(n183) );
  BUFX2 U250 ( .A(n438), .Y(n184) );
  BUFX2 U251 ( .A(n440), .Y(n185) );
  BUFX2 U252 ( .A(n442), .Y(n186) );
  BUFX2 U253 ( .A(n444), .Y(n187) );
  BUFX2 U254 ( .A(n446), .Y(n188) );
  BUFX2 U255 ( .A(n448), .Y(n189) );
  BUFX2 U256 ( .A(n450), .Y(n190) );
  BUFX2 U257 ( .A(n452), .Y(n191) );
  BUFX2 U258 ( .A(n454), .Y(n192) );
  BUFX2 U259 ( .A(n456), .Y(n193) );
  BUFX2 U260 ( .A(n458), .Y(n194) );
  BUFX2 U261 ( .A(n460), .Y(n195) );
  BUFX2 U262 ( .A(n462), .Y(n196) );
  BUFX2 U263 ( .A(n464), .Y(n197) );
  BUFX2 U264 ( .A(n466), .Y(n198) );
  BUFX2 U265 ( .A(n468), .Y(n199) );
  BUFX2 U266 ( .A(n473), .Y(n200) );
  BUFX2 U267 ( .A(n343), .Y(n201) );
  BUFX2 U268 ( .A(n345), .Y(n202) );
  BUFX2 U269 ( .A(n347), .Y(n203) );
  BUFX2 U270 ( .A(n349), .Y(n204) );
  BUFX2 U271 ( .A(n351), .Y(n205) );
  BUFX2 U272 ( .A(n353), .Y(n206) );
  BUFX2 U273 ( .A(n355), .Y(n207) );
  BUFX2 U274 ( .A(n357), .Y(n208) );
  BUFX2 U275 ( .A(n359), .Y(n209) );
  BUFX2 U276 ( .A(n361), .Y(n210) );
  BUFX2 U277 ( .A(n363), .Y(n211) );
  BUFX2 U278 ( .A(n365), .Y(n212) );
  BUFX2 U279 ( .A(n367), .Y(n213) );
  BUFX2 U280 ( .A(n369), .Y(n214) );
  BUFX2 U281 ( .A(n371), .Y(n215) );
  BUFX2 U282 ( .A(n373), .Y(n216) );
  BUFX2 U283 ( .A(n375), .Y(n217) );
  BUFX2 U284 ( .A(n377), .Y(n218) );
  BUFX2 U285 ( .A(n379), .Y(n219) );
  BUFX2 U286 ( .A(n381), .Y(n220) );
  BUFX2 U287 ( .A(n383), .Y(n221) );
  BUFX2 U288 ( .A(n385), .Y(n222) );
  BUFX2 U289 ( .A(n387), .Y(n223) );
  BUFX2 U290 ( .A(n389), .Y(n224) );
  BUFX2 U291 ( .A(n391), .Y(n225) );
  BUFX2 U292 ( .A(n393), .Y(n226) );
  BUFX2 U293 ( .A(n395), .Y(n227) );
  BUFX2 U294 ( .A(n397), .Y(n228) );
  BUFX2 U295 ( .A(n399), .Y(n229) );
  BUFX2 U296 ( .A(n401), .Y(n230) );
  BUFX2 U297 ( .A(n403), .Y(n231) );
  BUFX2 U298 ( .A(n405), .Y(n232) );
  BUFX2 U299 ( .A(n407), .Y(n233) );
  BUFX2 U300 ( .A(n409), .Y(n234) );
  BUFX2 U301 ( .A(n411), .Y(n235) );
  BUFX2 U302 ( .A(n413), .Y(n236) );
  BUFX2 U303 ( .A(n415), .Y(n237) );
  BUFX2 U304 ( .A(n417), .Y(n238) );
  BUFX2 U305 ( .A(n419), .Y(n239) );
  BUFX2 U306 ( .A(n421), .Y(n240) );
  BUFX2 U307 ( .A(n423), .Y(n241) );
  BUFX2 U308 ( .A(n425), .Y(n242) );
  BUFX2 U309 ( .A(n427), .Y(n243) );
  BUFX2 U310 ( .A(n429), .Y(n244) );
  BUFX2 U311 ( .A(n431), .Y(n245) );
  BUFX2 U312 ( .A(n433), .Y(n246) );
  BUFX2 U313 ( .A(n435), .Y(n247) );
  BUFX2 U314 ( .A(n437), .Y(n248) );
  BUFX2 U315 ( .A(n439), .Y(n249) );
  BUFX2 U316 ( .A(n441), .Y(n250) );
  BUFX2 U317 ( .A(n443), .Y(n251) );
  BUFX2 U318 ( .A(n445), .Y(n252) );
  BUFX2 U319 ( .A(n447), .Y(n253) );
  BUFX2 U320 ( .A(n449), .Y(n254) );
  BUFX2 U321 ( .A(n451), .Y(n255) );
  BUFX2 U322 ( .A(n453), .Y(n256) );
  BUFX2 U323 ( .A(n455), .Y(n257) );
  BUFX2 U324 ( .A(n457), .Y(n258) );
  BUFX2 U325 ( .A(n459), .Y(n259) );
  BUFX2 U326 ( .A(n461), .Y(n260) );
  BUFX2 U327 ( .A(n463), .Y(n261) );
  BUFX2 U328 ( .A(n465), .Y(n262) );
  BUFX2 U329 ( .A(n467), .Y(n263) );
  BUFX2 U330 ( .A(n472), .Y(n264) );
  INVX1 U331 ( .A(sel_data[0]), .Y(n265) );
  INVX1 U332 ( .A(sel_data[10]), .Y(n266) );
  INVX1 U333 ( .A(sel_data[11]), .Y(n267) );
  INVX1 U334 ( .A(sel_data[12]), .Y(n268) );
  INVX1 U335 ( .A(sel_data[13]), .Y(n269) );
  INVX1 U336 ( .A(sel_data[14]), .Y(n270) );
  INVX1 U337 ( .A(sel_data[15]), .Y(n271) );
  INVX1 U338 ( .A(sel_data[16]), .Y(n272) );
  INVX1 U339 ( .A(sel_data[17]), .Y(n273) );
  INVX1 U340 ( .A(sel_data[18]), .Y(n274) );
  INVX1 U341 ( .A(sel_data[19]), .Y(n275) );
  INVX1 U342 ( .A(sel_data[1]), .Y(n276) );
  INVX1 U343 ( .A(sel_data[20]), .Y(n277) );
  INVX1 U344 ( .A(sel_data[21]), .Y(n278) );
  INVX1 U345 ( .A(sel_data[22]), .Y(n279) );
  INVX1 U346 ( .A(sel_data[23]), .Y(n280) );
  INVX1 U347 ( .A(sel_data[24]), .Y(n281) );
  INVX1 U348 ( .A(sel_data[25]), .Y(n282) );
  INVX1 U349 ( .A(sel_data[26]), .Y(n283) );
  INVX1 U350 ( .A(sel_data[27]), .Y(n284) );
  INVX1 U351 ( .A(sel_data[28]), .Y(n285) );
  INVX1 U352 ( .A(sel_data[29]), .Y(n286) );
  INVX1 U353 ( .A(sel_data[2]), .Y(n287) );
  INVX1 U354 ( .A(sel_data[30]), .Y(n288) );
  INVX1 U355 ( .A(sel_data[31]), .Y(n289) );
  INVX1 U356 ( .A(sel_data[32]), .Y(n290) );
  INVX1 U357 ( .A(sel_data[33]), .Y(n291) );
  INVX1 U358 ( .A(sel_data[34]), .Y(n292) );
  INVX1 U359 ( .A(sel_data[35]), .Y(n293) );
  INVX1 U360 ( .A(sel_data[36]), .Y(n294) );
  INVX1 U361 ( .A(sel_data[37]), .Y(n295) );
  INVX1 U362 ( .A(sel_data[38]), .Y(n296) );
  INVX1 U363 ( .A(sel_data[39]), .Y(n297) );
  INVX1 U364 ( .A(sel_data[3]), .Y(n298) );
  INVX1 U365 ( .A(sel_data[40]), .Y(n299) );
  INVX1 U366 ( .A(sel_data[41]), .Y(n300) );
  INVX1 U367 ( .A(sel_data[42]), .Y(n301) );
  INVX1 U368 ( .A(sel_data[43]), .Y(n302) );
  INVX1 U369 ( .A(sel_data[44]), .Y(n303) );
  INVX1 U370 ( .A(sel_data[45]), .Y(n304) );
  INVX1 U371 ( .A(sel_data[46]), .Y(n305) );
  INVX1 U372 ( .A(sel_data[47]), .Y(n306) );
  INVX1 U373 ( .A(sel_data[48]), .Y(n307) );
  INVX1 U374 ( .A(sel_data[49]), .Y(n308) );
  INVX1 U375 ( .A(sel_data[4]), .Y(n309) );
  INVX1 U376 ( .A(sel_data[50]), .Y(n310) );
  INVX1 U377 ( .A(sel_data[51]), .Y(n311) );
  INVX1 U378 ( .A(sel_data[52]), .Y(n312) );
  INVX1 U379 ( .A(sel_data[53]), .Y(n313) );
  INVX1 U380 ( .A(sel_data[54]), .Y(n314) );
  INVX1 U381 ( .A(sel_data[55]), .Y(n315) );
  INVX1 U382 ( .A(sel_data[56]), .Y(n316) );
  INVX1 U383 ( .A(sel_data[57]), .Y(n317) );
  INVX1 U384 ( .A(sel_data[58]), .Y(n318) );
  INVX1 U385 ( .A(sel_data[59]), .Y(n319) );
  INVX1 U386 ( .A(sel_data[5]), .Y(n320) );
  INVX1 U387 ( .A(sel_data[60]), .Y(n321) );
  INVX1 U388 ( .A(sel_data[61]), .Y(n322) );
  INVX1 U389 ( .A(sel_data[62]), .Y(n323) );
  INVX1 U390 ( .A(sel_data[63]), .Y(n324) );
  INVX1 U391 ( .A(sel_data[6]), .Y(n325) );
  INVX1 U392 ( .A(sel_data[7]), .Y(n326) );
  INVX1 U393 ( .A(sel_data[8]), .Y(n327) );
  INVX1 U394 ( .A(sel_data[9]), .Y(n328) );
  AND2X1 U395 ( .A(n338), .B(grant[3]), .Y(n342) );
  INVX1 U396 ( .A(n342), .Y(n329) );
  AND2X1 U397 ( .A(buf_ri), .B(grant[0]), .Y(in0_ri) );
  AND2X1 U398 ( .A(buf_ri), .B(grant[1]), .Y(in1_ri) );
  INVX1 U399 ( .A(n333), .Y(n332) );
  INVX1 U400 ( .A(n335), .Y(n334) );
  INVX1 U401 ( .A(n337), .Y(n336) );
  INVX1 U402 ( .A(n469), .Y(n333) );
  INVX1 U403 ( .A(n470), .Y(n335) );
  INVX1 U404 ( .A(n471), .Y(n337) );
  INVX1 U405 ( .A(grant[2]), .Y(n474) );
  INVX1 U406 ( .A(grant[0]), .Y(n338) );
endmodule


module rr4_arbiter_2 ( clk, reset, request, advance, grant );
  input [3:0] request;
  output [3:0] grant;
  input clk, reset, advance;
  wire   n70, n72, n73, n75, n77, n51, n110, n47, n107, n106, n111, n53, n67,
         n65, n104, n105, n50, n102, n46, n100, n99, n103, n52, n66, n64, n97,
         n98, n96, n45, n94, n108, n59, n54, n91, n44, n89, n63, n56, n112,
         n86, n87, n85, n84, n113, n83, n92, n93, n82, n81, n80, n115, n88,
         n79, n49, n48, n114, n90, n95, n101, n109, n58, n61, n62, n60, n69;
  wire   [3:0] ptr;

  DFFSR ptr_reg_0_ ( .D(n70), .CLK(clk), .R(1'b1), .S(n72), .Q(ptr[0]) );
  DFFSR ptr_reg_2_ ( .D(n73), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[2]) );
  DFFSR ptr_reg_3_ ( .D(n75), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[3]) );
  DFFSR ptr_reg_1_ ( .D(n77), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[1]) );
  OAI21X1 U3 ( .A(n51), .B(n110), .C(n47), .Y(n77) );
  AOI21X1 U5 ( .A(advance), .B(n107), .C(n106), .Y(n111) );
  NOR3X1 U6 ( .A(n53), .B(request[3]), .C(request[2]), .Y(n106) );
  AOI22X1 U7 ( .A(n67), .B(advance), .C(n65), .D(n104), .Y(n105) );
  OAI21X1 U8 ( .A(n50), .B(n102), .C(n46), .Y(n75) );
  AOI21X1 U10 ( .A(advance), .B(n100), .C(n99), .Y(n103) );
  NOR3X1 U11 ( .A(n52), .B(request[1]), .C(request[0]), .Y(n99) );
  AOI22X1 U12 ( .A(n66), .B(advance), .C(n64), .D(n97), .Y(n98) );
  OAI21X1 U13 ( .A(n96), .B(n104), .C(n45), .Y(n73) );
  INVX1 U15 ( .A(n94), .Y(n96) );
  OAI21X1 U16 ( .A(n108), .B(n59), .C(n54), .Y(n94) );
  INVX1 U17 ( .A(reset), .Y(n72) );
  OAI21X1 U18 ( .A(n91), .B(n97), .C(n44), .Y(n70) );
  INVX1 U20 ( .A(n89), .Y(n91) );
  OAI21X1 U21 ( .A(n108), .B(n63), .C(n56), .Y(n89) );
  INVX1 U22 ( .A(advance), .Y(n108) );
  AOI21X1 U23 ( .A(n63), .B(n56), .C(n97), .Y(n112) );
  NAND3X1 U24 ( .A(n66), .B(n110), .C(n86), .Y(n87) );
  AND2X1 U25 ( .A(n102), .B(n104), .Y(n86) );
  AOI21X1 U26 ( .A(n85), .B(n84), .C(n102), .Y(n113) );
  OR2X1 U27 ( .A(n59), .B(request[1]), .Y(n84) );
  INVX1 U28 ( .A(n67), .Y(n85) );
  NAND3X1 U30 ( .A(n67), .B(n110), .C(n83), .Y(n92) );
  AND2X1 U31 ( .A(n97), .B(n102), .Y(n83) );
  AOI21X1 U32 ( .A(n110), .B(n107), .C(n65), .Y(n93) );
  INVX1 U33 ( .A(n82), .Y(n107) );
  AOI21X1 U34 ( .A(n97), .B(n64), .C(n66), .Y(n82) );
  INVX1 U35 ( .A(request[3]), .Y(n97) );
  AOI21X1 U36 ( .A(n81), .B(n80), .C(n110), .Y(n115) );
  INVX1 U37 ( .A(request[0]), .Y(n110) );
  AOI21X1 U39 ( .A(n102), .B(n100), .C(n64), .Y(n88) );
  INVX1 U40 ( .A(n79), .Y(n100) );
  AOI21X1 U41 ( .A(n104), .B(n65), .C(n67), .Y(n79) );
  INVX1 U42 ( .A(request[1]), .Y(n104) );
  INVX1 U43 ( .A(request[2]), .Y(n102) );
  INVX1 U44 ( .A(n66), .Y(n81) );
  OR2X1 U4 ( .A(n63), .B(request[3]), .Y(n80) );
  AND2X1 U9 ( .A(n49), .B(n48), .Y(n114) );
  INVX1 U14 ( .A(n114), .Y(grant[1]) );
  AND2X1 U19 ( .A(n66), .B(n108), .Y(n90) );
  INVX1 U29 ( .A(n90), .Y(n44) );
  AND2X1 U38 ( .A(n67), .B(n108), .Y(n95) );
  INVX1 U49 ( .A(n95), .Y(n45) );
  AND2X1 U50 ( .A(n64), .B(n108), .Y(n101) );
  INVX1 U51 ( .A(n101), .Y(n46) );
  AND2X1 U52 ( .A(n65), .B(n108), .Y(n109) );
  INVX1 U53 ( .A(n109), .Y(n47) );
  AND2X1 U54 ( .A(request[1]), .B(n58), .Y(n61) );
  INVX1 U55 ( .A(n61), .Y(n48) );
  AND2X1 U56 ( .A(request[1]), .B(n62), .Y(n60) );
  INVX1 U57 ( .A(n60), .Y(n49) );
  BUFX2 U58 ( .A(n103), .Y(n50) );
  BUFX2 U59 ( .A(n111), .Y(n51) );
  BUFX2 U60 ( .A(n98), .Y(n52) );
  BUFX2 U61 ( .A(n105), .Y(n53) );
  BUFX2 U62 ( .A(n92), .Y(n54) );
  BUFX2 U63 ( .A(n112), .Y(grant[3]) );
  BUFX2 U64 ( .A(n87), .Y(n56) );
  BUFX2 U65 ( .A(n113), .Y(grant[2]) );
  INVX1 U66 ( .A(n59), .Y(n58) );
  BUFX2 U67 ( .A(n93), .Y(n59) );
  INVX1 U68 ( .A(n54), .Y(n62) );
  BUFX2 U69 ( .A(n88), .Y(n63) );
  BUFX2 U70 ( .A(ptr[3]), .Y(n64) );
  BUFX2 U71 ( .A(ptr[1]), .Y(n65) );
  BUFX2 U72 ( .A(ptr[0]), .Y(n66) );
  BUFX2 U73 ( .A(ptr[2]), .Y(n67) );
  INVX1 U74 ( .A(n69), .Y(grant[0]) );
  INVX1 U75 ( .A(n115), .Y(n69) );
endmodule


module buffer_7 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n6, n277, n416, n348, n477, n347, n478, n346, n479, n345, n480, n410,
         n274, n271, n344, n268, n342, n343, n341, n273, n272, n340, n339,
         n338, n337, n336, n335, n334, n333, n332, n331, n330, n276, n329,
         n275, n328, n327, n326, n325, n324, n323, n322, n321, n320, n319,
         n318, n317, n316, n270, n315, n314, n313, n312, n311, n310, n309,
         n308, n307, n306, n305, n304, n269, n303, n302, n301, n300, n299,
         n298, n297, n296, n295, n294, n293, n292, n291, n290, n289, n288,
         n287, n286, n285, n284, n283, n282, n281, n280, n401, n424, n400,
         n425, n399, n426, n398, n427, n397, n428, n396, n429, n395, n430,
         n394, n431, n393, n432, n392, n433, n391, n434, n390, n435, n389,
         n436, n388, n437, n387, n438, n386, n439, n385, n440, n384, n441,
         n383, n442, n382, n443, n381, n444, n380, n445, n379, n446, n378,
         n447, n377, n448, n376, n449, n375, n450, n374, n451, n373, n452,
         n372, n453, n371, n454, n370, n455, n369, n456, n368, n457, n367,
         n458, n366, n459, n365, n460, n364, n461, n363, n462, n362, n463,
         n361, n464, n360, n465, n359, n466, n358, n467, n357, n468, n356,
         n469, n355, n470, n354, n471, n353, n472, n352, n473, n351, n474,
         n350, n475, n349, n476, n408, n417, n407, n418, n406, n419, n405,
         n420, n404, n421, n403, n422, n402, n423, n5, n415, n279, n278, n207,
         n205;

  DFFSR full_reg ( .D(n6), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n478) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n479) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n277), .S(1'b1), .Q(n480) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n271), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n274), .C(buffer_di[1]), .D(n268), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n274), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n272), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n272), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n272), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n272), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n272), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n272), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n272), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n272), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n272), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n272), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n272), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n276), .C(buffer_di[14]), .D(n272), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n275), .C(buffer_di[15]), .D(n272), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n271), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n276), .C(buffer_di[17]), .D(n271), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n275), .C(buffer_di[18]), .D(n271), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n271), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n271), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n271), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n271), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n271), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n271), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n271), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n271), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n271), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n270), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n270), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n270), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n270), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n270), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n270), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n270), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n270), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n270), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n270), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n270), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n270), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n269), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n269), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n269), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n269), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n269), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n269), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n269), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n269), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n269), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n269), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n269), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n269), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n268), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n268), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n268), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n268), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n268), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n274), .C(buffer_di[57]), .D(n268), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n268), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n274), .C(buffer_di[59]), .D(n268), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n274), .C(buffer_di[60]), .D(n268), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n274), .C(buffer_di[61]), .D(n268), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n268), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n274), .C(buffer_di[63]), .D(n268), .Y(
        n280) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  AND2X1 U7 ( .A(buffer_so), .B(n5), .Y(n415) );
  AND2X1 U8 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  AND2X1 U9 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U10 ( .A(n279), .Y(n5) );
  AND2X1 U11 ( .A(buffer_ri), .B(n274), .Y(n278) );
  INVX1 U12 ( .A(n278), .Y(n6) );
  BUFX2 U13 ( .A(n416), .Y(buffer_so) );
  BUFX2 U14 ( .A(n423), .Y(buffer_do[57]) );
  BUFX2 U15 ( .A(n422), .Y(buffer_do[58]) );
  BUFX2 U16 ( .A(n421), .Y(buffer_do[59]) );
  BUFX2 U17 ( .A(n420), .Y(buffer_do[60]) );
  BUFX2 U18 ( .A(n419), .Y(buffer_do[61]) );
  BUFX2 U19 ( .A(n418), .Y(buffer_do[62]) );
  BUFX2 U20 ( .A(n417), .Y(buffer_do[63]) );
  BUFX2 U21 ( .A(n476), .Y(buffer_do[4]) );
  BUFX2 U22 ( .A(n475), .Y(buffer_do[5]) );
  BUFX2 U23 ( .A(n474), .Y(buffer_do[6]) );
  BUFX2 U24 ( .A(n473), .Y(buffer_do[7]) );
  BUFX2 U25 ( .A(n472), .Y(buffer_do[8]) );
  BUFX2 U26 ( .A(n471), .Y(buffer_do[9]) );
  BUFX2 U27 ( .A(n470), .Y(buffer_do[10]) );
  BUFX2 U28 ( .A(n469), .Y(buffer_do[11]) );
  BUFX2 U29 ( .A(n468), .Y(buffer_do[12]) );
  BUFX2 U30 ( .A(n467), .Y(buffer_do[13]) );
  BUFX2 U31 ( .A(n466), .Y(buffer_do[14]) );
  BUFX2 U32 ( .A(n465), .Y(buffer_do[15]) );
  BUFX2 U33 ( .A(n464), .Y(buffer_do[16]) );
  BUFX2 U34 ( .A(n463), .Y(buffer_do[17]) );
  BUFX2 U35 ( .A(n462), .Y(buffer_do[18]) );
  BUFX2 U36 ( .A(n461), .Y(buffer_do[19]) );
  BUFX2 U37 ( .A(n460), .Y(buffer_do[20]) );
  BUFX2 U38 ( .A(n459), .Y(buffer_do[21]) );
  BUFX2 U39 ( .A(n458), .Y(buffer_do[22]) );
  BUFX2 U40 ( .A(n457), .Y(buffer_do[23]) );
  BUFX2 U41 ( .A(n456), .Y(buffer_do[24]) );
  BUFX2 U42 ( .A(n455), .Y(buffer_do[25]) );
  BUFX2 U43 ( .A(n454), .Y(buffer_do[26]) );
  BUFX2 U44 ( .A(n453), .Y(buffer_do[27]) );
  BUFX2 U45 ( .A(n452), .Y(buffer_do[28]) );
  BUFX2 U46 ( .A(n451), .Y(buffer_do[29]) );
  BUFX2 U47 ( .A(n450), .Y(buffer_do[30]) );
  BUFX2 U48 ( .A(n449), .Y(buffer_do[31]) );
  BUFX2 U49 ( .A(n448), .Y(buffer_do[32]) );
  BUFX2 U50 ( .A(n447), .Y(buffer_do[33]) );
  BUFX2 U51 ( .A(n446), .Y(buffer_do[34]) );
  BUFX2 U52 ( .A(n445), .Y(buffer_do[35]) );
  BUFX2 U53 ( .A(n444), .Y(buffer_do[36]) );
  BUFX2 U54 ( .A(n443), .Y(buffer_do[37]) );
  BUFX2 U55 ( .A(n442), .Y(buffer_do[38]) );
  BUFX2 U56 ( .A(n441), .Y(buffer_do[39]) );
  BUFX2 U57 ( .A(n440), .Y(buffer_do[40]) );
  BUFX2 U58 ( .A(n439), .Y(buffer_do[41]) );
  BUFX2 U59 ( .A(n438), .Y(buffer_do[42]) );
  BUFX2 U60 ( .A(n437), .Y(buffer_do[43]) );
  BUFX2 U61 ( .A(n436), .Y(buffer_do[44]) );
  BUFX2 U62 ( .A(n435), .Y(buffer_do[45]) );
  BUFX2 U63 ( .A(n434), .Y(buffer_do[46]) );
  BUFX2 U64 ( .A(n433), .Y(buffer_do[47]) );
  BUFX2 U65 ( .A(n432), .Y(buffer_do[48]) );
  BUFX2 U66 ( .A(n431), .Y(buffer_do[49]) );
  BUFX2 U69 ( .A(n430), .Y(buffer_do[50]) );
  BUFX2 U70 ( .A(n429), .Y(buffer_do[51]) );
  BUFX2 U71 ( .A(n428), .Y(buffer_do[52]) );
  BUFX2 U72 ( .A(n427), .Y(buffer_do[53]) );
  BUFX2 U73 ( .A(n426), .Y(buffer_do[54]) );
  BUFX2 U74 ( .A(n425), .Y(buffer_do[55]) );
  BUFX2 U75 ( .A(n424), .Y(buffer_do[56]) );
  BUFX2 U76 ( .A(n480), .Y(buffer_do[0]) );
  BUFX2 U77 ( .A(n479), .Y(buffer_do[1]) );
  BUFX2 U78 ( .A(n478), .Y(buffer_do[2]) );
  BUFX2 U79 ( .A(n477), .Y(buffer_do[3]) );
  INVX1 U80 ( .A(n207), .Y(n205) );
  INVX1 U81 ( .A(n205), .Y(buffer_ri) );
  INVX1 U82 ( .A(n415), .Y(n207) );
  INVX2 U83 ( .A(reset), .Y(n277) );
  INVX1 U208 ( .A(n276), .Y(n272) );
  INVX1 U209 ( .A(n273), .Y(n271) );
  INVX1 U210 ( .A(n273), .Y(n270) );
  INVX1 U211 ( .A(n276), .Y(n269) );
  INVX1 U212 ( .A(n275), .Y(n268) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n344), .Y(n345) );
  INVX1 U218 ( .A(n342), .Y(n346) );
  INVX1 U219 ( .A(n341), .Y(n347) );
  INVX1 U220 ( .A(n340), .Y(n348) );
  INVX1 U221 ( .A(n339), .Y(n349) );
  INVX1 U222 ( .A(n338), .Y(n350) );
  INVX1 U223 ( .A(n337), .Y(n351) );
  INVX1 U224 ( .A(n336), .Y(n352) );
  INVX1 U225 ( .A(n335), .Y(n353) );
  INVX1 U226 ( .A(n334), .Y(n354) );
  INVX1 U227 ( .A(n333), .Y(n355) );
  INVX1 U228 ( .A(n332), .Y(n356) );
  INVX1 U229 ( .A(n331), .Y(n357) );
  INVX1 U230 ( .A(n330), .Y(n358) );
  INVX1 U231 ( .A(n329), .Y(n359) );
  INVX1 U232 ( .A(n328), .Y(n360) );
  INVX1 U233 ( .A(n327), .Y(n361) );
  INVX1 U234 ( .A(n326), .Y(n362) );
  INVX1 U235 ( .A(n325), .Y(n363) );
  INVX1 U236 ( .A(n324), .Y(n364) );
  INVX1 U237 ( .A(n323), .Y(n365) );
  INVX1 U238 ( .A(n322), .Y(n366) );
  INVX1 U239 ( .A(n321), .Y(n367) );
  INVX1 U240 ( .A(n320), .Y(n368) );
  INVX1 U241 ( .A(n319), .Y(n369) );
  INVX1 U242 ( .A(n318), .Y(n370) );
  INVX1 U243 ( .A(n317), .Y(n371) );
  INVX1 U244 ( .A(n316), .Y(n372) );
  INVX1 U245 ( .A(n315), .Y(n373) );
  INVX1 U246 ( .A(n314), .Y(n374) );
  INVX1 U247 ( .A(n313), .Y(n375) );
  INVX1 U248 ( .A(n312), .Y(n376) );
  INVX1 U249 ( .A(n311), .Y(n377) );
  INVX1 U250 ( .A(n310), .Y(n378) );
  INVX1 U251 ( .A(n309), .Y(n379) );
  INVX1 U252 ( .A(n308), .Y(n380) );
  INVX1 U253 ( .A(n307), .Y(n381) );
  INVX1 U254 ( .A(n306), .Y(n382) );
  INVX1 U255 ( .A(n305), .Y(n383) );
  INVX1 U256 ( .A(n304), .Y(n384) );
  INVX1 U257 ( .A(n303), .Y(n385) );
  INVX1 U258 ( .A(n302), .Y(n386) );
  INVX1 U259 ( .A(n301), .Y(n387) );
  INVX1 U260 ( .A(n300), .Y(n388) );
  INVX1 U261 ( .A(n299), .Y(n389) );
  INVX1 U262 ( .A(n298), .Y(n390) );
  INVX1 U263 ( .A(n297), .Y(n391) );
  INVX1 U264 ( .A(n296), .Y(n392) );
  INVX1 U265 ( .A(n295), .Y(n393) );
  INVX1 U266 ( .A(n294), .Y(n394) );
  INVX1 U267 ( .A(n293), .Y(n395) );
  INVX1 U268 ( .A(n292), .Y(n396) );
  INVX1 U269 ( .A(n291), .Y(n397) );
  INVX1 U270 ( .A(n290), .Y(n398) );
  INVX1 U271 ( .A(n289), .Y(n399) );
  INVX1 U272 ( .A(n288), .Y(n400) );
  INVX1 U273 ( .A(n287), .Y(n401) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n282), .Y(n406) );
  INVX1 U279 ( .A(n281), .Y(n407) );
  INVX1 U280 ( .A(n280), .Y(n408) );
endmodule


module output_controller_4in_2 ( clk, reset, polarity, output_so, output_do, 
        output_ro, in0_si, in0_di, in0_ri, in1_si, in1_di, in1_ri, in2_si, 
        in2_di, in2_ri, in3_si, in3_di, in3_ri );
  output [63:0] output_do;
  input [63:0] in0_di;
  input [63:0] in1_di;
  input [63:0] in2_di;
  input [63:0] in3_di;
  input clk, reset, polarity, output_ro, in0_si, in1_si, in2_si, in3_si;
  output output_so, in0_ri, in1_ri, in2_ri, in3_ri;
  wire   n330, buf_ri, n324, n323, n322, n321, n319, n318, n317, n316, n315,
         n314, n313, n312, n311, n310, n308, n307, n306, n305, n304, n303,
         n302, n301, n300, n299, n297, n296, n295, n294, n293, n292, n291,
         n290, n289, n288, n286, n285, n284, n283, n282, n281, n280, n279,
         n278, n277, n275, n274, n273, n272, n271, n270, n269, n268, n267,
         n266, n328, n327, n326, n325, n320, n309, n298, n287, n276, n265,
         n471, n334, n472, n469, n473, n467, n468, n470, n465, n466, n463,
         n464, n461, n462, n459, n460, n457, n458, n336, n455, n456, n453,
         n454, n451, n452, n449, n450, n447, n448, n445, n446, n443, n444,
         n441, n442, n439, n440, n437, n438, n435, n436, n433, n434, n431,
         n432, n429, n430, n427, n428, n425, n426, n423, n424, n421, n422,
         n419, n420, n417, n332, n418, n415, n416, n413, n414, n411, n412,
         n409, n410, n407, n408, n405, n406, n403, n404, n401, n402, n399,
         n400, n397, n398, n395, n396, n393, n394, n391, n392, n389, n390,
         n387, n388, n385, n386, n383, n384, n381, n382, n379, n380, n377,
         n378, n375, n376, n373, n374, n371, n372, n369, n370, n367, n368,
         n365, n366, n363, n364, n361, n362, n359, n360, n357, n358, n355,
         n356, n353, n354, n351, n352, n349, n350, n347, n348, n345, n346,
         n343, n474, n329, n344, n189, n253, n190, n254, n191, n255, n193,
         n257, n194, n258, n195, n259, n196, n260, n181, n245, n192, n256,
         n197, n261, n198, n262, n199, n263, n200, n264, n2, n202, n3, n203,
         n140, n204, n141, n205, n142, n206, n143, n207, n144, n208, n145,
         n209, n146, n210, n147, n211, n149, n213, n150, n214, n151, n215,
         n152, n216, n153, n217, n154, n218, n155, n219, n156, n220, n157,
         n221, n158, n222, n160, n224, n161, n225, n162, n226, n163, n227,
         n164, n228, n165, n229, n166, n230, n167, n231, n168, n232, n169,
         n233, n171, n235, n172, n236, n173, n237, n174, n238, n175, n239,
         n176, n240, n177, n241, n178, n242, n179, n243, n180, n244, n182,
         n246, n183, n247, n184, n248, n185, n249, n186, n250, n187, n251,
         n188, n252, n1, n201, n148, n212, n159, n223, n170, n234, n338, n331,
         n339, n342, n333, n335, n337;
  wire   [3:0] grant;
  wire   [63:0] sel_data;

  rr4_arbiter_2 ARB ( .clk(clk), .reset(reset), .request({in3_si, in2_si, 
        in1_si, in0_si}), .advance(n330), .grant(grant) );
  buffer_7 OB ( .clk(clk), .reset(reset), .buffer_en(1'b1), .buffer_di({n324, 
        n323, n322, n321, n319, n318, n317, n316, n315, n314, n313, n312, n311, 
        n310, n308, n307, n306, n305, n304, n303, n302, n301, n300, n299, n297, 
        n296, n295, n294, n293, n292, n291, n290, n289, n288, n286, n285, n284, 
        n283, n282, n281, n280, n279, n278, n277, n275, n274, n273, n272, n271, 
        n270, n269, n268, n267, n266, n328, n327, n326, n325, n320, n309, n298, 
        n287, n276, n265}), .buffer_si(n330), .buffer_ri(buf_ri), .buffer_ro(
        output_ro), .buffer_so(output_so), .buffer_do(output_do) );
  AOI22X1 U11 ( .A(in3_di[9]), .B(n471), .C(in2_di[9]), .D(n334), .Y(n472) );
  AOI22X1 U12 ( .A(in1_di[9]), .B(n469), .C(in0_di[9]), .D(grant[0]), .Y(n473)
         );
  AOI22X1 U14 ( .A(in3_di[8]), .B(n471), .C(in2_di[8]), .D(n334), .Y(n467) );
  AOI22X1 U15 ( .A(in1_di[8]), .B(n469), .C(in0_di[8]), .D(grant[0]), .Y(n468)
         );
  AOI22X1 U17 ( .A(in3_di[7]), .B(n471), .C(in2_di[7]), .D(n470), .Y(n465) );
  AOI22X1 U18 ( .A(in1_di[7]), .B(n469), .C(in0_di[7]), .D(grant[0]), .Y(n466)
         );
  AOI22X1 U20 ( .A(in3_di[6]), .B(n471), .C(in2_di[6]), .D(n334), .Y(n463) );
  AOI22X1 U21 ( .A(in1_di[6]), .B(n469), .C(in0_di[6]), .D(grant[0]), .Y(n464)
         );
  AOI22X1 U23 ( .A(in3_di[63]), .B(n471), .C(in2_di[63]), .D(n334), .Y(n461)
         );
  AOI22X1 U24 ( .A(in1_di[63]), .B(n469), .C(in0_di[63]), .D(grant[0]), .Y(
        n462) );
  AOI22X1 U26 ( .A(in3_di[62]), .B(n471), .C(in2_di[62]), .D(n334), .Y(n459)
         );
  AOI22X1 U27 ( .A(in1_di[62]), .B(n469), .C(in0_di[62]), .D(grant[0]), .Y(
        n460) );
  AOI22X1 U29 ( .A(in3_di[61]), .B(n471), .C(in2_di[61]), .D(n334), .Y(n457)
         );
  AOI22X1 U30 ( .A(in1_di[61]), .B(n469), .C(in0_di[61]), .D(grant[0]), .Y(
        n458) );
  AOI22X1 U32 ( .A(in3_di[60]), .B(n336), .C(in2_di[60]), .D(n470), .Y(n455)
         );
  AOI22X1 U33 ( .A(in1_di[60]), .B(n469), .C(in0_di[60]), .D(grant[0]), .Y(
        n456) );
  AOI22X1 U35 ( .A(in3_di[5]), .B(n471), .C(in2_di[5]), .D(n470), .Y(n453) );
  AOI22X1 U36 ( .A(in1_di[5]), .B(n469), .C(in0_di[5]), .D(grant[0]), .Y(n454)
         );
  AOI22X1 U38 ( .A(in3_di[59]), .B(n336), .C(in2_di[59]), .D(n470), .Y(n451)
         );
  AOI22X1 U39 ( .A(in1_di[59]), .B(n469), .C(in0_di[59]), .D(grant[0]), .Y(
        n452) );
  AOI22X1 U41 ( .A(in3_di[58]), .B(n336), .C(in2_di[58]), .D(n470), .Y(n449)
         );
  AOI22X1 U42 ( .A(in1_di[58]), .B(n469), .C(in0_di[58]), .D(grant[0]), .Y(
        n450) );
  AOI22X1 U44 ( .A(in3_di[57]), .B(n336), .C(in2_di[57]), .D(n470), .Y(n447)
         );
  AOI22X1 U45 ( .A(in1_di[57]), .B(n469), .C(in0_di[57]), .D(grant[0]), .Y(
        n448) );
  AOI22X1 U47 ( .A(in3_di[56]), .B(n471), .C(in2_di[56]), .D(n470), .Y(n445)
         );
  AOI22X1 U48 ( .A(in1_di[56]), .B(n469), .C(in0_di[56]), .D(grant[0]), .Y(
        n446) );
  AOI22X1 U50 ( .A(in3_di[55]), .B(n336), .C(in2_di[55]), .D(n470), .Y(n443)
         );
  AOI22X1 U51 ( .A(in1_di[55]), .B(n469), .C(in0_di[55]), .D(grant[0]), .Y(
        n444) );
  AOI22X1 U53 ( .A(in3_di[54]), .B(n471), .C(in2_di[54]), .D(n470), .Y(n441)
         );
  AOI22X1 U54 ( .A(in1_di[54]), .B(n469), .C(in0_di[54]), .D(grant[0]), .Y(
        n442) );
  AOI22X1 U56 ( .A(in3_di[53]), .B(n471), .C(in2_di[53]), .D(n470), .Y(n439)
         );
  AOI22X1 U57 ( .A(in1_di[53]), .B(n469), .C(in0_di[53]), .D(grant[0]), .Y(
        n440) );
  AOI22X1 U59 ( .A(in3_di[52]), .B(n471), .C(in2_di[52]), .D(n334), .Y(n437)
         );
  AOI22X1 U60 ( .A(in1_di[52]), .B(n469), .C(in0_di[52]), .D(grant[0]), .Y(
        n438) );
  AOI22X1 U62 ( .A(in3_di[51]), .B(n471), .C(in2_di[51]), .D(n334), .Y(n435)
         );
  AOI22X1 U63 ( .A(in1_di[51]), .B(n469), .C(in0_di[51]), .D(grant[0]), .Y(
        n436) );
  AOI22X1 U65 ( .A(in3_di[50]), .B(n471), .C(in2_di[50]), .D(n334), .Y(n433)
         );
  AOI22X1 U66 ( .A(in1_di[50]), .B(n469), .C(in0_di[50]), .D(grant[0]), .Y(
        n434) );
  AOI22X1 U68 ( .A(in3_di[4]), .B(n471), .C(in2_di[4]), .D(n334), .Y(n431) );
  AOI22X1 U69 ( .A(in1_di[4]), .B(n469), .C(in0_di[4]), .D(grant[0]), .Y(n432)
         );
  AOI22X1 U71 ( .A(in3_di[49]), .B(n471), .C(in2_di[49]), .D(n334), .Y(n429)
         );
  AOI22X1 U72 ( .A(in1_di[49]), .B(n469), .C(in0_di[49]), .D(grant[0]), .Y(
        n430) );
  AOI22X1 U74 ( .A(in3_di[48]), .B(n471), .C(in2_di[48]), .D(n334), .Y(n427)
         );
  AOI22X1 U75 ( .A(in1_di[48]), .B(n469), .C(in0_di[48]), .D(grant[0]), .Y(
        n428) );
  AOI22X1 U77 ( .A(in3_di[47]), .B(n471), .C(in2_di[47]), .D(n334), .Y(n425)
         );
  AOI22X1 U78 ( .A(in1_di[47]), .B(n469), .C(in0_di[47]), .D(grant[0]), .Y(
        n426) );
  AOI22X1 U80 ( .A(in3_di[46]), .B(n471), .C(in2_di[46]), .D(n334), .Y(n423)
         );
  AOI22X1 U81 ( .A(in1_di[46]), .B(n469), .C(in0_di[46]), .D(grant[0]), .Y(
        n424) );
  AOI22X1 U83 ( .A(in3_di[45]), .B(n471), .C(in2_di[45]), .D(n334), .Y(n421)
         );
  AOI22X1 U84 ( .A(in1_di[45]), .B(n469), .C(in0_di[45]), .D(grant[0]), .Y(
        n422) );
  AOI22X1 U86 ( .A(in3_di[44]), .B(n471), .C(in2_di[44]), .D(n334), .Y(n419)
         );
  AOI22X1 U87 ( .A(in1_di[44]), .B(n469), .C(in0_di[44]), .D(grant[0]), .Y(
        n420) );
  AOI22X1 U89 ( .A(in3_di[43]), .B(n471), .C(in2_di[43]), .D(n334), .Y(n417)
         );
  AOI22X1 U90 ( .A(in1_di[43]), .B(n332), .C(in0_di[43]), .D(grant[0]), .Y(
        n418) );
  AOI22X1 U92 ( .A(in3_di[42]), .B(n471), .C(in2_di[42]), .D(n334), .Y(n415)
         );
  AOI22X1 U93 ( .A(in1_di[42]), .B(n332), .C(in0_di[42]), .D(grant[0]), .Y(
        n416) );
  AOI22X1 U95 ( .A(in3_di[41]), .B(n471), .C(in2_di[41]), .D(n470), .Y(n413)
         );
  AOI22X1 U96 ( .A(in1_di[41]), .B(n469), .C(in0_di[41]), .D(grant[0]), .Y(
        n414) );
  AOI22X1 U98 ( .A(in3_di[40]), .B(n471), .C(in2_di[40]), .D(n470), .Y(n411)
         );
  AOI22X1 U99 ( .A(in1_di[40]), .B(n469), .C(in0_di[40]), .D(grant[0]), .Y(
        n412) );
  AOI22X1 U101 ( .A(in3_di[3]), .B(n471), .C(in2_di[3]), .D(n470), .Y(n409) );
  AOI22X1 U102 ( .A(in1_di[3]), .B(n469), .C(in0_di[3]), .D(grant[0]), .Y(n410) );
  AOI22X1 U104 ( .A(in3_di[39]), .B(n471), .C(in2_di[39]), .D(n470), .Y(n407)
         );
  AOI22X1 U105 ( .A(in1_di[39]), .B(n469), .C(in0_di[39]), .D(grant[0]), .Y(
        n408) );
  AOI22X1 U107 ( .A(in3_di[38]), .B(n471), .C(in2_di[38]), .D(n470), .Y(n405)
         );
  AOI22X1 U108 ( .A(in1_di[38]), .B(n469), .C(in0_di[38]), .D(grant[0]), .Y(
        n406) );
  AOI22X1 U110 ( .A(in3_di[37]), .B(n471), .C(in2_di[37]), .D(n470), .Y(n403)
         );
  AOI22X1 U111 ( .A(in1_di[37]), .B(n469), .C(in0_di[37]), .D(grant[0]), .Y(
        n404) );
  AOI22X1 U113 ( .A(in3_di[36]), .B(n471), .C(in2_di[36]), .D(n470), .Y(n401)
         );
  AOI22X1 U114 ( .A(in1_di[36]), .B(n469), .C(in0_di[36]), .D(grant[0]), .Y(
        n402) );
  AOI22X1 U116 ( .A(in3_di[35]), .B(n471), .C(in2_di[35]), .D(n470), .Y(n399)
         );
  AOI22X1 U117 ( .A(in1_di[35]), .B(n469), .C(in0_di[35]), .D(grant[0]), .Y(
        n400) );
  AOI22X1 U119 ( .A(in3_di[34]), .B(n471), .C(in2_di[34]), .D(n470), .Y(n397)
         );
  AOI22X1 U120 ( .A(in1_di[34]), .B(n469), .C(in0_di[34]), .D(grant[0]), .Y(
        n398) );
  AOI22X1 U122 ( .A(in3_di[33]), .B(n471), .C(in2_di[33]), .D(n470), .Y(n395)
         );
  AOI22X1 U123 ( .A(in1_di[33]), .B(n469), .C(in0_di[33]), .D(grant[0]), .Y(
        n396) );
  AOI22X1 U125 ( .A(in3_di[32]), .B(n471), .C(in2_di[32]), .D(n470), .Y(n393)
         );
  AOI22X1 U126 ( .A(in1_di[32]), .B(n469), .C(in0_di[32]), .D(grant[0]), .Y(
        n394) );
  AOI22X1 U128 ( .A(in3_di[31]), .B(n336), .C(in2_di[31]), .D(n470), .Y(n391)
         );
  AOI22X1 U129 ( .A(in1_di[31]), .B(n332), .C(in0_di[31]), .D(grant[0]), .Y(
        n392) );
  AOI22X1 U131 ( .A(in3_di[30]), .B(n336), .C(in2_di[30]), .D(n470), .Y(n389)
         );
  AOI22X1 U132 ( .A(in1_di[30]), .B(n332), .C(in0_di[30]), .D(grant[0]), .Y(
        n390) );
  AOI22X1 U134 ( .A(in3_di[2]), .B(n336), .C(in2_di[2]), .D(n334), .Y(n387) );
  AOI22X1 U135 ( .A(in1_di[2]), .B(n332), .C(in0_di[2]), .D(grant[0]), .Y(n388) );
  AOI22X1 U137 ( .A(in3_di[29]), .B(n336), .C(in2_di[29]), .D(n470), .Y(n385)
         );
  AOI22X1 U138 ( .A(in1_di[29]), .B(n332), .C(in0_di[29]), .D(grant[0]), .Y(
        n386) );
  AOI22X1 U140 ( .A(in3_di[28]), .B(n336), .C(in2_di[28]), .D(n334), .Y(n383)
         );
  AOI22X1 U141 ( .A(in1_di[28]), .B(n332), .C(in0_di[28]), .D(grant[0]), .Y(
        n384) );
  AOI22X1 U143 ( .A(in3_di[27]), .B(n336), .C(in2_di[27]), .D(n470), .Y(n381)
         );
  AOI22X1 U144 ( .A(in1_di[27]), .B(n332), .C(in0_di[27]), .D(grant[0]), .Y(
        n382) );
  AOI22X1 U146 ( .A(in3_di[26]), .B(n336), .C(in2_di[26]), .D(n470), .Y(n379)
         );
  AOI22X1 U147 ( .A(in1_di[26]), .B(n332), .C(in0_di[26]), .D(grant[0]), .Y(
        n380) );
  AOI22X1 U149 ( .A(in3_di[25]), .B(n336), .C(in2_di[25]), .D(n470), .Y(n377)
         );
  AOI22X1 U150 ( .A(in1_di[25]), .B(n332), .C(in0_di[25]), .D(grant[0]), .Y(
        n378) );
  AOI22X1 U152 ( .A(in3_di[24]), .B(n336), .C(in2_di[24]), .D(n470), .Y(n375)
         );
  AOI22X1 U153 ( .A(in1_di[24]), .B(n332), .C(in0_di[24]), .D(grant[0]), .Y(
        n376) );
  AOI22X1 U155 ( .A(in3_di[23]), .B(n336), .C(in2_di[23]), .D(n470), .Y(n373)
         );
  AOI22X1 U156 ( .A(in1_di[23]), .B(n332), .C(in0_di[23]), .D(grant[0]), .Y(
        n374) );
  AOI22X1 U158 ( .A(in3_di[22]), .B(n336), .C(in2_di[22]), .D(n470), .Y(n371)
         );
  AOI22X1 U159 ( .A(in1_di[22]), .B(n332), .C(in0_di[22]), .D(grant[0]), .Y(
        n372) );
  AOI22X1 U161 ( .A(in3_di[21]), .B(n336), .C(in2_di[21]), .D(n470), .Y(n369)
         );
  AOI22X1 U162 ( .A(in1_di[21]), .B(n332), .C(in0_di[21]), .D(grant[0]), .Y(
        n370) );
  AOI22X1 U164 ( .A(in3_di[20]), .B(n336), .C(in2_di[20]), .D(n470), .Y(n367)
         );
  AOI22X1 U165 ( .A(in1_di[20]), .B(n332), .C(in0_di[20]), .D(grant[0]), .Y(
        n368) );
  AOI22X1 U167 ( .A(in3_di[1]), .B(n336), .C(in2_di[1]), .D(n334), .Y(n365) );
  AOI22X1 U168 ( .A(in1_di[1]), .B(n469), .C(in0_di[1]), .D(grant[0]), .Y(n366) );
  AOI22X1 U170 ( .A(in3_di[19]), .B(n336), .C(in2_di[19]), .D(n334), .Y(n363)
         );
  AOI22X1 U171 ( .A(in1_di[19]), .B(n469), .C(in0_di[19]), .D(grant[0]), .Y(
        n364) );
  AOI22X1 U173 ( .A(in3_di[18]), .B(n336), .C(in2_di[18]), .D(n334), .Y(n361)
         );
  AOI22X1 U174 ( .A(in1_di[18]), .B(n469), .C(in0_di[18]), .D(grant[0]), .Y(
        n362) );
  AOI22X1 U176 ( .A(in3_di[17]), .B(n336), .C(in2_di[17]), .D(n334), .Y(n359)
         );
  AOI22X1 U177 ( .A(in1_di[17]), .B(n469), .C(in0_di[17]), .D(grant[0]), .Y(
        n360) );
  AOI22X1 U179 ( .A(in3_di[16]), .B(n336), .C(in2_di[16]), .D(n334), .Y(n357)
         );
  AOI22X1 U180 ( .A(in1_di[16]), .B(n469), .C(in0_di[16]), .D(grant[0]), .Y(
        n358) );
  AOI22X1 U182 ( .A(in3_di[15]), .B(n336), .C(in2_di[15]), .D(n334), .Y(n355)
         );
  AOI22X1 U183 ( .A(in1_di[15]), .B(n469), .C(in0_di[15]), .D(grant[0]), .Y(
        n356) );
  AOI22X1 U185 ( .A(in3_di[14]), .B(n336), .C(in2_di[14]), .D(n334), .Y(n353)
         );
  AOI22X1 U186 ( .A(in1_di[14]), .B(n469), .C(in0_di[14]), .D(grant[0]), .Y(
        n354) );
  AOI22X1 U188 ( .A(in3_di[13]), .B(n336), .C(in2_di[13]), .D(n334), .Y(n351)
         );
  AOI22X1 U189 ( .A(in1_di[13]), .B(n469), .C(in0_di[13]), .D(grant[0]), .Y(
        n352) );
  AOI22X1 U191 ( .A(in3_di[12]), .B(n336), .C(in2_di[12]), .D(n334), .Y(n349)
         );
  AOI22X1 U192 ( .A(in1_di[12]), .B(n469), .C(in0_di[12]), .D(grant[0]), .Y(
        n350) );
  AOI22X1 U194 ( .A(in3_di[11]), .B(n336), .C(in2_di[11]), .D(n334), .Y(n347)
         );
  AOI22X1 U195 ( .A(in1_di[11]), .B(n469), .C(in0_di[11]), .D(grant[0]), .Y(
        n348) );
  AOI22X1 U197 ( .A(in3_di[10]), .B(n336), .C(in2_di[10]), .D(n334), .Y(n345)
         );
  AOI22X1 U198 ( .A(in1_di[10]), .B(n469), .C(in0_di[10]), .D(grant[0]), .Y(
        n346) );
  AOI22X1 U200 ( .A(in3_di[0]), .B(n336), .C(in2_di[0]), .D(n334), .Y(n343) );
  NOR3X1 U201 ( .A(grant[0]), .B(grant[1]), .C(n474), .Y(n470) );
  NOR3X1 U202 ( .A(grant[1]), .B(grant[2]), .C(n329), .Y(n471) );
  AOI22X1 U204 ( .A(in1_di[0]), .B(n469), .C(in0_di[0]), .D(grant[0]), .Y(n344) );
  AND2X1 U3 ( .A(buf_ri), .B(grant[3]), .Y(in3_ri) );
  AND2X1 U4 ( .A(n189), .B(n253), .Y(sel_data[57]) );
  AND2X1 U5 ( .A(n190), .B(n254), .Y(sel_data[58]) );
  AND2X1 U6 ( .A(n191), .B(n255), .Y(sel_data[59]) );
  AND2X1 U7 ( .A(n193), .B(n257), .Y(sel_data[60]) );
  AND2X1 U8 ( .A(n194), .B(n258), .Y(sel_data[61]) );
  AND2X1 U9 ( .A(n195), .B(n259), .Y(sel_data[62]) );
  AND2X1 U10 ( .A(n196), .B(n260), .Y(sel_data[63]) );
  AND2X1 U13 ( .A(n181), .B(n245), .Y(sel_data[4]) );
  AND2X1 U16 ( .A(n192), .B(n256), .Y(sel_data[5]) );
  AND2X1 U19 ( .A(n197), .B(n261), .Y(sel_data[6]) );
  AND2X1 U22 ( .A(n198), .B(n262), .Y(sel_data[7]) );
  AND2X1 U25 ( .A(n199), .B(n263), .Y(sel_data[8]) );
  AND2X1 U28 ( .A(n200), .B(n264), .Y(sel_data[9]) );
  AND2X1 U31 ( .A(n2), .B(n202), .Y(sel_data[10]) );
  AND2X1 U34 ( .A(n3), .B(n203), .Y(sel_data[11]) );
  AND2X1 U37 ( .A(n140), .B(n204), .Y(sel_data[12]) );
  AND2X1 U40 ( .A(n141), .B(n205), .Y(sel_data[13]) );
  AND2X1 U43 ( .A(n142), .B(n206), .Y(sel_data[14]) );
  AND2X1 U46 ( .A(n143), .B(n207), .Y(sel_data[15]) );
  AND2X1 U49 ( .A(n144), .B(n208), .Y(sel_data[16]) );
  AND2X1 U52 ( .A(n145), .B(n209), .Y(sel_data[17]) );
  AND2X1 U55 ( .A(n146), .B(n210), .Y(sel_data[18]) );
  AND2X1 U58 ( .A(n147), .B(n211), .Y(sel_data[19]) );
  AND2X1 U61 ( .A(n149), .B(n213), .Y(sel_data[20]) );
  AND2X1 U64 ( .A(n150), .B(n214), .Y(sel_data[21]) );
  AND2X1 U67 ( .A(n151), .B(n215), .Y(sel_data[22]) );
  AND2X1 U70 ( .A(n152), .B(n216), .Y(sel_data[23]) );
  AND2X1 U73 ( .A(n153), .B(n217), .Y(sel_data[24]) );
  AND2X1 U76 ( .A(n154), .B(n218), .Y(sel_data[25]) );
  AND2X1 U79 ( .A(n155), .B(n219), .Y(sel_data[26]) );
  AND2X1 U82 ( .A(n156), .B(n220), .Y(sel_data[27]) );
  AND2X1 U85 ( .A(n157), .B(n221), .Y(sel_data[28]) );
  AND2X1 U88 ( .A(n158), .B(n222), .Y(sel_data[29]) );
  AND2X1 U91 ( .A(n160), .B(n224), .Y(sel_data[30]) );
  AND2X1 U94 ( .A(n161), .B(n225), .Y(sel_data[31]) );
  AND2X1 U97 ( .A(n162), .B(n226), .Y(sel_data[32]) );
  AND2X1 U100 ( .A(n163), .B(n227), .Y(sel_data[33]) );
  AND2X1 U103 ( .A(n164), .B(n228), .Y(sel_data[34]) );
  AND2X1 U106 ( .A(n165), .B(n229), .Y(sel_data[35]) );
  AND2X1 U109 ( .A(n166), .B(n230), .Y(sel_data[36]) );
  AND2X1 U112 ( .A(n167), .B(n231), .Y(sel_data[37]) );
  AND2X1 U115 ( .A(n168), .B(n232), .Y(sel_data[38]) );
  AND2X1 U118 ( .A(n169), .B(n233), .Y(sel_data[39]) );
  AND2X1 U121 ( .A(n171), .B(n235), .Y(sel_data[40]) );
  AND2X1 U124 ( .A(n172), .B(n236), .Y(sel_data[41]) );
  AND2X1 U127 ( .A(n173), .B(n237), .Y(sel_data[42]) );
  AND2X1 U130 ( .A(n174), .B(n238), .Y(sel_data[43]) );
  AND2X1 U133 ( .A(n175), .B(n239), .Y(sel_data[44]) );
  AND2X1 U136 ( .A(n176), .B(n240), .Y(sel_data[45]) );
  AND2X1 U139 ( .A(n177), .B(n241), .Y(sel_data[46]) );
  AND2X1 U142 ( .A(n178), .B(n242), .Y(sel_data[47]) );
  AND2X1 U145 ( .A(n179), .B(n243), .Y(sel_data[48]) );
  AND2X1 U148 ( .A(n180), .B(n244), .Y(sel_data[49]) );
  AND2X1 U151 ( .A(n182), .B(n246), .Y(sel_data[50]) );
  AND2X1 U154 ( .A(n183), .B(n247), .Y(sel_data[51]) );
  AND2X1 U157 ( .A(n184), .B(n248), .Y(sel_data[52]) );
  AND2X1 U160 ( .A(n185), .B(n249), .Y(sel_data[53]) );
  AND2X1 U163 ( .A(n186), .B(n250), .Y(sel_data[54]) );
  AND2X1 U166 ( .A(n187), .B(n251), .Y(sel_data[55]) );
  AND2X1 U169 ( .A(n188), .B(n252), .Y(sel_data[56]) );
  AND2X1 U172 ( .A(n1), .B(n201), .Y(sel_data[0]) );
  AND2X1 U175 ( .A(n148), .B(n212), .Y(sel_data[1]) );
  AND2X1 U178 ( .A(n159), .B(n223), .Y(sel_data[2]) );
  AND2X1 U181 ( .A(n170), .B(n234), .Y(sel_data[3]) );
  AND2X1 U184 ( .A(grant[1]), .B(n338), .Y(n469) );
  OR2X1 U187 ( .A(in0_ri), .B(n331), .Y(n330) );
  OR2X1 U190 ( .A(n339), .B(in1_ri), .Y(n331) );
  OR2X1 U193 ( .A(in2_ri), .B(in3_ri), .Y(n339) );
  AND2X1 U196 ( .A(buf_ri), .B(grant[2]), .Y(in2_ri) );
  BUFX2 U199 ( .A(n344), .Y(n1) );
  BUFX2 U203 ( .A(n346), .Y(n2) );
  BUFX2 U205 ( .A(n348), .Y(n3) );
  BUFX2 U206 ( .A(n350), .Y(n140) );
  BUFX2 U207 ( .A(n352), .Y(n141) );
  BUFX2 U208 ( .A(n354), .Y(n142) );
  BUFX2 U209 ( .A(n356), .Y(n143) );
  BUFX2 U210 ( .A(n358), .Y(n144) );
  BUFX2 U211 ( .A(n360), .Y(n145) );
  BUFX2 U212 ( .A(n362), .Y(n146) );
  BUFX2 U213 ( .A(n364), .Y(n147) );
  BUFX2 U214 ( .A(n366), .Y(n148) );
  BUFX2 U215 ( .A(n368), .Y(n149) );
  BUFX2 U216 ( .A(n370), .Y(n150) );
  BUFX2 U217 ( .A(n372), .Y(n151) );
  BUFX2 U218 ( .A(n374), .Y(n152) );
  BUFX2 U219 ( .A(n376), .Y(n153) );
  BUFX2 U220 ( .A(n378), .Y(n154) );
  BUFX2 U221 ( .A(n380), .Y(n155) );
  BUFX2 U222 ( .A(n382), .Y(n156) );
  BUFX2 U223 ( .A(n384), .Y(n157) );
  BUFX2 U224 ( .A(n386), .Y(n158) );
  BUFX2 U225 ( .A(n388), .Y(n159) );
  BUFX2 U226 ( .A(n390), .Y(n160) );
  BUFX2 U227 ( .A(n392), .Y(n161) );
  BUFX2 U228 ( .A(n394), .Y(n162) );
  BUFX2 U229 ( .A(n396), .Y(n163) );
  BUFX2 U230 ( .A(n398), .Y(n164) );
  BUFX2 U231 ( .A(n400), .Y(n165) );
  BUFX2 U232 ( .A(n402), .Y(n166) );
  BUFX2 U233 ( .A(n404), .Y(n167) );
  BUFX2 U234 ( .A(n406), .Y(n168) );
  BUFX2 U235 ( .A(n408), .Y(n169) );
  BUFX2 U236 ( .A(n410), .Y(n170) );
  BUFX2 U237 ( .A(n412), .Y(n171) );
  BUFX2 U238 ( .A(n414), .Y(n172) );
  BUFX2 U239 ( .A(n416), .Y(n173) );
  BUFX2 U240 ( .A(n418), .Y(n174) );
  BUFX2 U241 ( .A(n420), .Y(n175) );
  BUFX2 U242 ( .A(n422), .Y(n176) );
  BUFX2 U243 ( .A(n424), .Y(n177) );
  BUFX2 U244 ( .A(n426), .Y(n178) );
  BUFX2 U245 ( .A(n428), .Y(n179) );
  BUFX2 U246 ( .A(n430), .Y(n180) );
  BUFX2 U247 ( .A(n432), .Y(n181) );
  BUFX2 U248 ( .A(n434), .Y(n182) );
  BUFX2 U249 ( .A(n436), .Y(n183) );
  BUFX2 U250 ( .A(n438), .Y(n184) );
  BUFX2 U251 ( .A(n440), .Y(n185) );
  BUFX2 U252 ( .A(n442), .Y(n186) );
  BUFX2 U253 ( .A(n444), .Y(n187) );
  BUFX2 U254 ( .A(n446), .Y(n188) );
  BUFX2 U255 ( .A(n448), .Y(n189) );
  BUFX2 U256 ( .A(n450), .Y(n190) );
  BUFX2 U257 ( .A(n452), .Y(n191) );
  BUFX2 U258 ( .A(n454), .Y(n192) );
  BUFX2 U259 ( .A(n456), .Y(n193) );
  BUFX2 U260 ( .A(n458), .Y(n194) );
  BUFX2 U261 ( .A(n460), .Y(n195) );
  BUFX2 U262 ( .A(n462), .Y(n196) );
  BUFX2 U263 ( .A(n464), .Y(n197) );
  BUFX2 U264 ( .A(n466), .Y(n198) );
  BUFX2 U265 ( .A(n468), .Y(n199) );
  BUFX2 U266 ( .A(n473), .Y(n200) );
  BUFX2 U267 ( .A(n343), .Y(n201) );
  BUFX2 U268 ( .A(n345), .Y(n202) );
  BUFX2 U269 ( .A(n347), .Y(n203) );
  BUFX2 U270 ( .A(n349), .Y(n204) );
  BUFX2 U271 ( .A(n351), .Y(n205) );
  BUFX2 U272 ( .A(n353), .Y(n206) );
  BUFX2 U273 ( .A(n355), .Y(n207) );
  BUFX2 U274 ( .A(n357), .Y(n208) );
  BUFX2 U275 ( .A(n359), .Y(n209) );
  BUFX2 U276 ( .A(n361), .Y(n210) );
  BUFX2 U277 ( .A(n363), .Y(n211) );
  BUFX2 U278 ( .A(n365), .Y(n212) );
  BUFX2 U279 ( .A(n367), .Y(n213) );
  BUFX2 U280 ( .A(n369), .Y(n214) );
  BUFX2 U281 ( .A(n371), .Y(n215) );
  BUFX2 U282 ( .A(n373), .Y(n216) );
  BUFX2 U283 ( .A(n375), .Y(n217) );
  BUFX2 U284 ( .A(n377), .Y(n218) );
  BUFX2 U285 ( .A(n379), .Y(n219) );
  BUFX2 U286 ( .A(n381), .Y(n220) );
  BUFX2 U287 ( .A(n383), .Y(n221) );
  BUFX2 U288 ( .A(n385), .Y(n222) );
  BUFX2 U289 ( .A(n387), .Y(n223) );
  BUFX2 U290 ( .A(n389), .Y(n224) );
  BUFX2 U291 ( .A(n391), .Y(n225) );
  BUFX2 U292 ( .A(n393), .Y(n226) );
  BUFX2 U293 ( .A(n395), .Y(n227) );
  BUFX2 U294 ( .A(n397), .Y(n228) );
  BUFX2 U295 ( .A(n399), .Y(n229) );
  BUFX2 U296 ( .A(n401), .Y(n230) );
  BUFX2 U297 ( .A(n403), .Y(n231) );
  BUFX2 U298 ( .A(n405), .Y(n232) );
  BUFX2 U299 ( .A(n407), .Y(n233) );
  BUFX2 U300 ( .A(n409), .Y(n234) );
  BUFX2 U301 ( .A(n411), .Y(n235) );
  BUFX2 U302 ( .A(n413), .Y(n236) );
  BUFX2 U303 ( .A(n415), .Y(n237) );
  BUFX2 U304 ( .A(n417), .Y(n238) );
  BUFX2 U305 ( .A(n419), .Y(n239) );
  BUFX2 U306 ( .A(n421), .Y(n240) );
  BUFX2 U307 ( .A(n423), .Y(n241) );
  BUFX2 U308 ( .A(n425), .Y(n242) );
  BUFX2 U309 ( .A(n427), .Y(n243) );
  BUFX2 U310 ( .A(n429), .Y(n244) );
  BUFX2 U311 ( .A(n431), .Y(n245) );
  BUFX2 U312 ( .A(n433), .Y(n246) );
  BUFX2 U313 ( .A(n435), .Y(n247) );
  BUFX2 U314 ( .A(n437), .Y(n248) );
  BUFX2 U315 ( .A(n439), .Y(n249) );
  BUFX2 U316 ( .A(n441), .Y(n250) );
  BUFX2 U317 ( .A(n443), .Y(n251) );
  BUFX2 U318 ( .A(n445), .Y(n252) );
  BUFX2 U319 ( .A(n447), .Y(n253) );
  BUFX2 U320 ( .A(n449), .Y(n254) );
  BUFX2 U321 ( .A(n451), .Y(n255) );
  BUFX2 U322 ( .A(n453), .Y(n256) );
  BUFX2 U323 ( .A(n455), .Y(n257) );
  BUFX2 U324 ( .A(n457), .Y(n258) );
  BUFX2 U325 ( .A(n459), .Y(n259) );
  BUFX2 U326 ( .A(n461), .Y(n260) );
  BUFX2 U327 ( .A(n463), .Y(n261) );
  BUFX2 U328 ( .A(n465), .Y(n262) );
  BUFX2 U329 ( .A(n467), .Y(n263) );
  BUFX2 U330 ( .A(n472), .Y(n264) );
  INVX1 U331 ( .A(sel_data[0]), .Y(n265) );
  INVX1 U332 ( .A(sel_data[10]), .Y(n266) );
  INVX1 U333 ( .A(sel_data[11]), .Y(n267) );
  INVX1 U334 ( .A(sel_data[12]), .Y(n268) );
  INVX1 U335 ( .A(sel_data[13]), .Y(n269) );
  INVX1 U336 ( .A(sel_data[14]), .Y(n270) );
  INVX1 U337 ( .A(sel_data[15]), .Y(n271) );
  INVX1 U338 ( .A(sel_data[16]), .Y(n272) );
  INVX1 U339 ( .A(sel_data[17]), .Y(n273) );
  INVX1 U340 ( .A(sel_data[18]), .Y(n274) );
  INVX1 U341 ( .A(sel_data[19]), .Y(n275) );
  INVX1 U342 ( .A(sel_data[1]), .Y(n276) );
  INVX1 U343 ( .A(sel_data[20]), .Y(n277) );
  INVX1 U344 ( .A(sel_data[21]), .Y(n278) );
  INVX1 U345 ( .A(sel_data[22]), .Y(n279) );
  INVX1 U346 ( .A(sel_data[23]), .Y(n280) );
  INVX1 U347 ( .A(sel_data[24]), .Y(n281) );
  INVX1 U348 ( .A(sel_data[25]), .Y(n282) );
  INVX1 U349 ( .A(sel_data[26]), .Y(n283) );
  INVX1 U350 ( .A(sel_data[27]), .Y(n284) );
  INVX1 U351 ( .A(sel_data[28]), .Y(n285) );
  INVX1 U352 ( .A(sel_data[29]), .Y(n286) );
  INVX1 U353 ( .A(sel_data[2]), .Y(n287) );
  INVX1 U354 ( .A(sel_data[30]), .Y(n288) );
  INVX1 U355 ( .A(sel_data[31]), .Y(n289) );
  INVX1 U356 ( .A(sel_data[32]), .Y(n290) );
  INVX1 U357 ( .A(sel_data[33]), .Y(n291) );
  INVX1 U358 ( .A(sel_data[34]), .Y(n292) );
  INVX1 U359 ( .A(sel_data[35]), .Y(n293) );
  INVX1 U360 ( .A(sel_data[36]), .Y(n294) );
  INVX1 U361 ( .A(sel_data[37]), .Y(n295) );
  INVX1 U362 ( .A(sel_data[38]), .Y(n296) );
  INVX1 U363 ( .A(sel_data[39]), .Y(n297) );
  INVX1 U364 ( .A(sel_data[3]), .Y(n298) );
  INVX1 U365 ( .A(sel_data[40]), .Y(n299) );
  INVX1 U366 ( .A(sel_data[41]), .Y(n300) );
  INVX1 U367 ( .A(sel_data[42]), .Y(n301) );
  INVX1 U368 ( .A(sel_data[43]), .Y(n302) );
  INVX1 U369 ( .A(sel_data[44]), .Y(n303) );
  INVX1 U370 ( .A(sel_data[45]), .Y(n304) );
  INVX1 U371 ( .A(sel_data[46]), .Y(n305) );
  INVX1 U372 ( .A(sel_data[47]), .Y(n306) );
  INVX1 U373 ( .A(sel_data[48]), .Y(n307) );
  INVX1 U374 ( .A(sel_data[49]), .Y(n308) );
  INVX1 U375 ( .A(sel_data[4]), .Y(n309) );
  INVX1 U376 ( .A(sel_data[50]), .Y(n310) );
  INVX1 U377 ( .A(sel_data[51]), .Y(n311) );
  INVX1 U378 ( .A(sel_data[52]), .Y(n312) );
  INVX1 U379 ( .A(sel_data[53]), .Y(n313) );
  INVX1 U380 ( .A(sel_data[54]), .Y(n314) );
  INVX1 U381 ( .A(sel_data[55]), .Y(n315) );
  INVX1 U382 ( .A(sel_data[56]), .Y(n316) );
  INVX1 U383 ( .A(sel_data[57]), .Y(n317) );
  INVX1 U384 ( .A(sel_data[58]), .Y(n318) );
  INVX1 U385 ( .A(sel_data[59]), .Y(n319) );
  INVX1 U386 ( .A(sel_data[5]), .Y(n320) );
  INVX1 U387 ( .A(sel_data[60]), .Y(n321) );
  INVX1 U388 ( .A(sel_data[61]), .Y(n322) );
  INVX1 U389 ( .A(sel_data[62]), .Y(n323) );
  INVX1 U390 ( .A(sel_data[63]), .Y(n324) );
  INVX1 U391 ( .A(sel_data[6]), .Y(n325) );
  INVX1 U392 ( .A(sel_data[7]), .Y(n326) );
  INVX1 U393 ( .A(sel_data[8]), .Y(n327) );
  INVX1 U394 ( .A(sel_data[9]), .Y(n328) );
  AND2X1 U395 ( .A(n338), .B(grant[3]), .Y(n342) );
  INVX1 U396 ( .A(n342), .Y(n329) );
  AND2X1 U397 ( .A(buf_ri), .B(grant[0]), .Y(in0_ri) );
  AND2X1 U398 ( .A(buf_ri), .B(grant[1]), .Y(in1_ri) );
  INVX1 U399 ( .A(n333), .Y(n332) );
  INVX1 U400 ( .A(n335), .Y(n334) );
  INVX1 U401 ( .A(n337), .Y(n336) );
  INVX1 U402 ( .A(n469), .Y(n333) );
  INVX1 U403 ( .A(n470), .Y(n335) );
  INVX1 U404 ( .A(n471), .Y(n337) );
  INVX1 U405 ( .A(grant[2]), .Y(n474) );
  INVX1 U406 ( .A(grant[0]), .Y(n338) );
endmodule


module rr4_arbiter_1 ( clk, reset, request, advance, grant );
  input [3:0] request;
  output [3:0] grant;
  input clk, reset, advance;
  wire   n70, n72, n73, n75, n77, n51, n110, n47, n107, n106, n111, n53, n67,
         n65, n104, n105, n50, n102, n46, n100, n99, n103, n52, n66, n64, n97,
         n98, n96, n45, n94, n108, n59, n54, n91, n44, n89, n63, n56, n112,
         n86, n87, n85, n84, n113, n83, n92, n93, n82, n81, n80, n115, n88,
         n79, n49, n48, n114, n90, n95, n101, n109, n58, n61, n62, n60, n69;
  wire   [3:0] ptr;

  DFFSR ptr_reg_0_ ( .D(n70), .CLK(clk), .R(1'b1), .S(n72), .Q(ptr[0]) );
  DFFSR ptr_reg_2_ ( .D(n73), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[2]) );
  DFFSR ptr_reg_3_ ( .D(n75), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[3]) );
  DFFSR ptr_reg_1_ ( .D(n77), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[1]) );
  OAI21X1 U3 ( .A(n51), .B(n110), .C(n47), .Y(n77) );
  AOI21X1 U5 ( .A(advance), .B(n107), .C(n106), .Y(n111) );
  NOR3X1 U6 ( .A(n53), .B(request[3]), .C(request[2]), .Y(n106) );
  AOI22X1 U7 ( .A(n67), .B(advance), .C(n65), .D(n104), .Y(n105) );
  OAI21X1 U8 ( .A(n50), .B(n102), .C(n46), .Y(n75) );
  AOI21X1 U10 ( .A(advance), .B(n100), .C(n99), .Y(n103) );
  NOR3X1 U11 ( .A(n52), .B(request[1]), .C(request[0]), .Y(n99) );
  AOI22X1 U12 ( .A(n66), .B(advance), .C(n64), .D(n97), .Y(n98) );
  OAI21X1 U13 ( .A(n96), .B(n104), .C(n45), .Y(n73) );
  INVX1 U15 ( .A(n94), .Y(n96) );
  OAI21X1 U16 ( .A(n108), .B(n59), .C(n54), .Y(n94) );
  INVX1 U17 ( .A(reset), .Y(n72) );
  OAI21X1 U18 ( .A(n91), .B(n97), .C(n44), .Y(n70) );
  INVX1 U20 ( .A(n89), .Y(n91) );
  OAI21X1 U21 ( .A(n108), .B(n63), .C(n56), .Y(n89) );
  INVX1 U22 ( .A(advance), .Y(n108) );
  AOI21X1 U23 ( .A(n63), .B(n56), .C(n97), .Y(n112) );
  NAND3X1 U24 ( .A(n66), .B(n110), .C(n86), .Y(n87) );
  AND2X1 U25 ( .A(n102), .B(n104), .Y(n86) );
  AOI21X1 U26 ( .A(n85), .B(n84), .C(n102), .Y(n113) );
  INVX1 U28 ( .A(n67), .Y(n85) );
  NAND3X1 U30 ( .A(n67), .B(n110), .C(n83), .Y(n92) );
  AND2X1 U31 ( .A(n97), .B(n102), .Y(n83) );
  AOI21X1 U32 ( .A(n110), .B(n107), .C(n65), .Y(n93) );
  INVX1 U33 ( .A(n82), .Y(n107) );
  AOI21X1 U34 ( .A(n97), .B(n64), .C(n66), .Y(n82) );
  INVX1 U35 ( .A(request[3]), .Y(n97) );
  AOI21X1 U36 ( .A(n81), .B(n80), .C(n110), .Y(n115) );
  INVX1 U37 ( .A(request[0]), .Y(n110) );
  AOI21X1 U39 ( .A(n102), .B(n100), .C(n64), .Y(n88) );
  INVX1 U40 ( .A(n79), .Y(n100) );
  AOI21X1 U41 ( .A(n104), .B(n65), .C(n67), .Y(n79) );
  INVX1 U42 ( .A(request[1]), .Y(n104) );
  INVX1 U43 ( .A(request[2]), .Y(n102) );
  INVX1 U44 ( .A(n66), .Y(n81) );
  OR2X1 U4 ( .A(n63), .B(request[3]), .Y(n80) );
  OR2X1 U9 ( .A(n59), .B(request[1]), .Y(n84) );
  AND2X1 U14 ( .A(n49), .B(n48), .Y(n114) );
  INVX1 U19 ( .A(n114), .Y(grant[1]) );
  AND2X1 U27 ( .A(n66), .B(n108), .Y(n90) );
  INVX1 U29 ( .A(n90), .Y(n44) );
  AND2X1 U38 ( .A(n67), .B(n108), .Y(n95) );
  INVX1 U49 ( .A(n95), .Y(n45) );
  AND2X1 U50 ( .A(n64), .B(n108), .Y(n101) );
  INVX1 U51 ( .A(n101), .Y(n46) );
  AND2X1 U52 ( .A(n65), .B(n108), .Y(n109) );
  INVX1 U53 ( .A(n109), .Y(n47) );
  AND2X1 U54 ( .A(request[1]), .B(n58), .Y(n61) );
  INVX1 U55 ( .A(n61), .Y(n48) );
  AND2X1 U56 ( .A(request[1]), .B(n62), .Y(n60) );
  INVX1 U57 ( .A(n60), .Y(n49) );
  BUFX2 U58 ( .A(n103), .Y(n50) );
  BUFX2 U59 ( .A(n111), .Y(n51) );
  BUFX2 U60 ( .A(n98), .Y(n52) );
  BUFX2 U61 ( .A(n105), .Y(n53) );
  BUFX2 U62 ( .A(n92), .Y(n54) );
  BUFX2 U63 ( .A(n112), .Y(grant[3]) );
  BUFX2 U64 ( .A(n87), .Y(n56) );
  BUFX2 U65 ( .A(n113), .Y(grant[2]) );
  INVX1 U66 ( .A(n59), .Y(n58) );
  BUFX2 U67 ( .A(n93), .Y(n59) );
  INVX1 U68 ( .A(n54), .Y(n62) );
  BUFX2 U69 ( .A(n88), .Y(n63) );
  BUFX2 U70 ( .A(ptr[3]), .Y(n64) );
  BUFX2 U71 ( .A(ptr[1]), .Y(n65) );
  BUFX2 U72 ( .A(ptr[0]), .Y(n66) );
  BUFX2 U73 ( .A(ptr[2]), .Y(n67) );
  INVX1 U74 ( .A(n69), .Y(grant[0]) );
  INVX1 U75 ( .A(n115), .Y(n69) );
endmodule


module buffer_6 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n7, n278, n434, n402, n442, n401, n411, n443, n400, n444, n399, n445,
         n398, n446, n397, n447, n396, n448, n395, n449, n394, n450, n393,
         n451, n392, n452, n391, n453, n390, n454, n389, n455, n388, n456,
         n387, n457, n386, n458, n349, n495, n348, n496, n347, n497, n346,
         n498, n275, n344, n345, n273, n343, n274, n342, n341, n340, n339,
         n338, n337, n336, n335, n334, n333, n332, n331, n330, n329, n272,
         n328, n327, n326, n325, n324, n323, n322, n321, n320, n319, n318,
         n317, n271, n316, n315, n314, n313, n312, n311, n310, n276, n309,
         n308, n307, n306, n305, n270, n304, n303, n302, n301, n300, n299,
         n277, n298, n297, n296, n295, n294, n293, n269, n292, n291, n290,
         n289, n288, n287, n286, n285, n284, n283, n282, n281, n385, n459,
         n384, n460, n383, n461, n382, n462, n381, n463, n380, n464, n379,
         n465, n378, n466, n377, n467, n376, n468, n375, n469, n374, n470,
         n373, n471, n372, n472, n371, n473, n370, n474, n369, n475, n368,
         n476, n367, n477, n366, n478, n365, n479, n364, n480, n363, n481,
         n362, n482, n361, n483, n360, n484, n359, n485, n358, n486, n357,
         n487, n356, n488, n355, n489, n354, n490, n353, n491, n352, n492,
         n351, n493, n350, n494, n409, n435, n408, n436, n407, n437, n406,
         n438, n405, n439, n404, n440, n403, n441, n6, n433, n5, n280, n279,
         n225, n223;

  DFFSR full_reg ( .D(n7), .CLK(clk), .R(n278), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_56_ ( .D(n402), .CLK(clk), .R(n278), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_55_ ( .D(n401), .CLK(clk), .R(n411), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_54_ ( .D(n400), .CLK(clk), .R(n411), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_53_ ( .D(n399), .CLK(clk), .R(n411), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_52_ ( .D(n398), .CLK(clk), .R(n411), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_51_ ( .D(n397), .CLK(clk), .R(n411), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_50_ ( .D(n396), .CLK(clk), .R(n411), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_49_ ( .D(n395), .CLK(clk), .R(n411), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_48_ ( .D(n394), .CLK(clk), .R(n411), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_47_ ( .D(n393), .CLK(clk), .R(n278), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_46_ ( .D(n392), .CLK(clk), .R(n278), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_45_ ( .D(n391), .CLK(clk), .R(n278), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_44_ ( .D(n390), .CLK(clk), .R(n278), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_43_ ( .D(n389), .CLK(clk), .R(n278), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_42_ ( .D(n388), .CLK(clk), .R(n278), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_41_ ( .D(n387), .CLK(clk), .R(n278), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_40_ ( .D(n386), .CLK(clk), .R(n411), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_3_ ( .D(n349), .CLK(clk), .R(n278), .S(1'b1), .Q(n495) );
  DFFSR data_q_reg_2_ ( .D(n348), .CLK(clk), .R(n278), .S(1'b1), .Q(n496) );
  DFFSR data_q_reg_1_ ( .D(n347), .CLK(clk), .R(n278), .S(1'b1), .Q(n497) );
  DFFSR data_q_reg_0_ ( .D(n346), .CLK(clk), .R(n278), .S(1'b1), .Q(n498) );
  INVX1 U67 ( .A(reset), .Y(n411) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n275), .C(buffer_di[0]), .D(n344), .Y(
        n345) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n273), .C(buffer_di[1]), .D(n344), .Y(
        n343) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n274), .C(buffer_di[2]), .D(n344), .Y(
        n342) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n344), .Y(
        n341) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n344), .Y(
        n340) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n344), .Y(
        n339) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n344), .Y(
        n338) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n344), .Y(
        n337) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n344), .Y(
        n336) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n344), .Y(
        n335) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n344), .Y(
        n334) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n344), .Y(
        n333) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n344), .Y(
        n332) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n344), .Y(
        n331) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n274), .C(buffer_di[14]), .D(n344), .Y(
        n330) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n274), .C(buffer_di[15]), .D(n344), .Y(
        n329) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n274), .C(buffer_di[16]), .D(n272), .Y(
        n328) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n274), .C(buffer_di[17]), .D(n272), .Y(
        n327) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n274), .C(buffer_di[18]), .D(n272), .Y(
        n326) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n272), .Y(
        n325) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n272), .Y(
        n324) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n272), .Y(
        n323) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n272), .Y(
        n322) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n272), .Y(
        n321) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n272), .Y(
        n320) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n275), .C(buffer_di[25]), .D(n272), .Y(
        n319) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n275), .C(buffer_di[26]), .D(n272), .Y(
        n318) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n275), .C(buffer_di[27]), .D(n272), .Y(
        n317) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n275), .C(buffer_di[28]), .D(n271), .Y(
        n316) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n275), .C(buffer_di[29]), .D(n271), .Y(
        n315) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n275), .C(buffer_di[30]), .D(n271), .Y(
        n314) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n275), .C(buffer_di[31]), .D(n271), .Y(
        n313) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n275), .C(buffer_di[32]), .D(n271), .Y(
        n312) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n275), .C(buffer_di[33]), .D(n271), .Y(
        n311) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n275), .C(buffer_di[34]), .D(n271), .Y(
        n310) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n276), .C(buffer_di[35]), .D(n271), .Y(
        n309) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n276), .C(buffer_di[36]), .D(n271), .Y(
        n308) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n276), .C(buffer_di[37]), .D(n271), .Y(
        n307) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n276), .C(buffer_di[38]), .D(n271), .Y(
        n306) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n276), .C(buffer_di[39]), .D(n271), .Y(
        n305) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n276), .C(buffer_di[40]), .D(n270), .Y(
        n304) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n276), .C(buffer_di[41]), .D(n270), .Y(
        n303) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n276), .C(buffer_di[42]), .D(n270), .Y(
        n302) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n276), .C(buffer_di[43]), .D(n270), .Y(
        n301) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n276), .C(buffer_di[44]), .D(n270), .Y(
        n300) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n276), .C(buffer_di[45]), .D(n270), .Y(
        n299) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n277), .C(buffer_di[46]), .D(n270), .Y(
        n298) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n277), .C(buffer_di[47]), .D(n270), .Y(
        n297) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n277), .C(buffer_di[48]), .D(n270), .Y(
        n296) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n277), .C(buffer_di[49]), .D(n270), .Y(
        n295) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n277), .C(buffer_di[50]), .D(n270), .Y(
        n294) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n277), .C(buffer_di[51]), .D(n270), .Y(
        n293) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n277), .C(buffer_di[52]), .D(n269), .Y(
        n292) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n277), .C(buffer_di[53]), .D(n269), .Y(
        n291) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n277), .C(buffer_di[54]), .D(n269), .Y(
        n290) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n277), .C(buffer_di[55]), .D(n269), .Y(
        n289) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n277), .C(buffer_di[56]), .D(n269), .Y(
        n288) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n273), .C(buffer_di[57]), .D(n269), .Y(
        n287) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n277), .C(buffer_di[58]), .D(n269), .Y(
        n286) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n276), .C(buffer_di[59]), .D(n269), .Y(
        n285) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n275), .C(buffer_di[60]), .D(n269), .Y(
        n284) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n277), .C(buffer_di[61]), .D(n269), .Y(
        n283) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n276), .C(buffer_di[62]), .D(n269), .Y(
        n282) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n275), .C(buffer_di[63]), .D(n269), .Y(
        n281) );
  DFFSR data_q_reg_39_ ( .D(n385), .CLK(clk), .R(n278), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_38_ ( .D(n384), .CLK(clk), .R(n278), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_37_ ( .D(n383), .CLK(clk), .R(n278), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_36_ ( .D(n382), .CLK(clk), .R(n278), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_35_ ( .D(n381), .CLK(clk), .R(n278), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_34_ ( .D(n380), .CLK(clk), .R(n278), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_33_ ( .D(n379), .CLK(clk), .R(n278), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_32_ ( .D(n378), .CLK(clk), .R(n278), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_31_ ( .D(n377), .CLK(clk), .R(n278), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_30_ ( .D(n376), .CLK(clk), .R(n278), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_29_ ( .D(n375), .CLK(clk), .R(n278), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_28_ ( .D(n374), .CLK(clk), .R(n278), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_27_ ( .D(n373), .CLK(clk), .R(n278), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_26_ ( .D(n372), .CLK(clk), .R(n278), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_25_ ( .D(n371), .CLK(clk), .R(n278), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_24_ ( .D(n370), .CLK(clk), .R(n278), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_23_ ( .D(n369), .CLK(clk), .R(n278), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_22_ ( .D(n368), .CLK(clk), .R(n278), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_21_ ( .D(n367), .CLK(clk), .R(n278), .S(1'b1), .Q(n477) );
  DFFSR data_q_reg_20_ ( .D(n366), .CLK(clk), .R(n278), .S(1'b1), .Q(n478) );
  DFFSR data_q_reg_19_ ( .D(n365), .CLK(clk), .R(n278), .S(1'b1), .Q(n479) );
  DFFSR data_q_reg_18_ ( .D(n364), .CLK(clk), .R(n278), .S(1'b1), .Q(n480) );
  DFFSR data_q_reg_17_ ( .D(n363), .CLK(clk), .R(n278), .S(1'b1), .Q(n481) );
  DFFSR data_q_reg_16_ ( .D(n362), .CLK(clk), .R(n278), .S(1'b1), .Q(n482) );
  DFFSR data_q_reg_15_ ( .D(n361), .CLK(clk), .R(n278), .S(1'b1), .Q(n483) );
  DFFSR data_q_reg_14_ ( .D(n360), .CLK(clk), .R(n278), .S(1'b1), .Q(n484) );
  DFFSR data_q_reg_13_ ( .D(n359), .CLK(clk), .R(n278), .S(1'b1), .Q(n485) );
  DFFSR data_q_reg_12_ ( .D(n358), .CLK(clk), .R(n278), .S(1'b1), .Q(n486) );
  DFFSR data_q_reg_11_ ( .D(n357), .CLK(clk), .R(n411), .S(1'b1), .Q(n487) );
  DFFSR data_q_reg_10_ ( .D(n356), .CLK(clk), .R(n411), .S(1'b1), .Q(n488) );
  DFFSR data_q_reg_9_ ( .D(n355), .CLK(clk), .R(n411), .S(1'b1), .Q(n489) );
  DFFSR data_q_reg_8_ ( .D(n354), .CLK(clk), .R(n411), .S(1'b1), .Q(n490) );
  DFFSR data_q_reg_7_ ( .D(n353), .CLK(clk), .R(n411), .S(1'b1), .Q(n491) );
  DFFSR data_q_reg_6_ ( .D(n352), .CLK(clk), .R(n411), .S(1'b1), .Q(n492) );
  DFFSR data_q_reg_5_ ( .D(n351), .CLK(clk), .R(n411), .S(1'b1), .Q(n493) );
  DFFSR data_q_reg_4_ ( .D(n350), .CLK(clk), .R(n411), .S(1'b1), .Q(n494) );
  DFFSR data_q_reg_63_ ( .D(n409), .CLK(clk), .R(n278), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_62_ ( .D(n408), .CLK(clk), .R(n278), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_61_ ( .D(n407), .CLK(clk), .R(n278), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_60_ ( .D(n406), .CLK(clk), .R(n278), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_59_ ( .D(n405), .CLK(clk), .R(n278), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_58_ ( .D(n404), .CLK(clk), .R(n278), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_57_ ( .D(n403), .CLK(clk), .R(n278), .S(1'b1), .Q(n441) );
  AND2X1 U7 ( .A(buffer_so), .B(n6), .Y(n433) );
  AND2X1 U8 ( .A(buffer_si), .B(buffer_ri), .Y(n344) );
  INVX1 U9 ( .A(n344), .Y(n5) );
  AND2X1 U10 ( .A(buffer_ro), .B(buffer_en), .Y(n280) );
  INVX1 U11 ( .A(n280), .Y(n6) );
  AND2X1 U12 ( .A(buffer_ri), .B(n274), .Y(n279) );
  INVX1 U13 ( .A(n279), .Y(n7) );
  BUFX2 U14 ( .A(n434), .Y(buffer_so) );
  BUFX2 U15 ( .A(n441), .Y(buffer_do[57]) );
  BUFX2 U16 ( .A(n440), .Y(buffer_do[58]) );
  BUFX2 U17 ( .A(n439), .Y(buffer_do[59]) );
  BUFX2 U18 ( .A(n438), .Y(buffer_do[60]) );
  BUFX2 U19 ( .A(n437), .Y(buffer_do[61]) );
  BUFX2 U20 ( .A(n436), .Y(buffer_do[62]) );
  BUFX2 U21 ( .A(n435), .Y(buffer_do[63]) );
  BUFX2 U22 ( .A(n494), .Y(buffer_do[4]) );
  BUFX2 U23 ( .A(n493), .Y(buffer_do[5]) );
  BUFX2 U24 ( .A(n492), .Y(buffer_do[6]) );
  BUFX2 U25 ( .A(n491), .Y(buffer_do[7]) );
  BUFX2 U26 ( .A(n490), .Y(buffer_do[8]) );
  BUFX2 U27 ( .A(n489), .Y(buffer_do[9]) );
  BUFX2 U28 ( .A(n488), .Y(buffer_do[10]) );
  BUFX2 U29 ( .A(n487), .Y(buffer_do[11]) );
  BUFX2 U30 ( .A(n486), .Y(buffer_do[12]) );
  BUFX2 U31 ( .A(n485), .Y(buffer_do[13]) );
  BUFX2 U32 ( .A(n484), .Y(buffer_do[14]) );
  BUFX2 U33 ( .A(n483), .Y(buffer_do[15]) );
  BUFX2 U34 ( .A(n482), .Y(buffer_do[16]) );
  BUFX2 U35 ( .A(n481), .Y(buffer_do[17]) );
  BUFX2 U36 ( .A(n480), .Y(buffer_do[18]) );
  BUFX2 U37 ( .A(n479), .Y(buffer_do[19]) );
  BUFX2 U38 ( .A(n478), .Y(buffer_do[20]) );
  BUFX2 U39 ( .A(n477), .Y(buffer_do[21]) );
  BUFX2 U40 ( .A(n476), .Y(buffer_do[22]) );
  BUFX2 U41 ( .A(n475), .Y(buffer_do[23]) );
  BUFX2 U42 ( .A(n474), .Y(buffer_do[24]) );
  BUFX2 U60 ( .A(n473), .Y(buffer_do[25]) );
  BUFX2 U61 ( .A(n472), .Y(buffer_do[26]) );
  BUFX2 U62 ( .A(n471), .Y(buffer_do[27]) );
  BUFX2 U63 ( .A(n470), .Y(buffer_do[28]) );
  BUFX2 U64 ( .A(n469), .Y(buffer_do[29]) );
  BUFX2 U65 ( .A(n468), .Y(buffer_do[30]) );
  BUFX2 U66 ( .A(n467), .Y(buffer_do[31]) );
  BUFX2 U69 ( .A(n466), .Y(buffer_do[32]) );
  BUFX2 U70 ( .A(n465), .Y(buffer_do[33]) );
  BUFX2 U71 ( .A(n464), .Y(buffer_do[34]) );
  BUFX2 U72 ( .A(n463), .Y(buffer_do[35]) );
  BUFX2 U73 ( .A(n462), .Y(buffer_do[36]) );
  BUFX2 U74 ( .A(n461), .Y(buffer_do[37]) );
  BUFX2 U75 ( .A(n460), .Y(buffer_do[38]) );
  BUFX2 U76 ( .A(n459), .Y(buffer_do[39]) );
  BUFX2 U77 ( .A(n498), .Y(buffer_do[0]) );
  BUFX2 U78 ( .A(n497), .Y(buffer_do[1]) );
  BUFX2 U79 ( .A(n496), .Y(buffer_do[2]) );
  BUFX2 U80 ( .A(n495), .Y(buffer_do[3]) );
  BUFX2 U81 ( .A(n458), .Y(buffer_do[40]) );
  BUFX2 U82 ( .A(n457), .Y(buffer_do[41]) );
  BUFX2 U83 ( .A(n456), .Y(buffer_do[42]) );
  BUFX2 U84 ( .A(n455), .Y(buffer_do[43]) );
  BUFX2 U85 ( .A(n454), .Y(buffer_do[44]) );
  BUFX2 U86 ( .A(n453), .Y(buffer_do[45]) );
  BUFX2 U87 ( .A(n452), .Y(buffer_do[46]) );
  BUFX2 U88 ( .A(n451), .Y(buffer_do[47]) );
  BUFX2 U89 ( .A(n450), .Y(buffer_do[48]) );
  BUFX2 U90 ( .A(n449), .Y(buffer_do[49]) );
  BUFX2 U91 ( .A(n448), .Y(buffer_do[50]) );
  BUFX2 U92 ( .A(n447), .Y(buffer_do[51]) );
  BUFX2 U93 ( .A(n446), .Y(buffer_do[52]) );
  BUFX2 U94 ( .A(n445), .Y(buffer_do[53]) );
  BUFX2 U95 ( .A(n444), .Y(buffer_do[54]) );
  BUFX2 U96 ( .A(n443), .Y(buffer_do[55]) );
  BUFX2 U97 ( .A(n442), .Y(buffer_do[56]) );
  INVX1 U98 ( .A(n225), .Y(n223) );
  INVX1 U99 ( .A(n223), .Y(buffer_ri) );
  INVX1 U100 ( .A(n433), .Y(n225) );
  INVX1 U208 ( .A(n5), .Y(n272) );
  INVX1 U209 ( .A(n5), .Y(n271) );
  INVX1 U210 ( .A(n5), .Y(n270) );
  INVX1 U211 ( .A(n5), .Y(n269) );
  INVX1 U212 ( .A(n344), .Y(n273) );
  INVX1 U213 ( .A(n344), .Y(n274) );
  INVX1 U214 ( .A(n344), .Y(n275) );
  INVX1 U215 ( .A(n344), .Y(n276) );
  INVX1 U216 ( .A(n344), .Y(n277) );
  INVX1 U217 ( .A(n345), .Y(n346) );
  INVX1 U218 ( .A(n343), .Y(n347) );
  INVX1 U219 ( .A(n342), .Y(n348) );
  INVX1 U220 ( .A(n341), .Y(n349) );
  INVX1 U221 ( .A(n340), .Y(n350) );
  INVX1 U222 ( .A(n339), .Y(n351) );
  INVX1 U223 ( .A(n338), .Y(n352) );
  INVX1 U224 ( .A(n337), .Y(n353) );
  INVX1 U225 ( .A(n336), .Y(n354) );
  INVX1 U226 ( .A(n335), .Y(n355) );
  INVX1 U227 ( .A(n334), .Y(n356) );
  INVX1 U228 ( .A(n333), .Y(n357) );
  INVX1 U229 ( .A(n332), .Y(n358) );
  INVX1 U230 ( .A(n331), .Y(n359) );
  INVX1 U231 ( .A(n330), .Y(n360) );
  INVX1 U232 ( .A(n329), .Y(n361) );
  INVX1 U233 ( .A(n328), .Y(n362) );
  INVX1 U234 ( .A(n327), .Y(n363) );
  INVX1 U235 ( .A(n326), .Y(n364) );
  INVX1 U236 ( .A(n325), .Y(n365) );
  INVX1 U237 ( .A(n324), .Y(n366) );
  INVX1 U238 ( .A(n323), .Y(n367) );
  INVX1 U239 ( .A(n322), .Y(n368) );
  INVX1 U240 ( .A(n321), .Y(n369) );
  INVX1 U241 ( .A(n320), .Y(n370) );
  INVX1 U242 ( .A(n319), .Y(n371) );
  INVX1 U243 ( .A(n318), .Y(n372) );
  INVX1 U244 ( .A(n317), .Y(n373) );
  INVX1 U245 ( .A(n316), .Y(n374) );
  INVX1 U246 ( .A(n315), .Y(n375) );
  INVX1 U247 ( .A(n314), .Y(n376) );
  INVX1 U248 ( .A(n313), .Y(n377) );
  INVX1 U249 ( .A(n312), .Y(n378) );
  INVX1 U250 ( .A(n311), .Y(n379) );
  INVX1 U251 ( .A(n310), .Y(n380) );
  INVX1 U252 ( .A(n309), .Y(n381) );
  INVX1 U253 ( .A(n308), .Y(n382) );
  INVX1 U254 ( .A(n307), .Y(n383) );
  INVX1 U255 ( .A(n306), .Y(n384) );
  INVX1 U256 ( .A(n305), .Y(n385) );
  INVX1 U257 ( .A(n304), .Y(n386) );
  INVX1 U258 ( .A(n303), .Y(n387) );
  INVX1 U259 ( .A(n302), .Y(n388) );
  INVX1 U260 ( .A(n301), .Y(n389) );
  INVX1 U261 ( .A(n300), .Y(n390) );
  INVX1 U262 ( .A(n299), .Y(n391) );
  INVX1 U263 ( .A(n298), .Y(n392) );
  INVX1 U264 ( .A(n297), .Y(n393) );
  INVX1 U265 ( .A(n296), .Y(n394) );
  INVX1 U266 ( .A(n295), .Y(n395) );
  INVX1 U267 ( .A(n294), .Y(n396) );
  INVX1 U268 ( .A(n293), .Y(n397) );
  INVX1 U269 ( .A(n292), .Y(n398) );
  INVX1 U270 ( .A(n291), .Y(n399) );
  INVX1 U271 ( .A(n290), .Y(n400) );
  INVX1 U272 ( .A(n289), .Y(n401) );
  INVX1 U273 ( .A(n288), .Y(n402) );
  INVX1 U274 ( .A(n287), .Y(n403) );
  INVX1 U275 ( .A(n286), .Y(n404) );
  INVX1 U276 ( .A(n285), .Y(n405) );
  INVX1 U277 ( .A(n284), .Y(n406) );
  INVX1 U278 ( .A(n283), .Y(n407) );
  INVX1 U279 ( .A(n282), .Y(n408) );
  INVX1 U280 ( .A(n281), .Y(n409) );
  INVX1 U281 ( .A(reset), .Y(n278) );
endmodule


module output_controller_4in_1 ( clk, reset, polarity, output_so, output_do, 
        output_ro, in0_si, in0_di, in0_ri, in1_si, in1_di, in1_ri, in2_si, 
        in2_di, in2_ri, in3_si, in3_di, in3_ri );
  output [63:0] output_do;
  input [63:0] in0_di;
  input [63:0] in1_di;
  input [63:0] in2_di;
  input [63:0] in3_di;
  input clk, reset, polarity, output_ro, in0_si, in1_si, in2_si, in3_si;
  output output_so, in0_ri, in1_ri, in2_ri, in3_ri;
  wire   n330, buf_ri, n324, n323, n322, n321, n319, n318, n317, n316, n315,
         n314, n313, n312, n311, n310, n308, n307, n306, n305, n304, n303,
         n302, n301, n300, n299, n297, n296, n295, n294, n293, n292, n291,
         n290, n289, n288, n286, n285, n284, n283, n282, n281, n280, n279,
         n278, n277, n275, n274, n273, n272, n271, n270, n269, n268, n267,
         n266, n328, n327, n326, n325, n320, n309, n298, n287, n276, n265,
         n471, n334, n472, n469, n473, n470, n467, n468, n465, n466, n463,
         n464, n461, n462, n459, n460, n336, n457, n458, n455, n456, n453,
         n454, n451, n452, n449, n450, n447, n448, n445, n446, n443, n444,
         n441, n442, n439, n440, n437, n438, n435, n436, n433, n434, n431,
         n432, n429, n430, n427, n428, n425, n426, n423, n424, n421, n422,
         n419, n420, n417, n332, n418, n415, n416, n413, n414, n411, n412,
         n409, n410, n407, n408, n405, n406, n403, n404, n401, n402, n399,
         n400, n397, n398, n395, n396, n393, n394, n391, n392, n389, n390,
         n387, n388, n385, n386, n383, n384, n381, n382, n379, n380, n377,
         n378, n375, n376, n373, n374, n371, n372, n369, n370, n367, n368,
         n365, n366, n363, n364, n361, n362, n359, n360, n357, n358, n355,
         n356, n353, n354, n351, n352, n349, n350, n347, n348, n345, n346,
         n343, n474, n329, n344, n189, n253, n190, n254, n191, n255, n193,
         n257, n194, n258, n195, n259, n196, n260, n181, n245, n192, n256,
         n197, n261, n198, n262, n199, n263, n200, n264, n2, n202, n3, n203,
         n140, n204, n141, n205, n142, n206, n143, n207, n144, n208, n145,
         n209, n146, n210, n147, n211, n149, n213, n150, n214, n151, n215,
         n152, n216, n153, n217, n154, n218, n155, n219, n156, n220, n157,
         n221, n158, n222, n160, n224, n161, n225, n162, n226, n163, n227,
         n164, n228, n165, n229, n166, n230, n167, n231, n168, n232, n169,
         n233, n1, n201, n148, n212, n159, n223, n170, n234, n171, n235, n172,
         n236, n173, n237, n174, n238, n175, n239, n176, n240, n177, n241,
         n178, n242, n179, n243, n180, n244, n182, n246, n183, n247, n184,
         n248, n185, n249, n186, n250, n187, n251, n188, n252, n338, n331,
         n339, n342, n333, n335, n337;
  wire   [3:0] grant;
  wire   [63:0] sel_data;

  rr4_arbiter_1 ARB ( .clk(clk), .reset(reset), .request({in3_si, in2_si, 
        in1_si, in0_si}), .advance(n330), .grant(grant) );
  buffer_6 OB ( .clk(clk), .reset(reset), .buffer_en(1'b1), .buffer_di({n324, 
        n323, n322, n321, n319, n318, n317, n316, n315, n314, n313, n312, n311, 
        n310, n308, n307, n306, n305, n304, n303, n302, n301, n300, n299, n297, 
        n296, n295, n294, n293, n292, n291, n290, n289, n288, n286, n285, n284, 
        n283, n282, n281, n280, n279, n278, n277, n275, n274, n273, n272, n271, 
        n270, n269, n268, n267, n266, n328, n327, n326, n325, n320, n309, n298, 
        n287, n276, n265}), .buffer_si(n330), .buffer_ri(buf_ri), .buffer_ro(
        output_ro), .buffer_so(output_so), .buffer_do(output_do) );
  AOI22X1 U11 ( .A(in3_di[9]), .B(n471), .C(in2_di[9]), .D(n334), .Y(n472) );
  AOI22X1 U12 ( .A(in1_di[9]), .B(n469), .C(in0_di[9]), .D(grant[0]), .Y(n473)
         );
  AOI22X1 U14 ( .A(in3_di[8]), .B(n471), .C(in2_di[8]), .D(n470), .Y(n467) );
  AOI22X1 U15 ( .A(in1_di[8]), .B(n469), .C(in0_di[8]), .D(grant[0]), .Y(n468)
         );
  AOI22X1 U17 ( .A(in3_di[7]), .B(n471), .C(in2_di[7]), .D(n470), .Y(n465) );
  AOI22X1 U18 ( .A(in1_di[7]), .B(n469), .C(in0_di[7]), .D(grant[0]), .Y(n466)
         );
  AOI22X1 U20 ( .A(in3_di[6]), .B(n471), .C(in2_di[6]), .D(n334), .Y(n463) );
  AOI22X1 U21 ( .A(in1_di[6]), .B(n469), .C(in0_di[6]), .D(grant[0]), .Y(n464)
         );
  AOI22X1 U23 ( .A(in3_di[63]), .B(n471), .C(in2_di[63]), .D(n334), .Y(n461)
         );
  AOI22X1 U24 ( .A(in1_di[63]), .B(n469), .C(in0_di[63]), .D(grant[0]), .Y(
        n462) );
  AOI22X1 U26 ( .A(in3_di[62]), .B(n471), .C(in2_di[62]), .D(n334), .Y(n459)
         );
  AOI22X1 U27 ( .A(in1_di[62]), .B(n469), .C(in0_di[62]), .D(grant[0]), .Y(
        n460) );
  AOI22X1 U29 ( .A(in3_di[61]), .B(n336), .C(in2_di[61]), .D(n470), .Y(n457)
         );
  AOI22X1 U30 ( .A(in1_di[61]), .B(n469), .C(in0_di[61]), .D(grant[0]), .Y(
        n458) );
  AOI22X1 U32 ( .A(in3_di[60]), .B(n336), .C(in2_di[60]), .D(n470), .Y(n455)
         );
  AOI22X1 U33 ( .A(in1_di[60]), .B(n469), .C(in0_di[60]), .D(grant[0]), .Y(
        n456) );
  AOI22X1 U35 ( .A(in3_di[5]), .B(n471), .C(in2_di[5]), .D(n470), .Y(n453) );
  AOI22X1 U36 ( .A(in1_di[5]), .B(n469), .C(in0_di[5]), .D(grant[0]), .Y(n454)
         );
  AOI22X1 U38 ( .A(in3_di[59]), .B(n471), .C(in2_di[59]), .D(n470), .Y(n451)
         );
  AOI22X1 U39 ( .A(in1_di[59]), .B(n469), .C(in0_di[59]), .D(grant[0]), .Y(
        n452) );
  AOI22X1 U41 ( .A(in3_di[58]), .B(n471), .C(in2_di[58]), .D(n470), .Y(n449)
         );
  AOI22X1 U42 ( .A(in1_di[58]), .B(n469), .C(in0_di[58]), .D(grant[0]), .Y(
        n450) );
  AOI22X1 U44 ( .A(in3_di[57]), .B(n471), .C(in2_di[57]), .D(n470), .Y(n447)
         );
  AOI22X1 U45 ( .A(in1_di[57]), .B(n469), .C(in0_di[57]), .D(grant[0]), .Y(
        n448) );
  AOI22X1 U47 ( .A(in3_di[56]), .B(n336), .C(in2_di[56]), .D(n470), .Y(n445)
         );
  AOI22X1 U48 ( .A(in1_di[56]), .B(n469), .C(in0_di[56]), .D(grant[0]), .Y(
        n446) );
  AOI22X1 U50 ( .A(in3_di[55]), .B(n471), .C(in2_di[55]), .D(n470), .Y(n443)
         );
  AOI22X1 U51 ( .A(in1_di[55]), .B(n469), .C(in0_di[55]), .D(grant[0]), .Y(
        n444) );
  AOI22X1 U53 ( .A(in3_di[54]), .B(n471), .C(in2_di[54]), .D(n470), .Y(n441)
         );
  AOI22X1 U54 ( .A(in1_di[54]), .B(n469), .C(in0_di[54]), .D(grant[0]), .Y(
        n442) );
  AOI22X1 U56 ( .A(in3_di[53]), .B(n471), .C(in2_di[53]), .D(n470), .Y(n439)
         );
  AOI22X1 U57 ( .A(in1_di[53]), .B(n469), .C(in0_di[53]), .D(grant[0]), .Y(
        n440) );
  AOI22X1 U59 ( .A(in3_di[52]), .B(n471), .C(in2_di[52]), .D(n334), .Y(n437)
         );
  AOI22X1 U60 ( .A(in1_di[52]), .B(n469), .C(in0_di[52]), .D(grant[0]), .Y(
        n438) );
  AOI22X1 U62 ( .A(in3_di[51]), .B(n471), .C(in2_di[51]), .D(n334), .Y(n435)
         );
  AOI22X1 U63 ( .A(in1_di[51]), .B(n469), .C(in0_di[51]), .D(grant[0]), .Y(
        n436) );
  AOI22X1 U65 ( .A(in3_di[50]), .B(n471), .C(in2_di[50]), .D(n334), .Y(n433)
         );
  AOI22X1 U66 ( .A(in1_di[50]), .B(n469), .C(in0_di[50]), .D(grant[0]), .Y(
        n434) );
  AOI22X1 U68 ( .A(in3_di[4]), .B(n471), .C(in2_di[4]), .D(n334), .Y(n431) );
  AOI22X1 U69 ( .A(in1_di[4]), .B(n469), .C(in0_di[4]), .D(grant[0]), .Y(n432)
         );
  AOI22X1 U71 ( .A(in3_di[49]), .B(n471), .C(in2_di[49]), .D(n334), .Y(n429)
         );
  AOI22X1 U72 ( .A(in1_di[49]), .B(n469), .C(in0_di[49]), .D(grant[0]), .Y(
        n430) );
  AOI22X1 U74 ( .A(in3_di[48]), .B(n471), .C(in2_di[48]), .D(n334), .Y(n427)
         );
  AOI22X1 U75 ( .A(in1_di[48]), .B(n469), .C(in0_di[48]), .D(grant[0]), .Y(
        n428) );
  AOI22X1 U77 ( .A(in3_di[47]), .B(n471), .C(in2_di[47]), .D(n334), .Y(n425)
         );
  AOI22X1 U78 ( .A(in1_di[47]), .B(n469), .C(in0_di[47]), .D(grant[0]), .Y(
        n426) );
  AOI22X1 U80 ( .A(in3_di[46]), .B(n471), .C(in2_di[46]), .D(n334), .Y(n423)
         );
  AOI22X1 U81 ( .A(in1_di[46]), .B(n469), .C(in0_di[46]), .D(grant[0]), .Y(
        n424) );
  AOI22X1 U83 ( .A(in3_di[45]), .B(n471), .C(in2_di[45]), .D(n334), .Y(n421)
         );
  AOI22X1 U84 ( .A(in1_di[45]), .B(n469), .C(in0_di[45]), .D(grant[0]), .Y(
        n422) );
  AOI22X1 U86 ( .A(in3_di[44]), .B(n471), .C(in2_di[44]), .D(n334), .Y(n419)
         );
  AOI22X1 U87 ( .A(in1_di[44]), .B(n469), .C(in0_di[44]), .D(grant[0]), .Y(
        n420) );
  AOI22X1 U89 ( .A(in3_di[43]), .B(n471), .C(in2_di[43]), .D(n334), .Y(n417)
         );
  AOI22X1 U90 ( .A(in1_di[43]), .B(n332), .C(in0_di[43]), .D(grant[0]), .Y(
        n418) );
  AOI22X1 U92 ( .A(in3_di[42]), .B(n471), .C(in2_di[42]), .D(n334), .Y(n415)
         );
  AOI22X1 U93 ( .A(in1_di[42]), .B(n332), .C(in0_di[42]), .D(grant[0]), .Y(
        n416) );
  AOI22X1 U95 ( .A(in3_di[41]), .B(n471), .C(in2_di[41]), .D(n334), .Y(n413)
         );
  AOI22X1 U96 ( .A(in1_di[41]), .B(n469), .C(in0_di[41]), .D(grant[0]), .Y(
        n414) );
  AOI22X1 U98 ( .A(in3_di[40]), .B(n336), .C(in2_di[40]), .D(n470), .Y(n411)
         );
  AOI22X1 U99 ( .A(in1_di[40]), .B(n469), .C(in0_di[40]), .D(grant[0]), .Y(
        n412) );
  AOI22X1 U101 ( .A(in3_di[3]), .B(n471), .C(in2_di[3]), .D(n470), .Y(n409) );
  AOI22X1 U102 ( .A(in1_di[3]), .B(n469), .C(in0_di[3]), .D(grant[0]), .Y(n410) );
  AOI22X1 U104 ( .A(in3_di[39]), .B(n471), .C(in2_di[39]), .D(n470), .Y(n407)
         );
  AOI22X1 U105 ( .A(in1_di[39]), .B(n469), .C(in0_di[39]), .D(grant[0]), .Y(
        n408) );
  AOI22X1 U107 ( .A(in3_di[38]), .B(n471), .C(in2_di[38]), .D(n470), .Y(n405)
         );
  AOI22X1 U108 ( .A(in1_di[38]), .B(n469), .C(in0_di[38]), .D(grant[0]), .Y(
        n406) );
  AOI22X1 U110 ( .A(in3_di[37]), .B(n471), .C(in2_di[37]), .D(n470), .Y(n403)
         );
  AOI22X1 U111 ( .A(in1_di[37]), .B(n469), .C(in0_di[37]), .D(grant[0]), .Y(
        n404) );
  AOI22X1 U113 ( .A(in3_di[36]), .B(n471), .C(in2_di[36]), .D(n470), .Y(n401)
         );
  AOI22X1 U114 ( .A(in1_di[36]), .B(n469), .C(in0_di[36]), .D(grant[0]), .Y(
        n402) );
  AOI22X1 U116 ( .A(in3_di[35]), .B(n471), .C(in2_di[35]), .D(n470), .Y(n399)
         );
  AOI22X1 U117 ( .A(in1_di[35]), .B(n469), .C(in0_di[35]), .D(grant[0]), .Y(
        n400) );
  AOI22X1 U119 ( .A(in3_di[34]), .B(n471), .C(in2_di[34]), .D(n470), .Y(n397)
         );
  AOI22X1 U120 ( .A(in1_di[34]), .B(n469), .C(in0_di[34]), .D(grant[0]), .Y(
        n398) );
  AOI22X1 U122 ( .A(in3_di[33]), .B(n471), .C(in2_di[33]), .D(n470), .Y(n395)
         );
  AOI22X1 U123 ( .A(in1_di[33]), .B(n469), .C(in0_di[33]), .D(grant[0]), .Y(
        n396) );
  AOI22X1 U125 ( .A(in3_di[32]), .B(n336), .C(in2_di[32]), .D(n470), .Y(n393)
         );
  AOI22X1 U126 ( .A(in1_di[32]), .B(n469), .C(in0_di[32]), .D(grant[0]), .Y(
        n394) );
  AOI22X1 U128 ( .A(in3_di[31]), .B(n336), .C(in2_di[31]), .D(n470), .Y(n391)
         );
  AOI22X1 U129 ( .A(in1_di[31]), .B(n332), .C(in0_di[31]), .D(grant[0]), .Y(
        n392) );
  AOI22X1 U131 ( .A(in3_di[30]), .B(n336), .C(in2_di[30]), .D(n334), .Y(n389)
         );
  AOI22X1 U132 ( .A(in1_di[30]), .B(n332), .C(in0_di[30]), .D(grant[0]), .Y(
        n390) );
  AOI22X1 U134 ( .A(in3_di[2]), .B(n336), .C(in2_di[2]), .D(n334), .Y(n387) );
  AOI22X1 U135 ( .A(in1_di[2]), .B(n332), .C(in0_di[2]), .D(grant[0]), .Y(n388) );
  AOI22X1 U137 ( .A(in3_di[29]), .B(n336), .C(in2_di[29]), .D(n470), .Y(n385)
         );
  AOI22X1 U138 ( .A(in1_di[29]), .B(n332), .C(in0_di[29]), .D(grant[0]), .Y(
        n386) );
  AOI22X1 U140 ( .A(in3_di[28]), .B(n336), .C(in2_di[28]), .D(n334), .Y(n383)
         );
  AOI22X1 U141 ( .A(in1_di[28]), .B(n332), .C(in0_di[28]), .D(grant[0]), .Y(
        n384) );
  AOI22X1 U143 ( .A(in3_di[27]), .B(n336), .C(in2_di[27]), .D(n470), .Y(n381)
         );
  AOI22X1 U144 ( .A(in1_di[27]), .B(n332), .C(in0_di[27]), .D(grant[0]), .Y(
        n382) );
  AOI22X1 U146 ( .A(in3_di[26]), .B(n336), .C(in2_di[26]), .D(n470), .Y(n379)
         );
  AOI22X1 U147 ( .A(in1_di[26]), .B(n332), .C(in0_di[26]), .D(grant[0]), .Y(
        n380) );
  AOI22X1 U149 ( .A(in3_di[25]), .B(n336), .C(in2_di[25]), .D(n470), .Y(n377)
         );
  AOI22X1 U150 ( .A(in1_di[25]), .B(n332), .C(in0_di[25]), .D(grant[0]), .Y(
        n378) );
  AOI22X1 U152 ( .A(in3_di[24]), .B(n336), .C(in2_di[24]), .D(n470), .Y(n375)
         );
  AOI22X1 U153 ( .A(in1_di[24]), .B(n332), .C(in0_di[24]), .D(grant[0]), .Y(
        n376) );
  AOI22X1 U155 ( .A(in3_di[23]), .B(n336), .C(in2_di[23]), .D(n470), .Y(n373)
         );
  AOI22X1 U156 ( .A(in1_di[23]), .B(n332), .C(in0_di[23]), .D(grant[0]), .Y(
        n374) );
  AOI22X1 U158 ( .A(in3_di[22]), .B(n336), .C(in2_di[22]), .D(n470), .Y(n371)
         );
  AOI22X1 U159 ( .A(in1_di[22]), .B(n332), .C(in0_di[22]), .D(grant[0]), .Y(
        n372) );
  AOI22X1 U161 ( .A(in3_di[21]), .B(n336), .C(in2_di[21]), .D(n470), .Y(n369)
         );
  AOI22X1 U162 ( .A(in1_di[21]), .B(n332), .C(in0_di[21]), .D(grant[0]), .Y(
        n370) );
  AOI22X1 U164 ( .A(in3_di[20]), .B(n336), .C(in2_di[20]), .D(n470), .Y(n367)
         );
  AOI22X1 U165 ( .A(in1_di[20]), .B(n332), .C(in0_di[20]), .D(grant[0]), .Y(
        n368) );
  AOI22X1 U167 ( .A(in3_di[1]), .B(n336), .C(in2_di[1]), .D(n334), .Y(n365) );
  AOI22X1 U168 ( .A(in1_di[1]), .B(n469), .C(in0_di[1]), .D(grant[0]), .Y(n366) );
  AOI22X1 U170 ( .A(in3_di[19]), .B(n336), .C(in2_di[19]), .D(n334), .Y(n363)
         );
  AOI22X1 U171 ( .A(in1_di[19]), .B(n469), .C(in0_di[19]), .D(grant[0]), .Y(
        n364) );
  AOI22X1 U173 ( .A(in3_di[18]), .B(n336), .C(in2_di[18]), .D(n334), .Y(n361)
         );
  AOI22X1 U174 ( .A(in1_di[18]), .B(n469), .C(in0_di[18]), .D(grant[0]), .Y(
        n362) );
  AOI22X1 U176 ( .A(in3_di[17]), .B(n336), .C(in2_di[17]), .D(n334), .Y(n359)
         );
  AOI22X1 U177 ( .A(in1_di[17]), .B(n469), .C(in0_di[17]), .D(grant[0]), .Y(
        n360) );
  AOI22X1 U179 ( .A(in3_di[16]), .B(n336), .C(in2_di[16]), .D(n334), .Y(n357)
         );
  AOI22X1 U180 ( .A(in1_di[16]), .B(n469), .C(in0_di[16]), .D(grant[0]), .Y(
        n358) );
  AOI22X1 U182 ( .A(in3_di[15]), .B(n336), .C(in2_di[15]), .D(n334), .Y(n355)
         );
  AOI22X1 U183 ( .A(in1_di[15]), .B(n469), .C(in0_di[15]), .D(grant[0]), .Y(
        n356) );
  AOI22X1 U185 ( .A(in3_di[14]), .B(n336), .C(in2_di[14]), .D(n334), .Y(n353)
         );
  AOI22X1 U186 ( .A(in1_di[14]), .B(n469), .C(in0_di[14]), .D(grant[0]), .Y(
        n354) );
  AOI22X1 U188 ( .A(in3_di[13]), .B(n336), .C(in2_di[13]), .D(n334), .Y(n351)
         );
  AOI22X1 U189 ( .A(in1_di[13]), .B(n469), .C(in0_di[13]), .D(grant[0]), .Y(
        n352) );
  AOI22X1 U191 ( .A(in3_di[12]), .B(n336), .C(in2_di[12]), .D(n334), .Y(n349)
         );
  AOI22X1 U192 ( .A(in1_di[12]), .B(n469), .C(in0_di[12]), .D(grant[0]), .Y(
        n350) );
  AOI22X1 U194 ( .A(in3_di[11]), .B(n336), .C(in2_di[11]), .D(n334), .Y(n347)
         );
  AOI22X1 U195 ( .A(in1_di[11]), .B(n469), .C(in0_di[11]), .D(grant[0]), .Y(
        n348) );
  AOI22X1 U197 ( .A(in3_di[10]), .B(n336), .C(in2_di[10]), .D(n334), .Y(n345)
         );
  AOI22X1 U198 ( .A(in1_di[10]), .B(n469), .C(in0_di[10]), .D(grant[0]), .Y(
        n346) );
  AOI22X1 U200 ( .A(in3_di[0]), .B(n336), .C(in2_di[0]), .D(n334), .Y(n343) );
  NOR3X1 U201 ( .A(grant[0]), .B(grant[1]), .C(n474), .Y(n470) );
  NOR3X1 U202 ( .A(grant[1]), .B(grant[2]), .C(n329), .Y(n471) );
  AOI22X1 U204 ( .A(in1_di[0]), .B(n469), .C(in0_di[0]), .D(grant[0]), .Y(n344) );
  AND2X1 U3 ( .A(n189), .B(n253), .Y(sel_data[57]) );
  AND2X1 U4 ( .A(n190), .B(n254), .Y(sel_data[58]) );
  AND2X1 U5 ( .A(n191), .B(n255), .Y(sel_data[59]) );
  AND2X1 U6 ( .A(n193), .B(n257), .Y(sel_data[60]) );
  AND2X1 U7 ( .A(n194), .B(n258), .Y(sel_data[61]) );
  AND2X1 U8 ( .A(n195), .B(n259), .Y(sel_data[62]) );
  AND2X1 U9 ( .A(n196), .B(n260), .Y(sel_data[63]) );
  AND2X1 U10 ( .A(n181), .B(n245), .Y(sel_data[4]) );
  AND2X1 U13 ( .A(n192), .B(n256), .Y(sel_data[5]) );
  AND2X1 U16 ( .A(n197), .B(n261), .Y(sel_data[6]) );
  AND2X1 U19 ( .A(n198), .B(n262), .Y(sel_data[7]) );
  AND2X1 U22 ( .A(n199), .B(n263), .Y(sel_data[8]) );
  AND2X1 U25 ( .A(n200), .B(n264), .Y(sel_data[9]) );
  AND2X1 U28 ( .A(n2), .B(n202), .Y(sel_data[10]) );
  AND2X1 U31 ( .A(n3), .B(n203), .Y(sel_data[11]) );
  AND2X1 U34 ( .A(n140), .B(n204), .Y(sel_data[12]) );
  AND2X1 U37 ( .A(n141), .B(n205), .Y(sel_data[13]) );
  AND2X1 U40 ( .A(n142), .B(n206), .Y(sel_data[14]) );
  AND2X1 U43 ( .A(n143), .B(n207), .Y(sel_data[15]) );
  AND2X1 U46 ( .A(n144), .B(n208), .Y(sel_data[16]) );
  AND2X1 U49 ( .A(n145), .B(n209), .Y(sel_data[17]) );
  AND2X1 U52 ( .A(n146), .B(n210), .Y(sel_data[18]) );
  AND2X1 U55 ( .A(n147), .B(n211), .Y(sel_data[19]) );
  AND2X1 U58 ( .A(n149), .B(n213), .Y(sel_data[20]) );
  AND2X1 U61 ( .A(n150), .B(n214), .Y(sel_data[21]) );
  AND2X1 U64 ( .A(n151), .B(n215), .Y(sel_data[22]) );
  AND2X1 U67 ( .A(n152), .B(n216), .Y(sel_data[23]) );
  AND2X1 U70 ( .A(n153), .B(n217), .Y(sel_data[24]) );
  AND2X1 U73 ( .A(n154), .B(n218), .Y(sel_data[25]) );
  AND2X1 U76 ( .A(n155), .B(n219), .Y(sel_data[26]) );
  AND2X1 U79 ( .A(n156), .B(n220), .Y(sel_data[27]) );
  AND2X1 U82 ( .A(n157), .B(n221), .Y(sel_data[28]) );
  AND2X1 U85 ( .A(n158), .B(n222), .Y(sel_data[29]) );
  AND2X1 U88 ( .A(n160), .B(n224), .Y(sel_data[30]) );
  AND2X1 U91 ( .A(n161), .B(n225), .Y(sel_data[31]) );
  AND2X1 U94 ( .A(n162), .B(n226), .Y(sel_data[32]) );
  AND2X1 U97 ( .A(n163), .B(n227), .Y(sel_data[33]) );
  AND2X1 U100 ( .A(n164), .B(n228), .Y(sel_data[34]) );
  AND2X1 U103 ( .A(n165), .B(n229), .Y(sel_data[35]) );
  AND2X1 U106 ( .A(n166), .B(n230), .Y(sel_data[36]) );
  AND2X1 U109 ( .A(n167), .B(n231), .Y(sel_data[37]) );
  AND2X1 U112 ( .A(n168), .B(n232), .Y(sel_data[38]) );
  AND2X1 U115 ( .A(n169), .B(n233), .Y(sel_data[39]) );
  AND2X1 U118 ( .A(n1), .B(n201), .Y(sel_data[0]) );
  AND2X1 U121 ( .A(n148), .B(n212), .Y(sel_data[1]) );
  AND2X1 U124 ( .A(n159), .B(n223), .Y(sel_data[2]) );
  AND2X1 U127 ( .A(n170), .B(n234), .Y(sel_data[3]) );
  AND2X1 U130 ( .A(n171), .B(n235), .Y(sel_data[40]) );
  AND2X1 U133 ( .A(n172), .B(n236), .Y(sel_data[41]) );
  AND2X1 U136 ( .A(n173), .B(n237), .Y(sel_data[42]) );
  AND2X1 U139 ( .A(n174), .B(n238), .Y(sel_data[43]) );
  AND2X1 U142 ( .A(n175), .B(n239), .Y(sel_data[44]) );
  AND2X1 U145 ( .A(n176), .B(n240), .Y(sel_data[45]) );
  AND2X1 U148 ( .A(n177), .B(n241), .Y(sel_data[46]) );
  AND2X1 U151 ( .A(n178), .B(n242), .Y(sel_data[47]) );
  AND2X1 U154 ( .A(n179), .B(n243), .Y(sel_data[48]) );
  AND2X1 U157 ( .A(n180), .B(n244), .Y(sel_data[49]) );
  AND2X1 U160 ( .A(n182), .B(n246), .Y(sel_data[50]) );
  AND2X1 U163 ( .A(n183), .B(n247), .Y(sel_data[51]) );
  AND2X1 U166 ( .A(n184), .B(n248), .Y(sel_data[52]) );
  AND2X1 U169 ( .A(n185), .B(n249), .Y(sel_data[53]) );
  AND2X1 U172 ( .A(n186), .B(n250), .Y(sel_data[54]) );
  AND2X1 U175 ( .A(n187), .B(n251), .Y(sel_data[55]) );
  AND2X1 U178 ( .A(n188), .B(n252), .Y(sel_data[56]) );
  AND2X1 U181 ( .A(grant[1]), .B(n338), .Y(n469) );
  AND2X1 U184 ( .A(buf_ri), .B(grant[3]), .Y(in3_ri) );
  OR2X1 U187 ( .A(in0_ri), .B(n331), .Y(n330) );
  OR2X1 U190 ( .A(n339), .B(in1_ri), .Y(n331) );
  OR2X1 U193 ( .A(in2_ri), .B(in3_ri), .Y(n339) );
  AND2X1 U196 ( .A(buf_ri), .B(grant[2]), .Y(in2_ri) );
  BUFX2 U199 ( .A(n344), .Y(n1) );
  BUFX2 U203 ( .A(n346), .Y(n2) );
  BUFX2 U205 ( .A(n348), .Y(n3) );
  BUFX2 U206 ( .A(n350), .Y(n140) );
  BUFX2 U207 ( .A(n352), .Y(n141) );
  BUFX2 U208 ( .A(n354), .Y(n142) );
  BUFX2 U209 ( .A(n356), .Y(n143) );
  BUFX2 U210 ( .A(n358), .Y(n144) );
  BUFX2 U211 ( .A(n360), .Y(n145) );
  BUFX2 U212 ( .A(n362), .Y(n146) );
  BUFX2 U213 ( .A(n364), .Y(n147) );
  BUFX2 U214 ( .A(n366), .Y(n148) );
  BUFX2 U215 ( .A(n368), .Y(n149) );
  BUFX2 U216 ( .A(n370), .Y(n150) );
  BUFX2 U217 ( .A(n372), .Y(n151) );
  BUFX2 U218 ( .A(n374), .Y(n152) );
  BUFX2 U219 ( .A(n376), .Y(n153) );
  BUFX2 U220 ( .A(n378), .Y(n154) );
  BUFX2 U221 ( .A(n380), .Y(n155) );
  BUFX2 U222 ( .A(n382), .Y(n156) );
  BUFX2 U223 ( .A(n384), .Y(n157) );
  BUFX2 U224 ( .A(n386), .Y(n158) );
  BUFX2 U225 ( .A(n388), .Y(n159) );
  BUFX2 U226 ( .A(n390), .Y(n160) );
  BUFX2 U227 ( .A(n392), .Y(n161) );
  BUFX2 U228 ( .A(n394), .Y(n162) );
  BUFX2 U229 ( .A(n396), .Y(n163) );
  BUFX2 U230 ( .A(n398), .Y(n164) );
  BUFX2 U231 ( .A(n400), .Y(n165) );
  BUFX2 U232 ( .A(n402), .Y(n166) );
  BUFX2 U233 ( .A(n404), .Y(n167) );
  BUFX2 U234 ( .A(n406), .Y(n168) );
  BUFX2 U235 ( .A(n408), .Y(n169) );
  BUFX2 U236 ( .A(n410), .Y(n170) );
  BUFX2 U237 ( .A(n412), .Y(n171) );
  BUFX2 U238 ( .A(n414), .Y(n172) );
  BUFX2 U239 ( .A(n416), .Y(n173) );
  BUFX2 U240 ( .A(n418), .Y(n174) );
  BUFX2 U241 ( .A(n420), .Y(n175) );
  BUFX2 U242 ( .A(n422), .Y(n176) );
  BUFX2 U243 ( .A(n424), .Y(n177) );
  BUFX2 U244 ( .A(n426), .Y(n178) );
  BUFX2 U245 ( .A(n428), .Y(n179) );
  BUFX2 U246 ( .A(n430), .Y(n180) );
  BUFX2 U247 ( .A(n432), .Y(n181) );
  BUFX2 U248 ( .A(n434), .Y(n182) );
  BUFX2 U249 ( .A(n436), .Y(n183) );
  BUFX2 U250 ( .A(n438), .Y(n184) );
  BUFX2 U251 ( .A(n440), .Y(n185) );
  BUFX2 U252 ( .A(n442), .Y(n186) );
  BUFX2 U253 ( .A(n444), .Y(n187) );
  BUFX2 U254 ( .A(n446), .Y(n188) );
  BUFX2 U255 ( .A(n448), .Y(n189) );
  BUFX2 U256 ( .A(n450), .Y(n190) );
  BUFX2 U257 ( .A(n452), .Y(n191) );
  BUFX2 U258 ( .A(n454), .Y(n192) );
  BUFX2 U259 ( .A(n456), .Y(n193) );
  BUFX2 U260 ( .A(n458), .Y(n194) );
  BUFX2 U261 ( .A(n460), .Y(n195) );
  BUFX2 U262 ( .A(n462), .Y(n196) );
  BUFX2 U263 ( .A(n464), .Y(n197) );
  BUFX2 U264 ( .A(n466), .Y(n198) );
  BUFX2 U265 ( .A(n468), .Y(n199) );
  BUFX2 U266 ( .A(n473), .Y(n200) );
  BUFX2 U267 ( .A(n343), .Y(n201) );
  BUFX2 U268 ( .A(n345), .Y(n202) );
  BUFX2 U269 ( .A(n347), .Y(n203) );
  BUFX2 U270 ( .A(n349), .Y(n204) );
  BUFX2 U271 ( .A(n351), .Y(n205) );
  BUFX2 U272 ( .A(n353), .Y(n206) );
  BUFX2 U273 ( .A(n355), .Y(n207) );
  BUFX2 U274 ( .A(n357), .Y(n208) );
  BUFX2 U275 ( .A(n359), .Y(n209) );
  BUFX2 U276 ( .A(n361), .Y(n210) );
  BUFX2 U277 ( .A(n363), .Y(n211) );
  BUFX2 U278 ( .A(n365), .Y(n212) );
  BUFX2 U279 ( .A(n367), .Y(n213) );
  BUFX2 U280 ( .A(n369), .Y(n214) );
  BUFX2 U281 ( .A(n371), .Y(n215) );
  BUFX2 U282 ( .A(n373), .Y(n216) );
  BUFX2 U283 ( .A(n375), .Y(n217) );
  BUFX2 U284 ( .A(n377), .Y(n218) );
  BUFX2 U285 ( .A(n379), .Y(n219) );
  BUFX2 U286 ( .A(n381), .Y(n220) );
  BUFX2 U287 ( .A(n383), .Y(n221) );
  BUFX2 U288 ( .A(n385), .Y(n222) );
  BUFX2 U289 ( .A(n387), .Y(n223) );
  BUFX2 U290 ( .A(n389), .Y(n224) );
  BUFX2 U291 ( .A(n391), .Y(n225) );
  BUFX2 U292 ( .A(n393), .Y(n226) );
  BUFX2 U293 ( .A(n395), .Y(n227) );
  BUFX2 U294 ( .A(n397), .Y(n228) );
  BUFX2 U295 ( .A(n399), .Y(n229) );
  BUFX2 U296 ( .A(n401), .Y(n230) );
  BUFX2 U297 ( .A(n403), .Y(n231) );
  BUFX2 U298 ( .A(n405), .Y(n232) );
  BUFX2 U299 ( .A(n407), .Y(n233) );
  BUFX2 U300 ( .A(n409), .Y(n234) );
  BUFX2 U301 ( .A(n411), .Y(n235) );
  BUFX2 U302 ( .A(n413), .Y(n236) );
  BUFX2 U303 ( .A(n415), .Y(n237) );
  BUFX2 U304 ( .A(n417), .Y(n238) );
  BUFX2 U305 ( .A(n419), .Y(n239) );
  BUFX2 U306 ( .A(n421), .Y(n240) );
  BUFX2 U307 ( .A(n423), .Y(n241) );
  BUFX2 U308 ( .A(n425), .Y(n242) );
  BUFX2 U309 ( .A(n427), .Y(n243) );
  BUFX2 U310 ( .A(n429), .Y(n244) );
  BUFX2 U311 ( .A(n431), .Y(n245) );
  BUFX2 U312 ( .A(n433), .Y(n246) );
  BUFX2 U313 ( .A(n435), .Y(n247) );
  BUFX2 U314 ( .A(n437), .Y(n248) );
  BUFX2 U315 ( .A(n439), .Y(n249) );
  BUFX2 U316 ( .A(n441), .Y(n250) );
  BUFX2 U317 ( .A(n443), .Y(n251) );
  BUFX2 U318 ( .A(n445), .Y(n252) );
  BUFX2 U319 ( .A(n447), .Y(n253) );
  BUFX2 U320 ( .A(n449), .Y(n254) );
  BUFX2 U321 ( .A(n451), .Y(n255) );
  BUFX2 U322 ( .A(n453), .Y(n256) );
  BUFX2 U323 ( .A(n455), .Y(n257) );
  BUFX2 U324 ( .A(n457), .Y(n258) );
  BUFX2 U325 ( .A(n459), .Y(n259) );
  BUFX2 U326 ( .A(n461), .Y(n260) );
  BUFX2 U327 ( .A(n463), .Y(n261) );
  BUFX2 U328 ( .A(n465), .Y(n262) );
  BUFX2 U329 ( .A(n467), .Y(n263) );
  BUFX2 U330 ( .A(n472), .Y(n264) );
  INVX1 U331 ( .A(sel_data[0]), .Y(n265) );
  INVX1 U332 ( .A(sel_data[10]), .Y(n266) );
  INVX1 U333 ( .A(sel_data[11]), .Y(n267) );
  INVX1 U334 ( .A(sel_data[12]), .Y(n268) );
  INVX1 U335 ( .A(sel_data[13]), .Y(n269) );
  INVX1 U336 ( .A(sel_data[14]), .Y(n270) );
  INVX1 U337 ( .A(sel_data[15]), .Y(n271) );
  INVX1 U338 ( .A(sel_data[16]), .Y(n272) );
  INVX1 U339 ( .A(sel_data[17]), .Y(n273) );
  INVX1 U340 ( .A(sel_data[18]), .Y(n274) );
  INVX1 U341 ( .A(sel_data[19]), .Y(n275) );
  INVX1 U342 ( .A(sel_data[1]), .Y(n276) );
  INVX1 U343 ( .A(sel_data[20]), .Y(n277) );
  INVX1 U344 ( .A(sel_data[21]), .Y(n278) );
  INVX1 U345 ( .A(sel_data[22]), .Y(n279) );
  INVX1 U346 ( .A(sel_data[23]), .Y(n280) );
  INVX1 U347 ( .A(sel_data[24]), .Y(n281) );
  INVX1 U348 ( .A(sel_data[25]), .Y(n282) );
  INVX1 U349 ( .A(sel_data[26]), .Y(n283) );
  INVX1 U350 ( .A(sel_data[27]), .Y(n284) );
  INVX1 U351 ( .A(sel_data[28]), .Y(n285) );
  INVX1 U352 ( .A(sel_data[29]), .Y(n286) );
  INVX1 U353 ( .A(sel_data[2]), .Y(n287) );
  INVX1 U354 ( .A(sel_data[30]), .Y(n288) );
  INVX1 U355 ( .A(sel_data[31]), .Y(n289) );
  INVX1 U356 ( .A(sel_data[32]), .Y(n290) );
  INVX1 U357 ( .A(sel_data[33]), .Y(n291) );
  INVX1 U358 ( .A(sel_data[34]), .Y(n292) );
  INVX1 U359 ( .A(sel_data[35]), .Y(n293) );
  INVX1 U360 ( .A(sel_data[36]), .Y(n294) );
  INVX1 U361 ( .A(sel_data[37]), .Y(n295) );
  INVX1 U362 ( .A(sel_data[38]), .Y(n296) );
  INVX1 U363 ( .A(sel_data[39]), .Y(n297) );
  INVX1 U364 ( .A(sel_data[3]), .Y(n298) );
  INVX1 U365 ( .A(sel_data[40]), .Y(n299) );
  INVX1 U366 ( .A(sel_data[41]), .Y(n300) );
  INVX1 U367 ( .A(sel_data[42]), .Y(n301) );
  INVX1 U368 ( .A(sel_data[43]), .Y(n302) );
  INVX1 U369 ( .A(sel_data[44]), .Y(n303) );
  INVX1 U370 ( .A(sel_data[45]), .Y(n304) );
  INVX1 U371 ( .A(sel_data[46]), .Y(n305) );
  INVX1 U372 ( .A(sel_data[47]), .Y(n306) );
  INVX1 U373 ( .A(sel_data[48]), .Y(n307) );
  INVX1 U374 ( .A(sel_data[49]), .Y(n308) );
  INVX1 U375 ( .A(sel_data[4]), .Y(n309) );
  INVX1 U376 ( .A(sel_data[50]), .Y(n310) );
  INVX1 U377 ( .A(sel_data[51]), .Y(n311) );
  INVX1 U378 ( .A(sel_data[52]), .Y(n312) );
  INVX1 U379 ( .A(sel_data[53]), .Y(n313) );
  INVX1 U380 ( .A(sel_data[54]), .Y(n314) );
  INVX1 U381 ( .A(sel_data[55]), .Y(n315) );
  INVX1 U382 ( .A(sel_data[56]), .Y(n316) );
  INVX1 U383 ( .A(sel_data[57]), .Y(n317) );
  INVX1 U384 ( .A(sel_data[58]), .Y(n318) );
  INVX1 U385 ( .A(sel_data[59]), .Y(n319) );
  INVX1 U386 ( .A(sel_data[5]), .Y(n320) );
  INVX1 U387 ( .A(sel_data[60]), .Y(n321) );
  INVX1 U388 ( .A(sel_data[61]), .Y(n322) );
  INVX1 U389 ( .A(sel_data[62]), .Y(n323) );
  INVX1 U390 ( .A(sel_data[63]), .Y(n324) );
  INVX1 U391 ( .A(sel_data[6]), .Y(n325) );
  INVX1 U392 ( .A(sel_data[7]), .Y(n326) );
  INVX1 U393 ( .A(sel_data[8]), .Y(n327) );
  INVX1 U394 ( .A(sel_data[9]), .Y(n328) );
  AND2X1 U395 ( .A(n338), .B(grant[3]), .Y(n342) );
  INVX1 U396 ( .A(n342), .Y(n329) );
  AND2X1 U397 ( .A(buf_ri), .B(grant[0]), .Y(in0_ri) );
  AND2X1 U398 ( .A(buf_ri), .B(grant[1]), .Y(in1_ri) );
  INVX1 U399 ( .A(n333), .Y(n332) );
  INVX1 U400 ( .A(n335), .Y(n334) );
  INVX1 U401 ( .A(n337), .Y(n336) );
  INVX1 U402 ( .A(n469), .Y(n333) );
  INVX1 U403 ( .A(n470), .Y(n335) );
  INVX1 U404 ( .A(n471), .Y(n337) );
  INVX1 U405 ( .A(grant[0]), .Y(n338) );
  INVX1 U406 ( .A(grant[2]), .Y(n474) );
endmodule


module rr4_arbiter_0 ( clk, reset, request, advance, grant );
  input [3:0] request;
  output [3:0] grant;
  input clk, reset, advance;
  wire   n70, n72, n73, n75, n77, n51, n110, n47, n107, n106, n111, n53, n67,
         n65, n104, n105, n50, n102, n46, n100, n99, n103, n52, n66, n64, n97,
         n98, n96, n45, n94, n108, n59, n54, n91, n44, n89, n63, n56, n112,
         n86, n87, n85, n84, n113, n83, n92, n93, n82, n81, n80, n115, n88,
         n79, n49, n48, n114, n90, n95, n101, n109, n58, n61, n62, n60, n69;
  wire   [3:0] ptr;

  DFFSR ptr_reg_0_ ( .D(n70), .CLK(clk), .R(1'b1), .S(n72), .Q(ptr[0]) );
  DFFSR ptr_reg_2_ ( .D(n73), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[2]) );
  DFFSR ptr_reg_3_ ( .D(n75), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[3]) );
  DFFSR ptr_reg_1_ ( .D(n77), .CLK(clk), .R(n72), .S(1'b1), .Q(ptr[1]) );
  OAI21X1 U3 ( .A(n51), .B(n110), .C(n47), .Y(n77) );
  AOI21X1 U5 ( .A(advance), .B(n107), .C(n106), .Y(n111) );
  NOR3X1 U6 ( .A(n53), .B(request[3]), .C(request[2]), .Y(n106) );
  AOI22X1 U7 ( .A(n67), .B(advance), .C(n65), .D(n104), .Y(n105) );
  OAI21X1 U8 ( .A(n50), .B(n102), .C(n46), .Y(n75) );
  AOI21X1 U10 ( .A(advance), .B(n100), .C(n99), .Y(n103) );
  NOR3X1 U11 ( .A(n52), .B(request[1]), .C(request[0]), .Y(n99) );
  AOI22X1 U12 ( .A(n66), .B(advance), .C(n64), .D(n97), .Y(n98) );
  OAI21X1 U13 ( .A(n96), .B(n104), .C(n45), .Y(n73) );
  INVX1 U15 ( .A(n94), .Y(n96) );
  OAI21X1 U16 ( .A(n108), .B(n59), .C(n54), .Y(n94) );
  INVX1 U17 ( .A(reset), .Y(n72) );
  OAI21X1 U18 ( .A(n91), .B(n97), .C(n44), .Y(n70) );
  INVX1 U20 ( .A(n89), .Y(n91) );
  OAI21X1 U21 ( .A(n108), .B(n63), .C(n56), .Y(n89) );
  INVX1 U22 ( .A(advance), .Y(n108) );
  AOI21X1 U23 ( .A(n63), .B(n56), .C(n97), .Y(n112) );
  NAND3X1 U24 ( .A(n66), .B(n110), .C(n86), .Y(n87) );
  AND2X1 U25 ( .A(n102), .B(n104), .Y(n86) );
  AOI21X1 U26 ( .A(n85), .B(n84), .C(n102), .Y(n113) );
  OR2X1 U27 ( .A(n59), .B(request[1]), .Y(n84) );
  INVX1 U28 ( .A(n67), .Y(n85) );
  NAND3X1 U30 ( .A(n67), .B(n110), .C(n83), .Y(n92) );
  AND2X1 U31 ( .A(n97), .B(n102), .Y(n83) );
  AOI21X1 U32 ( .A(n110), .B(n107), .C(n65), .Y(n93) );
  INVX1 U33 ( .A(n82), .Y(n107) );
  AOI21X1 U34 ( .A(n97), .B(n64), .C(n66), .Y(n82) );
  INVX1 U35 ( .A(request[3]), .Y(n97) );
  AOI21X1 U36 ( .A(n81), .B(n80), .C(n110), .Y(n115) );
  INVX1 U37 ( .A(request[0]), .Y(n110) );
  AOI21X1 U39 ( .A(n102), .B(n100), .C(n64), .Y(n88) );
  INVX1 U40 ( .A(n79), .Y(n100) );
  AOI21X1 U41 ( .A(n104), .B(n65), .C(n67), .Y(n79) );
  INVX1 U42 ( .A(request[1]), .Y(n104) );
  INVX1 U43 ( .A(request[2]), .Y(n102) );
  INVX1 U44 ( .A(n66), .Y(n81) );
  OR2X1 U4 ( .A(n63), .B(request[3]), .Y(n80) );
  AND2X1 U9 ( .A(n49), .B(n48), .Y(n114) );
  INVX1 U14 ( .A(n114), .Y(grant[1]) );
  AND2X1 U19 ( .A(n66), .B(n108), .Y(n90) );
  INVX1 U29 ( .A(n90), .Y(n44) );
  AND2X1 U38 ( .A(n67), .B(n108), .Y(n95) );
  INVX1 U49 ( .A(n95), .Y(n45) );
  AND2X1 U50 ( .A(n64), .B(n108), .Y(n101) );
  INVX1 U51 ( .A(n101), .Y(n46) );
  AND2X1 U52 ( .A(n65), .B(n108), .Y(n109) );
  INVX1 U53 ( .A(n109), .Y(n47) );
  AND2X1 U54 ( .A(request[1]), .B(n58), .Y(n61) );
  INVX1 U55 ( .A(n61), .Y(n48) );
  AND2X1 U56 ( .A(request[1]), .B(n62), .Y(n60) );
  INVX1 U57 ( .A(n60), .Y(n49) );
  BUFX2 U58 ( .A(n103), .Y(n50) );
  BUFX2 U59 ( .A(n111), .Y(n51) );
  BUFX2 U60 ( .A(n98), .Y(n52) );
  BUFX2 U61 ( .A(n105), .Y(n53) );
  BUFX2 U62 ( .A(n92), .Y(n54) );
  BUFX2 U63 ( .A(n112), .Y(grant[3]) );
  BUFX2 U64 ( .A(n87), .Y(n56) );
  BUFX2 U65 ( .A(n113), .Y(grant[2]) );
  INVX1 U66 ( .A(n59), .Y(n58) );
  BUFX2 U67 ( .A(n93), .Y(n59) );
  INVX1 U68 ( .A(n54), .Y(n62) );
  BUFX2 U69 ( .A(n88), .Y(n63) );
  BUFX2 U70 ( .A(ptr[3]), .Y(n64) );
  BUFX2 U71 ( .A(ptr[1]), .Y(n65) );
  BUFX2 U72 ( .A(ptr[0]), .Y(n66) );
  BUFX2 U73 ( .A(ptr[2]), .Y(n67) );
  INVX1 U74 ( .A(n69), .Y(grant[0]) );
  INVX1 U75 ( .A(n115), .Y(n69) );
endmodule


module buffer_5 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n6, n277, n416, n348, n477, n347, n478, n346, n479, n345, n480, n410,
         n274, n271, n344, n268, n342, n343, n341, n273, n272, n340, n339,
         n338, n337, n336, n335, n334, n333, n332, n331, n330, n276, n329,
         n275, n328, n327, n326, n325, n324, n323, n322, n321, n320, n319,
         n318, n317, n316, n270, n315, n314, n313, n312, n311, n310, n309,
         n308, n307, n306, n305, n304, n269, n303, n302, n301, n300, n299,
         n298, n297, n296, n295, n294, n293, n292, n291, n290, n289, n288,
         n287, n286, n285, n284, n283, n282, n281, n280, n401, n424, n400,
         n425, n399, n426, n398, n427, n397, n428, n396, n429, n395, n430,
         n394, n431, n393, n432, n392, n433, n391, n434, n390, n435, n389,
         n436, n388, n437, n387, n438, n386, n439, n385, n440, n384, n441,
         n383, n442, n382, n443, n381, n444, n380, n445, n379, n446, n378,
         n447, n377, n448, n376, n449, n375, n450, n374, n451, n373, n452,
         n372, n453, n371, n454, n370, n455, n369, n456, n368, n457, n367,
         n458, n366, n459, n365, n460, n364, n461, n363, n462, n362, n463,
         n361, n464, n360, n465, n359, n466, n358, n467, n357, n468, n356,
         n469, n355, n470, n354, n471, n353, n472, n352, n473, n351, n474,
         n350, n475, n349, n476, n408, n417, n407, n418, n406, n419, n405,
         n420, n404, n421, n403, n422, n402, n423, n5, n415, n279, n278, n207,
         n205;

  DFFSR full_reg ( .D(n6), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n478) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n479) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n277), .S(1'b1), .Q(n480) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n271), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n274), .C(buffer_di[1]), .D(n268), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n274), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n272), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n272), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n272), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n272), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n272), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n272), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n272), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n272), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n272), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n272), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n272), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n276), .C(buffer_di[14]), .D(n272), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n275), .C(buffer_di[15]), .D(n272), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n271), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n276), .C(buffer_di[17]), .D(n271), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n275), .C(buffer_di[18]), .D(n271), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n271), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n271), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n271), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n271), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n271), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n271), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n271), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n271), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n271), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n270), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n270), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n270), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n270), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n270), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n270), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n270), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n270), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n270), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n270), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n270), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n270), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n269), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n269), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n269), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n269), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n269), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n269), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n269), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n269), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n269), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n269), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n269), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n269), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n268), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n268), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n268), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n268), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n268), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n274), .C(buffer_di[57]), .D(n268), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n268), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n274), .C(buffer_di[59]), .D(n268), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n274), .C(buffer_di[60]), .D(n268), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n274), .C(buffer_di[61]), .D(n268), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n268), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n274), .C(buffer_di[63]), .D(n268), .Y(
        n280) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  AND2X1 U7 ( .A(buffer_so), .B(n5), .Y(n415) );
  AND2X1 U8 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  AND2X1 U9 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U10 ( .A(n279), .Y(n5) );
  AND2X1 U11 ( .A(buffer_ri), .B(n274), .Y(n278) );
  INVX1 U12 ( .A(n278), .Y(n6) );
  BUFX2 U13 ( .A(n416), .Y(buffer_so) );
  BUFX2 U14 ( .A(n423), .Y(buffer_do[57]) );
  BUFX2 U15 ( .A(n422), .Y(buffer_do[58]) );
  BUFX2 U16 ( .A(n421), .Y(buffer_do[59]) );
  BUFX2 U17 ( .A(n420), .Y(buffer_do[60]) );
  BUFX2 U18 ( .A(n419), .Y(buffer_do[61]) );
  BUFX2 U19 ( .A(n418), .Y(buffer_do[62]) );
  BUFX2 U20 ( .A(n417), .Y(buffer_do[63]) );
  BUFX2 U21 ( .A(n476), .Y(buffer_do[4]) );
  BUFX2 U22 ( .A(n475), .Y(buffer_do[5]) );
  BUFX2 U23 ( .A(n474), .Y(buffer_do[6]) );
  BUFX2 U24 ( .A(n473), .Y(buffer_do[7]) );
  BUFX2 U25 ( .A(n472), .Y(buffer_do[8]) );
  BUFX2 U26 ( .A(n471), .Y(buffer_do[9]) );
  BUFX2 U27 ( .A(n470), .Y(buffer_do[10]) );
  BUFX2 U28 ( .A(n469), .Y(buffer_do[11]) );
  BUFX2 U29 ( .A(n468), .Y(buffer_do[12]) );
  BUFX2 U30 ( .A(n467), .Y(buffer_do[13]) );
  BUFX2 U31 ( .A(n466), .Y(buffer_do[14]) );
  BUFX2 U32 ( .A(n465), .Y(buffer_do[15]) );
  BUFX2 U33 ( .A(n464), .Y(buffer_do[16]) );
  BUFX2 U34 ( .A(n463), .Y(buffer_do[17]) );
  BUFX2 U35 ( .A(n462), .Y(buffer_do[18]) );
  BUFX2 U36 ( .A(n461), .Y(buffer_do[19]) );
  BUFX2 U37 ( .A(n460), .Y(buffer_do[20]) );
  BUFX2 U38 ( .A(n459), .Y(buffer_do[21]) );
  BUFX2 U39 ( .A(n458), .Y(buffer_do[22]) );
  BUFX2 U40 ( .A(n457), .Y(buffer_do[23]) );
  BUFX2 U41 ( .A(n456), .Y(buffer_do[24]) );
  BUFX2 U42 ( .A(n455), .Y(buffer_do[25]) );
  BUFX2 U43 ( .A(n454), .Y(buffer_do[26]) );
  BUFX2 U44 ( .A(n453), .Y(buffer_do[27]) );
  BUFX2 U45 ( .A(n452), .Y(buffer_do[28]) );
  BUFX2 U46 ( .A(n451), .Y(buffer_do[29]) );
  BUFX2 U47 ( .A(n450), .Y(buffer_do[30]) );
  BUFX2 U48 ( .A(n449), .Y(buffer_do[31]) );
  BUFX2 U49 ( .A(n448), .Y(buffer_do[32]) );
  BUFX2 U50 ( .A(n447), .Y(buffer_do[33]) );
  BUFX2 U51 ( .A(n446), .Y(buffer_do[34]) );
  BUFX2 U52 ( .A(n445), .Y(buffer_do[35]) );
  BUFX2 U53 ( .A(n444), .Y(buffer_do[36]) );
  BUFX2 U54 ( .A(n443), .Y(buffer_do[37]) );
  BUFX2 U55 ( .A(n442), .Y(buffer_do[38]) );
  BUFX2 U56 ( .A(n441), .Y(buffer_do[39]) );
  BUFX2 U57 ( .A(n440), .Y(buffer_do[40]) );
  BUFX2 U58 ( .A(n439), .Y(buffer_do[41]) );
  BUFX2 U59 ( .A(n438), .Y(buffer_do[42]) );
  BUFX2 U60 ( .A(n437), .Y(buffer_do[43]) );
  BUFX2 U61 ( .A(n436), .Y(buffer_do[44]) );
  BUFX2 U62 ( .A(n435), .Y(buffer_do[45]) );
  BUFX2 U63 ( .A(n434), .Y(buffer_do[46]) );
  BUFX2 U64 ( .A(n433), .Y(buffer_do[47]) );
  BUFX2 U65 ( .A(n432), .Y(buffer_do[48]) );
  BUFX2 U66 ( .A(n431), .Y(buffer_do[49]) );
  BUFX2 U69 ( .A(n430), .Y(buffer_do[50]) );
  BUFX2 U70 ( .A(n429), .Y(buffer_do[51]) );
  BUFX2 U71 ( .A(n428), .Y(buffer_do[52]) );
  BUFX2 U72 ( .A(n427), .Y(buffer_do[53]) );
  BUFX2 U73 ( .A(n426), .Y(buffer_do[54]) );
  BUFX2 U74 ( .A(n425), .Y(buffer_do[55]) );
  BUFX2 U75 ( .A(n424), .Y(buffer_do[56]) );
  BUFX2 U76 ( .A(n480), .Y(buffer_do[0]) );
  BUFX2 U77 ( .A(n479), .Y(buffer_do[1]) );
  BUFX2 U78 ( .A(n478), .Y(buffer_do[2]) );
  BUFX2 U79 ( .A(n477), .Y(buffer_do[3]) );
  INVX1 U80 ( .A(n207), .Y(n205) );
  INVX1 U81 ( .A(n205), .Y(buffer_ri) );
  INVX1 U82 ( .A(n415), .Y(n207) );
  INVX2 U83 ( .A(reset), .Y(n277) );
  INVX1 U208 ( .A(n276), .Y(n272) );
  INVX1 U209 ( .A(n273), .Y(n271) );
  INVX1 U210 ( .A(n273), .Y(n270) );
  INVX1 U211 ( .A(n276), .Y(n269) );
  INVX1 U212 ( .A(n275), .Y(n268) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n344), .Y(n345) );
  INVX1 U218 ( .A(n342), .Y(n346) );
  INVX1 U219 ( .A(n341), .Y(n347) );
  INVX1 U220 ( .A(n340), .Y(n348) );
  INVX1 U221 ( .A(n339), .Y(n349) );
  INVX1 U222 ( .A(n338), .Y(n350) );
  INVX1 U223 ( .A(n337), .Y(n351) );
  INVX1 U224 ( .A(n336), .Y(n352) );
  INVX1 U225 ( .A(n335), .Y(n353) );
  INVX1 U226 ( .A(n334), .Y(n354) );
  INVX1 U227 ( .A(n333), .Y(n355) );
  INVX1 U228 ( .A(n332), .Y(n356) );
  INVX1 U229 ( .A(n331), .Y(n357) );
  INVX1 U230 ( .A(n330), .Y(n358) );
  INVX1 U231 ( .A(n329), .Y(n359) );
  INVX1 U232 ( .A(n328), .Y(n360) );
  INVX1 U233 ( .A(n327), .Y(n361) );
  INVX1 U234 ( .A(n326), .Y(n362) );
  INVX1 U235 ( .A(n325), .Y(n363) );
  INVX1 U236 ( .A(n324), .Y(n364) );
  INVX1 U237 ( .A(n323), .Y(n365) );
  INVX1 U238 ( .A(n322), .Y(n366) );
  INVX1 U239 ( .A(n321), .Y(n367) );
  INVX1 U240 ( .A(n320), .Y(n368) );
  INVX1 U241 ( .A(n319), .Y(n369) );
  INVX1 U242 ( .A(n318), .Y(n370) );
  INVX1 U243 ( .A(n317), .Y(n371) );
  INVX1 U244 ( .A(n316), .Y(n372) );
  INVX1 U245 ( .A(n315), .Y(n373) );
  INVX1 U246 ( .A(n314), .Y(n374) );
  INVX1 U247 ( .A(n313), .Y(n375) );
  INVX1 U248 ( .A(n312), .Y(n376) );
  INVX1 U249 ( .A(n311), .Y(n377) );
  INVX1 U250 ( .A(n310), .Y(n378) );
  INVX1 U251 ( .A(n309), .Y(n379) );
  INVX1 U252 ( .A(n308), .Y(n380) );
  INVX1 U253 ( .A(n307), .Y(n381) );
  INVX1 U254 ( .A(n306), .Y(n382) );
  INVX1 U255 ( .A(n305), .Y(n383) );
  INVX1 U256 ( .A(n304), .Y(n384) );
  INVX1 U257 ( .A(n303), .Y(n385) );
  INVX1 U258 ( .A(n302), .Y(n386) );
  INVX1 U259 ( .A(n301), .Y(n387) );
  INVX1 U260 ( .A(n300), .Y(n388) );
  INVX1 U261 ( .A(n299), .Y(n389) );
  INVX1 U262 ( .A(n298), .Y(n390) );
  INVX1 U263 ( .A(n297), .Y(n391) );
  INVX1 U264 ( .A(n296), .Y(n392) );
  INVX1 U265 ( .A(n295), .Y(n393) );
  INVX1 U266 ( .A(n294), .Y(n394) );
  INVX1 U267 ( .A(n293), .Y(n395) );
  INVX1 U268 ( .A(n292), .Y(n396) );
  INVX1 U269 ( .A(n291), .Y(n397) );
  INVX1 U270 ( .A(n290), .Y(n398) );
  INVX1 U271 ( .A(n289), .Y(n399) );
  INVX1 U272 ( .A(n288), .Y(n400) );
  INVX1 U273 ( .A(n287), .Y(n401) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n282), .Y(n406) );
  INVX1 U279 ( .A(n281), .Y(n407) );
  INVX1 U280 ( .A(n280), .Y(n408) );
endmodule


module output_controller_4in_0 ( clk, reset, polarity, output_so, output_do, 
        output_ro, in0_si, in0_di, in0_ri, in1_si, in1_di, in1_ri, in2_si, 
        in2_di, in2_ri, in3_si, in3_di, in3_ri );
  output [63:0] output_do;
  input [63:0] in0_di;
  input [63:0] in1_di;
  input [63:0] in2_di;
  input [63:0] in3_di;
  input clk, reset, polarity, output_ro, in0_si, in1_si, in2_si, in3_si;
  output output_so, in0_ri, in1_ri, in2_ri, in3_ri;
  wire   n330, buf_ri, n324, n323, n322, n321, n319, n318, n317, n316, n315,
         n314, n313, n312, n311, n310, n308, n307, n306, n305, n304, n303,
         n302, n301, n300, n299, n297, n296, n295, n294, n293, n292, n291,
         n290, n289, n288, n286, n285, n284, n283, n282, n281, n280, n279,
         n278, n277, n275, n274, n273, n272, n271, n270, n269, n268, n267,
         n266, n328, n327, n326, n325, n320, n309, n298, n287, n276, n265,
         n471, n334, n472, n469, n473, n467, n468, n470, n465, n466, n463,
         n464, n461, n462, n459, n460, n457, n458, n455, n456, n453, n454,
         n451, n452, n336, n449, n450, n447, n448, n445, n446, n443, n444,
         n441, n442, n439, n440, n437, n438, n435, n436, n433, n434, n431,
         n432, n429, n430, n427, n428, n425, n426, n423, n424, n421, n422,
         n419, n420, n417, n332, n418, n415, n416, n413, n414, n411, n412,
         n409, n410, n407, n408, n405, n406, n403, n404, n401, n402, n399,
         n400, n397, n398, n395, n396, n393, n394, n391, n392, n389, n390,
         n387, n388, n385, n386, n383, n384, n381, n382, n379, n380, n377,
         n378, n375, n376, n373, n374, n371, n372, n369, n370, n367, n368,
         n365, n366, n363, n364, n361, n362, n359, n360, n357, n358, n355,
         n356, n353, n354, n351, n352, n349, n350, n347, n348, n345, n346,
         n343, n474, n329, n344, n189, n253, n190, n254, n191, n255, n193,
         n257, n194, n258, n195, n259, n196, n260, n181, n245, n192, n256,
         n197, n261, n198, n262, n199, n263, n200, n264, n2, n202, n3, n203,
         n140, n204, n141, n205, n142, n206, n143, n207, n144, n208, n145,
         n209, n146, n210, n147, n211, n149, n213, n150, n214, n151, n215,
         n152, n216, n153, n217, n154, n218, n155, n219, n156, n220, n157,
         n221, n158, n222, n160, n224, n161, n225, n162, n226, n163, n227,
         n164, n228, n165, n229, n166, n230, n167, n231, n168, n232, n169,
         n233, n171, n235, n172, n236, n173, n237, n174, n238, n175, n239,
         n176, n240, n177, n241, n178, n242, n179, n243, n180, n244, n182,
         n246, n183, n247, n184, n248, n185, n249, n186, n250, n187, n251,
         n188, n252, n1, n201, n148, n212, n159, n223, n170, n234, n338, n331,
         n339, n342, n333, n335, n337;
  wire   [3:0] grant;
  wire   [63:0] sel_data;

  rr4_arbiter_0 ARB ( .clk(clk), .reset(reset), .request({in3_si, in2_si, 
        in1_si, in0_si}), .advance(n330), .grant(grant) );
  buffer_5 OB ( .clk(clk), .reset(reset), .buffer_en(1'b1), .buffer_di({n324, 
        n323, n322, n321, n319, n318, n317, n316, n315, n314, n313, n312, n311, 
        n310, n308, n307, n306, n305, n304, n303, n302, n301, n300, n299, n297, 
        n296, n295, n294, n293, n292, n291, n290, n289, n288, n286, n285, n284, 
        n283, n282, n281, n280, n279, n278, n277, n275, n274, n273, n272, n271, 
        n270, n269, n268, n267, n266, n328, n327, n326, n325, n320, n309, n298, 
        n287, n276, n265}), .buffer_si(n330), .buffer_ri(buf_ri), .buffer_ro(
        output_ro), .buffer_so(output_so), .buffer_do(output_do) );
  AOI22X1 U11 ( .A(in3_di[9]), .B(n471), .C(in2_di[9]), .D(n334), .Y(n472) );
  AOI22X1 U12 ( .A(in1_di[9]), .B(n469), .C(in0_di[9]), .D(grant[0]), .Y(n473)
         );
  AOI22X1 U14 ( .A(in3_di[8]), .B(n471), .C(in2_di[8]), .D(n334), .Y(n467) );
  AOI22X1 U15 ( .A(in1_di[8]), .B(n469), .C(in0_di[8]), .D(grant[0]), .Y(n468)
         );
  AOI22X1 U17 ( .A(in3_di[7]), .B(n471), .C(in2_di[7]), .D(n470), .Y(n465) );
  AOI22X1 U18 ( .A(in1_di[7]), .B(n469), .C(in0_di[7]), .D(grant[0]), .Y(n466)
         );
  AOI22X1 U20 ( .A(in3_di[6]), .B(n471), .C(in2_di[6]), .D(n470), .Y(n463) );
  AOI22X1 U21 ( .A(in1_di[6]), .B(n469), .C(in0_di[6]), .D(grant[0]), .Y(n464)
         );
  AOI22X1 U23 ( .A(in3_di[63]), .B(n471), .C(in2_di[63]), .D(n334), .Y(n461)
         );
  AOI22X1 U24 ( .A(in1_di[63]), .B(n469), .C(in0_di[63]), .D(grant[0]), .Y(
        n462) );
  AOI22X1 U26 ( .A(in3_di[62]), .B(n471), .C(in2_di[62]), .D(n470), .Y(n459)
         );
  AOI22X1 U27 ( .A(in1_di[62]), .B(n469), .C(in0_di[62]), .D(grant[0]), .Y(
        n460) );
  AOI22X1 U29 ( .A(in3_di[61]), .B(n471), .C(in2_di[61]), .D(n334), .Y(n457)
         );
  AOI22X1 U30 ( .A(in1_di[61]), .B(n469), .C(in0_di[61]), .D(grant[0]), .Y(
        n458) );
  AOI22X1 U32 ( .A(in3_di[60]), .B(n471), .C(in2_di[60]), .D(n470), .Y(n455)
         );
  AOI22X1 U33 ( .A(in1_di[60]), .B(n469), .C(in0_di[60]), .D(grant[0]), .Y(
        n456) );
  AOI22X1 U35 ( .A(in3_di[5]), .B(n471), .C(in2_di[5]), .D(n470), .Y(n453) );
  AOI22X1 U36 ( .A(in1_di[5]), .B(n469), .C(in0_di[5]), .D(grant[0]), .Y(n454)
         );
  AOI22X1 U38 ( .A(in3_di[59]), .B(n471), .C(in2_di[59]), .D(n470), .Y(n451)
         );
  AOI22X1 U39 ( .A(in1_di[59]), .B(n469), .C(in0_di[59]), .D(grant[0]), .Y(
        n452) );
  AOI22X1 U41 ( .A(in3_di[58]), .B(n336), .C(in2_di[58]), .D(n470), .Y(n449)
         );
  AOI22X1 U42 ( .A(in1_di[58]), .B(n469), .C(in0_di[58]), .D(grant[0]), .Y(
        n450) );
  AOI22X1 U44 ( .A(in3_di[57]), .B(n336), .C(in2_di[57]), .D(n470), .Y(n447)
         );
  AOI22X1 U45 ( .A(in1_di[57]), .B(n469), .C(in0_di[57]), .D(grant[0]), .Y(
        n448) );
  AOI22X1 U47 ( .A(in3_di[56]), .B(n471), .C(in2_di[56]), .D(n470), .Y(n445)
         );
  AOI22X1 U48 ( .A(in1_di[56]), .B(n469), .C(in0_di[56]), .D(grant[0]), .Y(
        n446) );
  AOI22X1 U50 ( .A(in3_di[55]), .B(n471), .C(in2_di[55]), .D(n470), .Y(n443)
         );
  AOI22X1 U51 ( .A(in1_di[55]), .B(n469), .C(in0_di[55]), .D(grant[0]), .Y(
        n444) );
  AOI22X1 U53 ( .A(in3_di[54]), .B(n471), .C(in2_di[54]), .D(n470), .Y(n441)
         );
  AOI22X1 U54 ( .A(in1_di[54]), .B(n469), .C(in0_di[54]), .D(grant[0]), .Y(
        n442) );
  AOI22X1 U56 ( .A(in3_di[53]), .B(n471), .C(in2_di[53]), .D(n470), .Y(n439)
         );
  AOI22X1 U57 ( .A(in1_di[53]), .B(n469), .C(in0_di[53]), .D(grant[0]), .Y(
        n440) );
  AOI22X1 U59 ( .A(in3_di[52]), .B(n471), .C(in2_di[52]), .D(n334), .Y(n437)
         );
  AOI22X1 U60 ( .A(in1_di[52]), .B(n469), .C(in0_di[52]), .D(grant[0]), .Y(
        n438) );
  AOI22X1 U62 ( .A(in3_di[51]), .B(n471), .C(in2_di[51]), .D(n334), .Y(n435)
         );
  AOI22X1 U63 ( .A(in1_di[51]), .B(n469), .C(in0_di[51]), .D(grant[0]), .Y(
        n436) );
  AOI22X1 U65 ( .A(in3_di[50]), .B(n471), .C(in2_di[50]), .D(n334), .Y(n433)
         );
  AOI22X1 U66 ( .A(in1_di[50]), .B(n469), .C(in0_di[50]), .D(grant[0]), .Y(
        n434) );
  AOI22X1 U68 ( .A(in3_di[4]), .B(n471), .C(in2_di[4]), .D(n334), .Y(n431) );
  AOI22X1 U69 ( .A(in1_di[4]), .B(n469), .C(in0_di[4]), .D(grant[0]), .Y(n432)
         );
  AOI22X1 U71 ( .A(in3_di[49]), .B(n471), .C(in2_di[49]), .D(n334), .Y(n429)
         );
  AOI22X1 U72 ( .A(in1_di[49]), .B(n469), .C(in0_di[49]), .D(grant[0]), .Y(
        n430) );
  AOI22X1 U74 ( .A(in3_di[48]), .B(n471), .C(in2_di[48]), .D(n334), .Y(n427)
         );
  AOI22X1 U75 ( .A(in1_di[48]), .B(n469), .C(in0_di[48]), .D(grant[0]), .Y(
        n428) );
  AOI22X1 U77 ( .A(in3_di[47]), .B(n471), .C(in2_di[47]), .D(n334), .Y(n425)
         );
  AOI22X1 U78 ( .A(in1_di[47]), .B(n469), .C(in0_di[47]), .D(grant[0]), .Y(
        n426) );
  AOI22X1 U80 ( .A(in3_di[46]), .B(n471), .C(in2_di[46]), .D(n334), .Y(n423)
         );
  AOI22X1 U81 ( .A(in1_di[46]), .B(n469), .C(in0_di[46]), .D(grant[0]), .Y(
        n424) );
  AOI22X1 U83 ( .A(in3_di[45]), .B(n471), .C(in2_di[45]), .D(n334), .Y(n421)
         );
  AOI22X1 U84 ( .A(in1_di[45]), .B(n469), .C(in0_di[45]), .D(grant[0]), .Y(
        n422) );
  AOI22X1 U86 ( .A(in3_di[44]), .B(n471), .C(in2_di[44]), .D(n334), .Y(n419)
         );
  AOI22X1 U87 ( .A(in1_di[44]), .B(n469), .C(in0_di[44]), .D(grant[0]), .Y(
        n420) );
  AOI22X1 U89 ( .A(in3_di[43]), .B(n471), .C(in2_di[43]), .D(n334), .Y(n417)
         );
  AOI22X1 U90 ( .A(in1_di[43]), .B(n332), .C(in0_di[43]), .D(grant[0]), .Y(
        n418) );
  AOI22X1 U92 ( .A(in3_di[42]), .B(n471), .C(in2_di[42]), .D(n334), .Y(n415)
         );
  AOI22X1 U93 ( .A(in1_di[42]), .B(n469), .C(in0_di[42]), .D(grant[0]), .Y(
        n416) );
  AOI22X1 U95 ( .A(in3_di[41]), .B(n471), .C(in2_di[41]), .D(n470), .Y(n413)
         );
  AOI22X1 U96 ( .A(in1_di[41]), .B(n469), .C(in0_di[41]), .D(grant[0]), .Y(
        n414) );
  AOI22X1 U98 ( .A(in3_di[40]), .B(n471), .C(in2_di[40]), .D(n470), .Y(n411)
         );
  AOI22X1 U99 ( .A(in1_di[40]), .B(n469), .C(in0_di[40]), .D(grant[0]), .Y(
        n412) );
  AOI22X1 U101 ( .A(in3_di[3]), .B(n471), .C(in2_di[3]), .D(n470), .Y(n409) );
  AOI22X1 U102 ( .A(in1_di[3]), .B(n469), .C(in0_di[3]), .D(grant[0]), .Y(n410) );
  AOI22X1 U104 ( .A(in3_di[39]), .B(n471), .C(in2_di[39]), .D(n470), .Y(n407)
         );
  AOI22X1 U105 ( .A(in1_di[39]), .B(n469), .C(in0_di[39]), .D(grant[0]), .Y(
        n408) );
  AOI22X1 U107 ( .A(in3_di[38]), .B(n471), .C(in2_di[38]), .D(n470), .Y(n405)
         );
  AOI22X1 U108 ( .A(in1_di[38]), .B(n469), .C(in0_di[38]), .D(grant[0]), .Y(
        n406) );
  AOI22X1 U110 ( .A(in3_di[37]), .B(n471), .C(in2_di[37]), .D(n470), .Y(n403)
         );
  AOI22X1 U111 ( .A(in1_di[37]), .B(n469), .C(in0_di[37]), .D(grant[0]), .Y(
        n404) );
  AOI22X1 U113 ( .A(in3_di[36]), .B(n471), .C(in2_di[36]), .D(n470), .Y(n401)
         );
  AOI22X1 U114 ( .A(in1_di[36]), .B(n469), .C(in0_di[36]), .D(grant[0]), .Y(
        n402) );
  AOI22X1 U116 ( .A(in3_di[35]), .B(n471), .C(in2_di[35]), .D(n470), .Y(n399)
         );
  AOI22X1 U117 ( .A(in1_di[35]), .B(n469), .C(in0_di[35]), .D(grant[0]), .Y(
        n400) );
  AOI22X1 U119 ( .A(in3_di[34]), .B(n336), .C(in2_di[34]), .D(n334), .Y(n397)
         );
  AOI22X1 U120 ( .A(in1_di[34]), .B(n469), .C(in0_di[34]), .D(grant[0]), .Y(
        n398) );
  AOI22X1 U122 ( .A(in3_di[33]), .B(n336), .C(in2_di[33]), .D(n334), .Y(n395)
         );
  AOI22X1 U123 ( .A(in1_di[33]), .B(n469), .C(in0_di[33]), .D(grant[0]), .Y(
        n396) );
  AOI22X1 U125 ( .A(in3_di[32]), .B(n336), .C(in2_di[32]), .D(n334), .Y(n393)
         );
  AOI22X1 U126 ( .A(in1_di[32]), .B(n469), .C(in0_di[32]), .D(grant[0]), .Y(
        n394) );
  AOI22X1 U128 ( .A(in3_di[31]), .B(n336), .C(in2_di[31]), .D(n334), .Y(n391)
         );
  AOI22X1 U129 ( .A(in1_di[31]), .B(n332), .C(in0_di[31]), .D(grant[0]), .Y(
        n392) );
  AOI22X1 U131 ( .A(in3_di[30]), .B(n336), .C(in2_di[30]), .D(n470), .Y(n389)
         );
  AOI22X1 U132 ( .A(in1_di[30]), .B(n332), .C(in0_di[30]), .D(grant[0]), .Y(
        n390) );
  AOI22X1 U134 ( .A(in3_di[2]), .B(n336), .C(in2_di[2]), .D(n470), .Y(n387) );
  AOI22X1 U135 ( .A(in1_di[2]), .B(n332), .C(in0_di[2]), .D(grant[0]), .Y(n388) );
  AOI22X1 U137 ( .A(in3_di[29]), .B(n336), .C(in2_di[29]), .D(n470), .Y(n385)
         );
  AOI22X1 U138 ( .A(in1_di[29]), .B(n332), .C(in0_di[29]), .D(grant[0]), .Y(
        n386) );
  AOI22X1 U140 ( .A(in3_di[28]), .B(n336), .C(in2_di[28]), .D(n470), .Y(n383)
         );
  AOI22X1 U141 ( .A(in1_di[28]), .B(n332), .C(in0_di[28]), .D(grant[0]), .Y(
        n384) );
  AOI22X1 U143 ( .A(in3_di[27]), .B(n336), .C(in2_di[27]), .D(n470), .Y(n381)
         );
  AOI22X1 U144 ( .A(in1_di[27]), .B(n332), .C(in0_di[27]), .D(grant[0]), .Y(
        n382) );
  AOI22X1 U146 ( .A(in3_di[26]), .B(n336), .C(in2_di[26]), .D(n470), .Y(n379)
         );
  AOI22X1 U147 ( .A(in1_di[26]), .B(n332), .C(in0_di[26]), .D(grant[0]), .Y(
        n380) );
  AOI22X1 U149 ( .A(in3_di[25]), .B(n336), .C(in2_di[25]), .D(n470), .Y(n377)
         );
  AOI22X1 U150 ( .A(in1_di[25]), .B(n332), .C(in0_di[25]), .D(grant[0]), .Y(
        n378) );
  AOI22X1 U152 ( .A(in3_di[24]), .B(n336), .C(in2_di[24]), .D(n470), .Y(n375)
         );
  AOI22X1 U153 ( .A(in1_di[24]), .B(n332), .C(in0_di[24]), .D(grant[0]), .Y(
        n376) );
  AOI22X1 U155 ( .A(in3_di[23]), .B(n336), .C(in2_di[23]), .D(n470), .Y(n373)
         );
  AOI22X1 U156 ( .A(in1_di[23]), .B(n332), .C(in0_di[23]), .D(grant[0]), .Y(
        n374) );
  AOI22X1 U158 ( .A(in3_di[22]), .B(n336), .C(in2_di[22]), .D(n470), .Y(n371)
         );
  AOI22X1 U159 ( .A(in1_di[22]), .B(n332), .C(in0_di[22]), .D(grant[0]), .Y(
        n372) );
  AOI22X1 U161 ( .A(in3_di[21]), .B(n336), .C(in2_di[21]), .D(n470), .Y(n369)
         );
  AOI22X1 U162 ( .A(in1_di[21]), .B(n332), .C(in0_di[21]), .D(grant[0]), .Y(
        n370) );
  AOI22X1 U164 ( .A(in3_di[20]), .B(n336), .C(in2_di[20]), .D(n470), .Y(n367)
         );
  AOI22X1 U165 ( .A(in1_di[20]), .B(n332), .C(in0_di[20]), .D(grant[0]), .Y(
        n368) );
  AOI22X1 U167 ( .A(in3_di[1]), .B(n336), .C(in2_di[1]), .D(n334), .Y(n365) );
  AOI22X1 U168 ( .A(in1_di[1]), .B(n469), .C(in0_di[1]), .D(grant[0]), .Y(n366) );
  AOI22X1 U170 ( .A(in3_di[19]), .B(n336), .C(in2_di[19]), .D(n334), .Y(n363)
         );
  AOI22X1 U171 ( .A(in1_di[19]), .B(n469), .C(in0_di[19]), .D(grant[0]), .Y(
        n364) );
  AOI22X1 U173 ( .A(in3_di[18]), .B(n336), .C(in2_di[18]), .D(n334), .Y(n361)
         );
  AOI22X1 U174 ( .A(in1_di[18]), .B(n469), .C(in0_di[18]), .D(grant[0]), .Y(
        n362) );
  AOI22X1 U176 ( .A(in3_di[17]), .B(n336), .C(in2_di[17]), .D(n334), .Y(n359)
         );
  AOI22X1 U177 ( .A(in1_di[17]), .B(n469), .C(in0_di[17]), .D(grant[0]), .Y(
        n360) );
  AOI22X1 U179 ( .A(in3_di[16]), .B(n336), .C(in2_di[16]), .D(n334), .Y(n357)
         );
  AOI22X1 U180 ( .A(in1_di[16]), .B(n469), .C(in0_di[16]), .D(grant[0]), .Y(
        n358) );
  AOI22X1 U182 ( .A(in3_di[15]), .B(n336), .C(in2_di[15]), .D(n334), .Y(n355)
         );
  AOI22X1 U183 ( .A(in1_di[15]), .B(n469), .C(in0_di[15]), .D(grant[0]), .Y(
        n356) );
  AOI22X1 U185 ( .A(in3_di[14]), .B(n336), .C(in2_di[14]), .D(n334), .Y(n353)
         );
  AOI22X1 U186 ( .A(in1_di[14]), .B(n469), .C(in0_di[14]), .D(grant[0]), .Y(
        n354) );
  AOI22X1 U188 ( .A(in3_di[13]), .B(n336), .C(in2_di[13]), .D(n334), .Y(n351)
         );
  AOI22X1 U189 ( .A(in1_di[13]), .B(n469), .C(in0_di[13]), .D(grant[0]), .Y(
        n352) );
  AOI22X1 U191 ( .A(in3_di[12]), .B(n336), .C(in2_di[12]), .D(n334), .Y(n349)
         );
  AOI22X1 U192 ( .A(in1_di[12]), .B(n469), .C(in0_di[12]), .D(grant[0]), .Y(
        n350) );
  AOI22X1 U194 ( .A(in3_di[11]), .B(n336), .C(in2_di[11]), .D(n334), .Y(n347)
         );
  AOI22X1 U195 ( .A(in1_di[11]), .B(n469), .C(in0_di[11]), .D(grant[0]), .Y(
        n348) );
  AOI22X1 U197 ( .A(in3_di[10]), .B(n336), .C(in2_di[10]), .D(n334), .Y(n345)
         );
  AOI22X1 U198 ( .A(in1_di[10]), .B(n332), .C(in0_di[10]), .D(grant[0]), .Y(
        n346) );
  AOI22X1 U200 ( .A(in3_di[0]), .B(n336), .C(in2_di[0]), .D(n334), .Y(n343) );
  NOR3X1 U201 ( .A(grant[0]), .B(grant[1]), .C(n474), .Y(n470) );
  NOR3X1 U202 ( .A(grant[1]), .B(grant[2]), .C(n329), .Y(n471) );
  AOI22X1 U204 ( .A(in1_di[0]), .B(n469), .C(in0_di[0]), .D(grant[0]), .Y(n344) );
  AND2X1 U3 ( .A(buf_ri), .B(grant[3]), .Y(in3_ri) );
  AND2X1 U4 ( .A(n189), .B(n253), .Y(sel_data[57]) );
  AND2X1 U5 ( .A(n190), .B(n254), .Y(sel_data[58]) );
  AND2X1 U6 ( .A(n191), .B(n255), .Y(sel_data[59]) );
  AND2X1 U7 ( .A(n193), .B(n257), .Y(sel_data[60]) );
  AND2X1 U8 ( .A(n194), .B(n258), .Y(sel_data[61]) );
  AND2X1 U9 ( .A(n195), .B(n259), .Y(sel_data[62]) );
  AND2X1 U10 ( .A(n196), .B(n260), .Y(sel_data[63]) );
  AND2X1 U13 ( .A(n181), .B(n245), .Y(sel_data[4]) );
  AND2X1 U16 ( .A(n192), .B(n256), .Y(sel_data[5]) );
  AND2X1 U19 ( .A(n197), .B(n261), .Y(sel_data[6]) );
  AND2X1 U22 ( .A(n198), .B(n262), .Y(sel_data[7]) );
  AND2X1 U25 ( .A(n199), .B(n263), .Y(sel_data[8]) );
  AND2X1 U28 ( .A(n200), .B(n264), .Y(sel_data[9]) );
  AND2X1 U31 ( .A(n2), .B(n202), .Y(sel_data[10]) );
  AND2X1 U34 ( .A(n3), .B(n203), .Y(sel_data[11]) );
  AND2X1 U37 ( .A(n140), .B(n204), .Y(sel_data[12]) );
  AND2X1 U40 ( .A(n141), .B(n205), .Y(sel_data[13]) );
  AND2X1 U43 ( .A(n142), .B(n206), .Y(sel_data[14]) );
  AND2X1 U46 ( .A(n143), .B(n207), .Y(sel_data[15]) );
  AND2X1 U49 ( .A(n144), .B(n208), .Y(sel_data[16]) );
  AND2X1 U52 ( .A(n145), .B(n209), .Y(sel_data[17]) );
  AND2X1 U55 ( .A(n146), .B(n210), .Y(sel_data[18]) );
  AND2X1 U58 ( .A(n147), .B(n211), .Y(sel_data[19]) );
  AND2X1 U61 ( .A(n149), .B(n213), .Y(sel_data[20]) );
  AND2X1 U64 ( .A(n150), .B(n214), .Y(sel_data[21]) );
  AND2X1 U67 ( .A(n151), .B(n215), .Y(sel_data[22]) );
  AND2X1 U70 ( .A(n152), .B(n216), .Y(sel_data[23]) );
  AND2X1 U73 ( .A(n153), .B(n217), .Y(sel_data[24]) );
  AND2X1 U76 ( .A(n154), .B(n218), .Y(sel_data[25]) );
  AND2X1 U79 ( .A(n155), .B(n219), .Y(sel_data[26]) );
  AND2X1 U82 ( .A(n156), .B(n220), .Y(sel_data[27]) );
  AND2X1 U85 ( .A(n157), .B(n221), .Y(sel_data[28]) );
  AND2X1 U88 ( .A(n158), .B(n222), .Y(sel_data[29]) );
  AND2X1 U91 ( .A(n160), .B(n224), .Y(sel_data[30]) );
  AND2X1 U94 ( .A(n161), .B(n225), .Y(sel_data[31]) );
  AND2X1 U97 ( .A(n162), .B(n226), .Y(sel_data[32]) );
  AND2X1 U100 ( .A(n163), .B(n227), .Y(sel_data[33]) );
  AND2X1 U103 ( .A(n164), .B(n228), .Y(sel_data[34]) );
  AND2X1 U106 ( .A(n165), .B(n229), .Y(sel_data[35]) );
  AND2X1 U109 ( .A(n166), .B(n230), .Y(sel_data[36]) );
  AND2X1 U112 ( .A(n167), .B(n231), .Y(sel_data[37]) );
  AND2X1 U115 ( .A(n168), .B(n232), .Y(sel_data[38]) );
  AND2X1 U118 ( .A(n169), .B(n233), .Y(sel_data[39]) );
  AND2X1 U121 ( .A(n171), .B(n235), .Y(sel_data[40]) );
  AND2X1 U124 ( .A(n172), .B(n236), .Y(sel_data[41]) );
  AND2X1 U127 ( .A(n173), .B(n237), .Y(sel_data[42]) );
  AND2X1 U130 ( .A(n174), .B(n238), .Y(sel_data[43]) );
  AND2X1 U133 ( .A(n175), .B(n239), .Y(sel_data[44]) );
  AND2X1 U136 ( .A(n176), .B(n240), .Y(sel_data[45]) );
  AND2X1 U139 ( .A(n177), .B(n241), .Y(sel_data[46]) );
  AND2X1 U142 ( .A(n178), .B(n242), .Y(sel_data[47]) );
  AND2X1 U145 ( .A(n179), .B(n243), .Y(sel_data[48]) );
  AND2X1 U148 ( .A(n180), .B(n244), .Y(sel_data[49]) );
  AND2X1 U151 ( .A(n182), .B(n246), .Y(sel_data[50]) );
  AND2X1 U154 ( .A(n183), .B(n247), .Y(sel_data[51]) );
  AND2X1 U157 ( .A(n184), .B(n248), .Y(sel_data[52]) );
  AND2X1 U160 ( .A(n185), .B(n249), .Y(sel_data[53]) );
  AND2X1 U163 ( .A(n186), .B(n250), .Y(sel_data[54]) );
  AND2X1 U166 ( .A(n187), .B(n251), .Y(sel_data[55]) );
  AND2X1 U169 ( .A(n188), .B(n252), .Y(sel_data[56]) );
  AND2X1 U172 ( .A(n1), .B(n201), .Y(sel_data[0]) );
  AND2X1 U175 ( .A(n148), .B(n212), .Y(sel_data[1]) );
  AND2X1 U178 ( .A(n159), .B(n223), .Y(sel_data[2]) );
  AND2X1 U181 ( .A(n170), .B(n234), .Y(sel_data[3]) );
  AND2X1 U184 ( .A(grant[1]), .B(n338), .Y(n469) );
  OR2X1 U187 ( .A(in0_ri), .B(n331), .Y(n330) );
  OR2X1 U190 ( .A(n339), .B(in1_ri), .Y(n331) );
  OR2X1 U193 ( .A(in2_ri), .B(in3_ri), .Y(n339) );
  AND2X1 U196 ( .A(buf_ri), .B(grant[2]), .Y(in2_ri) );
  BUFX2 U199 ( .A(n344), .Y(n1) );
  BUFX2 U203 ( .A(n346), .Y(n2) );
  BUFX2 U205 ( .A(n348), .Y(n3) );
  BUFX2 U206 ( .A(n350), .Y(n140) );
  BUFX2 U207 ( .A(n352), .Y(n141) );
  BUFX2 U208 ( .A(n354), .Y(n142) );
  BUFX2 U209 ( .A(n356), .Y(n143) );
  BUFX2 U210 ( .A(n358), .Y(n144) );
  BUFX2 U211 ( .A(n360), .Y(n145) );
  BUFX2 U212 ( .A(n362), .Y(n146) );
  BUFX2 U213 ( .A(n364), .Y(n147) );
  BUFX2 U214 ( .A(n366), .Y(n148) );
  BUFX2 U215 ( .A(n368), .Y(n149) );
  BUFX2 U216 ( .A(n370), .Y(n150) );
  BUFX2 U217 ( .A(n372), .Y(n151) );
  BUFX2 U218 ( .A(n374), .Y(n152) );
  BUFX2 U219 ( .A(n376), .Y(n153) );
  BUFX2 U220 ( .A(n378), .Y(n154) );
  BUFX2 U221 ( .A(n380), .Y(n155) );
  BUFX2 U222 ( .A(n382), .Y(n156) );
  BUFX2 U223 ( .A(n384), .Y(n157) );
  BUFX2 U224 ( .A(n386), .Y(n158) );
  BUFX2 U225 ( .A(n388), .Y(n159) );
  BUFX2 U226 ( .A(n390), .Y(n160) );
  BUFX2 U227 ( .A(n392), .Y(n161) );
  BUFX2 U228 ( .A(n394), .Y(n162) );
  BUFX2 U229 ( .A(n396), .Y(n163) );
  BUFX2 U230 ( .A(n398), .Y(n164) );
  BUFX2 U231 ( .A(n400), .Y(n165) );
  BUFX2 U232 ( .A(n402), .Y(n166) );
  BUFX2 U233 ( .A(n404), .Y(n167) );
  BUFX2 U234 ( .A(n406), .Y(n168) );
  BUFX2 U235 ( .A(n408), .Y(n169) );
  BUFX2 U236 ( .A(n410), .Y(n170) );
  BUFX2 U237 ( .A(n412), .Y(n171) );
  BUFX2 U238 ( .A(n414), .Y(n172) );
  BUFX2 U239 ( .A(n416), .Y(n173) );
  BUFX2 U240 ( .A(n418), .Y(n174) );
  BUFX2 U241 ( .A(n420), .Y(n175) );
  BUFX2 U242 ( .A(n422), .Y(n176) );
  BUFX2 U243 ( .A(n424), .Y(n177) );
  BUFX2 U244 ( .A(n426), .Y(n178) );
  BUFX2 U245 ( .A(n428), .Y(n179) );
  BUFX2 U246 ( .A(n430), .Y(n180) );
  BUFX2 U247 ( .A(n432), .Y(n181) );
  BUFX2 U248 ( .A(n434), .Y(n182) );
  BUFX2 U249 ( .A(n436), .Y(n183) );
  BUFX2 U250 ( .A(n438), .Y(n184) );
  BUFX2 U251 ( .A(n440), .Y(n185) );
  BUFX2 U252 ( .A(n442), .Y(n186) );
  BUFX2 U253 ( .A(n444), .Y(n187) );
  BUFX2 U254 ( .A(n446), .Y(n188) );
  BUFX2 U255 ( .A(n448), .Y(n189) );
  BUFX2 U256 ( .A(n450), .Y(n190) );
  BUFX2 U257 ( .A(n452), .Y(n191) );
  BUFX2 U258 ( .A(n454), .Y(n192) );
  BUFX2 U259 ( .A(n456), .Y(n193) );
  BUFX2 U260 ( .A(n458), .Y(n194) );
  BUFX2 U261 ( .A(n460), .Y(n195) );
  BUFX2 U262 ( .A(n462), .Y(n196) );
  BUFX2 U263 ( .A(n464), .Y(n197) );
  BUFX2 U264 ( .A(n466), .Y(n198) );
  BUFX2 U265 ( .A(n468), .Y(n199) );
  BUFX2 U266 ( .A(n473), .Y(n200) );
  BUFX2 U267 ( .A(n343), .Y(n201) );
  BUFX2 U268 ( .A(n345), .Y(n202) );
  BUFX2 U269 ( .A(n347), .Y(n203) );
  BUFX2 U270 ( .A(n349), .Y(n204) );
  BUFX2 U271 ( .A(n351), .Y(n205) );
  BUFX2 U272 ( .A(n353), .Y(n206) );
  BUFX2 U273 ( .A(n355), .Y(n207) );
  BUFX2 U274 ( .A(n357), .Y(n208) );
  BUFX2 U275 ( .A(n359), .Y(n209) );
  BUFX2 U276 ( .A(n361), .Y(n210) );
  BUFX2 U277 ( .A(n363), .Y(n211) );
  BUFX2 U278 ( .A(n365), .Y(n212) );
  BUFX2 U279 ( .A(n367), .Y(n213) );
  BUFX2 U280 ( .A(n369), .Y(n214) );
  BUFX2 U281 ( .A(n371), .Y(n215) );
  BUFX2 U282 ( .A(n373), .Y(n216) );
  BUFX2 U283 ( .A(n375), .Y(n217) );
  BUFX2 U284 ( .A(n377), .Y(n218) );
  BUFX2 U285 ( .A(n379), .Y(n219) );
  BUFX2 U286 ( .A(n381), .Y(n220) );
  BUFX2 U287 ( .A(n383), .Y(n221) );
  BUFX2 U288 ( .A(n385), .Y(n222) );
  BUFX2 U289 ( .A(n387), .Y(n223) );
  BUFX2 U290 ( .A(n389), .Y(n224) );
  BUFX2 U291 ( .A(n391), .Y(n225) );
  BUFX2 U292 ( .A(n393), .Y(n226) );
  BUFX2 U293 ( .A(n395), .Y(n227) );
  BUFX2 U294 ( .A(n397), .Y(n228) );
  BUFX2 U295 ( .A(n399), .Y(n229) );
  BUFX2 U296 ( .A(n401), .Y(n230) );
  BUFX2 U297 ( .A(n403), .Y(n231) );
  BUFX2 U298 ( .A(n405), .Y(n232) );
  BUFX2 U299 ( .A(n407), .Y(n233) );
  BUFX2 U300 ( .A(n409), .Y(n234) );
  BUFX2 U301 ( .A(n411), .Y(n235) );
  BUFX2 U302 ( .A(n413), .Y(n236) );
  BUFX2 U303 ( .A(n415), .Y(n237) );
  BUFX2 U304 ( .A(n417), .Y(n238) );
  BUFX2 U305 ( .A(n419), .Y(n239) );
  BUFX2 U306 ( .A(n421), .Y(n240) );
  BUFX2 U307 ( .A(n423), .Y(n241) );
  BUFX2 U308 ( .A(n425), .Y(n242) );
  BUFX2 U309 ( .A(n427), .Y(n243) );
  BUFX2 U310 ( .A(n429), .Y(n244) );
  BUFX2 U311 ( .A(n431), .Y(n245) );
  BUFX2 U312 ( .A(n433), .Y(n246) );
  BUFX2 U313 ( .A(n435), .Y(n247) );
  BUFX2 U314 ( .A(n437), .Y(n248) );
  BUFX2 U315 ( .A(n439), .Y(n249) );
  BUFX2 U316 ( .A(n441), .Y(n250) );
  BUFX2 U317 ( .A(n443), .Y(n251) );
  BUFX2 U318 ( .A(n445), .Y(n252) );
  BUFX2 U319 ( .A(n447), .Y(n253) );
  BUFX2 U320 ( .A(n449), .Y(n254) );
  BUFX2 U321 ( .A(n451), .Y(n255) );
  BUFX2 U322 ( .A(n453), .Y(n256) );
  BUFX2 U323 ( .A(n455), .Y(n257) );
  BUFX2 U324 ( .A(n457), .Y(n258) );
  BUFX2 U325 ( .A(n459), .Y(n259) );
  BUFX2 U326 ( .A(n461), .Y(n260) );
  BUFX2 U327 ( .A(n463), .Y(n261) );
  BUFX2 U328 ( .A(n465), .Y(n262) );
  BUFX2 U329 ( .A(n467), .Y(n263) );
  BUFX2 U330 ( .A(n472), .Y(n264) );
  INVX1 U331 ( .A(sel_data[0]), .Y(n265) );
  INVX1 U332 ( .A(sel_data[10]), .Y(n266) );
  INVX1 U333 ( .A(sel_data[11]), .Y(n267) );
  INVX1 U334 ( .A(sel_data[12]), .Y(n268) );
  INVX1 U335 ( .A(sel_data[13]), .Y(n269) );
  INVX1 U336 ( .A(sel_data[14]), .Y(n270) );
  INVX1 U337 ( .A(sel_data[15]), .Y(n271) );
  INVX1 U338 ( .A(sel_data[16]), .Y(n272) );
  INVX1 U339 ( .A(sel_data[17]), .Y(n273) );
  INVX1 U340 ( .A(sel_data[18]), .Y(n274) );
  INVX1 U341 ( .A(sel_data[19]), .Y(n275) );
  INVX1 U342 ( .A(sel_data[1]), .Y(n276) );
  INVX1 U343 ( .A(sel_data[20]), .Y(n277) );
  INVX1 U344 ( .A(sel_data[21]), .Y(n278) );
  INVX1 U345 ( .A(sel_data[22]), .Y(n279) );
  INVX1 U346 ( .A(sel_data[23]), .Y(n280) );
  INVX1 U347 ( .A(sel_data[24]), .Y(n281) );
  INVX1 U348 ( .A(sel_data[25]), .Y(n282) );
  INVX1 U349 ( .A(sel_data[26]), .Y(n283) );
  INVX1 U350 ( .A(sel_data[27]), .Y(n284) );
  INVX1 U351 ( .A(sel_data[28]), .Y(n285) );
  INVX1 U352 ( .A(sel_data[29]), .Y(n286) );
  INVX1 U353 ( .A(sel_data[2]), .Y(n287) );
  INVX1 U354 ( .A(sel_data[30]), .Y(n288) );
  INVX1 U355 ( .A(sel_data[31]), .Y(n289) );
  INVX1 U356 ( .A(sel_data[32]), .Y(n290) );
  INVX1 U357 ( .A(sel_data[33]), .Y(n291) );
  INVX1 U358 ( .A(sel_data[34]), .Y(n292) );
  INVX1 U359 ( .A(sel_data[35]), .Y(n293) );
  INVX1 U360 ( .A(sel_data[36]), .Y(n294) );
  INVX1 U361 ( .A(sel_data[37]), .Y(n295) );
  INVX1 U362 ( .A(sel_data[38]), .Y(n296) );
  INVX1 U363 ( .A(sel_data[39]), .Y(n297) );
  INVX1 U364 ( .A(sel_data[3]), .Y(n298) );
  INVX1 U365 ( .A(sel_data[40]), .Y(n299) );
  INVX1 U366 ( .A(sel_data[41]), .Y(n300) );
  INVX1 U367 ( .A(sel_data[42]), .Y(n301) );
  INVX1 U368 ( .A(sel_data[43]), .Y(n302) );
  INVX1 U369 ( .A(sel_data[44]), .Y(n303) );
  INVX1 U370 ( .A(sel_data[45]), .Y(n304) );
  INVX1 U371 ( .A(sel_data[46]), .Y(n305) );
  INVX1 U372 ( .A(sel_data[47]), .Y(n306) );
  INVX1 U373 ( .A(sel_data[48]), .Y(n307) );
  INVX1 U374 ( .A(sel_data[49]), .Y(n308) );
  INVX1 U375 ( .A(sel_data[4]), .Y(n309) );
  INVX1 U376 ( .A(sel_data[50]), .Y(n310) );
  INVX1 U377 ( .A(sel_data[51]), .Y(n311) );
  INVX1 U378 ( .A(sel_data[52]), .Y(n312) );
  INVX1 U379 ( .A(sel_data[53]), .Y(n313) );
  INVX1 U380 ( .A(sel_data[54]), .Y(n314) );
  INVX1 U381 ( .A(sel_data[55]), .Y(n315) );
  INVX1 U382 ( .A(sel_data[56]), .Y(n316) );
  INVX1 U383 ( .A(sel_data[57]), .Y(n317) );
  INVX1 U384 ( .A(sel_data[58]), .Y(n318) );
  INVX1 U385 ( .A(sel_data[59]), .Y(n319) );
  INVX1 U386 ( .A(sel_data[5]), .Y(n320) );
  INVX1 U387 ( .A(sel_data[60]), .Y(n321) );
  INVX1 U388 ( .A(sel_data[61]), .Y(n322) );
  INVX1 U389 ( .A(sel_data[62]), .Y(n323) );
  INVX1 U390 ( .A(sel_data[63]), .Y(n324) );
  INVX1 U391 ( .A(sel_data[6]), .Y(n325) );
  INVX1 U392 ( .A(sel_data[7]), .Y(n326) );
  INVX1 U393 ( .A(sel_data[8]), .Y(n327) );
  INVX1 U394 ( .A(sel_data[9]), .Y(n328) );
  AND2X1 U395 ( .A(n338), .B(grant[3]), .Y(n342) );
  INVX1 U396 ( .A(n342), .Y(n329) );
  AND2X1 U397 ( .A(buf_ri), .B(grant[0]), .Y(in0_ri) );
  AND2X1 U398 ( .A(buf_ri), .B(grant[1]), .Y(in1_ri) );
  INVX1 U399 ( .A(n333), .Y(n332) );
  INVX1 U400 ( .A(n469), .Y(n333) );
  INVX1 U401 ( .A(n335), .Y(n334) );
  INVX1 U402 ( .A(n337), .Y(n336) );
  INVX1 U403 ( .A(n470), .Y(n335) );
  INVX1 U404 ( .A(n471), .Y(n337) );
  INVX1 U405 ( .A(grant[2]), .Y(n474) );
  INVX1 U406 ( .A(grant[0]), .Y(n338) );
endmodule


module buffer_4 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n5, n277, n414, n347, n476, n346, n477, n410, n274, n343, n344, n272,
         n342, n276, n341, n340, n339, n338, n337, n336, n335, n334, n333,
         n332, n331, n330, n273, n329, n328, n327, n326, n325, n324, n323,
         n322, n321, n320, n319, n318, n317, n316, n271, n315, n314, n313,
         n312, n311, n310, n309, n275, n308, n307, n306, n305, n304, n270,
         n303, n302, n301, n300, n299, n298, n297, n296, n295, n294, n293,
         n292, n269, n291, n290, n289, n288, n287, n286, n285, n284, n283,
         n282, n281, n280, n408, n415, n407, n416, n406, n417, n405, n418,
         n404, n419, n403, n420, n402, n421, n401, n422, n400, n423, n399,
         n424, n398, n425, n397, n426, n396, n427, n395, n428, n394, n429,
         n393, n430, n392, n431, n391, n432, n390, n433, n389, n434, n388,
         n435, n387, n436, n386, n437, n385, n438, n384, n439, n383, n440,
         n382, n441, n381, n442, n380, n443, n379, n444, n378, n445, n377,
         n446, n376, n447, n375, n448, n374, n449, n373, n450, n372, n451,
         n371, n452, n370, n453, n369, n454, n368, n455, n367, n456, n366,
         n457, n365, n458, n364, n459, n363, n460, n362, n461, n361, n462,
         n360, n463, n359, n464, n358, n465, n357, n466, n356, n467, n355,
         n468, n354, n469, n353, n470, n352, n471, n351, n472, n350, n473,
         n349, n474, n348, n475, n345, n478, n4, n413, n1, n279, n278, n8, n6;

  DFFSR full_reg ( .D(n5), .CLK(clk), .R(n277), .S(1'b1), .Q(n414) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n343), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n272), .C(buffer_di[1]), .D(n343), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n276), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n272), .C(buffer_di[3]), .D(n343), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n272), .C(buffer_di[4]), .D(n343), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n272), .C(buffer_di[5]), .D(n343), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n272), .C(buffer_di[6]), .D(n343), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n272), .C(buffer_di[7]), .D(n343), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n272), .C(buffer_di[8]), .D(n343), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n272), .C(buffer_di[9]), .D(n343), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n272), .C(buffer_di[10]), .D(n343), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n272), .C(buffer_di[11]), .D(n343), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n272), .C(buffer_di[12]), .D(n343), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n272), .C(buffer_di[13]), .D(n343), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n273), .C(buffer_di[14]), .D(n343), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n273), .C(buffer_di[15]), .D(n343), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n343), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n273), .C(buffer_di[17]), .D(n343), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n273), .C(buffer_di[18]), .D(n343), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n273), .C(buffer_di[19]), .D(n343), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n273), .C(buffer_di[20]), .D(n343), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n273), .C(buffer_di[21]), .D(n343), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n273), .C(buffer_di[22]), .D(n343), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n273), .C(buffer_di[23]), .D(n343), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n273), .C(buffer_di[24]), .D(n343), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n343), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n343), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n343), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n271), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n271), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n271), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n271), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n271), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n271), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n271), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n271), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n271), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n271), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n271), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n271), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n270), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n270), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n270), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n270), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n270), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n270), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n270), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n270), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n270), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n270), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n270), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n270), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n269), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n269), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n269), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n269), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n269), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n275), .C(buffer_di[57]), .D(n269), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n269), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n273), .C(buffer_di[59]), .D(n269), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n272), .C(buffer_di[60]), .D(n269), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n275), .C(buffer_di[61]), .D(n269), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n269), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n273), .C(buffer_di[63]), .D(n269), .Y(
        n280) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n415) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n410), .S(1'b1), .Q(n478) );
  AND2X1 U3 ( .A(buffer_so), .B(n4), .Y(n413) );
  AND2X1 U6 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  INVX1 U7 ( .A(n343), .Y(n1) );
  AND2X1 U8 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U9 ( .A(n279), .Y(n4) );
  AND2X1 U10 ( .A(buffer_ri), .B(n276), .Y(n278) );
  INVX1 U11 ( .A(n278), .Y(n5) );
  INVX1 U12 ( .A(n8), .Y(n6) );
  INVX1 U13 ( .A(n6), .Y(buffer_ri) );
  INVX1 U14 ( .A(n413), .Y(n8) );
  BUFX2 U15 ( .A(n414), .Y(buffer_so) );
  INVX2 U16 ( .A(reset), .Y(n277) );
  BUFX2 U81 ( .A(n427), .Y(buffer_do[51]) );
  BUFX2 U82 ( .A(n424), .Y(buffer_do[54]) );
  BUFX2 U83 ( .A(n426), .Y(buffer_do[52]) );
  BUFX2 U84 ( .A(n428), .Y(buffer_do[50]) );
  BUFX2 U85 ( .A(n425), .Y(buffer_do[53]) );
  BUFX2 U86 ( .A(n416), .Y(buffer_do[62]) );
  BUFX2 U87 ( .A(n429), .Y(buffer_do[49]) );
  BUFX2 U88 ( .A(n423), .Y(buffer_do[55]) );
  BUFX2 U89 ( .A(n430), .Y(buffer_do[48]) );
  BUFX2 U90 ( .A(n415), .Y(buffer_do[63]) );
  BUFX2 U91 ( .A(n417), .Y(buffer_do[61]) );
  BUFX2 U92 ( .A(n418), .Y(buffer_do[60]) );
  BUFX2 U93 ( .A(n419), .Y(buffer_do[59]) );
  BUFX2 U94 ( .A(n420), .Y(buffer_do[58]) );
  BUFX2 U95 ( .A(n421), .Y(buffer_do[57]) );
  BUFX2 U96 ( .A(n422), .Y(buffer_do[56]) );
  BUFX2 U97 ( .A(n431), .Y(buffer_do[47]) );
  BUFX2 U98 ( .A(n432), .Y(buffer_do[46]) );
  BUFX2 U99 ( .A(n433), .Y(buffer_do[45]) );
  BUFX2 U100 ( .A(n434), .Y(buffer_do[44]) );
  BUFX2 U101 ( .A(n435), .Y(buffer_do[43]) );
  BUFX2 U102 ( .A(n436), .Y(buffer_do[42]) );
  BUFX2 U103 ( .A(n437), .Y(buffer_do[41]) );
  BUFX2 U104 ( .A(n438), .Y(buffer_do[40]) );
  BUFX2 U105 ( .A(n439), .Y(buffer_do[39]) );
  BUFX2 U106 ( .A(n440), .Y(buffer_do[38]) );
  BUFX2 U107 ( .A(n441), .Y(buffer_do[37]) );
  BUFX2 U108 ( .A(n442), .Y(buffer_do[36]) );
  BUFX2 U109 ( .A(n443), .Y(buffer_do[35]) );
  BUFX2 U110 ( .A(n444), .Y(buffer_do[34]) );
  BUFX2 U111 ( .A(n445), .Y(buffer_do[33]) );
  BUFX2 U112 ( .A(n446), .Y(buffer_do[32]) );
  BUFX2 U113 ( .A(n447), .Y(buffer_do[31]) );
  BUFX2 U114 ( .A(n448), .Y(buffer_do[30]) );
  BUFX2 U115 ( .A(n449), .Y(buffer_do[29]) );
  BUFX2 U116 ( .A(n450), .Y(buffer_do[28]) );
  BUFX2 U117 ( .A(n451), .Y(buffer_do[27]) );
  BUFX2 U118 ( .A(n452), .Y(buffer_do[26]) );
  BUFX2 U119 ( .A(n453), .Y(buffer_do[25]) );
  BUFX2 U120 ( .A(n454), .Y(buffer_do[24]) );
  BUFX2 U121 ( .A(n455), .Y(buffer_do[23]) );
  BUFX2 U122 ( .A(n456), .Y(buffer_do[22]) );
  BUFX2 U123 ( .A(n457), .Y(buffer_do[21]) );
  BUFX2 U124 ( .A(n458), .Y(buffer_do[20]) );
  BUFX2 U125 ( .A(n459), .Y(buffer_do[19]) );
  BUFX2 U126 ( .A(n460), .Y(buffer_do[18]) );
  BUFX2 U127 ( .A(n461), .Y(buffer_do[17]) );
  BUFX2 U128 ( .A(n462), .Y(buffer_do[16]) );
  BUFX2 U129 ( .A(n463), .Y(buffer_do[15]) );
  BUFX2 U130 ( .A(n464), .Y(buffer_do[14]) );
  BUFX2 U131 ( .A(n465), .Y(buffer_do[13]) );
  BUFX2 U132 ( .A(n466), .Y(buffer_do[12]) );
  BUFX2 U133 ( .A(n467), .Y(buffer_do[11]) );
  BUFX2 U198 ( .A(n468), .Y(buffer_do[10]) );
  BUFX2 U199 ( .A(n469), .Y(buffer_do[9]) );
  BUFX2 U200 ( .A(n470), .Y(buffer_do[8]) );
  BUFX2 U201 ( .A(n471), .Y(buffer_do[7]) );
  BUFX2 U202 ( .A(n472), .Y(buffer_do[6]) );
  BUFX2 U203 ( .A(n473), .Y(buffer_do[5]) );
  BUFX2 U204 ( .A(n474), .Y(buffer_do[4]) );
  BUFX2 U205 ( .A(n475), .Y(buffer_do[3]) );
  BUFX2 U206 ( .A(n476), .Y(buffer_do[2]) );
  BUFX2 U207 ( .A(n477), .Y(buffer_do[1]) );
  BUFX2 U208 ( .A(n478), .Y(buffer_do[0]) );
  INVX1 U209 ( .A(n1), .Y(n271) );
  INVX1 U210 ( .A(n1), .Y(n270) );
  INVX1 U211 ( .A(n1), .Y(n269) );
  INVX1 U212 ( .A(n343), .Y(n272) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n294), .Y(n394) );
  INVX1 U218 ( .A(n291), .Y(n397) );
  INVX1 U219 ( .A(n288), .Y(n400) );
  INVX1 U220 ( .A(n289), .Y(n399) );
  INVX1 U221 ( .A(n292), .Y(n396) );
  INVX1 U222 ( .A(n293), .Y(n395) );
  INVX1 U223 ( .A(n295), .Y(n393) );
  INVX1 U224 ( .A(n290), .Y(n398) );
  INVX1 U225 ( .A(n344), .Y(n345) );
  INVX1 U226 ( .A(n340), .Y(n348) );
  INVX1 U227 ( .A(n339), .Y(n349) );
  INVX1 U228 ( .A(n338), .Y(n350) );
  INVX1 U229 ( .A(n337), .Y(n351) );
  INVX1 U230 ( .A(n336), .Y(n352) );
  INVX1 U231 ( .A(n335), .Y(n353) );
  INVX1 U232 ( .A(n334), .Y(n354) );
  INVX1 U233 ( .A(n333), .Y(n355) );
  INVX1 U234 ( .A(n332), .Y(n356) );
  INVX1 U235 ( .A(n331), .Y(n357) );
  INVX1 U236 ( .A(n330), .Y(n358) );
  INVX1 U237 ( .A(n329), .Y(n359) );
  INVX1 U238 ( .A(n328), .Y(n360) );
  INVX1 U239 ( .A(n327), .Y(n361) );
  INVX1 U240 ( .A(n326), .Y(n362) );
  INVX1 U241 ( .A(n325), .Y(n363) );
  INVX1 U242 ( .A(n324), .Y(n364) );
  INVX1 U243 ( .A(n323), .Y(n365) );
  INVX1 U244 ( .A(n322), .Y(n366) );
  INVX1 U245 ( .A(n321), .Y(n367) );
  INVX1 U246 ( .A(n320), .Y(n368) );
  INVX1 U247 ( .A(n319), .Y(n369) );
  INVX1 U248 ( .A(n318), .Y(n370) );
  INVX1 U249 ( .A(n317), .Y(n371) );
  INVX1 U250 ( .A(n316), .Y(n372) );
  INVX1 U251 ( .A(n315), .Y(n373) );
  INVX1 U252 ( .A(n314), .Y(n374) );
  INVX1 U253 ( .A(n313), .Y(n375) );
  INVX1 U254 ( .A(n312), .Y(n376) );
  INVX1 U255 ( .A(n311), .Y(n377) );
  INVX1 U256 ( .A(n310), .Y(n378) );
  INVX1 U257 ( .A(n309), .Y(n379) );
  INVX1 U258 ( .A(n308), .Y(n380) );
  INVX1 U259 ( .A(n307), .Y(n381) );
  INVX1 U260 ( .A(n306), .Y(n382) );
  INVX1 U261 ( .A(n305), .Y(n383) );
  INVX1 U262 ( .A(n304), .Y(n384) );
  INVX1 U263 ( .A(n303), .Y(n385) );
  INVX1 U264 ( .A(n302), .Y(n386) );
  INVX1 U265 ( .A(n301), .Y(n387) );
  INVX1 U266 ( .A(n300), .Y(n388) );
  INVX1 U267 ( .A(n299), .Y(n389) );
  INVX1 U268 ( .A(n298), .Y(n390) );
  INVX1 U269 ( .A(n297), .Y(n391) );
  INVX1 U270 ( .A(n296), .Y(n392) );
  INVX1 U271 ( .A(n287), .Y(n401) );
  INVX1 U272 ( .A(n342), .Y(n346) );
  INVX1 U273 ( .A(n341), .Y(n347) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n282), .Y(n406) );
  INVX1 U279 ( .A(n280), .Y(n408) );
  INVX1 U280 ( .A(n281), .Y(n407) );
endmodule


module input_controller_IDX_W0_IDX_E1_IDX_S2_IDX_NIC3 ( clk, reset, polarity, 
        upstream_si, upstream_di, upstream_ri, out_ready0, out_ready1, 
        out_ready2, out_ready3, out_valid0, out_valid1, out_valid2, out_valid3, 
        out_data0, out_data1, out_data2, out_data3 );
  input [63:0] upstream_di;
  output [63:0] out_data0;
  output [63:0] out_data1;
  output [63:0] out_data2;
  output [63:0] out_data3;
  input clk, reset, polarity, upstream_si, out_ready0, out_ready1, out_ready2,
         out_ready3;
  output upstream_ri, out_valid0, out_valid1, out_valid2, out_valid3;
  wire   n7, ib_so, n12, n9, n10, out_data00_55_, n13, n34, n14, n21, n8, n15,
         n4, n5, out_data00_51_, n16, n18, n3, n28, n2, n17, n20, n19, n31,
         n29, n11, n1, n30, n23, n22, n25, n6, chosen_ready, n26, n35, n24;
  wire   [55:48] ib_do;
  assign out_data0[63] = out_data3[63];
  assign out_data1[63] = out_data3[63];
  assign out_data2[63] = out_data3[63];
  assign out_data0[62] = out_data3[62];
  assign out_data1[62] = out_data3[62];
  assign out_data2[62] = out_data3[62];
  assign out_data0[61] = out_data3[61];
  assign out_data1[61] = out_data3[61];
  assign out_data2[61] = out_data3[61];
  assign out_data0[60] = out_data3[60];
  assign out_data1[60] = out_data3[60];
  assign out_data2[60] = out_data3[60];
  assign out_data0[59] = out_data3[59];
  assign out_data1[59] = out_data3[59];
  assign out_data2[59] = out_data3[59];
  assign out_data0[58] = out_data3[58];
  assign out_data1[58] = out_data3[58];
  assign out_data2[58] = out_data3[58];
  assign out_data0[57] = out_data3[57];
  assign out_data1[57] = out_data3[57];
  assign out_data2[57] = out_data3[57];
  assign out_data0[56] = out_data3[56];
  assign out_data1[56] = out_data3[56];
  assign out_data2[56] = out_data3[56];
  assign out_data1[55] = out_data3[55];
  assign out_data0[55] = out_data3[55];
  assign out_data2[55] = out_data3[55];
  assign out_data0[54] = out_data3[54];
  assign out_data1[54] = out_data3[54];
  assign out_data2[54] = out_data3[54];
  assign out_data0[53] = out_data3[53];
  assign out_data1[53] = out_data3[53];
  assign out_data2[53] = out_data3[53];
  assign out_data0[52] = out_data3[52];
  assign out_data1[52] = out_data3[52];
  assign out_data2[52] = out_data3[52];
  assign out_data1[51] = out_data3[51];
  assign out_data0[51] = out_data3[51];
  assign out_data2[51] = out_data3[51];
  assign out_data0[50] = out_data3[50];
  assign out_data1[50] = out_data3[50];
  assign out_data2[50] = out_data3[50];
  assign out_data0[49] = out_data3[49];
  assign out_data1[49] = out_data3[49];
  assign out_data2[49] = out_data3[49];
  assign out_data0[48] = out_data3[48];
  assign out_data1[48] = out_data3[48];
  assign out_data2[48] = out_data3[48];
  assign out_data0[47] = out_data3[47];
  assign out_data1[47] = out_data3[47];
  assign out_data2[47] = out_data3[47];
  assign out_data0[46] = out_data3[46];
  assign out_data1[46] = out_data3[46];
  assign out_data2[46] = out_data3[46];
  assign out_data0[45] = out_data3[45];
  assign out_data1[45] = out_data3[45];
  assign out_data2[45] = out_data3[45];
  assign out_data0[44] = out_data3[44];
  assign out_data1[44] = out_data3[44];
  assign out_data2[44] = out_data3[44];
  assign out_data0[43] = out_data3[43];
  assign out_data1[43] = out_data3[43];
  assign out_data2[43] = out_data3[43];
  assign out_data0[42] = out_data3[42];
  assign out_data1[42] = out_data3[42];
  assign out_data2[42] = out_data3[42];
  assign out_data0[41] = out_data3[41];
  assign out_data1[41] = out_data3[41];
  assign out_data2[41] = out_data3[41];
  assign out_data0[40] = out_data3[40];
  assign out_data1[40] = out_data3[40];
  assign out_data2[40] = out_data3[40];
  assign out_data0[39] = out_data3[39];
  assign out_data1[39] = out_data3[39];
  assign out_data2[39] = out_data3[39];
  assign out_data0[38] = out_data3[38];
  assign out_data1[38] = out_data3[38];
  assign out_data2[38] = out_data3[38];
  assign out_data0[37] = out_data3[37];
  assign out_data1[37] = out_data3[37];
  assign out_data2[37] = out_data3[37];
  assign out_data0[36] = out_data3[36];
  assign out_data1[36] = out_data3[36];
  assign out_data2[36] = out_data3[36];
  assign out_data0[35] = out_data3[35];
  assign out_data1[35] = out_data3[35];
  assign out_data2[35] = out_data3[35];
  assign out_data0[34] = out_data3[34];
  assign out_data1[34] = out_data3[34];
  assign out_data2[34] = out_data3[34];
  assign out_data0[33] = out_data3[33];
  assign out_data1[33] = out_data3[33];
  assign out_data2[33] = out_data3[33];
  assign out_data0[32] = out_data3[32];
  assign out_data1[32] = out_data3[32];
  assign out_data2[32] = out_data3[32];
  assign out_data0[31] = out_data3[31];
  assign out_data1[31] = out_data3[31];
  assign out_data2[31] = out_data3[31];
  assign out_data0[30] = out_data3[30];
  assign out_data1[30] = out_data3[30];
  assign out_data2[30] = out_data3[30];
  assign out_data0[29] = out_data3[29];
  assign out_data1[29] = out_data3[29];
  assign out_data2[29] = out_data3[29];
  assign out_data0[28] = out_data3[28];
  assign out_data1[28] = out_data3[28];
  assign out_data2[28] = out_data3[28];
  assign out_data0[27] = out_data3[27];
  assign out_data1[27] = out_data3[27];
  assign out_data2[27] = out_data3[27];
  assign out_data0[26] = out_data3[26];
  assign out_data1[26] = out_data3[26];
  assign out_data2[26] = out_data3[26];
  assign out_data0[25] = out_data3[25];
  assign out_data1[25] = out_data3[25];
  assign out_data2[25] = out_data3[25];
  assign out_data0[24] = out_data3[24];
  assign out_data1[24] = out_data3[24];
  assign out_data2[24] = out_data3[24];
  assign out_data0[23] = out_data3[23];
  assign out_data1[23] = out_data3[23];
  assign out_data2[23] = out_data3[23];
  assign out_data0[22] = out_data3[22];
  assign out_data1[22] = out_data3[22];
  assign out_data2[22] = out_data3[22];
  assign out_data0[21] = out_data3[21];
  assign out_data1[21] = out_data3[21];
  assign out_data2[21] = out_data3[21];
  assign out_data0[20] = out_data3[20];
  assign out_data1[20] = out_data3[20];
  assign out_data2[20] = out_data3[20];
  assign out_data0[19] = out_data3[19];
  assign out_data1[19] = out_data3[19];
  assign out_data2[19] = out_data3[19];
  assign out_data0[18] = out_data3[18];
  assign out_data1[18] = out_data3[18];
  assign out_data2[18] = out_data3[18];
  assign out_data0[17] = out_data3[17];
  assign out_data1[17] = out_data3[17];
  assign out_data2[17] = out_data3[17];
  assign out_data0[16] = out_data3[16];
  assign out_data1[16] = out_data3[16];
  assign out_data2[16] = out_data3[16];
  assign out_data0[15] = out_data3[15];
  assign out_data1[15] = out_data3[15];
  assign out_data2[15] = out_data3[15];
  assign out_data0[14] = out_data3[14];
  assign out_data1[14] = out_data3[14];
  assign out_data2[14] = out_data3[14];
  assign out_data0[13] = out_data3[13];
  assign out_data1[13] = out_data3[13];
  assign out_data2[13] = out_data3[13];
  assign out_data0[12] = out_data3[12];
  assign out_data1[12] = out_data3[12];
  assign out_data2[12] = out_data3[12];
  assign out_data0[11] = out_data3[11];
  assign out_data1[11] = out_data3[11];
  assign out_data2[11] = out_data3[11];
  assign out_data0[10] = out_data3[10];
  assign out_data1[10] = out_data3[10];
  assign out_data2[10] = out_data3[10];
  assign out_data0[9] = out_data3[9];
  assign out_data1[9] = out_data3[9];
  assign out_data2[9] = out_data3[9];
  assign out_data0[8] = out_data3[8];
  assign out_data1[8] = out_data3[8];
  assign out_data2[8] = out_data3[8];
  assign out_data0[7] = out_data3[7];
  assign out_data1[7] = out_data3[7];
  assign out_data2[7] = out_data3[7];
  assign out_data0[6] = out_data3[6];
  assign out_data1[6] = out_data3[6];
  assign out_data2[6] = out_data3[6];
  assign out_data0[5] = out_data3[5];
  assign out_data1[5] = out_data3[5];
  assign out_data2[5] = out_data3[5];
  assign out_data0[4] = out_data3[4];
  assign out_data1[4] = out_data3[4];
  assign out_data2[4] = out_data3[4];
  assign out_data0[3] = out_data3[3];
  assign out_data1[3] = out_data3[3];
  assign out_data2[3] = out_data3[3];
  assign out_data0[2] = out_data3[2];
  assign out_data1[2] = out_data3[2];
  assign out_data2[2] = out_data3[2];
  assign out_data0[1] = out_data3[1];
  assign out_data1[1] = out_data3[1];
  assign out_data2[1] = out_data3[1];
  assign out_data0[0] = out_data3[0];
  assign out_data1[0] = out_data3[0];
  assign out_data2[0] = out_data3[0];

  buffer_4 INBUF ( .clk(clk), .reset(reset), .buffer_en(n7), .buffer_di(
        upstream_di), .buffer_si(upstream_si), .buffer_ri(upstream_ri), 
        .buffer_ro(1'b1), .buffer_so(ib_so), .buffer_do({out_data3[63:56], 
        ib_do, out_data3[47:0]}) );
  AOI21X1 U19 ( .A(n12), .B(n9), .C(n10), .Y(out_data00_55_) );
  OAI21X1 U20 ( .A(n13), .B(n34), .C(n14), .Y(out_data3[54]) );
  OAI21X1 U21 ( .A(ib_do[53]), .B(n34), .C(ib_do[54]), .Y(n14) );
  XNOR2X1 U22 ( .A(ib_do[53]), .B(n34), .Y(out_data3[53]) );
  OAI21X1 U23 ( .A(n21), .B(n8), .C(n34), .Y(out_data3[52]) );
  AOI21X1 U25 ( .A(n15), .B(n4), .C(n5), .Y(out_data00_51_) );
  OAI21X1 U26 ( .A(n15), .B(n4), .C(n16), .Y(out_data3[50]) );
  OAI21X1 U27 ( .A(n18), .B(n3), .C(n28), .Y(out_data3[49]) );
  NAND3X1 U28 ( .A(n2), .B(n3), .C(out_valid2), .Y(n17) );
  XOR2X1 U29 ( .A(ib_do[48]), .B(out_valid2), .Y(out_data3[48]) );
  AOI22X1 U31 ( .A(out_ready0), .B(out_valid0), .C(out_ready1), .D(out_valid1), 
        .Y(n20) );
  AOI22X1 U34 ( .A(out_ready2), .B(out_valid2), .C(out_ready3), .D(out_valid3), 
        .Y(n19) );
  NOR3X1 U35 ( .A(n31), .B(n29), .C(n11), .Y(out_valid3) );
  NOR3X1 U36 ( .A(n31), .B(n1), .C(n11), .Y(out_valid2) );
  NAND3X1 U37 ( .A(n2), .B(n3), .C(n30), .Y(n23) );
  NAND3X1 U39 ( .A(n8), .B(n10), .C(n9), .Y(n22) );
  AND2X1 U3 ( .A(n25), .B(n6), .Y(chosen_ready) );
  OR2X1 U4 ( .A(ib_do[54]), .B(ib_do[53]), .Y(n13) );
  OR2X1 U5 ( .A(n28), .B(ib_do[50]), .Y(n16) );
  AND2X1 U6 ( .A(out_data3[62]), .B(n21), .Y(out_valid0) );
  OR2X1 U7 ( .A(n26), .B(out_data3[62]), .Y(n35) );
  BUFX2 U8 ( .A(n20), .Y(n6) );
  INVX1 U9 ( .A(chosen_ready), .Y(n7) );
  BUFX2 U10 ( .A(n19), .Y(n25) );
  AND2X1 U11 ( .A(ib_so), .B(n31), .Y(n21) );
  INVX1 U12 ( .A(n21), .Y(n26) );
  INVX1 U13 ( .A(n35), .Y(out_valid1) );
  BUFX2 U14 ( .A(n17), .Y(n28) );
  BUFX2 U15 ( .A(n23), .Y(n29) );
  OR2X1 U16 ( .A(ib_do[51]), .B(ib_do[50]), .Y(n24) );
  INVX1 U17 ( .A(n24), .Y(n30) );
  BUFX2 U18 ( .A(n22), .Y(n31) );
  BUFX2 U24 ( .A(out_data00_55_), .Y(out_data3[55]) );
  BUFX2 U30 ( .A(out_data00_51_), .Y(out_data3[51]) );
  AND2X1 U32 ( .A(n21), .B(n8), .Y(n12) );
  INVX1 U33 ( .A(n12), .Y(n34) );
  INVX1 U38 ( .A(n29), .Y(n1) );
  INVX1 U40 ( .A(n13), .Y(n9) );
  AND2X1 U41 ( .A(out_valid2), .B(n2), .Y(n18) );
  AND2X1 U42 ( .A(n18), .B(n3), .Y(n15) );
  INVX1 U43 ( .A(ib_do[48]), .Y(n2) );
  INVX1 U44 ( .A(ib_do[49]), .Y(n3) );
  INVX1 U45 ( .A(ib_so), .Y(n11) );
  INVX1 U46 ( .A(ib_do[52]), .Y(n8) );
  INVX1 U47 ( .A(ib_do[55]), .Y(n10) );
  INVX1 U48 ( .A(ib_do[51]), .Y(n5) );
  INVX1 U49 ( .A(ib_do[50]), .Y(n4) );
endmodule


module buffer_3 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n5, n277, n414, n347, n476, n346, n477, n410, n275, n343, n344, n276,
         n342, n1, n341, n273, n340, n339, n338, n337, n336, n335, n334, n333,
         n332, n331, n330, n274, n329, n328, n272, n327, n326, n325, n324,
         n323, n322, n321, n320, n319, n318, n317, n316, n271, n315, n314,
         n313, n312, n311, n310, n309, n308, n307, n306, n305, n304, n270,
         n303, n302, n301, n300, n299, n298, n297, n296, n295, n294, n293,
         n292, n269, n291, n290, n289, n288, n287, n286, n285, n284, n283,
         n282, n281, n280, n408, n415, n407, n416, n406, n417, n405, n418,
         n404, n419, n403, n420, n402, n421, n401, n422, n400, n423, n399,
         n424, n398, n425, n397, n426, n396, n427, n395, n428, n394, n429,
         n393, n430, n392, n431, n391, n432, n390, n433, n389, n434, n388,
         n435, n387, n436, n386, n437, n385, n438, n384, n439, n383, n440,
         n382, n441, n381, n442, n380, n443, n379, n444, n378, n445, n377,
         n446, n376, n447, n375, n448, n374, n449, n373, n450, n372, n451,
         n371, n452, n370, n453, n369, n454, n368, n455, n367, n456, n366,
         n457, n365, n458, n364, n459, n363, n460, n362, n461, n361, n462,
         n360, n463, n359, n464, n358, n465, n357, n466, n356, n467, n355,
         n468, n354, n469, n353, n470, n352, n471, n351, n472, n350, n473,
         n349, n474, n348, n475, n345, n478, n4, n413, n279, n278, n8, n6;

  DFFSR full_reg ( .D(n5), .CLK(clk), .R(n277), .S(1'b1), .Q(n414) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n275), .C(buffer_di[0]), .D(n343), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n276), .C(buffer_di[1]), .D(n343), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n1), .C(buffer_di[2]), .D(n343), .Y(n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n343), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n343), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n343), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n343), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n343), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n343), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n343), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n343), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n343), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n343), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n343), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n274), .C(buffer_di[14]), .D(n343), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n274), .C(buffer_di[15]), .D(n343), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n274), .C(buffer_di[16]), .D(n272), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n274), .C(buffer_di[17]), .D(n272), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n274), .C(buffer_di[18]), .D(n272), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n272), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n272), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n272), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n272), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n272), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n272), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n275), .C(buffer_di[25]), .D(n272), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n275), .C(buffer_di[26]), .D(n272), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n275), .C(buffer_di[27]), .D(n272), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n275), .C(buffer_di[28]), .D(n271), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n275), .C(buffer_di[29]), .D(n271), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n275), .C(buffer_di[30]), .D(n271), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n275), .C(buffer_di[31]), .D(n271), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n275), .C(buffer_di[32]), .D(n271), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n275), .C(buffer_di[33]), .D(n271), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n275), .C(buffer_di[34]), .D(n271), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n274), .C(buffer_di[35]), .D(n271), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n273), .C(buffer_di[36]), .D(n271), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n276), .C(buffer_di[37]), .D(n271), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n271), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n274), .C(buffer_di[39]), .D(n271), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n273), .C(buffer_di[40]), .D(n270), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n276), .C(buffer_di[41]), .D(n270), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n270), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n274), .C(buffer_di[43]), .D(n270), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n273), .C(buffer_di[44]), .D(n270), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n276), .C(buffer_di[45]), .D(n270), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n270), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n270), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n270), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n270), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n270), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n270), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n269), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n269), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n269), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n269), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n269), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n274), .C(buffer_di[57]), .D(n269), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n273), .C(buffer_di[58]), .D(n269), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n276), .C(buffer_di[59]), .D(n269), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n275), .C(buffer_di[60]), .D(n269), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n275), .C(buffer_di[61]), .D(n269), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n269), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n273), .C(buffer_di[63]), .D(n269), .Y(
        n280) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n415) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n410), .S(1'b1), .Q(n478) );
  AND2X1 U3 ( .A(buffer_so), .B(n4), .Y(n413) );
  AND2X1 U6 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  INVX1 U7 ( .A(n343), .Y(n1) );
  AND2X1 U8 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U9 ( .A(n279), .Y(n4) );
  AND2X1 U10 ( .A(buffer_ri), .B(n275), .Y(n278) );
  INVX1 U11 ( .A(n278), .Y(n5) );
  INVX1 U12 ( .A(n8), .Y(n6) );
  INVX1 U13 ( .A(n6), .Y(buffer_ri) );
  INVX1 U14 ( .A(n413), .Y(n8) );
  BUFX2 U15 ( .A(n414), .Y(buffer_so) );
  INVX2 U16 ( .A(reset), .Y(n277) );
  BUFX2 U81 ( .A(n427), .Y(buffer_do[51]) );
  BUFX2 U82 ( .A(n424), .Y(buffer_do[54]) );
  BUFX2 U83 ( .A(n417), .Y(buffer_do[61]) );
  BUFX2 U84 ( .A(n416), .Y(buffer_do[62]) );
  BUFX2 U85 ( .A(n426), .Y(buffer_do[52]) );
  BUFX2 U86 ( .A(n425), .Y(buffer_do[53]) );
  BUFX2 U87 ( .A(n415), .Y(buffer_do[63]) );
  BUFX2 U88 ( .A(n418), .Y(buffer_do[60]) );
  BUFX2 U89 ( .A(n419), .Y(buffer_do[59]) );
  BUFX2 U90 ( .A(n420), .Y(buffer_do[58]) );
  BUFX2 U91 ( .A(n421), .Y(buffer_do[57]) );
  BUFX2 U92 ( .A(n422), .Y(buffer_do[56]) );
  BUFX2 U93 ( .A(n431), .Y(buffer_do[47]) );
  BUFX2 U94 ( .A(n432), .Y(buffer_do[46]) );
  BUFX2 U95 ( .A(n433), .Y(buffer_do[45]) );
  BUFX2 U96 ( .A(n434), .Y(buffer_do[44]) );
  BUFX2 U97 ( .A(n435), .Y(buffer_do[43]) );
  BUFX2 U98 ( .A(n436), .Y(buffer_do[42]) );
  BUFX2 U99 ( .A(n437), .Y(buffer_do[41]) );
  BUFX2 U100 ( .A(n438), .Y(buffer_do[40]) );
  BUFX2 U101 ( .A(n439), .Y(buffer_do[39]) );
  BUFX2 U102 ( .A(n440), .Y(buffer_do[38]) );
  BUFX2 U103 ( .A(n441), .Y(buffer_do[37]) );
  BUFX2 U104 ( .A(n442), .Y(buffer_do[36]) );
  BUFX2 U105 ( .A(n443), .Y(buffer_do[35]) );
  BUFX2 U106 ( .A(n444), .Y(buffer_do[34]) );
  BUFX2 U107 ( .A(n445), .Y(buffer_do[33]) );
  BUFX2 U108 ( .A(n446), .Y(buffer_do[32]) );
  BUFX2 U109 ( .A(n447), .Y(buffer_do[31]) );
  BUFX2 U110 ( .A(n448), .Y(buffer_do[30]) );
  BUFX2 U111 ( .A(n449), .Y(buffer_do[29]) );
  BUFX2 U112 ( .A(n450), .Y(buffer_do[28]) );
  BUFX2 U113 ( .A(n451), .Y(buffer_do[27]) );
  BUFX2 U114 ( .A(n452), .Y(buffer_do[26]) );
  BUFX2 U115 ( .A(n453), .Y(buffer_do[25]) );
  BUFX2 U116 ( .A(n454), .Y(buffer_do[24]) );
  BUFX2 U117 ( .A(n455), .Y(buffer_do[23]) );
  BUFX2 U118 ( .A(n456), .Y(buffer_do[22]) );
  BUFX2 U119 ( .A(n457), .Y(buffer_do[21]) );
  BUFX2 U120 ( .A(n458), .Y(buffer_do[20]) );
  BUFX2 U121 ( .A(n459), .Y(buffer_do[19]) );
  BUFX2 U122 ( .A(n460), .Y(buffer_do[18]) );
  BUFX2 U123 ( .A(n461), .Y(buffer_do[17]) );
  BUFX2 U124 ( .A(n462), .Y(buffer_do[16]) );
  BUFX2 U125 ( .A(n463), .Y(buffer_do[15]) );
  BUFX2 U126 ( .A(n464), .Y(buffer_do[14]) );
  BUFX2 U127 ( .A(n465), .Y(buffer_do[13]) );
  BUFX2 U128 ( .A(n466), .Y(buffer_do[12]) );
  BUFX2 U129 ( .A(n467), .Y(buffer_do[11]) );
  BUFX2 U130 ( .A(n468), .Y(buffer_do[10]) );
  BUFX2 U131 ( .A(n469), .Y(buffer_do[9]) );
  BUFX2 U132 ( .A(n470), .Y(buffer_do[8]) );
  BUFX2 U133 ( .A(n471), .Y(buffer_do[7]) );
  BUFX2 U198 ( .A(n472), .Y(buffer_do[6]) );
  BUFX2 U199 ( .A(n473), .Y(buffer_do[5]) );
  BUFX2 U200 ( .A(n474), .Y(buffer_do[4]) );
  BUFX2 U201 ( .A(n475), .Y(buffer_do[3]) );
  BUFX2 U202 ( .A(n476), .Y(buffer_do[2]) );
  BUFX2 U203 ( .A(n477), .Y(buffer_do[1]) );
  BUFX2 U204 ( .A(n478), .Y(buffer_do[0]) );
  BUFX2 U205 ( .A(n429), .Y(buffer_do[49]) );
  BUFX2 U206 ( .A(n423), .Y(buffer_do[55]) );
  BUFX2 U207 ( .A(n430), .Y(buffer_do[48]) );
  BUFX2 U208 ( .A(n428), .Y(buffer_do[50]) );
  INVX1 U209 ( .A(n1), .Y(n272) );
  INVX1 U210 ( .A(n1), .Y(n271) );
  INVX1 U211 ( .A(n1), .Y(n270) );
  INVX1 U212 ( .A(n1), .Y(n269) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n294), .Y(n394) );
  INVX1 U218 ( .A(n291), .Y(n397) );
  INVX1 U219 ( .A(n288), .Y(n400) );
  INVX1 U220 ( .A(n289), .Y(n399) );
  INVX1 U221 ( .A(n292), .Y(n396) );
  INVX1 U222 ( .A(n293), .Y(n395) );
  INVX1 U223 ( .A(n295), .Y(n393) );
  INVX1 U224 ( .A(n290), .Y(n398) );
  INVX1 U225 ( .A(n344), .Y(n345) );
  INVX1 U226 ( .A(n340), .Y(n348) );
  INVX1 U227 ( .A(n339), .Y(n349) );
  INVX1 U228 ( .A(n338), .Y(n350) );
  INVX1 U229 ( .A(n337), .Y(n351) );
  INVX1 U230 ( .A(n336), .Y(n352) );
  INVX1 U231 ( .A(n335), .Y(n353) );
  INVX1 U232 ( .A(n334), .Y(n354) );
  INVX1 U233 ( .A(n333), .Y(n355) );
  INVX1 U234 ( .A(n332), .Y(n356) );
  INVX1 U235 ( .A(n331), .Y(n357) );
  INVX1 U236 ( .A(n330), .Y(n358) );
  INVX1 U237 ( .A(n329), .Y(n359) );
  INVX1 U238 ( .A(n328), .Y(n360) );
  INVX1 U239 ( .A(n327), .Y(n361) );
  INVX1 U240 ( .A(n326), .Y(n362) );
  INVX1 U241 ( .A(n325), .Y(n363) );
  INVX1 U242 ( .A(n324), .Y(n364) );
  INVX1 U243 ( .A(n323), .Y(n365) );
  INVX1 U244 ( .A(n322), .Y(n366) );
  INVX1 U245 ( .A(n321), .Y(n367) );
  INVX1 U246 ( .A(n320), .Y(n368) );
  INVX1 U247 ( .A(n319), .Y(n369) );
  INVX1 U248 ( .A(n318), .Y(n370) );
  INVX1 U249 ( .A(n317), .Y(n371) );
  INVX1 U250 ( .A(n316), .Y(n372) );
  INVX1 U251 ( .A(n315), .Y(n373) );
  INVX1 U252 ( .A(n314), .Y(n374) );
  INVX1 U253 ( .A(n313), .Y(n375) );
  INVX1 U254 ( .A(n312), .Y(n376) );
  INVX1 U255 ( .A(n311), .Y(n377) );
  INVX1 U256 ( .A(n310), .Y(n378) );
  INVX1 U257 ( .A(n309), .Y(n379) );
  INVX1 U258 ( .A(n308), .Y(n380) );
  INVX1 U259 ( .A(n307), .Y(n381) );
  INVX1 U260 ( .A(n306), .Y(n382) );
  INVX1 U261 ( .A(n305), .Y(n383) );
  INVX1 U262 ( .A(n304), .Y(n384) );
  INVX1 U263 ( .A(n303), .Y(n385) );
  INVX1 U264 ( .A(n302), .Y(n386) );
  INVX1 U265 ( .A(n301), .Y(n387) );
  INVX1 U266 ( .A(n300), .Y(n388) );
  INVX1 U267 ( .A(n299), .Y(n389) );
  INVX1 U268 ( .A(n298), .Y(n390) );
  INVX1 U269 ( .A(n297), .Y(n391) );
  INVX1 U270 ( .A(n296), .Y(n392) );
  INVX1 U271 ( .A(n287), .Y(n401) );
  INVX1 U272 ( .A(n342), .Y(n346) );
  INVX1 U273 ( .A(n341), .Y(n347) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n282), .Y(n406) );
  INVX1 U279 ( .A(n280), .Y(n408) );
  INVX1 U280 ( .A(n281), .Y(n407) );
endmodule


module input_controller_IDX_W0_IDX_E1_IDX_NIC3_IDX_U2 ( clk, reset, polarity, 
        upstream_si, upstream_di, upstream_ri, out_ready0, out_ready1, 
        out_ready2, out_ready3, out_valid0, out_valid1, out_valid2, out_valid3, 
        out_data0, out_data1, out_data2, out_data3 );
  input [63:0] upstream_di;
  output [63:0] out_data0;
  output [63:0] out_data1;
  output [63:0] out_data2;
  output [63:0] out_data3;
  input clk, reset, polarity, upstream_si, out_ready0, out_ready1, out_ready2,
         out_ready3;
  output upstream_ri, out_valid0, out_valid1, out_valid2, out_valid3;
  wire   n7, ib_so, n12, n9, n10, out_data00_55_, n13, n34, n14, n21, n8, n15,
         n4, n5, out_data00_51_, n16, n18, n3, n26, n2, n17, n20, n19, n31,
         n28, n11, n1, n29, n23, n22, n25, n6, chosen_ready, n27, n35, n24;
  wire   [55:48] ib_do;
  assign out_data0[63] = out_data3[63];
  assign out_data1[63] = out_data3[63];
  assign out_data2[63] = out_data3[63];
  assign out_data0[62] = out_data3[62];
  assign out_data1[62] = out_data3[62];
  assign out_data2[62] = out_data3[62];
  assign out_data0[61] = out_data3[61];
  assign out_data1[61] = out_data3[61];
  assign out_data2[61] = out_data3[61];
  assign out_data0[60] = out_data3[60];
  assign out_data1[60] = out_data3[60];
  assign out_data2[60] = out_data3[60];
  assign out_data0[59] = out_data3[59];
  assign out_data1[59] = out_data3[59];
  assign out_data2[59] = out_data3[59];
  assign out_data0[58] = out_data3[58];
  assign out_data1[58] = out_data3[58];
  assign out_data2[58] = out_data3[58];
  assign out_data0[57] = out_data3[57];
  assign out_data1[57] = out_data3[57];
  assign out_data2[57] = out_data3[57];
  assign out_data0[56] = out_data3[56];
  assign out_data1[56] = out_data3[56];
  assign out_data2[56] = out_data3[56];
  assign out_data1[55] = out_data3[55];
  assign out_data0[55] = out_data3[55];
  assign out_data2[55] = out_data3[55];
  assign out_data0[54] = out_data3[54];
  assign out_data1[54] = out_data3[54];
  assign out_data2[54] = out_data3[54];
  assign out_data0[53] = out_data3[53];
  assign out_data1[53] = out_data3[53];
  assign out_data2[53] = out_data3[53];
  assign out_data0[52] = out_data3[52];
  assign out_data1[52] = out_data3[52];
  assign out_data2[52] = out_data3[52];
  assign out_data1[51] = out_data3[51];
  assign out_data0[51] = out_data3[51];
  assign out_data2[51] = out_data3[51];
  assign out_data0[50] = out_data3[50];
  assign out_data1[50] = out_data3[50];
  assign out_data2[50] = out_data3[50];
  assign out_data0[49] = out_data3[49];
  assign out_data1[49] = out_data3[49];
  assign out_data2[49] = out_data3[49];
  assign out_data0[48] = out_data3[48];
  assign out_data1[48] = out_data3[48];
  assign out_data2[48] = out_data3[48];
  assign out_data0[47] = out_data3[47];
  assign out_data1[47] = out_data3[47];
  assign out_data2[47] = out_data3[47];
  assign out_data0[46] = out_data3[46];
  assign out_data1[46] = out_data3[46];
  assign out_data2[46] = out_data3[46];
  assign out_data0[45] = out_data3[45];
  assign out_data1[45] = out_data3[45];
  assign out_data2[45] = out_data3[45];
  assign out_data0[44] = out_data3[44];
  assign out_data1[44] = out_data3[44];
  assign out_data2[44] = out_data3[44];
  assign out_data0[43] = out_data3[43];
  assign out_data1[43] = out_data3[43];
  assign out_data2[43] = out_data3[43];
  assign out_data0[42] = out_data3[42];
  assign out_data1[42] = out_data3[42];
  assign out_data2[42] = out_data3[42];
  assign out_data0[41] = out_data3[41];
  assign out_data1[41] = out_data3[41];
  assign out_data2[41] = out_data3[41];
  assign out_data0[40] = out_data3[40];
  assign out_data1[40] = out_data3[40];
  assign out_data2[40] = out_data3[40];
  assign out_data0[39] = out_data3[39];
  assign out_data1[39] = out_data3[39];
  assign out_data2[39] = out_data3[39];
  assign out_data0[38] = out_data3[38];
  assign out_data1[38] = out_data3[38];
  assign out_data2[38] = out_data3[38];
  assign out_data0[37] = out_data3[37];
  assign out_data1[37] = out_data3[37];
  assign out_data2[37] = out_data3[37];
  assign out_data0[36] = out_data3[36];
  assign out_data1[36] = out_data3[36];
  assign out_data2[36] = out_data3[36];
  assign out_data0[35] = out_data3[35];
  assign out_data1[35] = out_data3[35];
  assign out_data2[35] = out_data3[35];
  assign out_data0[34] = out_data3[34];
  assign out_data1[34] = out_data3[34];
  assign out_data2[34] = out_data3[34];
  assign out_data0[33] = out_data3[33];
  assign out_data1[33] = out_data3[33];
  assign out_data2[33] = out_data3[33];
  assign out_data0[32] = out_data3[32];
  assign out_data1[32] = out_data3[32];
  assign out_data2[32] = out_data3[32];
  assign out_data0[31] = out_data3[31];
  assign out_data1[31] = out_data3[31];
  assign out_data2[31] = out_data3[31];
  assign out_data0[30] = out_data3[30];
  assign out_data1[30] = out_data3[30];
  assign out_data2[30] = out_data3[30];
  assign out_data0[29] = out_data3[29];
  assign out_data1[29] = out_data3[29];
  assign out_data2[29] = out_data3[29];
  assign out_data0[28] = out_data3[28];
  assign out_data1[28] = out_data3[28];
  assign out_data2[28] = out_data3[28];
  assign out_data0[27] = out_data3[27];
  assign out_data1[27] = out_data3[27];
  assign out_data2[27] = out_data3[27];
  assign out_data0[26] = out_data3[26];
  assign out_data1[26] = out_data3[26];
  assign out_data2[26] = out_data3[26];
  assign out_data0[25] = out_data3[25];
  assign out_data1[25] = out_data3[25];
  assign out_data2[25] = out_data3[25];
  assign out_data0[24] = out_data3[24];
  assign out_data1[24] = out_data3[24];
  assign out_data2[24] = out_data3[24];
  assign out_data0[23] = out_data3[23];
  assign out_data1[23] = out_data3[23];
  assign out_data2[23] = out_data3[23];
  assign out_data0[22] = out_data3[22];
  assign out_data1[22] = out_data3[22];
  assign out_data2[22] = out_data3[22];
  assign out_data0[21] = out_data3[21];
  assign out_data1[21] = out_data3[21];
  assign out_data2[21] = out_data3[21];
  assign out_data0[20] = out_data3[20];
  assign out_data1[20] = out_data3[20];
  assign out_data2[20] = out_data3[20];
  assign out_data0[19] = out_data3[19];
  assign out_data1[19] = out_data3[19];
  assign out_data2[19] = out_data3[19];
  assign out_data0[18] = out_data3[18];
  assign out_data1[18] = out_data3[18];
  assign out_data2[18] = out_data3[18];
  assign out_data0[17] = out_data3[17];
  assign out_data1[17] = out_data3[17];
  assign out_data2[17] = out_data3[17];
  assign out_data0[16] = out_data3[16];
  assign out_data1[16] = out_data3[16];
  assign out_data2[16] = out_data3[16];
  assign out_data0[15] = out_data3[15];
  assign out_data1[15] = out_data3[15];
  assign out_data2[15] = out_data3[15];
  assign out_data0[14] = out_data3[14];
  assign out_data1[14] = out_data3[14];
  assign out_data2[14] = out_data3[14];
  assign out_data0[13] = out_data3[13];
  assign out_data1[13] = out_data3[13];
  assign out_data2[13] = out_data3[13];
  assign out_data0[12] = out_data3[12];
  assign out_data1[12] = out_data3[12];
  assign out_data2[12] = out_data3[12];
  assign out_data0[11] = out_data3[11];
  assign out_data1[11] = out_data3[11];
  assign out_data2[11] = out_data3[11];
  assign out_data0[10] = out_data3[10];
  assign out_data1[10] = out_data3[10];
  assign out_data2[10] = out_data3[10];
  assign out_data0[9] = out_data3[9];
  assign out_data1[9] = out_data3[9];
  assign out_data2[9] = out_data3[9];
  assign out_data0[8] = out_data3[8];
  assign out_data1[8] = out_data3[8];
  assign out_data2[8] = out_data3[8];
  assign out_data0[7] = out_data3[7];
  assign out_data1[7] = out_data3[7];
  assign out_data2[7] = out_data3[7];
  assign out_data0[6] = out_data3[6];
  assign out_data1[6] = out_data3[6];
  assign out_data2[6] = out_data3[6];
  assign out_data0[5] = out_data3[5];
  assign out_data1[5] = out_data3[5];
  assign out_data2[5] = out_data3[5];
  assign out_data0[4] = out_data3[4];
  assign out_data1[4] = out_data3[4];
  assign out_data2[4] = out_data3[4];
  assign out_data0[3] = out_data3[3];
  assign out_data1[3] = out_data3[3];
  assign out_data2[3] = out_data3[3];
  assign out_data0[2] = out_data3[2];
  assign out_data1[2] = out_data3[2];
  assign out_data2[2] = out_data3[2];
  assign out_data0[1] = out_data3[1];
  assign out_data1[1] = out_data3[1];
  assign out_data2[1] = out_data3[1];
  assign out_data0[0] = out_data3[0];
  assign out_data1[0] = out_data3[0];
  assign out_data2[0] = out_data3[0];

  buffer_3 INBUF ( .clk(clk), .reset(reset), .buffer_en(n7), .buffer_di(
        upstream_di), .buffer_si(upstream_si), .buffer_ri(upstream_ri), 
        .buffer_ro(1'b1), .buffer_so(ib_so), .buffer_do({out_data3[63:56], 
        ib_do, out_data3[47:0]}) );
  AOI21X1 U19 ( .A(n12), .B(n9), .C(n10), .Y(out_data00_55_) );
  OAI21X1 U20 ( .A(n13), .B(n34), .C(n14), .Y(out_data3[54]) );
  OAI21X1 U21 ( .A(ib_do[53]), .B(n34), .C(ib_do[54]), .Y(n14) );
  XNOR2X1 U22 ( .A(ib_do[53]), .B(n34), .Y(out_data3[53]) );
  OAI21X1 U23 ( .A(n21), .B(n8), .C(n34), .Y(out_data3[52]) );
  AOI21X1 U25 ( .A(n15), .B(n4), .C(n5), .Y(out_data00_51_) );
  OAI21X1 U26 ( .A(n15), .B(n4), .C(n16), .Y(out_data3[50]) );
  OAI21X1 U27 ( .A(n18), .B(n3), .C(n26), .Y(out_data3[49]) );
  NAND3X1 U28 ( .A(n2), .B(n3), .C(out_valid2), .Y(n17) );
  XOR2X1 U29 ( .A(ib_do[48]), .B(out_valid2), .Y(out_data3[48]) );
  AOI22X1 U31 ( .A(out_ready0), .B(out_valid0), .C(out_ready1), .D(out_valid1), 
        .Y(n20) );
  AOI22X1 U34 ( .A(out_ready2), .B(out_valid2), .C(out_ready3), .D(out_valid3), 
        .Y(n19) );
  NOR3X1 U35 ( .A(n31), .B(n28), .C(n11), .Y(out_valid3) );
  NOR3X1 U36 ( .A(n31), .B(n1), .C(n11), .Y(out_valid2) );
  NAND3X1 U37 ( .A(n2), .B(n3), .C(n29), .Y(n23) );
  NAND3X1 U39 ( .A(n8), .B(n10), .C(n9), .Y(n22) );
  AND2X1 U3 ( .A(n25), .B(n6), .Y(chosen_ready) );
  OR2X1 U4 ( .A(ib_do[54]), .B(ib_do[53]), .Y(n13) );
  AND2X1 U5 ( .A(out_data3[62]), .B(n21), .Y(out_valid0) );
  OR2X1 U6 ( .A(n27), .B(out_data3[62]), .Y(n35) );
  OR2X1 U7 ( .A(n26), .B(ib_do[50]), .Y(n16) );
  AND2X1 U8 ( .A(ib_so), .B(n31), .Y(n21) );
  BUFX2 U9 ( .A(n20), .Y(n6) );
  INVX1 U10 ( .A(chosen_ready), .Y(n7) );
  BUFX2 U11 ( .A(n19), .Y(n25) );
  BUFX2 U12 ( .A(n17), .Y(n26) );
  INVX1 U13 ( .A(n21), .Y(n27) );
  BUFX2 U14 ( .A(n23), .Y(n28) );
  OR2X1 U15 ( .A(ib_do[51]), .B(ib_do[50]), .Y(n24) );
  INVX1 U16 ( .A(n24), .Y(n29) );
  INVX1 U17 ( .A(n35), .Y(out_valid1) );
  BUFX2 U18 ( .A(n22), .Y(n31) );
  BUFX2 U24 ( .A(out_data00_55_), .Y(out_data3[55]) );
  BUFX2 U30 ( .A(out_data00_51_), .Y(out_data3[51]) );
  AND2X1 U32 ( .A(n21), .B(n8), .Y(n12) );
  INVX1 U33 ( .A(n12), .Y(n34) );
  INVX1 U38 ( .A(n28), .Y(n1) );
  INVX1 U40 ( .A(n13), .Y(n9) );
  AND2X1 U41 ( .A(out_valid2), .B(n2), .Y(n18) );
  AND2X1 U42 ( .A(n18), .B(n3), .Y(n15) );
  INVX1 U43 ( .A(ib_do[48]), .Y(n2) );
  INVX1 U44 ( .A(ib_do[49]), .Y(n3) );
  INVX1 U45 ( .A(ib_so), .Y(n11) );
  INVX1 U46 ( .A(ib_do[52]), .Y(n8) );
  INVX1 U47 ( .A(ib_do[55]), .Y(n10) );
  INVX1 U48 ( .A(ib_do[51]), .Y(n5) );
  INVX1 U49 ( .A(ib_do[50]), .Y(n4) );
endmodule


module buffer_2 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n5, n277, n414, n347, n476, n346, n477, n410, n275, n343, n344, n273,
         n342, n341, n340, n339, n338, n337, n336, n335, n334, n333, n332,
         n331, n330, n274, n329, n328, n272, n327, n326, n325, n324, n323,
         n322, n321, n320, n319, n318, n317, n316, n271, n315, n314, n313,
         n312, n311, n310, n309, n276, n308, n307, n306, n305, n304, n270,
         n303, n302, n301, n300, n299, n298, n297, n296, n295, n294, n293,
         n292, n269, n291, n290, n289, n288, n287, n286, n285, n284, n283,
         n282, n281, n280, n408, n415, n407, n416, n406, n417, n405, n418,
         n404, n419, n403, n420, n402, n421, n401, n422, n400, n423, n399,
         n424, n398, n425, n397, n426, n396, n427, n395, n428, n394, n429,
         n393, n430, n392, n431, n391, n432, n390, n433, n389, n434, n388,
         n435, n387, n436, n386, n437, n385, n438, n384, n439, n383, n440,
         n382, n441, n381, n442, n380, n443, n379, n444, n378, n445, n377,
         n446, n376, n447, n375, n448, n374, n449, n373, n450, n372, n451,
         n371, n452, n370, n453, n369, n454, n368, n455, n367, n456, n366,
         n457, n365, n458, n364, n459, n363, n460, n362, n461, n361, n462,
         n360, n463, n359, n464, n358, n465, n357, n466, n356, n467, n355,
         n468, n354, n469, n353, n470, n352, n471, n351, n472, n350, n473,
         n349, n474, n348, n475, n345, n478, n4, n413, n1, n279, n278, n8, n6;

  DFFSR full_reg ( .D(n5), .CLK(clk), .R(n277), .S(1'b1), .Q(n414) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n275), .C(buffer_di[0]), .D(n343), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n273), .C(buffer_di[1]), .D(n343), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n273), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n273), .C(buffer_di[3]), .D(n343), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n273), .C(buffer_di[4]), .D(n343), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n273), .C(buffer_di[5]), .D(n343), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n273), .C(buffer_di[6]), .D(n343), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n273), .C(buffer_di[7]), .D(n343), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n273), .C(buffer_di[8]), .D(n343), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n273), .C(buffer_di[9]), .D(n343), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n273), .C(buffer_di[10]), .D(n343), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n273), .C(buffer_di[11]), .D(n343), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n273), .C(buffer_di[12]), .D(n343), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n273), .C(buffer_di[13]), .D(n343), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n274), .C(buffer_di[14]), .D(n343), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n274), .C(buffer_di[15]), .D(n343), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n274), .C(buffer_di[16]), .D(n272), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n274), .C(buffer_di[17]), .D(n272), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n274), .C(buffer_di[18]), .D(n272), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n274), .C(buffer_di[19]), .D(n272), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n274), .C(buffer_di[20]), .D(n272), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n274), .C(buffer_di[21]), .D(n272), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n274), .C(buffer_di[22]), .D(n272), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n274), .C(buffer_di[23]), .D(n272), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n274), .C(buffer_di[24]), .D(n272), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n275), .C(buffer_di[25]), .D(n272), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n275), .C(buffer_di[26]), .D(n272), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n275), .C(buffer_di[27]), .D(n272), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n275), .C(buffer_di[28]), .D(n271), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n275), .C(buffer_di[29]), .D(n271), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n275), .C(buffer_di[30]), .D(n271), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n275), .C(buffer_di[31]), .D(n271), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n275), .C(buffer_di[32]), .D(n271), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n275), .C(buffer_di[33]), .D(n271), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n275), .C(buffer_di[34]), .D(n271), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n276), .C(buffer_di[35]), .D(n271), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n276), .C(buffer_di[36]), .D(n271), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n276), .C(buffer_di[37]), .D(n271), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n276), .C(buffer_di[38]), .D(n271), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n276), .C(buffer_di[39]), .D(n271), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n276), .C(buffer_di[40]), .D(n270), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n276), .C(buffer_di[41]), .D(n270), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n276), .C(buffer_di[42]), .D(n270), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n276), .C(buffer_di[43]), .D(n270), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n276), .C(buffer_di[44]), .D(n270), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n276), .C(buffer_di[45]), .D(n270), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n270), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n275), .C(buffer_di[47]), .D(n270), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n274), .C(buffer_di[48]), .D(n270), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n273), .C(buffer_di[49]), .D(n270), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n270), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n275), .C(buffer_di[51]), .D(n270), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n274), .C(buffer_di[52]), .D(n269), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n273), .C(buffer_di[53]), .D(n269), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n269), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n275), .C(buffer_di[55]), .D(n269), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n274), .C(buffer_di[56]), .D(n269), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n276), .C(buffer_di[57]), .D(n269), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n275), .C(buffer_di[58]), .D(n269), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n274), .C(buffer_di[59]), .D(n269), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n273), .C(buffer_di[60]), .D(n269), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n276), .C(buffer_di[61]), .D(n269), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n275), .C(buffer_di[62]), .D(n269), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n274), .C(buffer_di[63]), .D(n269), .Y(
        n280) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n415) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n410), .S(1'b1), .Q(n478) );
  AND2X1 U3 ( .A(buffer_so), .B(n4), .Y(n413) );
  AND2X1 U6 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  INVX1 U7 ( .A(n343), .Y(n1) );
  AND2X1 U8 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U9 ( .A(n279), .Y(n4) );
  AND2X1 U10 ( .A(buffer_ri), .B(n273), .Y(n278) );
  INVX1 U11 ( .A(n278), .Y(n5) );
  INVX1 U12 ( .A(n8), .Y(n6) );
  INVX1 U13 ( .A(n6), .Y(buffer_ri) );
  INVX1 U14 ( .A(n413), .Y(n8) );
  INVX2 U15 ( .A(reset), .Y(n277) );
  BUFX2 U80 ( .A(n424), .Y(buffer_do[54]) );
  BUFX2 U81 ( .A(n426), .Y(buffer_do[52]) );
  BUFX2 U82 ( .A(n427), .Y(buffer_do[51]) );
  BUFX2 U83 ( .A(n428), .Y(buffer_do[50]) );
  BUFX2 U84 ( .A(n423), .Y(buffer_do[55]) );
  BUFX2 U85 ( .A(n425), .Y(buffer_do[53]) );
  BUFX2 U86 ( .A(n416), .Y(buffer_do[62]) );
  BUFX2 U87 ( .A(n430), .Y(buffer_do[48]) );
  BUFX2 U88 ( .A(n429), .Y(buffer_do[49]) );
  BUFX2 U89 ( .A(n414), .Y(buffer_so) );
  BUFX2 U90 ( .A(n415), .Y(buffer_do[63]) );
  BUFX2 U91 ( .A(n418), .Y(buffer_do[60]) );
  BUFX2 U92 ( .A(n419), .Y(buffer_do[59]) );
  BUFX2 U93 ( .A(n420), .Y(buffer_do[58]) );
  BUFX2 U94 ( .A(n421), .Y(buffer_do[57]) );
  BUFX2 U95 ( .A(n422), .Y(buffer_do[56]) );
  BUFX2 U96 ( .A(n431), .Y(buffer_do[47]) );
  BUFX2 U97 ( .A(n432), .Y(buffer_do[46]) );
  BUFX2 U98 ( .A(n433), .Y(buffer_do[45]) );
  BUFX2 U99 ( .A(n434), .Y(buffer_do[44]) );
  BUFX2 U100 ( .A(n435), .Y(buffer_do[43]) );
  BUFX2 U101 ( .A(n436), .Y(buffer_do[42]) );
  BUFX2 U102 ( .A(n437), .Y(buffer_do[41]) );
  BUFX2 U103 ( .A(n438), .Y(buffer_do[40]) );
  BUFX2 U104 ( .A(n439), .Y(buffer_do[39]) );
  BUFX2 U105 ( .A(n440), .Y(buffer_do[38]) );
  BUFX2 U106 ( .A(n441), .Y(buffer_do[37]) );
  BUFX2 U107 ( .A(n442), .Y(buffer_do[36]) );
  BUFX2 U108 ( .A(n443), .Y(buffer_do[35]) );
  BUFX2 U109 ( .A(n444), .Y(buffer_do[34]) );
  BUFX2 U110 ( .A(n445), .Y(buffer_do[33]) );
  BUFX2 U111 ( .A(n446), .Y(buffer_do[32]) );
  BUFX2 U112 ( .A(n447), .Y(buffer_do[31]) );
  BUFX2 U113 ( .A(n448), .Y(buffer_do[30]) );
  BUFX2 U114 ( .A(n449), .Y(buffer_do[29]) );
  BUFX2 U115 ( .A(n450), .Y(buffer_do[28]) );
  BUFX2 U116 ( .A(n451), .Y(buffer_do[27]) );
  BUFX2 U117 ( .A(n452), .Y(buffer_do[26]) );
  BUFX2 U118 ( .A(n453), .Y(buffer_do[25]) );
  BUFX2 U119 ( .A(n454), .Y(buffer_do[24]) );
  BUFX2 U120 ( .A(n455), .Y(buffer_do[23]) );
  BUFX2 U121 ( .A(n456), .Y(buffer_do[22]) );
  BUFX2 U122 ( .A(n457), .Y(buffer_do[21]) );
  BUFX2 U123 ( .A(n458), .Y(buffer_do[20]) );
  BUFX2 U124 ( .A(n459), .Y(buffer_do[19]) );
  BUFX2 U125 ( .A(n460), .Y(buffer_do[18]) );
  BUFX2 U126 ( .A(n461), .Y(buffer_do[17]) );
  BUFX2 U127 ( .A(n462), .Y(buffer_do[16]) );
  BUFX2 U128 ( .A(n463), .Y(buffer_do[15]) );
  BUFX2 U129 ( .A(n464), .Y(buffer_do[14]) );
  BUFX2 U130 ( .A(n465), .Y(buffer_do[13]) );
  BUFX2 U131 ( .A(n466), .Y(buffer_do[12]) );
  BUFX2 U132 ( .A(n467), .Y(buffer_do[11]) );
  BUFX2 U133 ( .A(n468), .Y(buffer_do[10]) );
  BUFX2 U198 ( .A(n469), .Y(buffer_do[9]) );
  BUFX2 U199 ( .A(n470), .Y(buffer_do[8]) );
  BUFX2 U200 ( .A(n471), .Y(buffer_do[7]) );
  BUFX2 U201 ( .A(n472), .Y(buffer_do[6]) );
  BUFX2 U202 ( .A(n473), .Y(buffer_do[5]) );
  BUFX2 U203 ( .A(n474), .Y(buffer_do[4]) );
  BUFX2 U204 ( .A(n475), .Y(buffer_do[3]) );
  BUFX2 U205 ( .A(n476), .Y(buffer_do[2]) );
  BUFX2 U206 ( .A(n477), .Y(buffer_do[1]) );
  BUFX2 U207 ( .A(n478), .Y(buffer_do[0]) );
  BUFX2 U208 ( .A(n417), .Y(buffer_do[61]) );
  INVX1 U209 ( .A(n1), .Y(n272) );
  INVX1 U210 ( .A(n1), .Y(n271) );
  INVX1 U211 ( .A(n1), .Y(n270) );
  INVX1 U212 ( .A(n1), .Y(n269) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n295), .Y(n393) );
  INVX1 U218 ( .A(n294), .Y(n394) );
  INVX1 U219 ( .A(n293), .Y(n395) );
  INVX1 U220 ( .A(n292), .Y(n396) );
  INVX1 U221 ( .A(n289), .Y(n399) );
  INVX1 U222 ( .A(n288), .Y(n400) );
  INVX1 U223 ( .A(n291), .Y(n397) );
  INVX1 U224 ( .A(n290), .Y(n398) );
  INVX1 U225 ( .A(n344), .Y(n345) );
  INVX1 U226 ( .A(n340), .Y(n348) );
  INVX1 U227 ( .A(n339), .Y(n349) );
  INVX1 U228 ( .A(n338), .Y(n350) );
  INVX1 U229 ( .A(n337), .Y(n351) );
  INVX1 U230 ( .A(n336), .Y(n352) );
  INVX1 U231 ( .A(n335), .Y(n353) );
  INVX1 U232 ( .A(n334), .Y(n354) );
  INVX1 U233 ( .A(n333), .Y(n355) );
  INVX1 U234 ( .A(n332), .Y(n356) );
  INVX1 U235 ( .A(n331), .Y(n357) );
  INVX1 U236 ( .A(n330), .Y(n358) );
  INVX1 U237 ( .A(n329), .Y(n359) );
  INVX1 U238 ( .A(n328), .Y(n360) );
  INVX1 U239 ( .A(n327), .Y(n361) );
  INVX1 U240 ( .A(n326), .Y(n362) );
  INVX1 U241 ( .A(n325), .Y(n363) );
  INVX1 U242 ( .A(n324), .Y(n364) );
  INVX1 U243 ( .A(n323), .Y(n365) );
  INVX1 U244 ( .A(n322), .Y(n366) );
  INVX1 U245 ( .A(n321), .Y(n367) );
  INVX1 U246 ( .A(n320), .Y(n368) );
  INVX1 U247 ( .A(n319), .Y(n369) );
  INVX1 U248 ( .A(n318), .Y(n370) );
  INVX1 U249 ( .A(n317), .Y(n371) );
  INVX1 U250 ( .A(n316), .Y(n372) );
  INVX1 U251 ( .A(n315), .Y(n373) );
  INVX1 U252 ( .A(n314), .Y(n374) );
  INVX1 U253 ( .A(n313), .Y(n375) );
  INVX1 U254 ( .A(n312), .Y(n376) );
  INVX1 U255 ( .A(n311), .Y(n377) );
  INVX1 U256 ( .A(n310), .Y(n378) );
  INVX1 U257 ( .A(n309), .Y(n379) );
  INVX1 U258 ( .A(n308), .Y(n380) );
  INVX1 U259 ( .A(n307), .Y(n381) );
  INVX1 U260 ( .A(n306), .Y(n382) );
  INVX1 U261 ( .A(n305), .Y(n383) );
  INVX1 U262 ( .A(n304), .Y(n384) );
  INVX1 U263 ( .A(n303), .Y(n385) );
  INVX1 U264 ( .A(n302), .Y(n386) );
  INVX1 U265 ( .A(n301), .Y(n387) );
  INVX1 U266 ( .A(n300), .Y(n388) );
  INVX1 U267 ( .A(n299), .Y(n389) );
  INVX1 U268 ( .A(n298), .Y(n390) );
  INVX1 U269 ( .A(n297), .Y(n391) );
  INVX1 U270 ( .A(n296), .Y(n392) );
  INVX1 U271 ( .A(n287), .Y(n401) );
  INVX1 U272 ( .A(n342), .Y(n346) );
  INVX1 U273 ( .A(n341), .Y(n347) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n280), .Y(n408) );
  INVX1 U279 ( .A(n281), .Y(n407) );
  INVX1 U280 ( .A(n282), .Y(n406) );
endmodule


module input_controller_IDX_E2_IDX_S1_IDX_NIC3_IDX_U0 ( clk, reset, polarity, 
        upstream_si, upstream_di, upstream_ri, out_ready0, out_ready1, 
        out_ready2, out_ready3, out_valid0, out_valid1, out_valid2, out_valid3, 
        out_data0, out_data1, out_data2, out_data3 );
  input [63:0] upstream_di;
  output [63:0] out_data0;
  output [63:0] out_data1;
  output [63:0] out_data2;
  output [63:0] out_data3;
  input clk, reset, polarity, upstream_si, out_ready0, out_ready1, out_ready2,
         out_ready3;
  output upstream_ri, out_valid0, out_valid1, out_valid2, out_valid3;
  wire   n27, ib_so, n35, n14, n12, n15, n23, n8, n16, n5, n6, out_data00_51_,
         n7, n4, n18, n17, n2, n3, n33, n20, n30, n9, n24, n32, n21, n19, n10,
         n11, n26, n25, n28, n1, chosen_ready, n29, n36, n22, n13;
  wire   [55:48] ib_do;
  assign out_data2[51] = out_data0[51];
  assign out_data1[51] = out_data0[51];
  assign out_data3[51] = out_data0[51];
  assign out_data0[50] = out_data3[50];
  assign out_data1[50] = out_data3[50];
  assign out_data2[50] = out_data3[50];
  assign out_data0[49] = out_data3[49];
  assign out_data1[49] = out_data3[49];
  assign out_data2[49] = out_data3[49];
  assign out_data0[48] = out_data3[48];
  assign out_data1[48] = out_data3[48];
  assign out_data2[48] = out_data3[48];
  assign out_data0[47] = out_data3[47];
  assign out_data1[47] = out_data3[47];
  assign out_data2[47] = out_data3[47];
  assign out_data0[46] = out_data3[46];
  assign out_data1[46] = out_data3[46];
  assign out_data2[46] = out_data3[46];
  assign out_data0[45] = out_data3[45];
  assign out_data1[45] = out_data3[45];
  assign out_data2[45] = out_data3[45];
  assign out_data0[44] = out_data3[44];
  assign out_data1[44] = out_data3[44];
  assign out_data2[44] = out_data3[44];
  assign out_data0[43] = out_data3[43];
  assign out_data1[43] = out_data3[43];
  assign out_data2[43] = out_data3[43];
  assign out_data0[42] = out_data3[42];
  assign out_data1[42] = out_data3[42];
  assign out_data2[42] = out_data3[42];
  assign out_data0[41] = out_data3[41];
  assign out_data1[41] = out_data3[41];
  assign out_data2[41] = out_data3[41];
  assign out_data0[40] = out_data3[40];
  assign out_data1[40] = out_data3[40];
  assign out_data2[40] = out_data3[40];
  assign out_data0[39] = out_data3[39];
  assign out_data1[39] = out_data3[39];
  assign out_data2[39] = out_data3[39];
  assign out_data0[38] = out_data3[38];
  assign out_data1[38] = out_data3[38];
  assign out_data2[38] = out_data3[38];
  assign out_data0[37] = out_data3[37];
  assign out_data1[37] = out_data3[37];
  assign out_data2[37] = out_data3[37];
  assign out_data0[36] = out_data3[36];
  assign out_data1[36] = out_data3[36];
  assign out_data2[36] = out_data3[36];
  assign out_data0[35] = out_data3[35];
  assign out_data1[35] = out_data3[35];
  assign out_data2[35] = out_data3[35];
  assign out_data0[34] = out_data3[34];
  assign out_data1[34] = out_data3[34];
  assign out_data2[34] = out_data3[34];
  assign out_data0[33] = out_data3[33];
  assign out_data1[33] = out_data3[33];
  assign out_data2[33] = out_data3[33];
  assign out_data0[32] = out_data3[32];
  assign out_data1[32] = out_data3[32];
  assign out_data2[32] = out_data3[32];
  assign out_data0[31] = out_data3[31];
  assign out_data1[31] = out_data3[31];
  assign out_data2[31] = out_data3[31];
  assign out_data0[30] = out_data3[30];
  assign out_data1[30] = out_data3[30];
  assign out_data2[30] = out_data3[30];
  assign out_data0[29] = out_data3[29];
  assign out_data1[29] = out_data3[29];
  assign out_data2[29] = out_data3[29];
  assign out_data0[28] = out_data3[28];
  assign out_data1[28] = out_data3[28];
  assign out_data2[28] = out_data3[28];
  assign out_data0[27] = out_data3[27];
  assign out_data1[27] = out_data3[27];
  assign out_data2[27] = out_data3[27];
  assign out_data0[26] = out_data3[26];
  assign out_data1[26] = out_data3[26];
  assign out_data2[26] = out_data3[26];
  assign out_data0[25] = out_data3[25];
  assign out_data1[25] = out_data3[25];
  assign out_data2[25] = out_data3[25];
  assign out_data0[24] = out_data3[24];
  assign out_data1[24] = out_data3[24];
  assign out_data2[24] = out_data3[24];
  assign out_data0[23] = out_data3[23];
  assign out_data1[23] = out_data3[23];
  assign out_data2[23] = out_data3[23];
  assign out_data0[22] = out_data3[22];
  assign out_data1[22] = out_data3[22];
  assign out_data2[22] = out_data3[22];
  assign out_data0[21] = out_data3[21];
  assign out_data1[21] = out_data3[21];
  assign out_data2[21] = out_data3[21];
  assign out_data0[20] = out_data3[20];
  assign out_data1[20] = out_data3[20];
  assign out_data2[20] = out_data3[20];
  assign out_data0[19] = out_data3[19];
  assign out_data1[19] = out_data3[19];
  assign out_data2[19] = out_data3[19];
  assign out_data0[18] = out_data3[18];
  assign out_data1[18] = out_data3[18];
  assign out_data2[18] = out_data3[18];
  assign out_data0[17] = out_data3[17];
  assign out_data1[17] = out_data3[17];
  assign out_data2[17] = out_data3[17];
  assign out_data0[16] = out_data3[16];
  assign out_data1[16] = out_data3[16];
  assign out_data2[16] = out_data3[16];
  assign out_data0[15] = out_data3[15];
  assign out_data1[15] = out_data3[15];
  assign out_data2[15] = out_data3[15];
  assign out_data0[14] = out_data3[14];
  assign out_data1[14] = out_data3[14];
  assign out_data2[14] = out_data3[14];
  assign out_data0[13] = out_data3[13];
  assign out_data1[13] = out_data3[13];
  assign out_data2[13] = out_data3[13];
  assign out_data0[12] = out_data3[12];
  assign out_data1[12] = out_data3[12];
  assign out_data2[12] = out_data3[12];
  assign out_data0[11] = out_data3[11];
  assign out_data1[11] = out_data3[11];
  assign out_data2[11] = out_data3[11];
  assign out_data0[10] = out_data3[10];
  assign out_data1[10] = out_data3[10];
  assign out_data2[10] = out_data3[10];
  assign out_data0[9] = out_data3[9];
  assign out_data1[9] = out_data3[9];
  assign out_data2[9] = out_data3[9];
  assign out_data0[8] = out_data3[8];
  assign out_data1[8] = out_data3[8];
  assign out_data2[8] = out_data3[8];
  assign out_data0[7] = out_data3[7];
  assign out_data1[7] = out_data3[7];
  assign out_data2[7] = out_data3[7];
  assign out_data0[6] = out_data3[6];
  assign out_data1[6] = out_data3[6];
  assign out_data2[6] = out_data3[6];
  assign out_data0[5] = out_data3[5];
  assign out_data1[5] = out_data3[5];
  assign out_data2[5] = out_data3[5];
  assign out_data0[4] = out_data3[4];
  assign out_data1[4] = out_data3[4];
  assign out_data2[4] = out_data3[4];
  assign out_data0[3] = out_data3[3];
  assign out_data1[3] = out_data3[3];
  assign out_data2[3] = out_data3[3];
  assign out_data0[2] = out_data3[2];
  assign out_data1[2] = out_data3[2];
  assign out_data2[2] = out_data3[2];
  assign out_data0[1] = out_data3[1];
  assign out_data1[1] = out_data3[1];
  assign out_data2[1] = out_data3[1];
  assign out_data0[0] = out_data3[0];
  assign out_data1[0] = out_data3[0];
  assign out_data2[0] = out_data3[0];
  assign out_data0[63] = out_data3[63];
  assign out_data1[63] = out_data3[63];
  assign out_data2[63] = out_data3[63];
  assign out_data0[62] = out_data3[62];
  assign out_data1[62] = out_data3[62];
  assign out_data2[62] = out_data3[62];
  assign out_data0[61] = out_data3[61];
  assign out_data1[61] = out_data3[61];
  assign out_data2[61] = out_data3[61];
  assign out_data0[60] = out_data3[60];
  assign out_data1[60] = out_data3[60];
  assign out_data2[60] = out_data3[60];
  assign out_data0[59] = out_data3[59];
  assign out_data1[59] = out_data3[59];
  assign out_data2[59] = out_data3[59];
  assign out_data0[58] = out_data3[58];
  assign out_data1[58] = out_data3[58];
  assign out_data2[58] = out_data3[58];
  assign out_data0[57] = out_data3[57];
  assign out_data1[57] = out_data3[57];
  assign out_data2[57] = out_data3[57];
  assign out_data0[56] = out_data3[56];
  assign out_data1[56] = out_data3[56];
  assign out_data2[56] = out_data3[56];
  assign out_data0[55] = out_data3[55];
  assign out_data1[55] = out_data3[55];
  assign out_data2[55] = out_data3[55];
  assign out_data0[54] = out_data3[54];
  assign out_data1[54] = out_data3[54];
  assign out_data2[54] = out_data3[54];
  assign out_data0[53] = out_data3[53];
  assign out_data1[53] = out_data3[53];
  assign out_data2[53] = out_data3[53];
  assign out_data0[52] = out_data3[52];
  assign out_data1[52] = out_data3[52];
  assign out_data2[52] = out_data3[52];

  buffer_2 INBUF ( .clk(clk), .reset(reset), .buffer_en(n27), .buffer_di(
        upstream_di), .buffer_si(upstream_si), .buffer_ri(upstream_ri), 
        .buffer_ro(1'b1), .buffer_so(ib_so), .buffer_do({out_data3[63:56], 
        ib_do, out_data3[47:0]}) );
  OAI21X1 U18 ( .A(n35), .B(n14), .C(ib_do[55]), .Y(n12) );
  OAI21X1 U19 ( .A(n14), .B(n35), .C(n15), .Y(out_data3[54]) );
  OAI21X1 U20 ( .A(ib_do[53]), .B(n35), .C(ib_do[54]), .Y(n15) );
  XNOR2X1 U21 ( .A(ib_do[53]), .B(n35), .Y(out_data3[53]) );
  OAI21X1 U22 ( .A(n23), .B(n8), .C(n35), .Y(out_data3[52]) );
  AOI21X1 U24 ( .A(n16), .B(n5), .C(n6), .Y(out_data00_51_) );
  OAI21X1 U25 ( .A(n16), .B(n5), .C(n7), .Y(out_data3[50]) );
  NAND3X1 U26 ( .A(n4), .B(n5), .C(n18), .Y(n17) );
  XNOR2X1 U27 ( .A(n4), .B(n18), .Y(out_data3[49]) );
  OAI21X1 U28 ( .A(n2), .B(n3), .C(n33), .Y(out_data3[48]) );
  AOI22X1 U31 ( .A(out_ready0), .B(out_valid0), .C(out_ready1), .D(out_valid1), 
        .Y(n20) );
  OAI21X1 U32 ( .A(out_data3[61]), .B(n30), .C(n9), .Y(out_valid0) );
  NAND3X1 U34 ( .A(n24), .B(n32), .C(ib_so), .Y(n21) );
  AOI22X1 U35 ( .A(out_ready2), .B(out_valid2), .C(out_ready3), .D(out_valid3), 
        .Y(n19) );
  NOR3X1 U36 ( .A(n10), .B(n32), .C(n11), .Y(out_valid3) );
  NAND3X1 U37 ( .A(n3), .B(n4), .C(n26), .Y(n25) );
  NOR3X1 U40 ( .A(ib_do[52]), .B(ib_do[55]), .C(n14), .Y(n24) );
  AND2X1 U3 ( .A(n28), .B(n1), .Y(chosen_ready) );
  OR2X1 U4 ( .A(ib_do[54]), .B(ib_do[53]), .Y(n14) );
  AND2X1 U5 ( .A(out_data3[61]), .B(n2), .Y(out_valid1) );
  OR2X1 U6 ( .A(n29), .B(out_data3[62]), .Y(n36) );
  BUFX2 U7 ( .A(n20), .Y(n1) );
  BUFX2 U8 ( .A(n17), .Y(n7) );
  AND2X1 U9 ( .A(out_data3[62]), .B(n23), .Y(n22) );
  INVX1 U10 ( .A(n22), .Y(n9) );
  INVX1 U11 ( .A(chosen_ready), .Y(n27) );
  BUFX2 U12 ( .A(n19), .Y(n28) );
  AND2X1 U13 ( .A(ib_so), .B(n10), .Y(n23) );
  INVX1 U14 ( .A(n23), .Y(n29) );
  BUFX2 U15 ( .A(n21), .Y(n30) );
  INVX1 U16 ( .A(n36), .Y(out_valid2) );
  BUFX2 U17 ( .A(n25), .Y(n32) );
  AND2X1 U23 ( .A(n2), .B(n3), .Y(n18) );
  INVX1 U29 ( .A(n18), .Y(n33) );
  BUFX2 U30 ( .A(out_data00_51_), .Y(out_data0[51]) );
  AND2X1 U33 ( .A(n23), .B(n8), .Y(n13) );
  INVX1 U38 ( .A(n13), .Y(n35) );
  AND2X1 U39 ( .A(n6), .B(n5), .Y(n26) );
  INVX1 U41 ( .A(n24), .Y(n10) );
  INVX1 U42 ( .A(n30), .Y(n2) );
  AND2X1 U43 ( .A(n18), .B(n4), .Y(n16) );
  INVX1 U44 ( .A(ib_so), .Y(n11) );
  INVX1 U45 ( .A(ib_do[49]), .Y(n4) );
  INVX1 U46 ( .A(ib_do[50]), .Y(n5) );
  INVX1 U47 ( .A(ib_do[48]), .Y(n3) );
  INVX1 U48 ( .A(ib_do[51]), .Y(n6) );
  INVX1 U49 ( .A(n12), .Y(out_data3[55]) );
  INVX1 U50 ( .A(ib_do[52]), .Y(n8) );
endmodule


module buffer_1 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n5, n277, n414, n347, n476, n346, n477, n410, n274, n343, n344, n272,
         n342, n276, n341, n340, n339, n338, n337, n336, n335, n334, n333,
         n332, n331, n330, n273, n329, n328, n327, n326, n325, n324, n323,
         n322, n321, n320, n319, n318, n317, n316, n271, n315, n314, n313,
         n312, n311, n310, n309, n275, n308, n307, n306, n305, n304, n270,
         n303, n302, n301, n300, n299, n298, n297, n296, n295, n294, n293,
         n292, n269, n291, n290, n289, n288, n287, n286, n285, n284, n283,
         n282, n281, n280, n408, n415, n407, n416, n406, n417, n405, n418,
         n404, n419, n403, n420, n402, n421, n401, n422, n400, n423, n399,
         n424, n398, n425, n397, n426, n396, n427, n395, n428, n394, n429,
         n393, n430, n392, n431, n391, n432, n390, n433, n389, n434, n388,
         n435, n387, n436, n386, n437, n385, n438, n384, n439, n383, n440,
         n382, n441, n381, n442, n380, n443, n379, n444, n378, n445, n377,
         n446, n376, n447, n375, n448, n374, n449, n373, n450, n372, n451,
         n371, n452, n370, n453, n369, n454, n368, n455, n367, n456, n366,
         n457, n365, n458, n364, n459, n363, n460, n362, n461, n361, n462,
         n360, n463, n359, n464, n358, n465, n357, n466, n356, n467, n355,
         n468, n354, n469, n353, n470, n352, n471, n351, n472, n350, n473,
         n349, n474, n348, n475, n345, n478, n4, n413, n1, n279, n278, n8, n6;

  DFFSR full_reg ( .D(n5), .CLK(clk), .R(n277), .S(1'b1), .Q(n414) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n343), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n272), .C(buffer_di[1]), .D(n343), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n276), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n272), .C(buffer_di[3]), .D(n343), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n272), .C(buffer_di[4]), .D(n343), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n272), .C(buffer_di[5]), .D(n343), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n272), .C(buffer_di[6]), .D(n343), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n272), .C(buffer_di[7]), .D(n343), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n272), .C(buffer_di[8]), .D(n343), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n272), .C(buffer_di[9]), .D(n343), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n272), .C(buffer_di[10]), .D(n343), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n272), .C(buffer_di[11]), .D(n343), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n272), .C(buffer_di[12]), .D(n343), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n272), .C(buffer_di[13]), .D(n343), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n273), .C(buffer_di[14]), .D(n343), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n273), .C(buffer_di[15]), .D(n343), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n343), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n273), .C(buffer_di[17]), .D(n343), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n273), .C(buffer_di[18]), .D(n343), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n273), .C(buffer_di[19]), .D(n343), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n273), .C(buffer_di[20]), .D(n343), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n273), .C(buffer_di[21]), .D(n343), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n273), .C(buffer_di[22]), .D(n343), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n273), .C(buffer_di[23]), .D(n343), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n273), .C(buffer_di[24]), .D(n343), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n343), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n343), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n343), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n271), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n271), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n271), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n271), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n271), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n271), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n271), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n271), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n271), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n271), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n271), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n271), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n270), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n270), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n270), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n270), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n270), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n270), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n270), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n270), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n270), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n270), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n270), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n270), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n269), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n269), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n269), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n269), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n269), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n275), .C(buffer_di[57]), .D(n269), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n269), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n273), .C(buffer_di[59]), .D(n269), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n272), .C(buffer_di[60]), .D(n269), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n275), .C(buffer_di[61]), .D(n269), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n269), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n273), .C(buffer_di[63]), .D(n269), .Y(
        n280) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n415) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n410), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n410), .S(1'b1), .Q(n478) );
  AND2X1 U3 ( .A(buffer_so), .B(n4), .Y(n413) );
  AND2X1 U6 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  INVX1 U7 ( .A(n343), .Y(n1) );
  AND2X1 U8 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U9 ( .A(n279), .Y(n4) );
  AND2X1 U10 ( .A(buffer_ri), .B(n276), .Y(n278) );
  INVX1 U11 ( .A(n278), .Y(n5) );
  INVX1 U12 ( .A(n8), .Y(n6) );
  INVX1 U13 ( .A(n6), .Y(buffer_ri) );
  INVX1 U14 ( .A(n413), .Y(n8) );
  INVX2 U15 ( .A(reset), .Y(n277) );
  BUFX2 U80 ( .A(n424), .Y(buffer_do[54]) );
  BUFX2 U81 ( .A(n426), .Y(buffer_do[52]) );
  BUFX2 U82 ( .A(n417), .Y(buffer_do[61]) );
  BUFX2 U83 ( .A(n416), .Y(buffer_do[62]) );
  BUFX2 U84 ( .A(n423), .Y(buffer_do[55]) );
  BUFX2 U85 ( .A(n414), .Y(buffer_so) );
  BUFX2 U86 ( .A(n425), .Y(buffer_do[53]) );
  BUFX2 U87 ( .A(n415), .Y(buffer_do[63]) );
  BUFX2 U88 ( .A(n418), .Y(buffer_do[60]) );
  BUFX2 U89 ( .A(n419), .Y(buffer_do[59]) );
  BUFX2 U90 ( .A(n420), .Y(buffer_do[58]) );
  BUFX2 U91 ( .A(n421), .Y(buffer_do[57]) );
  BUFX2 U92 ( .A(n422), .Y(buffer_do[56]) );
  BUFX2 U93 ( .A(n431), .Y(buffer_do[47]) );
  BUFX2 U94 ( .A(n432), .Y(buffer_do[46]) );
  BUFX2 U95 ( .A(n433), .Y(buffer_do[45]) );
  BUFX2 U96 ( .A(n434), .Y(buffer_do[44]) );
  BUFX2 U97 ( .A(n435), .Y(buffer_do[43]) );
  BUFX2 U98 ( .A(n436), .Y(buffer_do[42]) );
  BUFX2 U99 ( .A(n437), .Y(buffer_do[41]) );
  BUFX2 U100 ( .A(n438), .Y(buffer_do[40]) );
  BUFX2 U101 ( .A(n439), .Y(buffer_do[39]) );
  BUFX2 U102 ( .A(n440), .Y(buffer_do[38]) );
  BUFX2 U103 ( .A(n441), .Y(buffer_do[37]) );
  BUFX2 U104 ( .A(n442), .Y(buffer_do[36]) );
  BUFX2 U105 ( .A(n443), .Y(buffer_do[35]) );
  BUFX2 U106 ( .A(n444), .Y(buffer_do[34]) );
  BUFX2 U107 ( .A(n445), .Y(buffer_do[33]) );
  BUFX2 U108 ( .A(n446), .Y(buffer_do[32]) );
  BUFX2 U109 ( .A(n447), .Y(buffer_do[31]) );
  BUFX2 U110 ( .A(n448), .Y(buffer_do[30]) );
  BUFX2 U111 ( .A(n449), .Y(buffer_do[29]) );
  BUFX2 U112 ( .A(n450), .Y(buffer_do[28]) );
  BUFX2 U113 ( .A(n451), .Y(buffer_do[27]) );
  BUFX2 U114 ( .A(n452), .Y(buffer_do[26]) );
  BUFX2 U115 ( .A(n453), .Y(buffer_do[25]) );
  BUFX2 U116 ( .A(n454), .Y(buffer_do[24]) );
  BUFX2 U117 ( .A(n455), .Y(buffer_do[23]) );
  BUFX2 U118 ( .A(n456), .Y(buffer_do[22]) );
  BUFX2 U119 ( .A(n457), .Y(buffer_do[21]) );
  BUFX2 U120 ( .A(n458), .Y(buffer_do[20]) );
  BUFX2 U121 ( .A(n459), .Y(buffer_do[19]) );
  BUFX2 U122 ( .A(n460), .Y(buffer_do[18]) );
  BUFX2 U123 ( .A(n461), .Y(buffer_do[17]) );
  BUFX2 U124 ( .A(n462), .Y(buffer_do[16]) );
  BUFX2 U125 ( .A(n463), .Y(buffer_do[15]) );
  BUFX2 U126 ( .A(n464), .Y(buffer_do[14]) );
  BUFX2 U127 ( .A(n465), .Y(buffer_do[13]) );
  BUFX2 U128 ( .A(n466), .Y(buffer_do[12]) );
  BUFX2 U129 ( .A(n467), .Y(buffer_do[11]) );
  BUFX2 U130 ( .A(n468), .Y(buffer_do[10]) );
  BUFX2 U131 ( .A(n469), .Y(buffer_do[9]) );
  BUFX2 U132 ( .A(n470), .Y(buffer_do[8]) );
  BUFX2 U133 ( .A(n471), .Y(buffer_do[7]) );
  BUFX2 U198 ( .A(n472), .Y(buffer_do[6]) );
  BUFX2 U199 ( .A(n473), .Y(buffer_do[5]) );
  BUFX2 U200 ( .A(n474), .Y(buffer_do[4]) );
  BUFX2 U201 ( .A(n475), .Y(buffer_do[3]) );
  BUFX2 U202 ( .A(n476), .Y(buffer_do[2]) );
  BUFX2 U203 ( .A(n477), .Y(buffer_do[1]) );
  BUFX2 U204 ( .A(n478), .Y(buffer_do[0]) );
  BUFX2 U205 ( .A(n427), .Y(buffer_do[51]) );
  BUFX2 U206 ( .A(n430), .Y(buffer_do[48]) );
  BUFX2 U207 ( .A(n428), .Y(buffer_do[50]) );
  BUFX2 U208 ( .A(n429), .Y(buffer_do[49]) );
  INVX1 U209 ( .A(n1), .Y(n271) );
  INVX1 U210 ( .A(n1), .Y(n270) );
  INVX1 U211 ( .A(n1), .Y(n269) );
  INVX1 U212 ( .A(n343), .Y(n272) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n295), .Y(n393) );
  INVX1 U218 ( .A(n294), .Y(n394) );
  INVX1 U219 ( .A(n293), .Y(n395) );
  INVX1 U220 ( .A(n292), .Y(n396) );
  INVX1 U221 ( .A(n289), .Y(n399) );
  INVX1 U222 ( .A(n288), .Y(n400) );
  INVX1 U223 ( .A(n291), .Y(n397) );
  INVX1 U224 ( .A(n290), .Y(n398) );
  INVX1 U225 ( .A(n344), .Y(n345) );
  INVX1 U226 ( .A(n340), .Y(n348) );
  INVX1 U227 ( .A(n339), .Y(n349) );
  INVX1 U228 ( .A(n338), .Y(n350) );
  INVX1 U229 ( .A(n337), .Y(n351) );
  INVX1 U230 ( .A(n336), .Y(n352) );
  INVX1 U231 ( .A(n335), .Y(n353) );
  INVX1 U232 ( .A(n334), .Y(n354) );
  INVX1 U233 ( .A(n333), .Y(n355) );
  INVX1 U234 ( .A(n332), .Y(n356) );
  INVX1 U235 ( .A(n331), .Y(n357) );
  INVX1 U236 ( .A(n330), .Y(n358) );
  INVX1 U237 ( .A(n329), .Y(n359) );
  INVX1 U238 ( .A(n328), .Y(n360) );
  INVX1 U239 ( .A(n327), .Y(n361) );
  INVX1 U240 ( .A(n326), .Y(n362) );
  INVX1 U241 ( .A(n325), .Y(n363) );
  INVX1 U242 ( .A(n324), .Y(n364) );
  INVX1 U243 ( .A(n323), .Y(n365) );
  INVX1 U244 ( .A(n322), .Y(n366) );
  INVX1 U245 ( .A(n321), .Y(n367) );
  INVX1 U246 ( .A(n320), .Y(n368) );
  INVX1 U247 ( .A(n319), .Y(n369) );
  INVX1 U248 ( .A(n318), .Y(n370) );
  INVX1 U249 ( .A(n317), .Y(n371) );
  INVX1 U250 ( .A(n316), .Y(n372) );
  INVX1 U251 ( .A(n315), .Y(n373) );
  INVX1 U252 ( .A(n314), .Y(n374) );
  INVX1 U253 ( .A(n313), .Y(n375) );
  INVX1 U254 ( .A(n312), .Y(n376) );
  INVX1 U255 ( .A(n311), .Y(n377) );
  INVX1 U256 ( .A(n310), .Y(n378) );
  INVX1 U257 ( .A(n309), .Y(n379) );
  INVX1 U258 ( .A(n308), .Y(n380) );
  INVX1 U259 ( .A(n307), .Y(n381) );
  INVX1 U260 ( .A(n306), .Y(n382) );
  INVX1 U261 ( .A(n305), .Y(n383) );
  INVX1 U262 ( .A(n304), .Y(n384) );
  INVX1 U263 ( .A(n303), .Y(n385) );
  INVX1 U264 ( .A(n302), .Y(n386) );
  INVX1 U265 ( .A(n301), .Y(n387) );
  INVX1 U266 ( .A(n300), .Y(n388) );
  INVX1 U267 ( .A(n299), .Y(n389) );
  INVX1 U268 ( .A(n298), .Y(n390) );
  INVX1 U269 ( .A(n297), .Y(n391) );
  INVX1 U270 ( .A(n296), .Y(n392) );
  INVX1 U271 ( .A(n287), .Y(n401) );
  INVX1 U272 ( .A(n342), .Y(n346) );
  INVX1 U273 ( .A(n341), .Y(n347) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n280), .Y(n408) );
  INVX1 U279 ( .A(n282), .Y(n406) );
  INVX1 U280 ( .A(n281), .Y(n407) );
endmodule


module input_controller_IDX_W2_IDX_S1_IDX_NIC3_IDX_U0 ( clk, reset, polarity, 
        upstream_si, upstream_di, upstream_ri, out_ready0, out_ready1, 
        out_ready2, out_ready3, out_valid0, out_valid1, out_valid2, out_valid3, 
        out_data0, out_data1, out_data2, out_data3 );
  input [63:0] upstream_di;
  output [63:0] out_data0;
  output [63:0] out_data1;
  output [63:0] out_data2;
  output [63:0] out_data3;
  input clk, reset, polarity, upstream_si, out_ready0, out_ready1, out_ready2,
         out_ready3;
  output upstream_ri, out_valid0, out_valid1, out_valid2, out_valid3;
  wire   n29, ib_so, n35, n15, n13, n16, n17, n8, n18, n5, n6, out_data00_51_,
         n7, n4, n20, n19, n2, n3, n33, n22, n31, n10, n28, n25, n32, n23, n21,
         n9, n12, n27, n26, n30, n1, chosen_ready, n11, n24, n14;
  wire   [55:48] ib_do;
  assign out_data1[51] = out_data0[51];
  assign out_data2[51] = out_data0[51];
  assign out_data3[51] = out_data0[51];
  assign out_data0[50] = out_data3[50];
  assign out_data1[50] = out_data3[50];
  assign out_data2[50] = out_data3[50];
  assign out_data0[49] = out_data3[49];
  assign out_data1[49] = out_data3[49];
  assign out_data2[49] = out_data3[49];
  assign out_data0[48] = out_data3[48];
  assign out_data1[48] = out_data3[48];
  assign out_data2[48] = out_data3[48];
  assign out_data0[47] = out_data3[47];
  assign out_data1[47] = out_data3[47];
  assign out_data2[47] = out_data3[47];
  assign out_data0[46] = out_data3[46];
  assign out_data1[46] = out_data3[46];
  assign out_data2[46] = out_data3[46];
  assign out_data0[45] = out_data3[45];
  assign out_data1[45] = out_data3[45];
  assign out_data2[45] = out_data3[45];
  assign out_data0[44] = out_data3[44];
  assign out_data1[44] = out_data3[44];
  assign out_data2[44] = out_data3[44];
  assign out_data0[43] = out_data3[43];
  assign out_data1[43] = out_data3[43];
  assign out_data2[43] = out_data3[43];
  assign out_data0[42] = out_data3[42];
  assign out_data1[42] = out_data3[42];
  assign out_data2[42] = out_data3[42];
  assign out_data0[41] = out_data3[41];
  assign out_data1[41] = out_data3[41];
  assign out_data2[41] = out_data3[41];
  assign out_data0[40] = out_data3[40];
  assign out_data1[40] = out_data3[40];
  assign out_data2[40] = out_data3[40];
  assign out_data0[39] = out_data3[39];
  assign out_data1[39] = out_data3[39];
  assign out_data2[39] = out_data3[39];
  assign out_data0[38] = out_data3[38];
  assign out_data1[38] = out_data3[38];
  assign out_data2[38] = out_data3[38];
  assign out_data0[37] = out_data3[37];
  assign out_data1[37] = out_data3[37];
  assign out_data2[37] = out_data3[37];
  assign out_data0[36] = out_data3[36];
  assign out_data1[36] = out_data3[36];
  assign out_data2[36] = out_data3[36];
  assign out_data0[35] = out_data3[35];
  assign out_data1[35] = out_data3[35];
  assign out_data2[35] = out_data3[35];
  assign out_data0[34] = out_data3[34];
  assign out_data1[34] = out_data3[34];
  assign out_data2[34] = out_data3[34];
  assign out_data0[33] = out_data3[33];
  assign out_data1[33] = out_data3[33];
  assign out_data2[33] = out_data3[33];
  assign out_data0[32] = out_data3[32];
  assign out_data1[32] = out_data3[32];
  assign out_data2[32] = out_data3[32];
  assign out_data0[31] = out_data3[31];
  assign out_data1[31] = out_data3[31];
  assign out_data2[31] = out_data3[31];
  assign out_data0[30] = out_data3[30];
  assign out_data1[30] = out_data3[30];
  assign out_data2[30] = out_data3[30];
  assign out_data0[29] = out_data3[29];
  assign out_data1[29] = out_data3[29];
  assign out_data2[29] = out_data3[29];
  assign out_data0[28] = out_data3[28];
  assign out_data1[28] = out_data3[28];
  assign out_data2[28] = out_data3[28];
  assign out_data0[27] = out_data3[27];
  assign out_data1[27] = out_data3[27];
  assign out_data2[27] = out_data3[27];
  assign out_data0[26] = out_data3[26];
  assign out_data1[26] = out_data3[26];
  assign out_data2[26] = out_data3[26];
  assign out_data0[25] = out_data3[25];
  assign out_data1[25] = out_data3[25];
  assign out_data2[25] = out_data3[25];
  assign out_data0[24] = out_data3[24];
  assign out_data1[24] = out_data3[24];
  assign out_data2[24] = out_data3[24];
  assign out_data0[23] = out_data3[23];
  assign out_data1[23] = out_data3[23];
  assign out_data2[23] = out_data3[23];
  assign out_data0[22] = out_data3[22];
  assign out_data1[22] = out_data3[22];
  assign out_data2[22] = out_data3[22];
  assign out_data0[21] = out_data3[21];
  assign out_data1[21] = out_data3[21];
  assign out_data2[21] = out_data3[21];
  assign out_data0[20] = out_data3[20];
  assign out_data1[20] = out_data3[20];
  assign out_data2[20] = out_data3[20];
  assign out_data0[19] = out_data3[19];
  assign out_data1[19] = out_data3[19];
  assign out_data2[19] = out_data3[19];
  assign out_data0[18] = out_data3[18];
  assign out_data1[18] = out_data3[18];
  assign out_data2[18] = out_data3[18];
  assign out_data0[17] = out_data3[17];
  assign out_data1[17] = out_data3[17];
  assign out_data2[17] = out_data3[17];
  assign out_data0[16] = out_data3[16];
  assign out_data1[16] = out_data3[16];
  assign out_data2[16] = out_data3[16];
  assign out_data0[15] = out_data3[15];
  assign out_data1[15] = out_data3[15];
  assign out_data2[15] = out_data3[15];
  assign out_data0[14] = out_data3[14];
  assign out_data1[14] = out_data3[14];
  assign out_data2[14] = out_data3[14];
  assign out_data0[13] = out_data3[13];
  assign out_data1[13] = out_data3[13];
  assign out_data2[13] = out_data3[13];
  assign out_data0[12] = out_data3[12];
  assign out_data1[12] = out_data3[12];
  assign out_data2[12] = out_data3[12];
  assign out_data0[11] = out_data3[11];
  assign out_data1[11] = out_data3[11];
  assign out_data2[11] = out_data3[11];
  assign out_data0[10] = out_data3[10];
  assign out_data1[10] = out_data3[10];
  assign out_data2[10] = out_data3[10];
  assign out_data0[9] = out_data3[9];
  assign out_data1[9] = out_data3[9];
  assign out_data2[9] = out_data3[9];
  assign out_data0[8] = out_data3[8];
  assign out_data1[8] = out_data3[8];
  assign out_data2[8] = out_data3[8];
  assign out_data0[7] = out_data3[7];
  assign out_data1[7] = out_data3[7];
  assign out_data2[7] = out_data3[7];
  assign out_data0[6] = out_data3[6];
  assign out_data1[6] = out_data3[6];
  assign out_data2[6] = out_data3[6];
  assign out_data0[5] = out_data3[5];
  assign out_data1[5] = out_data3[5];
  assign out_data2[5] = out_data3[5];
  assign out_data0[4] = out_data3[4];
  assign out_data1[4] = out_data3[4];
  assign out_data2[4] = out_data3[4];
  assign out_data0[3] = out_data3[3];
  assign out_data1[3] = out_data3[3];
  assign out_data2[3] = out_data3[3];
  assign out_data0[2] = out_data3[2];
  assign out_data1[2] = out_data3[2];
  assign out_data2[2] = out_data3[2];
  assign out_data0[1] = out_data3[1];
  assign out_data1[1] = out_data3[1];
  assign out_data2[1] = out_data3[1];
  assign out_data0[0] = out_data3[0];
  assign out_data1[0] = out_data3[0];
  assign out_data2[0] = out_data3[0];
  assign out_data0[63] = out_data3[63];
  assign out_data1[63] = out_data3[63];
  assign out_data2[63] = out_data3[63];
  assign out_data0[62] = out_data3[62];
  assign out_data1[62] = out_data3[62];
  assign out_data2[62] = out_data3[62];
  assign out_data0[61] = out_data3[61];
  assign out_data1[61] = out_data3[61];
  assign out_data2[61] = out_data3[61];
  assign out_data0[60] = out_data3[60];
  assign out_data1[60] = out_data3[60];
  assign out_data2[60] = out_data3[60];
  assign out_data0[59] = out_data3[59];
  assign out_data1[59] = out_data3[59];
  assign out_data2[59] = out_data3[59];
  assign out_data0[58] = out_data3[58];
  assign out_data1[58] = out_data3[58];
  assign out_data2[58] = out_data3[58];
  assign out_data0[57] = out_data3[57];
  assign out_data1[57] = out_data3[57];
  assign out_data2[57] = out_data3[57];
  assign out_data0[56] = out_data3[56];
  assign out_data1[56] = out_data3[56];
  assign out_data2[56] = out_data3[56];
  assign out_data0[55] = out_data3[55];
  assign out_data1[55] = out_data3[55];
  assign out_data2[55] = out_data3[55];
  assign out_data0[54] = out_data3[54];
  assign out_data1[54] = out_data3[54];
  assign out_data2[54] = out_data3[54];
  assign out_data0[53] = out_data3[53];
  assign out_data1[53] = out_data3[53];
  assign out_data2[53] = out_data3[53];
  assign out_data0[52] = out_data3[52];
  assign out_data1[52] = out_data3[52];
  assign out_data2[52] = out_data3[52];

  buffer_1 INBUF ( .clk(clk), .reset(reset), .buffer_en(n29), .buffer_di(
        upstream_di), .buffer_si(upstream_si), .buffer_ri(upstream_ri), 
        .buffer_ro(1'b1), .buffer_so(ib_so), .buffer_do({out_data3[63:56], 
        ib_do, out_data3[47:0]}) );
  OAI21X1 U21 ( .A(n35), .B(n15), .C(ib_do[55]), .Y(n13) );
  OAI21X1 U22 ( .A(n15), .B(n35), .C(n16), .Y(out_data3[54]) );
  OAI21X1 U23 ( .A(ib_do[53]), .B(n35), .C(ib_do[54]), .Y(n16) );
  XNOR2X1 U24 ( .A(ib_do[53]), .B(n35), .Y(out_data3[53]) );
  OAI21X1 U25 ( .A(n17), .B(n8), .C(n35), .Y(out_data3[52]) );
  AOI21X1 U27 ( .A(n18), .B(n5), .C(n6), .Y(out_data00_51_) );
  OAI21X1 U28 ( .A(n18), .B(n5), .C(n7), .Y(out_data3[50]) );
  NAND3X1 U29 ( .A(n4), .B(n5), .C(n20), .Y(n19) );
  XNOR2X1 U30 ( .A(n4), .B(n20), .Y(out_data3[49]) );
  OAI21X1 U31 ( .A(n2), .B(n3), .C(n33), .Y(out_data3[48]) );
  AOI22X1 U34 ( .A(out_ready1), .B(out_valid1), .C(out_ready0), .D(out_valid0), 
        .Y(n22) );
  OAI21X1 U35 ( .A(n31), .B(n10), .C(n28), .Y(out_valid1) );
  NAND3X1 U37 ( .A(n25), .B(n32), .C(ib_so), .Y(n23) );
  AOI22X1 U38 ( .A(out_ready2), .B(out_valid2), .C(out_ready3), .D(out_valid3), 
        .Y(n21) );
  NOR3X1 U39 ( .A(n9), .B(n32), .C(n12), .Y(out_valid3) );
  NAND3X1 U40 ( .A(n3), .B(n4), .C(n27), .Y(n26) );
  NOR3X1 U41 ( .A(ib_do[52]), .B(ib_do[55]), .C(n15), .Y(n25) );
  AND2X1 U3 ( .A(n30), .B(n1), .Y(chosen_ready) );
  AND2X1 U4 ( .A(ib_so), .B(n9), .Y(n17) );
  OR2X1 U5 ( .A(ib_do[54]), .B(ib_do[53]), .Y(n15) );
  AND2X1 U6 ( .A(out_data3[62]), .B(n17), .Y(out_valid2) );
  BUFX2 U7 ( .A(n22), .Y(n1) );
  BUFX2 U8 ( .A(n19), .Y(n7) );
  AND2X1 U9 ( .A(n17), .B(n11), .Y(n24) );
  INVX1 U10 ( .A(n24), .Y(n28) );
  INVX1 U11 ( .A(chosen_ready), .Y(n29) );
  BUFX2 U12 ( .A(n21), .Y(n30) );
  BUFX2 U13 ( .A(n23), .Y(n31) );
  BUFX2 U14 ( .A(n26), .Y(n32) );
  AND2X1 U15 ( .A(n2), .B(n3), .Y(n20) );
  INVX1 U16 ( .A(n20), .Y(n33) );
  BUFX2 U17 ( .A(out_data00_51_), .Y(out_data0[51]) );
  AND2X1 U18 ( .A(n17), .B(n8), .Y(n14) );
  INVX1 U19 ( .A(n14), .Y(n35) );
  AND2X1 U20 ( .A(n6), .B(n5), .Y(n27) );
  AND2X1 U26 ( .A(n2), .B(n10), .Y(out_valid0) );
  INVX1 U32 ( .A(n25), .Y(n9) );
  INVX1 U33 ( .A(n31), .Y(n2) );
  AND2X1 U36 ( .A(n20), .B(n4), .Y(n18) );
  INVX1 U42 ( .A(ib_so), .Y(n12) );
  INVX1 U43 ( .A(out_data3[62]), .Y(n11) );
  INVX1 U44 ( .A(out_data3[61]), .Y(n10) );
  INVX1 U45 ( .A(ib_do[49]), .Y(n4) );
  INVX1 U46 ( .A(ib_do[50]), .Y(n5) );
  INVX1 U47 ( .A(ib_do[48]), .Y(n3) );
  INVX1 U48 ( .A(ib_do[51]), .Y(n6) );
  INVX1 U49 ( .A(n13), .Y(out_data3[55]) );
  INVX1 U50 ( .A(ib_do[52]), .Y(n8) );
endmodule


module buffer_0 ( clk, reset, buffer_en, buffer_di, buffer_si, buffer_ri, 
        buffer_ro, buffer_so, buffer_do );
  input [63:0] buffer_di;
  output [63:0] buffer_do;
  input clk, reset, buffer_en, buffer_si, buffer_ro;
  output buffer_ri, buffer_so;
  wire   n5, n277, n414, n347, n476, n346, n477, n410, n274, n343, n344, n272,
         n342, n276, n341, n340, n339, n338, n337, n336, n335, n334, n333,
         n332, n331, n330, n273, n329, n328, n327, n326, n325, n324, n323,
         n322, n321, n320, n319, n318, n317, n316, n271, n315, n314, n313,
         n312, n311, n310, n309, n275, n308, n307, n306, n305, n304, n270,
         n303, n302, n301, n300, n299, n298, n297, n296, n295, n294, n293,
         n292, n269, n291, n290, n289, n288, n287, n286, n285, n284, n283,
         n282, n281, n280, n348, n475, n345, n478, n401, n422, n400, n423,
         n399, n424, n398, n425, n397, n426, n396, n427, n395, n428, n394,
         n429, n393, n430, n392, n431, n391, n432, n390, n433, n389, n434,
         n388, n435, n387, n436, n386, n437, n385, n438, n384, n439, n383,
         n440, n382, n441, n381, n442, n380, n443, n379, n444, n378, n445,
         n377, n446, n376, n447, n375, n448, n374, n449, n373, n450, n372,
         n451, n371, n452, n370, n453, n369, n454, n368, n455, n367, n456,
         n366, n457, n365, n458, n364, n459, n363, n460, n362, n461, n361,
         n462, n360, n463, n359, n464, n358, n465, n357, n466, n356, n467,
         n355, n468, n354, n469, n353, n470, n352, n471, n351, n472, n350,
         n473, n349, n474, n408, n415, n407, n416, n406, n417, n405, n418,
         n404, n419, n403, n420, n402, n421, n4, n413, n1, n279, n278, n8, n6;

  DFFSR full_reg ( .D(n5), .CLK(clk), .R(n277), .S(1'b1), .Q(n414) );
  DFFSR data_q_reg_2_ ( .D(n347), .CLK(clk), .R(n277), .S(1'b1), .Q(n476) );
  DFFSR data_q_reg_1_ ( .D(n346), .CLK(clk), .R(n277), .S(1'b1), .Q(n477) );
  INVX1 U67 ( .A(reset), .Y(n410) );
  AOI22X1 U134 ( .A(buffer_do[0]), .B(n274), .C(buffer_di[0]), .D(n343), .Y(
        n344) );
  AOI22X1 U135 ( .A(buffer_do[1]), .B(n272), .C(buffer_di[1]), .D(n343), .Y(
        n342) );
  AOI22X1 U136 ( .A(buffer_do[2]), .B(n276), .C(buffer_di[2]), .D(n343), .Y(
        n341) );
  AOI22X1 U137 ( .A(buffer_do[3]), .B(n272), .C(buffer_di[3]), .D(n343), .Y(
        n340) );
  AOI22X1 U138 ( .A(buffer_do[4]), .B(n272), .C(buffer_di[4]), .D(n343), .Y(
        n339) );
  AOI22X1 U139 ( .A(buffer_do[5]), .B(n272), .C(buffer_di[5]), .D(n343), .Y(
        n338) );
  AOI22X1 U140 ( .A(buffer_do[6]), .B(n272), .C(buffer_di[6]), .D(n343), .Y(
        n337) );
  AOI22X1 U141 ( .A(buffer_do[7]), .B(n272), .C(buffer_di[7]), .D(n343), .Y(
        n336) );
  AOI22X1 U142 ( .A(buffer_do[8]), .B(n272), .C(buffer_di[8]), .D(n343), .Y(
        n335) );
  AOI22X1 U143 ( .A(buffer_do[9]), .B(n272), .C(buffer_di[9]), .D(n343), .Y(
        n334) );
  AOI22X1 U144 ( .A(buffer_do[10]), .B(n272), .C(buffer_di[10]), .D(n343), .Y(
        n333) );
  AOI22X1 U145 ( .A(buffer_do[11]), .B(n272), .C(buffer_di[11]), .D(n343), .Y(
        n332) );
  AOI22X1 U146 ( .A(buffer_do[12]), .B(n272), .C(buffer_di[12]), .D(n343), .Y(
        n331) );
  AOI22X1 U147 ( .A(buffer_do[13]), .B(n272), .C(buffer_di[13]), .D(n343), .Y(
        n330) );
  AOI22X1 U148 ( .A(buffer_do[14]), .B(n273), .C(buffer_di[14]), .D(n343), .Y(
        n329) );
  AOI22X1 U149 ( .A(buffer_do[15]), .B(n273), .C(buffer_di[15]), .D(n343), .Y(
        n328) );
  AOI22X1 U150 ( .A(buffer_do[16]), .B(n273), .C(buffer_di[16]), .D(n343), .Y(
        n327) );
  AOI22X1 U151 ( .A(buffer_do[17]), .B(n273), .C(buffer_di[17]), .D(n343), .Y(
        n326) );
  AOI22X1 U152 ( .A(buffer_do[18]), .B(n273), .C(buffer_di[18]), .D(n343), .Y(
        n325) );
  AOI22X1 U153 ( .A(buffer_do[19]), .B(n273), .C(buffer_di[19]), .D(n343), .Y(
        n324) );
  AOI22X1 U154 ( .A(buffer_do[20]), .B(n273), .C(buffer_di[20]), .D(n343), .Y(
        n323) );
  AOI22X1 U155 ( .A(buffer_do[21]), .B(n273), .C(buffer_di[21]), .D(n343), .Y(
        n322) );
  AOI22X1 U156 ( .A(buffer_do[22]), .B(n273), .C(buffer_di[22]), .D(n343), .Y(
        n321) );
  AOI22X1 U157 ( .A(buffer_do[23]), .B(n273), .C(buffer_di[23]), .D(n343), .Y(
        n320) );
  AOI22X1 U158 ( .A(buffer_do[24]), .B(n273), .C(buffer_di[24]), .D(n343), .Y(
        n319) );
  AOI22X1 U159 ( .A(buffer_do[25]), .B(n274), .C(buffer_di[25]), .D(n343), .Y(
        n318) );
  AOI22X1 U160 ( .A(buffer_do[26]), .B(n274), .C(buffer_di[26]), .D(n343), .Y(
        n317) );
  AOI22X1 U161 ( .A(buffer_do[27]), .B(n274), .C(buffer_di[27]), .D(n343), .Y(
        n316) );
  AOI22X1 U162 ( .A(buffer_do[28]), .B(n274), .C(buffer_di[28]), .D(n271), .Y(
        n315) );
  AOI22X1 U163 ( .A(buffer_do[29]), .B(n274), .C(buffer_di[29]), .D(n271), .Y(
        n314) );
  AOI22X1 U164 ( .A(buffer_do[30]), .B(n274), .C(buffer_di[30]), .D(n271), .Y(
        n313) );
  AOI22X1 U165 ( .A(buffer_do[31]), .B(n274), .C(buffer_di[31]), .D(n271), .Y(
        n312) );
  AOI22X1 U166 ( .A(buffer_do[32]), .B(n274), .C(buffer_di[32]), .D(n271), .Y(
        n311) );
  AOI22X1 U167 ( .A(buffer_do[33]), .B(n274), .C(buffer_di[33]), .D(n271), .Y(
        n310) );
  AOI22X1 U168 ( .A(buffer_do[34]), .B(n274), .C(buffer_di[34]), .D(n271), .Y(
        n309) );
  AOI22X1 U169 ( .A(buffer_do[35]), .B(n275), .C(buffer_di[35]), .D(n271), .Y(
        n308) );
  AOI22X1 U170 ( .A(buffer_do[36]), .B(n275), .C(buffer_di[36]), .D(n271), .Y(
        n307) );
  AOI22X1 U171 ( .A(buffer_do[37]), .B(n275), .C(buffer_di[37]), .D(n271), .Y(
        n306) );
  AOI22X1 U172 ( .A(buffer_do[38]), .B(n275), .C(buffer_di[38]), .D(n271), .Y(
        n305) );
  AOI22X1 U173 ( .A(buffer_do[39]), .B(n275), .C(buffer_di[39]), .D(n271), .Y(
        n304) );
  AOI22X1 U174 ( .A(buffer_do[40]), .B(n275), .C(buffer_di[40]), .D(n270), .Y(
        n303) );
  AOI22X1 U175 ( .A(buffer_do[41]), .B(n275), .C(buffer_di[41]), .D(n270), .Y(
        n302) );
  AOI22X1 U176 ( .A(buffer_do[42]), .B(n275), .C(buffer_di[42]), .D(n270), .Y(
        n301) );
  AOI22X1 U177 ( .A(buffer_do[43]), .B(n275), .C(buffer_di[43]), .D(n270), .Y(
        n300) );
  AOI22X1 U178 ( .A(buffer_do[44]), .B(n275), .C(buffer_di[44]), .D(n270), .Y(
        n299) );
  AOI22X1 U179 ( .A(buffer_do[45]), .B(n275), .C(buffer_di[45]), .D(n270), .Y(
        n298) );
  AOI22X1 U180 ( .A(buffer_do[46]), .B(n276), .C(buffer_di[46]), .D(n270), .Y(
        n297) );
  AOI22X1 U181 ( .A(buffer_do[47]), .B(n276), .C(buffer_di[47]), .D(n270), .Y(
        n296) );
  AOI22X1 U182 ( .A(buffer_do[48]), .B(n276), .C(buffer_di[48]), .D(n270), .Y(
        n295) );
  AOI22X1 U183 ( .A(buffer_do[49]), .B(n276), .C(buffer_di[49]), .D(n270), .Y(
        n294) );
  AOI22X1 U184 ( .A(buffer_do[50]), .B(n276), .C(buffer_di[50]), .D(n270), .Y(
        n293) );
  AOI22X1 U185 ( .A(buffer_do[51]), .B(n276), .C(buffer_di[51]), .D(n270), .Y(
        n292) );
  AOI22X1 U186 ( .A(buffer_do[52]), .B(n276), .C(buffer_di[52]), .D(n269), .Y(
        n291) );
  AOI22X1 U187 ( .A(buffer_do[53]), .B(n276), .C(buffer_di[53]), .D(n269), .Y(
        n290) );
  AOI22X1 U188 ( .A(buffer_do[54]), .B(n276), .C(buffer_di[54]), .D(n269), .Y(
        n289) );
  AOI22X1 U189 ( .A(buffer_do[55]), .B(n276), .C(buffer_di[55]), .D(n269), .Y(
        n288) );
  AOI22X1 U190 ( .A(buffer_do[56]), .B(n276), .C(buffer_di[56]), .D(n269), .Y(
        n287) );
  AOI22X1 U191 ( .A(buffer_do[57]), .B(n275), .C(buffer_di[57]), .D(n269), .Y(
        n286) );
  AOI22X1 U192 ( .A(buffer_do[58]), .B(n274), .C(buffer_di[58]), .D(n269), .Y(
        n285) );
  AOI22X1 U193 ( .A(buffer_do[59]), .B(n273), .C(buffer_di[59]), .D(n269), .Y(
        n284) );
  AOI22X1 U194 ( .A(buffer_do[60]), .B(n272), .C(buffer_di[60]), .D(n269), .Y(
        n283) );
  AOI22X1 U195 ( .A(buffer_do[61]), .B(n275), .C(buffer_di[61]), .D(n269), .Y(
        n282) );
  AOI22X1 U196 ( .A(buffer_do[62]), .B(n274), .C(buffer_di[62]), .D(n269), .Y(
        n281) );
  AOI22X1 U197 ( .A(buffer_do[63]), .B(n273), .C(buffer_di[63]), .D(n269), .Y(
        n280) );
  DFFSR data_q_reg_3_ ( .D(n348), .CLK(clk), .R(n277), .S(1'b1), .Q(n475) );
  DFFSR data_q_reg_0_ ( .D(n345), .CLK(clk), .R(n277), .S(1'b1), .Q(n478) );
  DFFSR data_q_reg_56_ ( .D(n401), .CLK(clk), .R(n277), .S(1'b1), .Q(n422) );
  DFFSR data_q_reg_55_ ( .D(n400), .CLK(clk), .R(n277), .S(1'b1), .Q(n423) );
  DFFSR data_q_reg_54_ ( .D(n399), .CLK(clk), .R(n277), .S(1'b1), .Q(n424) );
  DFFSR data_q_reg_53_ ( .D(n398), .CLK(clk), .R(n277), .S(1'b1), .Q(n425) );
  DFFSR data_q_reg_52_ ( .D(n397), .CLK(clk), .R(n277), .S(1'b1), .Q(n426) );
  DFFSR data_q_reg_51_ ( .D(n396), .CLK(clk), .R(n277), .S(1'b1), .Q(n427) );
  DFFSR data_q_reg_50_ ( .D(n395), .CLK(clk), .R(n277), .S(1'b1), .Q(n428) );
  DFFSR data_q_reg_49_ ( .D(n394), .CLK(clk), .R(n277), .S(1'b1), .Q(n429) );
  DFFSR data_q_reg_48_ ( .D(n393), .CLK(clk), .R(n277), .S(1'b1), .Q(n430) );
  DFFSR data_q_reg_47_ ( .D(n392), .CLK(clk), .R(n277), .S(1'b1), .Q(n431) );
  DFFSR data_q_reg_46_ ( .D(n391), .CLK(clk), .R(n277), .S(1'b1), .Q(n432) );
  DFFSR data_q_reg_45_ ( .D(n390), .CLK(clk), .R(n277), .S(1'b1), .Q(n433) );
  DFFSR data_q_reg_44_ ( .D(n389), .CLK(clk), .R(n277), .S(1'b1), .Q(n434) );
  DFFSR data_q_reg_43_ ( .D(n388), .CLK(clk), .R(n277), .S(1'b1), .Q(n435) );
  DFFSR data_q_reg_42_ ( .D(n387), .CLK(clk), .R(n277), .S(1'b1), .Q(n436) );
  DFFSR data_q_reg_41_ ( .D(n386), .CLK(clk), .R(n277), .S(1'b1), .Q(n437) );
  DFFSR data_q_reg_40_ ( .D(n385), .CLK(clk), .R(n277), .S(1'b1), .Q(n438) );
  DFFSR data_q_reg_39_ ( .D(n384), .CLK(clk), .R(n277), .S(1'b1), .Q(n439) );
  DFFSR data_q_reg_38_ ( .D(n383), .CLK(clk), .R(n277), .S(1'b1), .Q(n440) );
  DFFSR data_q_reg_37_ ( .D(n382), .CLK(clk), .R(n277), .S(1'b1), .Q(n441) );
  DFFSR data_q_reg_36_ ( .D(n381), .CLK(clk), .R(n277), .S(1'b1), .Q(n442) );
  DFFSR data_q_reg_35_ ( .D(n380), .CLK(clk), .R(n277), .S(1'b1), .Q(n443) );
  DFFSR data_q_reg_34_ ( .D(n379), .CLK(clk), .R(n277), .S(1'b1), .Q(n444) );
  DFFSR data_q_reg_33_ ( .D(n378), .CLK(clk), .R(n277), .S(1'b1), .Q(n445) );
  DFFSR data_q_reg_32_ ( .D(n377), .CLK(clk), .R(n277), .S(1'b1), .Q(n446) );
  DFFSR data_q_reg_31_ ( .D(n376), .CLK(clk), .R(n277), .S(1'b1), .Q(n447) );
  DFFSR data_q_reg_30_ ( .D(n375), .CLK(clk), .R(n277), .S(1'b1), .Q(n448) );
  DFFSR data_q_reg_29_ ( .D(n374), .CLK(clk), .R(n277), .S(1'b1), .Q(n449) );
  DFFSR data_q_reg_28_ ( .D(n373), .CLK(clk), .R(n277), .S(1'b1), .Q(n450) );
  DFFSR data_q_reg_27_ ( .D(n372), .CLK(clk), .R(n277), .S(1'b1), .Q(n451) );
  DFFSR data_q_reg_26_ ( .D(n371), .CLK(clk), .R(n277), .S(1'b1), .Q(n452) );
  DFFSR data_q_reg_25_ ( .D(n370), .CLK(clk), .R(n277), .S(1'b1), .Q(n453) );
  DFFSR data_q_reg_24_ ( .D(n369), .CLK(clk), .R(n277), .S(1'b1), .Q(n454) );
  DFFSR data_q_reg_23_ ( .D(n368), .CLK(clk), .R(n277), .S(1'b1), .Q(n455) );
  DFFSR data_q_reg_22_ ( .D(n367), .CLK(clk), .R(n277), .S(1'b1), .Q(n456) );
  DFFSR data_q_reg_21_ ( .D(n366), .CLK(clk), .R(n277), .S(1'b1), .Q(n457) );
  DFFSR data_q_reg_20_ ( .D(n365), .CLK(clk), .R(n277), .S(1'b1), .Q(n458) );
  DFFSR data_q_reg_19_ ( .D(n364), .CLK(clk), .R(n277), .S(1'b1), .Q(n459) );
  DFFSR data_q_reg_18_ ( .D(n363), .CLK(clk), .R(n277), .S(1'b1), .Q(n460) );
  DFFSR data_q_reg_17_ ( .D(n362), .CLK(clk), .R(n277), .S(1'b1), .Q(n461) );
  DFFSR data_q_reg_16_ ( .D(n361), .CLK(clk), .R(n277), .S(1'b1), .Q(n462) );
  DFFSR data_q_reg_15_ ( .D(n360), .CLK(clk), .R(n277), .S(1'b1), .Q(n463) );
  DFFSR data_q_reg_14_ ( .D(n359), .CLK(clk), .R(n277), .S(1'b1), .Q(n464) );
  DFFSR data_q_reg_13_ ( .D(n358), .CLK(clk), .R(n277), .S(1'b1), .Q(n465) );
  DFFSR data_q_reg_12_ ( .D(n357), .CLK(clk), .R(n277), .S(1'b1), .Q(n466) );
  DFFSR data_q_reg_11_ ( .D(n356), .CLK(clk), .R(n410), .S(1'b1), .Q(n467) );
  DFFSR data_q_reg_10_ ( .D(n355), .CLK(clk), .R(n410), .S(1'b1), .Q(n468) );
  DFFSR data_q_reg_9_ ( .D(n354), .CLK(clk), .R(n410), .S(1'b1), .Q(n469) );
  DFFSR data_q_reg_8_ ( .D(n353), .CLK(clk), .R(n410), .S(1'b1), .Q(n470) );
  DFFSR data_q_reg_7_ ( .D(n352), .CLK(clk), .R(n410), .S(1'b1), .Q(n471) );
  DFFSR data_q_reg_6_ ( .D(n351), .CLK(clk), .R(n410), .S(1'b1), .Q(n472) );
  DFFSR data_q_reg_5_ ( .D(n350), .CLK(clk), .R(n410), .S(1'b1), .Q(n473) );
  DFFSR data_q_reg_4_ ( .D(n349), .CLK(clk), .R(n410), .S(1'b1), .Q(n474) );
  DFFSR data_q_reg_63_ ( .D(n408), .CLK(clk), .R(n277), .S(1'b1), .Q(n415) );
  DFFSR data_q_reg_62_ ( .D(n407), .CLK(clk), .R(n277), .S(1'b1), .Q(n416) );
  DFFSR data_q_reg_61_ ( .D(n406), .CLK(clk), .R(n277), .S(1'b1), .Q(n417) );
  DFFSR data_q_reg_60_ ( .D(n405), .CLK(clk), .R(n277), .S(1'b1), .Q(n418) );
  DFFSR data_q_reg_59_ ( .D(n404), .CLK(clk), .R(n277), .S(1'b1), .Q(n419) );
  DFFSR data_q_reg_58_ ( .D(n403), .CLK(clk), .R(n277), .S(1'b1), .Q(n420) );
  DFFSR data_q_reg_57_ ( .D(n402), .CLK(clk), .R(n277), .S(1'b1), .Q(n421) );
  AND2X1 U3 ( .A(buffer_so), .B(n4), .Y(n413) );
  AND2X1 U6 ( .A(buffer_si), .B(buffer_ri), .Y(n343) );
  INVX1 U7 ( .A(n343), .Y(n1) );
  AND2X1 U8 ( .A(buffer_ro), .B(buffer_en), .Y(n279) );
  INVX1 U9 ( .A(n279), .Y(n4) );
  AND2X1 U10 ( .A(buffer_ri), .B(n276), .Y(n278) );
  INVX1 U11 ( .A(n278), .Y(n5) );
  INVX1 U12 ( .A(n8), .Y(n6) );
  INVX1 U13 ( .A(n6), .Y(buffer_ri) );
  INVX1 U14 ( .A(n413), .Y(n8) );
  INVX2 U15 ( .A(reset), .Y(n277) );
  BUFX2 U80 ( .A(n424), .Y(buffer_do[54]) );
  BUFX2 U81 ( .A(n426), .Y(buffer_do[52]) );
  BUFX2 U82 ( .A(n415), .Y(buffer_do[63]) );
  BUFX2 U83 ( .A(n418), .Y(buffer_do[60]) );
  BUFX2 U84 ( .A(n419), .Y(buffer_do[59]) );
  BUFX2 U85 ( .A(n420), .Y(buffer_do[58]) );
  BUFX2 U86 ( .A(n421), .Y(buffer_do[57]) );
  BUFX2 U87 ( .A(n422), .Y(buffer_do[56]) );
  BUFX2 U88 ( .A(n431), .Y(buffer_do[47]) );
  BUFX2 U89 ( .A(n432), .Y(buffer_do[46]) );
  BUFX2 U90 ( .A(n433), .Y(buffer_do[45]) );
  BUFX2 U91 ( .A(n434), .Y(buffer_do[44]) );
  BUFX2 U92 ( .A(n435), .Y(buffer_do[43]) );
  BUFX2 U93 ( .A(n436), .Y(buffer_do[42]) );
  BUFX2 U94 ( .A(n437), .Y(buffer_do[41]) );
  BUFX2 U95 ( .A(n438), .Y(buffer_do[40]) );
  BUFX2 U96 ( .A(n439), .Y(buffer_do[39]) );
  BUFX2 U97 ( .A(n440), .Y(buffer_do[38]) );
  BUFX2 U98 ( .A(n441), .Y(buffer_do[37]) );
  BUFX2 U99 ( .A(n442), .Y(buffer_do[36]) );
  BUFX2 U100 ( .A(n443), .Y(buffer_do[35]) );
  BUFX2 U101 ( .A(n444), .Y(buffer_do[34]) );
  BUFX2 U102 ( .A(n445), .Y(buffer_do[33]) );
  BUFX2 U103 ( .A(n446), .Y(buffer_do[32]) );
  BUFX2 U104 ( .A(n447), .Y(buffer_do[31]) );
  BUFX2 U105 ( .A(n448), .Y(buffer_do[30]) );
  BUFX2 U106 ( .A(n449), .Y(buffer_do[29]) );
  BUFX2 U107 ( .A(n450), .Y(buffer_do[28]) );
  BUFX2 U108 ( .A(n451), .Y(buffer_do[27]) );
  BUFX2 U109 ( .A(n452), .Y(buffer_do[26]) );
  BUFX2 U110 ( .A(n453), .Y(buffer_do[25]) );
  BUFX2 U111 ( .A(n454), .Y(buffer_do[24]) );
  BUFX2 U112 ( .A(n455), .Y(buffer_do[23]) );
  BUFX2 U113 ( .A(n456), .Y(buffer_do[22]) );
  BUFX2 U114 ( .A(n457), .Y(buffer_do[21]) );
  BUFX2 U115 ( .A(n458), .Y(buffer_do[20]) );
  BUFX2 U116 ( .A(n459), .Y(buffer_do[19]) );
  BUFX2 U117 ( .A(n460), .Y(buffer_do[18]) );
  BUFX2 U118 ( .A(n461), .Y(buffer_do[17]) );
  BUFX2 U119 ( .A(n462), .Y(buffer_do[16]) );
  BUFX2 U120 ( .A(n463), .Y(buffer_do[15]) );
  BUFX2 U121 ( .A(n464), .Y(buffer_do[14]) );
  BUFX2 U122 ( .A(n465), .Y(buffer_do[13]) );
  BUFX2 U123 ( .A(n466), .Y(buffer_do[12]) );
  BUFX2 U124 ( .A(n467), .Y(buffer_do[11]) );
  BUFX2 U125 ( .A(n468), .Y(buffer_do[10]) );
  BUFX2 U126 ( .A(n469), .Y(buffer_do[9]) );
  BUFX2 U127 ( .A(n470), .Y(buffer_do[8]) );
  BUFX2 U128 ( .A(n471), .Y(buffer_do[7]) );
  BUFX2 U129 ( .A(n472), .Y(buffer_do[6]) );
  BUFX2 U130 ( .A(n473), .Y(buffer_do[5]) );
  BUFX2 U131 ( .A(n474), .Y(buffer_do[4]) );
  BUFX2 U132 ( .A(n475), .Y(buffer_do[3]) );
  BUFX2 U133 ( .A(n476), .Y(buffer_do[2]) );
  BUFX2 U198 ( .A(n477), .Y(buffer_do[1]) );
  BUFX2 U199 ( .A(n478), .Y(buffer_do[0]) );
  BUFX2 U200 ( .A(n427), .Y(buffer_do[51]) );
  BUFX2 U201 ( .A(n423), .Y(buffer_do[55]) );
  BUFX2 U202 ( .A(n425), .Y(buffer_do[53]) );
  BUFX2 U203 ( .A(n414), .Y(buffer_so) );
  BUFX2 U204 ( .A(n417), .Y(buffer_do[61]) );
  BUFX2 U205 ( .A(n429), .Y(buffer_do[49]) );
  BUFX2 U206 ( .A(n430), .Y(buffer_do[48]) );
  BUFX2 U207 ( .A(n428), .Y(buffer_do[50]) );
  BUFX2 U208 ( .A(n416), .Y(buffer_do[62]) );
  INVX1 U209 ( .A(n1), .Y(n271) );
  INVX1 U210 ( .A(n1), .Y(n270) );
  INVX1 U211 ( .A(n1), .Y(n269) );
  INVX1 U212 ( .A(n343), .Y(n272) );
  INVX1 U213 ( .A(n343), .Y(n273) );
  INVX1 U214 ( .A(n343), .Y(n274) );
  INVX1 U215 ( .A(n343), .Y(n275) );
  INVX1 U216 ( .A(n343), .Y(n276) );
  INVX1 U217 ( .A(n294), .Y(n394) );
  INVX1 U218 ( .A(n292), .Y(n396) );
  INVX1 U219 ( .A(n289), .Y(n399) );
  INVX1 U220 ( .A(n288), .Y(n400) );
  INVX1 U221 ( .A(n291), .Y(n397) );
  INVX1 U222 ( .A(n293), .Y(n395) );
  INVX1 U223 ( .A(n295), .Y(n393) );
  INVX1 U224 ( .A(n290), .Y(n398) );
  INVX1 U225 ( .A(n344), .Y(n345) );
  INVX1 U226 ( .A(n340), .Y(n348) );
  INVX1 U227 ( .A(n339), .Y(n349) );
  INVX1 U228 ( .A(n338), .Y(n350) );
  INVX1 U229 ( .A(n337), .Y(n351) );
  INVX1 U230 ( .A(n336), .Y(n352) );
  INVX1 U231 ( .A(n335), .Y(n353) );
  INVX1 U232 ( .A(n334), .Y(n354) );
  INVX1 U233 ( .A(n333), .Y(n355) );
  INVX1 U234 ( .A(n332), .Y(n356) );
  INVX1 U235 ( .A(n331), .Y(n357) );
  INVX1 U236 ( .A(n330), .Y(n358) );
  INVX1 U237 ( .A(n329), .Y(n359) );
  INVX1 U238 ( .A(n328), .Y(n360) );
  INVX1 U239 ( .A(n327), .Y(n361) );
  INVX1 U240 ( .A(n326), .Y(n362) );
  INVX1 U241 ( .A(n325), .Y(n363) );
  INVX1 U242 ( .A(n324), .Y(n364) );
  INVX1 U243 ( .A(n323), .Y(n365) );
  INVX1 U244 ( .A(n322), .Y(n366) );
  INVX1 U245 ( .A(n321), .Y(n367) );
  INVX1 U246 ( .A(n320), .Y(n368) );
  INVX1 U247 ( .A(n319), .Y(n369) );
  INVX1 U248 ( .A(n318), .Y(n370) );
  INVX1 U249 ( .A(n317), .Y(n371) );
  INVX1 U250 ( .A(n316), .Y(n372) );
  INVX1 U251 ( .A(n315), .Y(n373) );
  INVX1 U252 ( .A(n314), .Y(n374) );
  INVX1 U253 ( .A(n313), .Y(n375) );
  INVX1 U254 ( .A(n312), .Y(n376) );
  INVX1 U255 ( .A(n311), .Y(n377) );
  INVX1 U256 ( .A(n310), .Y(n378) );
  INVX1 U257 ( .A(n309), .Y(n379) );
  INVX1 U258 ( .A(n308), .Y(n380) );
  INVX1 U259 ( .A(n307), .Y(n381) );
  INVX1 U260 ( .A(n306), .Y(n382) );
  INVX1 U261 ( .A(n305), .Y(n383) );
  INVX1 U262 ( .A(n304), .Y(n384) );
  INVX1 U263 ( .A(n303), .Y(n385) );
  INVX1 U264 ( .A(n302), .Y(n386) );
  INVX1 U265 ( .A(n301), .Y(n387) );
  INVX1 U266 ( .A(n300), .Y(n388) );
  INVX1 U267 ( .A(n299), .Y(n389) );
  INVX1 U268 ( .A(n298), .Y(n390) );
  INVX1 U269 ( .A(n297), .Y(n391) );
  INVX1 U270 ( .A(n296), .Y(n392) );
  INVX1 U271 ( .A(n287), .Y(n401) );
  INVX1 U272 ( .A(n342), .Y(n346) );
  INVX1 U273 ( .A(n341), .Y(n347) );
  INVX1 U274 ( .A(n286), .Y(n402) );
  INVX1 U275 ( .A(n285), .Y(n403) );
  INVX1 U276 ( .A(n284), .Y(n404) );
  INVX1 U277 ( .A(n283), .Y(n405) );
  INVX1 U278 ( .A(n280), .Y(n408) );
  INVX1 U279 ( .A(n282), .Y(n406) );
  INVX1 U280 ( .A(n281), .Y(n407) );
endmodule


module input_controller_IDX_W2_IDX_E3_IDX_S1_IDX_U0 ( clk, reset, polarity, 
        upstream_si, upstream_di, upstream_ri, out_ready0, out_ready1, 
        out_ready2, out_ready3, out_valid0, out_valid1, out_valid2, out_valid3, 
        out_data0, out_data1, out_data2, out_data3 );
  input [63:0] upstream_di;
  output [63:0] out_data0;
  output [63:0] out_data1;
  output [63:0] out_data2;
  output [63:0] out_data3;
  input clk, reset, polarity, upstream_si, out_ready0, out_ready1, out_ready2,
         out_ready3;
  output upstream_ri, out_valid0, out_valid1, out_valid2, out_valid3;
  wire   n9, ib_so, n44, n12, n10, n13, n25, n7, n33, n14, n34, n8, n35, n5,
         n4, n1, n16, n36, n6, n24, n42, n3, n31, n22, n26, n23, n30, n27, n29,
         n2, chosen_ready, n45, n39, n40, n37, n38, n41, n21, n17, n28, n32,
         n15, n18, n20, n19, n11;
  wire   [55:48] ib_do;
  assign out_data1[63] = out_data3[63];
  assign out_data2[63] = out_data3[63];
  assign out_data0[63] = out_data3[63];
  assign out_data1[62] = out_data3[62];
  assign out_data2[62] = out_data3[62];
  assign out_data0[62] = out_data3[62];
  assign out_data1[61] = out_data3[61];
  assign out_data2[61] = out_data3[61];
  assign out_data0[61] = out_data3[61];
  assign out_data1[60] = out_data3[60];
  assign out_data2[60] = out_data3[60];
  assign out_data0[60] = out_data3[60];
  assign out_data1[59] = out_data3[59];
  assign out_data2[59] = out_data3[59];
  assign out_data0[59] = out_data3[59];
  assign out_data1[58] = out_data3[58];
  assign out_data2[58] = out_data3[58];
  assign out_data0[58] = out_data3[58];
  assign out_data1[57] = out_data3[57];
  assign out_data2[57] = out_data3[57];
  assign out_data0[57] = out_data3[57];
  assign out_data1[56] = out_data3[56];
  assign out_data2[56] = out_data3[56];
  assign out_data0[56] = out_data3[56];
  assign out_data1[55] = out_data3[55];
  assign out_data2[55] = out_data3[55];
  assign out_data0[55] = out_data3[55];
  assign out_data1[54] = out_data3[54];
  assign out_data2[54] = out_data3[54];
  assign out_data0[54] = out_data3[54];
  assign out_data1[53] = out_data3[53];
  assign out_data2[53] = out_data3[53];
  assign out_data0[53] = out_data3[53];
  assign out_data1[52] = out_data3[52];
  assign out_data2[52] = out_data3[52];
  assign out_data0[52] = out_data3[52];
  assign out_data1[51] = out_data3[51];
  assign out_data2[51] = out_data3[51];
  assign out_data0[51] = out_data3[51];
  assign out_data1[50] = out_data3[50];
  assign out_data2[50] = out_data3[50];
  assign out_data0[50] = out_data3[50];
  assign out_data1[49] = out_data3[49];
  assign out_data2[49] = out_data3[49];
  assign out_data0[49] = out_data3[49];
  assign out_data1[48] = out_data3[48];
  assign out_data2[48] = out_data3[48];
  assign out_data0[48] = out_data3[48];
  assign out_data1[47] = out_data3[47];
  assign out_data2[47] = out_data3[47];
  assign out_data0[47] = out_data3[47];
  assign out_data1[46] = out_data3[46];
  assign out_data2[46] = out_data3[46];
  assign out_data0[46] = out_data3[46];
  assign out_data1[45] = out_data3[45];
  assign out_data2[45] = out_data3[45];
  assign out_data0[45] = out_data3[45];
  assign out_data1[44] = out_data3[44];
  assign out_data2[44] = out_data3[44];
  assign out_data0[44] = out_data3[44];
  assign out_data1[43] = out_data3[43];
  assign out_data2[43] = out_data3[43];
  assign out_data0[43] = out_data3[43];
  assign out_data1[42] = out_data3[42];
  assign out_data2[42] = out_data3[42];
  assign out_data0[42] = out_data3[42];
  assign out_data1[41] = out_data3[41];
  assign out_data2[41] = out_data3[41];
  assign out_data0[41] = out_data3[41];
  assign out_data1[40] = out_data3[40];
  assign out_data2[40] = out_data3[40];
  assign out_data0[40] = out_data3[40];
  assign out_data1[39] = out_data3[39];
  assign out_data2[39] = out_data3[39];
  assign out_data0[39] = out_data3[39];
  assign out_data1[38] = out_data3[38];
  assign out_data2[38] = out_data3[38];
  assign out_data0[38] = out_data3[38];
  assign out_data1[37] = out_data3[37];
  assign out_data2[37] = out_data3[37];
  assign out_data0[37] = out_data3[37];
  assign out_data1[36] = out_data3[36];
  assign out_data2[36] = out_data3[36];
  assign out_data0[36] = out_data3[36];
  assign out_data1[35] = out_data3[35];
  assign out_data2[35] = out_data3[35];
  assign out_data0[35] = out_data3[35];
  assign out_data1[34] = out_data3[34];
  assign out_data2[34] = out_data3[34];
  assign out_data0[34] = out_data3[34];
  assign out_data1[33] = out_data3[33];
  assign out_data2[33] = out_data3[33];
  assign out_data0[33] = out_data3[33];
  assign out_data1[32] = out_data3[32];
  assign out_data2[32] = out_data3[32];
  assign out_data0[32] = out_data3[32];
  assign out_data1[31] = out_data3[31];
  assign out_data2[31] = out_data3[31];
  assign out_data0[31] = out_data3[31];
  assign out_data1[30] = out_data3[30];
  assign out_data2[30] = out_data3[30];
  assign out_data0[30] = out_data3[30];
  assign out_data1[29] = out_data3[29];
  assign out_data2[29] = out_data3[29];
  assign out_data0[29] = out_data3[29];
  assign out_data1[28] = out_data3[28];
  assign out_data2[28] = out_data3[28];
  assign out_data0[28] = out_data3[28];
  assign out_data1[27] = out_data3[27];
  assign out_data2[27] = out_data3[27];
  assign out_data0[27] = out_data3[27];
  assign out_data1[26] = out_data3[26];
  assign out_data2[26] = out_data3[26];
  assign out_data0[26] = out_data3[26];
  assign out_data1[25] = out_data3[25];
  assign out_data2[25] = out_data3[25];
  assign out_data0[25] = out_data3[25];
  assign out_data1[24] = out_data3[24];
  assign out_data2[24] = out_data3[24];
  assign out_data0[24] = out_data3[24];
  assign out_data1[23] = out_data3[23];
  assign out_data2[23] = out_data3[23];
  assign out_data0[23] = out_data3[23];
  assign out_data1[22] = out_data3[22];
  assign out_data2[22] = out_data3[22];
  assign out_data0[22] = out_data3[22];
  assign out_data1[21] = out_data3[21];
  assign out_data2[21] = out_data3[21];
  assign out_data0[21] = out_data3[21];
  assign out_data1[20] = out_data3[20];
  assign out_data2[20] = out_data3[20];
  assign out_data0[20] = out_data3[20];
  assign out_data1[19] = out_data3[19];
  assign out_data2[19] = out_data3[19];
  assign out_data0[19] = out_data3[19];
  assign out_data1[18] = out_data3[18];
  assign out_data2[18] = out_data3[18];
  assign out_data0[18] = out_data3[18];
  assign out_data1[17] = out_data3[17];
  assign out_data2[17] = out_data3[17];
  assign out_data0[17] = out_data3[17];
  assign out_data1[16] = out_data3[16];
  assign out_data2[16] = out_data3[16];
  assign out_data0[16] = out_data3[16];
  assign out_data1[15] = out_data3[15];
  assign out_data2[15] = out_data3[15];
  assign out_data0[15] = out_data3[15];
  assign out_data1[14] = out_data3[14];
  assign out_data2[14] = out_data3[14];
  assign out_data0[14] = out_data3[14];
  assign out_data1[13] = out_data3[13];
  assign out_data2[13] = out_data3[13];
  assign out_data0[13] = out_data3[13];
  assign out_data1[12] = out_data3[12];
  assign out_data2[12] = out_data3[12];
  assign out_data0[12] = out_data3[12];
  assign out_data1[11] = out_data3[11];
  assign out_data2[11] = out_data3[11];
  assign out_data0[11] = out_data3[11];
  assign out_data1[10] = out_data3[10];
  assign out_data2[10] = out_data3[10];
  assign out_data0[10] = out_data3[10];
  assign out_data1[9] = out_data3[9];
  assign out_data2[9] = out_data3[9];
  assign out_data0[9] = out_data3[9];
  assign out_data1[8] = out_data3[8];
  assign out_data2[8] = out_data3[8];
  assign out_data0[8] = out_data3[8];
  assign out_data1[7] = out_data3[7];
  assign out_data2[7] = out_data3[7];
  assign out_data0[7] = out_data3[7];
  assign out_data1[6] = out_data3[6];
  assign out_data2[6] = out_data3[6];
  assign out_data0[6] = out_data3[6];
  assign out_data1[5] = out_data3[5];
  assign out_data2[5] = out_data3[5];
  assign out_data0[5] = out_data3[5];
  assign out_data1[4] = out_data3[4];
  assign out_data2[4] = out_data3[4];
  assign out_data0[4] = out_data3[4];
  assign out_data1[3] = out_data3[3];
  assign out_data2[3] = out_data3[3];
  assign out_data0[3] = out_data3[3];
  assign out_data1[2] = out_data3[2];
  assign out_data2[2] = out_data3[2];
  assign out_data0[2] = out_data3[2];
  assign out_data1[1] = out_data3[1];
  assign out_data2[1] = out_data3[1];
  assign out_data0[1] = out_data3[1];
  assign out_data1[0] = out_data3[0];
  assign out_data2[0] = out_data3[0];
  assign out_data0[0] = out_data3[0];

  buffer_0 INBUF ( .clk(clk), .reset(reset), .buffer_en(n9), .buffer_di(
        upstream_di), .buffer_si(upstream_si), .buffer_ri(upstream_ri), 
        .buffer_ro(1'b1), .buffer_so(ib_so), .buffer_do({out_data3[63:56], 
        ib_do, out_data3[47:0]}) );
  OAI21X1 U15 ( .A(n44), .B(n12), .C(ib_do[55]), .Y(n10) );
  OAI21X1 U16 ( .A(n12), .B(n44), .C(n13), .Y(out_data3[54]) );
  OAI21X1 U17 ( .A(ib_do[53]), .B(n44), .C(ib_do[54]), .Y(n13) );
  XNOR2X1 U18 ( .A(ib_do[53]), .B(n44), .Y(out_data3[53]) );
  OAI21X1 U19 ( .A(n25), .B(n7), .C(n44), .Y(out_data3[52]) );
  OAI21X1 U21 ( .A(n33), .B(ib_do[50]), .C(ib_do[51]), .Y(n14) );
  OAI21X1 U22 ( .A(ib_do[50]), .B(n34), .C(n8), .Y(out_data3[50]) );
  OAI21X1 U25 ( .A(n35), .B(n5), .C(n34), .Y(out_data3[49]) );
  NAND3X1 U26 ( .A(n4), .B(n5), .C(n1), .Y(n16) );
  OAI21X1 U28 ( .A(ib_do[48]), .B(n36), .C(n6), .Y(out_data3[48]) );
  AOI22X1 U32 ( .A(out_ready3), .B(out_valid3), .C(out_ready0), .D(out_valid0), 
        .Y(n24) );
  OAI21X1 U34 ( .A(out_data3[62]), .B(n42), .C(n3), .Y(out_valid3) );
  NAND3X1 U35 ( .A(n31), .B(ib_so), .C(n22), .Y(n26) );
  AOI22X1 U36 ( .A(out_ready1), .B(out_valid1), .C(out_ready2), .D(out_valid2), 
        .Y(n23) );
  NOR3X1 U39 ( .A(ib_do[52]), .B(ib_do[55]), .C(n12), .Y(n22) );
  NAND3X1 U40 ( .A(n4), .B(n5), .C(n30), .Y(n27) );
  AND2X1 U3 ( .A(n29), .B(n2), .Y(chosen_ready) );
  OR2X1 U4 ( .A(ib_do[54]), .B(ib_do[53]), .Y(n12) );
  AND2X1 U5 ( .A(out_data3[61]), .B(n1), .Y(out_valid1) );
  AND2X1 U6 ( .A(out_data3[62]), .B(n25), .Y(out_valid2) );
  OR2X1 U7 ( .A(n36), .B(out_data3[61]), .Y(n45) );
  OR2X1 U8 ( .A(n39), .B(n40), .Y(n37) );
  INVX1 U9 ( .A(n37), .Y(n1) );
  OR2X1 U10 ( .A(n38), .B(n31), .Y(n40) );
  BUFX2 U11 ( .A(n24), .Y(n2) );
  BUFX2 U12 ( .A(n26), .Y(n3) );
  AND2X1 U13 ( .A(ib_do[48]), .B(n41), .Y(n21) );
  INVX1 U14 ( .A(n21), .Y(n6) );
  AND2X1 U20 ( .A(ib_do[50]), .B(n33), .Y(n17) );
  INVX1 U23 ( .A(n17), .Y(n8) );
  INVX1 U24 ( .A(chosen_ready), .Y(n9) );
  BUFX2 U27 ( .A(n23), .Y(n29) );
  OR2X1 U29 ( .A(ib_do[51]), .B(ib_do[50]), .Y(n28) );
  INVX1 U30 ( .A(n28), .Y(n30) );
  INVX1 U31 ( .A(n32), .Y(n31) );
  BUFX2 U33 ( .A(n27), .Y(n32) );
  AND2X1 U37 ( .A(n35), .B(n5), .Y(n15) );
  INVX1 U38 ( .A(n15), .Y(n33) );
  BUFX2 U41 ( .A(n16), .Y(n34) );
  OR2X1 U42 ( .A(n41), .B(ib_do[48]), .Y(n18) );
  INVX1 U43 ( .A(n18), .Y(n35) );
  BUFX2 U44 ( .A(n20), .Y(n36) );
  INVX1 U45 ( .A(n1), .Y(n20) );
  INVX1 U46 ( .A(n22), .Y(n38) );
  INVX1 U47 ( .A(ib_so), .Y(n39) );
  AND2X1 U48 ( .A(n22), .B(ib_so), .Y(n19) );
  INVX1 U49 ( .A(n19), .Y(n41) );
  AND2X1 U50 ( .A(ib_so), .B(n38), .Y(n25) );
  INVX1 U51 ( .A(n25), .Y(n42) );
  INVX1 U52 ( .A(n45), .Y(out_valid0) );
  AND2X1 U53 ( .A(n25), .B(n7), .Y(n11) );
  INVX1 U54 ( .A(n11), .Y(n44) );
  INVX1 U55 ( .A(ib_do[48]), .Y(n4) );
  INVX1 U56 ( .A(ib_do[49]), .Y(n5) );
  INVX1 U57 ( .A(n14), .Y(out_data3[51]) );
  INVX1 U58 ( .A(n10), .Y(out_data3[55]) );
  INVX1 U59 ( .A(ib_do[52]), .Y(n7) );
endmodule


module cardinal_router ( clk, reset, up_si, down_si, left_si, right_si, NIC_si, 
        up_di, down_di, left_di, right_di, NIC_di, up_ri, down_ri, left_ri, 
        right_ri, NIC_ri, up_so, down_so, left_so, right_so, NIC_so, up_do, 
        down_do, left_do, right_do, NIC_do, up_ro, down_ro, left_ro, right_ro, 
        NIC_ro, polarity_to_NIC );
  input [63:0] up_di;
  input [63:0] down_di;
  input [63:0] left_di;
  input [63:0] right_di;
  input [63:0] NIC_di;
  output [63:0] up_do;
  output [63:0] down_do;
  output [63:0] left_do;
  output [63:0] right_do;
  output [63:0] NIC_do;
  input clk, reset, up_si, down_si, left_si, right_si, NIC_si, up_ro, down_ro,
         left_ro, right_ro, NIC_ro;
  output up_ri, down_ri, left_ri, right_ri, NIC_ri, up_so, down_so, left_so,
         right_so, NIC_so, polarity_to_NIC;
  wire   L2U_si, L2U_ri, R2U_si, R2U_ri, D2U_si, D2U_ri, N2U_si, N2U_ri,
         L2D_si, L2D_ri, R2D_si, R2D_ri, U2D_si, U2D_ri, N2D_si, N2D_ri,
         U2L_si, U2L_ri, D2L_si, D2L_ri, R2L_si, R2L_ri, N2L_si, N2L_ri,
         U2R_si, U2R_ri, D2R_si, D2R_ri, L2R_si, L2R_ri, N2R_si, N2R_ri,
         U2N_si, U2N_ri, D2N_si, D2N_ri, L2N_si, L2N_ri, R2N_si, R2N_ri, n1,
         N5;
  wire   [63:0] L2U_di;
  wire   [63:0] R2U_di;
  wire   [63:0] D2U_di;
  wire   [63:0] N2U_di;
  wire   [63:0] L2D_di;
  wire   [63:0] R2D_di;
  wire   [63:0] U2D_di;
  wire   [63:0] N2D_di;
  wire   [63:0] U2L_di;
  wire   [63:0] D2L_di;
  wire   [63:0] R2L_di;
  wire   [63:0] N2L_di;
  wire   [63:0] U2R_di;
  wire   [63:0] D2R_di;
  wire   [63:0] L2R_di;
  wire   [63:0] N2R_di;
  wire   [63:0] U2N_di;
  wire   [63:0] D2N_di;
  wire   [63:0] L2N_di;
  wire   [63:0] R2N_di;

  output_controller_4in_4 OC_UP ( .clk(clk), .reset(reset), .polarity(
        polarity_to_NIC), .output_so(up_so), .output_do(up_do), .output_ro(
        up_ro), .in0_si(L2U_si), .in0_di(L2U_di), .in0_ri(L2U_ri), .in1_si(
        R2U_si), .in1_di(R2U_di), .in1_ri(R2U_ri), .in2_si(D2U_si), .in2_di(
        D2U_di), .in2_ri(D2U_ri), .in3_si(N2U_si), .in3_di(N2U_di), .in3_ri(
        N2U_ri) );
  output_controller_4in_3 OC_DOWN ( .clk(clk), .reset(reset), .polarity(
        polarity_to_NIC), .output_so(down_so), .output_do(down_do), 
        .output_ro(down_ro), .in0_si(L2D_si), .in0_di(L2D_di), .in0_ri(L2D_ri), 
        .in1_si(R2D_si), .in1_di(R2D_di), .in1_ri(R2D_ri), .in2_si(U2D_si), 
        .in2_di(U2D_di), .in2_ri(U2D_ri), .in3_si(N2D_si), .in3_di(N2D_di), 
        .in3_ri(N2D_ri) );
  output_controller_4in_2 OC_LEFT ( .clk(clk), .reset(reset), .polarity(
        polarity_to_NIC), .output_so(left_so), .output_do(left_do), 
        .output_ro(left_ro), .in0_si(U2L_si), .in0_di(U2L_di), .in0_ri(U2L_ri), 
        .in1_si(D2L_si), .in1_di(D2L_di), .in1_ri(D2L_ri), .in2_si(R2L_si), 
        .in2_di(R2L_di), .in2_ri(R2L_ri), .in3_si(N2L_si), .in3_di(N2L_di), 
        .in3_ri(N2L_ri) );
  output_controller_4in_1 OC_RIGHT ( .clk(clk), .reset(reset), .polarity(
        polarity_to_NIC), .output_so(right_so), .output_do(right_do), 
        .output_ro(right_ro), .in0_si(U2R_si), .in0_di(U2R_di), .in0_ri(U2R_ri), .in1_si(D2R_si), .in1_di(D2R_di), .in1_ri(D2R_ri), .in2_si(L2R_si), .in2_di(
        L2R_di), .in2_ri(L2R_ri), .in3_si(N2R_si), .in3_di(N2R_di), .in3_ri(
        N2R_ri) );
  output_controller_4in_0 OC_NIC ( .clk(clk), .reset(reset), .polarity(
        polarity_to_NIC), .output_so(NIC_so), .output_do(NIC_do), .output_ro(
        NIC_ro), .in0_si(U2N_si), .in0_di(U2N_di), .in0_ri(U2N_ri), .in1_si(
        D2N_si), .in1_di(D2N_di), .in1_ri(D2N_ri), .in2_si(L2N_si), .in2_di(
        L2N_di), .in2_ri(L2N_ri), .in3_si(R2N_si), .in3_di(R2N_di), .in3_ri(
        R2N_ri) );
  input_controller_IDX_W0_IDX_E1_IDX_S2_IDX_NIC3 IC_UP ( .clk(clk), .reset(
        reset), .polarity(polarity_to_NIC), .upstream_si(up_si), .upstream_di(
        up_di), .upstream_ri(up_ri), .out_ready0(U2L_ri), .out_ready1(U2R_ri), 
        .out_ready2(U2D_ri), .out_ready3(U2N_ri), .out_valid0(U2L_si), 
        .out_valid1(U2R_si), .out_valid2(U2D_si), .out_valid3(U2N_si), 
        .out_data0(U2L_di), .out_data1(U2R_di), .out_data2(U2D_di), 
        .out_data3(U2N_di) );
  input_controller_IDX_W0_IDX_E1_IDX_NIC3_IDX_U2 IC_DOWN ( .clk(clk), .reset(
        reset), .polarity(polarity_to_NIC), .upstream_si(down_si), 
        .upstream_di(down_di), .upstream_ri(down_ri), .out_ready0(D2L_ri), 
        .out_ready1(D2R_ri), .out_ready2(D2U_ri), .out_ready3(D2N_ri), 
        .out_valid0(D2L_si), .out_valid1(D2R_si), .out_valid2(D2U_si), 
        .out_valid3(D2N_si), .out_data0(D2L_di), .out_data1(D2R_di), 
        .out_data2(D2U_di), .out_data3(D2N_di) );
  input_controller_IDX_E2_IDX_S1_IDX_NIC3_IDX_U0 IC_LEFT ( .clk(clk), .reset(
        reset), .polarity(polarity_to_NIC), .upstream_si(left_si), 
        .upstream_di(left_di), .upstream_ri(left_ri), .out_ready0(L2U_ri), 
        .out_ready1(L2D_ri), .out_ready2(L2R_ri), .out_ready3(L2N_ri), 
        .out_valid0(L2U_si), .out_valid1(L2D_si), .out_valid2(L2R_si), 
        .out_valid3(L2N_si), .out_data0(L2U_di), .out_data1(L2D_di), 
        .out_data2(L2R_di), .out_data3(L2N_di) );
  input_controller_IDX_W2_IDX_S1_IDX_NIC3_IDX_U0 IC_RIGHT ( .clk(clk), .reset(
        reset), .polarity(polarity_to_NIC), .upstream_si(right_si), 
        .upstream_di(right_di), .upstream_ri(right_ri), .out_ready0(R2U_ri), 
        .out_ready1(R2D_ri), .out_ready2(R2L_ri), .out_ready3(R2N_ri), 
        .out_valid0(R2U_si), .out_valid1(R2D_si), .out_valid2(R2L_si), 
        .out_valid3(R2N_si), .out_data0(R2U_di), .out_data1(R2D_di), 
        .out_data2(R2L_di), .out_data3(R2N_di) );
  input_controller_IDX_W2_IDX_E3_IDX_S1_IDX_U0 IC_NIC ( .clk(clk), .reset(
        reset), .polarity(polarity_to_NIC), .upstream_si(NIC_si), 
        .upstream_di(NIC_di), .upstream_ri(NIC_ri), .out_ready0(N2U_ri), 
        .out_ready1(N2D_ri), .out_ready2(N2L_ri), .out_ready3(N2R_ri), 
        .out_valid0(N2U_si), .out_valid1(N2D_si), .out_valid2(N2L_si), 
        .out_valid3(N2R_si), .out_data0(N2U_di), .out_data1(N2D_di), 
        .out_data2(N2L_di), .out_data3(N2R_di) );
  DFFPOSX1 polarity_reg ( .D(n1), .CLK(clk), .Q(polarity_to_NIC) );
  OR2X1 U4 ( .A(reset), .B(polarity_to_NIC), .Y(N5) );
  INVX1 U5 ( .A(N5), .Y(n1) );
endmodule


module cardinal_mesh ( clk, reset, node00_pesi, node00_pero, node00_pedi, 
        node00_peri, node00_peso, node00_pedo, node00_polarity, node01_pesi, 
        node01_pero, node01_pedi, node01_peri, node01_peso, node01_pedo, 
        node01_polarity, node02_pesi, node02_pero, node02_pedi, node02_peri, 
        node02_peso, node02_pedo, node02_polarity, node03_pesi, node03_pero, 
        node03_pedi, node03_peri, node03_peso, node03_pedo, node03_polarity, 
        node10_pesi, node10_pero, node10_pedi, node10_peri, node10_peso, 
        node10_pedo, node10_polarity, node11_pesi, node11_pero, node11_pedi, 
        node11_peri, node11_peso, node11_pedo, node11_polarity, node12_pesi, 
        node12_pero, node12_pedi, node12_peri, node12_peso, node12_pedo, 
        node12_polarity, node13_pesi, node13_pero, node13_pedi, node13_peri, 
        node13_peso, node13_pedo, node13_polarity, node20_pesi, node20_pero, 
        node20_pedi, node20_peri, node20_peso, node20_pedo, node20_polarity, 
        node21_pesi, node21_pero, node21_pedi, node21_peri, node21_peso, 
        node21_pedo, node21_polarity, node22_pesi, node22_pero, node22_pedi, 
        node22_peri, node22_peso, node22_pedo, node22_polarity, node23_pesi, 
        node23_pero, node23_pedi, node23_peri, node23_peso, node23_pedo, 
        node23_polarity, node30_pesi, node30_pero, node30_pedi, node30_peri, 
        node30_peso, node30_pedo, node30_polarity, node31_pesi, node31_pero, 
        node31_pedi, node31_peri, node31_peso, node31_pedo, node31_polarity, 
        node32_pesi, node32_pero, node32_pedi, node32_peri, node32_peso, 
        node32_pedo, node32_polarity, node33_pesi, node33_pero, node33_pedi, 
        node33_peri, node33_peso, node33_pedo, node33_polarity );
  input [63:0] node00_pedi;
  output [63:0] node00_pedo;
  input [63:0] node01_pedi;
  output [63:0] node01_pedo;
  input [63:0] node02_pedi;
  output [63:0] node02_pedo;
  input [63:0] node03_pedi;
  output [63:0] node03_pedo;
  input [63:0] node10_pedi;
  output [63:0] node10_pedo;
  input [63:0] node11_pedi;
  output [63:0] node11_pedo;
  input [63:0] node12_pedi;
  output [63:0] node12_pedo;
  input [63:0] node13_pedi;
  output [63:0] node13_pedo;
  input [63:0] node20_pedi;
  output [63:0] node20_pedo;
  input [63:0] node21_pedi;
  output [63:0] node21_pedo;
  input [63:0] node22_pedi;
  output [63:0] node22_pedo;
  input [63:0] node23_pedi;
  output [63:0] node23_pedo;
  input [63:0] node30_pedi;
  output [63:0] node30_pedo;
  input [63:0] node31_pedi;
  output [63:0] node31_pedo;
  input [63:0] node32_pedi;
  output [63:0] node32_pedo;
  input [63:0] node33_pedi;
  output [63:0] node33_pedo;
  input clk, reset, node00_pesi, node00_pero, node01_pesi, node01_pero,
         node02_pesi, node02_pero, node03_pesi, node03_pero, node10_pesi,
         node10_pero, node11_pesi, node11_pero, node12_pesi, node12_pero,
         node13_pesi, node13_pero, node20_pesi, node20_pero, node21_pesi,
         node21_pero, node22_pesi, node22_pero, node23_pesi, node23_pero,
         node30_pesi, node30_pero, node31_pesi, node31_pero, node32_pesi,
         node32_pero, node33_pesi, node33_pero;
  output node00_peri, node00_peso, node00_polarity, node01_peri, node01_peso,
         node01_polarity, node02_peri, node02_peso, node02_polarity,
         node03_peri, node03_peso, node03_polarity, node10_peri, node10_peso,
         node10_polarity, node11_peri, node11_peso, node11_polarity,
         node12_peri, node12_peso, node12_polarity, node13_peri, node13_peso,
         node13_polarity, node20_peri, node20_peso, node20_polarity,
         node21_peri, node21_peso, node21_polarity, node22_peri, node22_peso,
         node22_polarity, node23_peri, node23_peso, node23_polarity,
         node30_peri, node30_peso, node30_polarity, node31_peri, node31_peso,
         node31_polarity, node32_peri, node32_peso, node32_polarity,
         node33_peri, node33_peso, node33_polarity;
  wire   up_di_0__63_, up_di_0__62_, up_di_0__61_, up_di_0__60_, up_di_0__59_,
         up_di_0__58_, up_di_0__57_, up_di_0__56_, up_di_0__55_, up_di_0__54_,
         up_di_0__53_, up_di_0__52_, up_di_0__51_, up_di_0__50_, up_di_0__49_,
         up_di_0__48_, up_di_0__47_, up_di_0__46_, up_di_0__45_, up_di_0__44_,
         up_di_0__43_, up_di_0__42_, up_di_0__41_, up_di_0__40_, up_di_0__39_,
         up_di_0__38_, up_di_0__37_, up_di_0__36_, up_di_0__35_, up_di_0__34_,
         up_di_0__33_, up_di_0__32_, up_di_0__31_, up_di_0__30_, up_di_0__29_,
         up_di_0__28_, up_di_0__27_, up_di_0__26_, up_di_0__25_, up_di_0__24_,
         up_di_0__23_, up_di_0__22_, up_di_0__21_, up_di_0__20_, up_di_0__19_,
         up_di_0__18_, up_di_0__17_, up_di_0__16_, up_di_0__15_, up_di_0__14_,
         up_di_0__13_, up_di_0__12_, up_di_0__11_, up_di_0__10_, up_di_0__9_,
         up_di_0__8_, up_di_0__7_, up_di_0__6_, up_di_0__5_, up_di_0__4_,
         up_di_0__3_, up_di_0__2_, up_di_0__1_, up_di_0__0_, up_di_1__63_,
         up_di_1__62_, up_di_1__61_, up_di_1__60_, up_di_1__59_, up_di_1__58_,
         up_di_1__57_, up_di_1__56_, up_di_1__55_, up_di_1__54_, up_di_1__53_,
         up_di_1__52_, up_di_1__51_, up_di_1__50_, up_di_1__49_, up_di_1__48_,
         up_di_1__47_, up_di_1__46_, up_di_1__45_, up_di_1__44_, up_di_1__43_,
         up_di_1__42_, up_di_1__41_, up_di_1__40_, up_di_1__39_, up_di_1__38_,
         up_di_1__37_, up_di_1__36_, up_di_1__35_, up_di_1__34_, up_di_1__33_,
         up_di_1__32_, up_di_1__31_, up_di_1__30_, up_di_1__29_, up_di_1__28_,
         up_di_1__27_, up_di_1__26_, up_di_1__25_, up_di_1__24_, up_di_1__23_,
         up_di_1__22_, up_di_1__21_, up_di_1__20_, up_di_1__19_, up_di_1__18_,
         up_di_1__17_, up_di_1__16_, up_di_1__15_, up_di_1__14_, up_di_1__13_,
         up_di_1__12_, up_di_1__11_, up_di_1__10_, up_di_1__9_, up_di_1__8_,
         up_di_1__7_, up_di_1__6_, up_di_1__5_, up_di_1__4_, up_di_1__3_,
         up_di_1__2_, up_di_1__1_, up_di_1__0_, up_di_2__63_, up_di_2__62_,
         up_di_2__61_, up_di_2__60_, up_di_2__59_, up_di_2__58_, up_di_2__57_,
         up_di_2__56_, up_di_2__55_, up_di_2__54_, up_di_2__53_, up_di_2__52_,
         up_di_2__51_, up_di_2__50_, up_di_2__49_, up_di_2__48_, up_di_2__47_,
         up_di_2__46_, up_di_2__45_, up_di_2__44_, up_di_2__43_, up_di_2__42_,
         up_di_2__41_, up_di_2__40_, up_di_2__39_, up_di_2__38_, up_di_2__37_,
         up_di_2__36_, up_di_2__35_, up_di_2__34_, up_di_2__33_, up_di_2__32_,
         up_di_2__31_, up_di_2__30_, up_di_2__29_, up_di_2__28_, up_di_2__27_,
         up_di_2__26_, up_di_2__25_, up_di_2__24_, up_di_2__23_, up_di_2__22_,
         up_di_2__21_, up_di_2__20_, up_di_2__19_, up_di_2__18_, up_di_2__17_,
         up_di_2__16_, up_di_2__15_, up_di_2__14_, up_di_2__13_, up_di_2__12_,
         up_di_2__11_, up_di_2__10_, up_di_2__9_, up_di_2__8_, up_di_2__7_,
         up_di_2__6_, up_di_2__5_, up_di_2__4_, up_di_2__3_, up_di_2__2_,
         up_di_2__1_, up_di_2__0_, up_di_3__63_, up_di_3__62_, up_di_3__61_,
         up_di_3__60_, up_di_3__59_, up_di_3__58_, up_di_3__57_, up_di_3__56_,
         up_di_3__55_, up_di_3__54_, up_di_3__53_, up_di_3__52_, up_di_3__51_,
         up_di_3__50_, up_di_3__49_, up_di_3__48_, up_di_3__47_, up_di_3__46_,
         up_di_3__45_, up_di_3__44_, up_di_3__43_, up_di_3__42_, up_di_3__41_,
         up_di_3__40_, up_di_3__39_, up_di_3__38_, up_di_3__37_, up_di_3__36_,
         up_di_3__35_, up_di_3__34_, up_di_3__33_, up_di_3__32_, up_di_3__31_,
         up_di_3__30_, up_di_3__29_, up_di_3__28_, up_di_3__27_, up_di_3__26_,
         up_di_3__25_, up_di_3__24_, up_di_3__23_, up_di_3__22_, up_di_3__21_,
         up_di_3__20_, up_di_3__19_, up_di_3__18_, up_di_3__17_, up_di_3__16_,
         up_di_3__15_, up_di_3__14_, up_di_3__13_, up_di_3__12_, up_di_3__11_,
         up_di_3__10_, up_di_3__9_, up_di_3__8_, up_di_3__7_, up_di_3__6_,
         up_di_3__5_, up_di_3__4_, up_di_3__3_, up_di_3__2_, up_di_3__1_,
         up_di_3__0_, up_di_4__63_, up_di_4__62_, up_di_4__61_, up_di_4__60_,
         up_di_4__59_, up_di_4__58_, up_di_4__57_, up_di_4__56_, up_di_4__55_,
         up_di_4__54_, up_di_4__53_, up_di_4__52_, up_di_4__51_, up_di_4__50_,
         up_di_4__49_, up_di_4__48_, up_di_4__47_, up_di_4__46_, up_di_4__45_,
         up_di_4__44_, up_di_4__43_, up_di_4__42_, up_di_4__41_, up_di_4__40_,
         up_di_4__39_, up_di_4__38_, up_di_4__37_, up_di_4__36_, up_di_4__35_,
         up_di_4__34_, up_di_4__33_, up_di_4__32_, up_di_4__31_, up_di_4__30_,
         up_di_4__29_, up_di_4__28_, up_di_4__27_, up_di_4__26_, up_di_4__25_,
         up_di_4__24_, up_di_4__23_, up_di_4__22_, up_di_4__21_, up_di_4__20_,
         up_di_4__19_, up_di_4__18_, up_di_4__17_, up_di_4__16_, up_di_4__15_,
         up_di_4__14_, up_di_4__13_, up_di_4__12_, up_di_4__11_, up_di_4__10_,
         up_di_4__9_, up_di_4__8_, up_di_4__7_, up_di_4__6_, up_di_4__5_,
         up_di_4__4_, up_di_4__3_, up_di_4__2_, up_di_4__1_, up_di_4__0_,
         up_di_5__63_, up_di_5__62_, up_di_5__61_, up_di_5__60_, up_di_5__59_,
         up_di_5__58_, up_di_5__57_, up_di_5__56_, up_di_5__55_, up_di_5__54_,
         up_di_5__53_, up_di_5__52_, up_di_5__51_, up_di_5__50_, up_di_5__49_,
         up_di_5__48_, up_di_5__47_, up_di_5__46_, up_di_5__45_, up_di_5__44_,
         up_di_5__43_, up_di_5__42_, up_di_5__41_, up_di_5__40_, up_di_5__39_,
         up_di_5__38_, up_di_5__37_, up_di_5__36_, up_di_5__35_, up_di_5__34_,
         up_di_5__33_, up_di_5__32_, up_di_5__31_, up_di_5__30_, up_di_5__29_,
         up_di_5__28_, up_di_5__27_, up_di_5__26_, up_di_5__25_, up_di_5__24_,
         up_di_5__23_, up_di_5__22_, up_di_5__21_, up_di_5__20_, up_di_5__19_,
         up_di_5__18_, up_di_5__17_, up_di_5__16_, up_di_5__15_, up_di_5__14_,
         up_di_5__13_, up_di_5__12_, up_di_5__11_, up_di_5__10_, up_di_5__9_,
         up_di_5__8_, up_di_5__7_, up_di_5__6_, up_di_5__5_, up_di_5__4_,
         up_di_5__3_, up_di_5__2_, up_di_5__1_, up_di_5__0_, up_di_6__63_,
         up_di_6__62_, up_di_6__61_, up_di_6__60_, up_di_6__59_, up_di_6__58_,
         up_di_6__57_, up_di_6__56_, up_di_6__55_, up_di_6__54_, up_di_6__53_,
         up_di_6__52_, up_di_6__51_, up_di_6__50_, up_di_6__49_, up_di_6__48_,
         up_di_6__47_, up_di_6__46_, up_di_6__45_, up_di_6__44_, up_di_6__43_,
         up_di_6__42_, up_di_6__41_, up_di_6__40_, up_di_6__39_, up_di_6__38_,
         up_di_6__37_, up_di_6__36_, up_di_6__35_, up_di_6__34_, up_di_6__33_,
         up_di_6__32_, up_di_6__31_, up_di_6__30_, up_di_6__29_, up_di_6__28_,
         up_di_6__27_, up_di_6__26_, up_di_6__25_, up_di_6__24_, up_di_6__23_,
         up_di_6__22_, up_di_6__21_, up_di_6__20_, up_di_6__19_, up_di_6__18_,
         up_di_6__17_, up_di_6__16_, up_di_6__15_, up_di_6__14_, up_di_6__13_,
         up_di_6__12_, up_di_6__11_, up_di_6__10_, up_di_6__9_, up_di_6__8_,
         up_di_6__7_, up_di_6__6_, up_di_6__5_, up_di_6__4_, up_di_6__3_,
         up_di_6__2_, up_di_6__1_, up_di_6__0_, up_di_7__63_, up_di_7__62_,
         up_di_7__61_, up_di_7__60_, up_di_7__59_, up_di_7__58_, up_di_7__57_,
         up_di_7__56_, up_di_7__55_, up_di_7__54_, up_di_7__53_, up_di_7__52_,
         up_di_7__51_, up_di_7__50_, up_di_7__49_, up_di_7__48_, up_di_7__47_,
         up_di_7__46_, up_di_7__45_, up_di_7__44_, up_di_7__43_, up_di_7__42_,
         up_di_7__41_, up_di_7__40_, up_di_7__39_, up_di_7__38_, up_di_7__37_,
         up_di_7__36_, up_di_7__35_, up_di_7__34_, up_di_7__33_, up_di_7__32_,
         up_di_7__31_, up_di_7__30_, up_di_7__29_, up_di_7__28_, up_di_7__27_,
         up_di_7__26_, up_di_7__25_, up_di_7__24_, up_di_7__23_, up_di_7__22_,
         up_di_7__21_, up_di_7__20_, up_di_7__19_, up_di_7__18_, up_di_7__17_,
         up_di_7__16_, up_di_7__15_, up_di_7__14_, up_di_7__13_, up_di_7__12_,
         up_di_7__11_, up_di_7__10_, up_di_7__9_, up_di_7__8_, up_di_7__7_,
         up_di_7__6_, up_di_7__5_, up_di_7__4_, up_di_7__3_, up_di_7__2_,
         up_di_7__1_, up_di_7__0_, right_si_4, right_si_5, right_si_6,
         right_si_8, right_si_9, right_si_10, right_si_12, right_si_13,
         right_si_14, right_di_0__63_, right_di_0__62_, right_di_0__61_,
         right_di_0__60_, right_di_0__59_, right_di_0__58_, right_di_0__57_,
         right_di_0__56_, right_di_0__55_, right_di_0__54_, right_di_0__53_,
         right_di_0__52_, right_di_0__51_, right_di_0__50_, right_di_0__49_,
         right_di_0__48_, right_di_0__47_, right_di_0__46_, right_di_0__45_,
         right_di_0__44_, right_di_0__43_, right_di_0__42_, right_di_0__41_,
         right_di_0__40_, right_di_0__39_, right_di_0__38_, right_di_0__37_,
         right_di_0__36_, right_di_0__35_, right_di_0__34_, right_di_0__33_,
         right_di_0__32_, right_di_0__31_, right_di_0__30_, right_di_0__29_,
         right_di_0__28_, right_di_0__27_, right_di_0__26_, right_di_0__25_,
         right_di_0__24_, right_di_0__23_, right_di_0__22_, right_di_0__21_,
         right_di_0__20_, right_di_0__19_, right_di_0__18_, right_di_0__17_,
         right_di_0__16_, right_di_0__15_, right_di_0__14_, right_di_0__13_,
         right_di_0__12_, right_di_0__11_, right_di_0__10_, right_di_0__9_,
         right_di_0__8_, right_di_0__7_, right_di_0__6_, right_di_0__5_,
         right_di_0__4_, right_di_0__3_, right_di_0__2_, right_di_0__1_,
         right_di_0__0_, right_di_1__63_, right_di_1__62_, right_di_1__61_,
         right_di_1__60_, right_di_1__59_, right_di_1__58_, right_di_1__57_,
         right_di_1__56_, right_di_1__55_, right_di_1__54_, right_di_1__53_,
         right_di_1__52_, right_di_1__51_, right_di_1__50_, right_di_1__49_,
         right_di_1__48_, right_di_1__47_, right_di_1__46_, right_di_1__45_,
         right_di_1__44_, right_di_1__43_, right_di_1__42_, right_di_1__41_,
         right_di_1__40_, right_di_1__39_, right_di_1__38_, right_di_1__37_,
         right_di_1__36_, right_di_1__35_, right_di_1__34_, right_di_1__33_,
         right_di_1__32_, right_di_1__31_, right_di_1__30_, right_di_1__29_,
         right_di_1__28_, right_di_1__27_, right_di_1__26_, right_di_1__25_,
         right_di_1__24_, right_di_1__23_, right_di_1__22_, right_di_1__21_,
         right_di_1__20_, right_di_1__19_, right_di_1__18_, right_di_1__17_,
         right_di_1__16_, right_di_1__15_, right_di_1__14_, right_di_1__13_,
         right_di_1__12_, right_di_1__11_, right_di_1__10_, right_di_1__9_,
         right_di_1__8_, right_di_1__7_, right_di_1__6_, right_di_1__5_,
         right_di_1__4_, right_di_1__3_, right_di_1__2_, right_di_1__1_,
         right_di_1__0_, right_di_2__63_, right_di_2__62_, right_di_2__61_,
         right_di_2__60_, right_di_2__59_, right_di_2__58_, right_di_2__57_,
         right_di_2__56_, right_di_2__55_, right_di_2__54_, right_di_2__53_,
         right_di_2__52_, right_di_2__51_, right_di_2__50_, right_di_2__49_,
         right_di_2__48_, right_di_2__47_, right_di_2__46_, right_di_2__45_,
         right_di_2__44_, right_di_2__43_, right_di_2__42_, right_di_2__41_,
         right_di_2__40_, right_di_2__39_, right_di_2__38_, right_di_2__37_,
         right_di_2__36_, right_di_2__35_, right_di_2__34_, right_di_2__33_,
         right_di_2__32_, right_di_2__31_, right_di_2__30_, right_di_2__29_,
         right_di_2__28_, right_di_2__27_, right_di_2__26_, right_di_2__25_,
         right_di_2__24_, right_di_2__23_, right_di_2__22_, right_di_2__21_,
         right_di_2__20_, right_di_2__19_, right_di_2__18_, right_di_2__17_,
         right_di_2__16_, right_di_2__15_, right_di_2__14_, right_di_2__13_,
         right_di_2__12_, right_di_2__11_, right_di_2__10_, right_di_2__9_,
         right_di_2__8_, right_di_2__7_, right_di_2__6_, right_di_2__5_,
         right_di_2__4_, right_di_2__3_, right_di_2__2_, right_di_2__1_,
         right_di_2__0_, right_di_4__63_, right_di_4__62_, right_di_4__61_,
         right_di_4__60_, right_di_4__59_, right_di_4__58_, right_di_4__57_,
         right_di_4__56_, right_di_4__55_, right_di_4__54_, right_di_4__53_,
         right_di_4__52_, right_di_4__51_, right_di_4__50_, right_di_4__49_,
         right_di_4__48_, right_di_4__47_, right_di_4__46_, right_di_4__45_,
         right_di_4__44_, right_di_4__43_, right_di_4__42_, right_di_4__41_,
         right_di_4__40_, right_di_4__39_, right_di_4__38_, right_di_4__37_,
         right_di_4__36_, right_di_4__35_, right_di_4__34_, right_di_4__33_,
         right_di_4__32_, right_di_4__31_, right_di_4__30_, right_di_4__29_,
         right_di_4__28_, right_di_4__27_, right_di_4__26_, right_di_4__25_,
         right_di_4__24_, right_di_4__23_, right_di_4__22_, right_di_4__21_,
         right_di_4__20_, right_di_4__19_, right_di_4__18_, right_di_4__17_,
         right_di_4__16_, right_di_4__15_, right_di_4__14_, right_di_4__13_,
         right_di_4__12_, right_di_4__11_, right_di_4__10_, right_di_4__9_,
         right_di_4__8_, right_di_4__7_, right_di_4__6_, right_di_4__5_,
         right_di_4__4_, right_di_4__3_, right_di_4__2_, right_di_4__1_,
         right_di_4__0_, right_di_5__63_, right_di_5__62_, right_di_5__61_,
         right_di_5__60_, right_di_5__59_, right_di_5__58_, right_di_5__57_,
         right_di_5__56_, right_di_5__55_, right_di_5__54_, right_di_5__53_,
         right_di_5__52_, right_di_5__51_, right_di_5__50_, right_di_5__49_,
         right_di_5__48_, right_di_5__47_, right_di_5__46_, right_di_5__45_,
         right_di_5__44_, right_di_5__43_, right_di_5__42_, right_di_5__41_,
         right_di_5__40_, right_di_5__39_, right_di_5__38_, right_di_5__37_,
         right_di_5__36_, right_di_5__35_, right_di_5__34_, right_di_5__33_,
         right_di_5__32_, right_di_5__31_, right_di_5__30_, right_di_5__29_,
         right_di_5__28_, right_di_5__27_, right_di_5__26_, right_di_5__25_,
         right_di_5__24_, right_di_5__23_, right_di_5__22_, right_di_5__21_,
         right_di_5__20_, right_di_5__19_, right_di_5__18_, right_di_5__17_,
         right_di_5__16_, right_di_5__15_, right_di_5__14_, right_di_5__13_,
         right_di_5__12_, right_di_5__11_, right_di_5__10_, right_di_5__9_,
         right_di_5__8_, right_di_5__7_, right_di_5__6_, right_di_5__5_,
         right_di_5__4_, right_di_5__3_, right_di_5__2_, right_di_5__1_,
         right_di_5__0_, right_di_6__63_, right_di_6__62_, right_di_6__61_,
         right_di_6__60_, right_di_6__59_, right_di_6__58_, right_di_6__57_,
         right_di_6__56_, right_di_6__55_, right_di_6__54_, right_di_6__53_,
         right_di_6__52_, right_di_6__51_, right_di_6__50_, right_di_6__49_,
         right_di_6__48_, right_di_6__47_, right_di_6__46_, right_di_6__45_,
         right_di_6__44_, right_di_6__43_, right_di_6__42_, right_di_6__41_,
         right_di_6__40_, right_di_6__39_, right_di_6__38_, right_di_6__37_,
         right_di_6__36_, right_di_6__35_, right_di_6__34_, right_di_6__33_,
         right_di_6__32_, right_di_6__31_, right_di_6__30_, right_di_6__29_,
         right_di_6__28_, right_di_6__27_, right_di_6__26_, right_di_6__25_,
         right_di_6__24_, right_di_6__23_, right_di_6__22_, right_di_6__21_,
         right_di_6__20_, right_di_6__19_, right_di_6__18_, right_di_6__17_,
         right_di_6__16_, right_di_6__15_, right_di_6__14_, right_di_6__13_,
         right_di_6__12_, right_di_6__11_, right_di_6__10_, right_di_6__9_,
         right_di_6__8_, right_di_6__7_, right_di_6__6_, right_di_6__5_,
         right_di_6__4_, right_di_6__3_, right_di_6__2_, right_di_6__1_,
         right_di_6__0_, right_ro_4, right_ro_5, right_ro_6, right_ro_8,
         right_ro_9, right_ro_10, right_ro_12, right_ro_13, right_ro_14,
         up_di_8__63_, up_di_8__62_, up_di_8__61_, up_di_8__60_, up_di_8__59_,
         up_di_8__58_, up_di_8__57_, up_di_8__56_, up_di_8__55_, up_di_8__54_,
         up_di_8__53_, up_di_8__52_, up_di_8__51_, up_di_8__50_, up_di_8__49_,
         up_di_8__48_, up_di_8__47_, up_di_8__46_, up_di_8__45_, up_di_8__44_,
         up_di_8__43_, up_di_8__42_, up_di_8__41_, up_di_8__40_, up_di_8__39_,
         up_di_8__38_, up_di_8__37_, up_di_8__36_, up_di_8__35_, up_di_8__34_,
         up_di_8__33_, up_di_8__32_, up_di_8__31_, up_di_8__30_, up_di_8__29_,
         up_di_8__28_, up_di_8__27_, up_di_8__26_, up_di_8__25_, up_di_8__24_,
         up_di_8__23_, up_di_8__22_, up_di_8__21_, up_di_8__20_, up_di_8__19_,
         up_di_8__18_, up_di_8__17_, up_di_8__16_, up_di_8__15_, up_di_8__14_,
         up_di_8__13_, up_di_8__12_, up_di_8__11_, up_di_8__10_, up_di_8__9_,
         up_di_8__8_, up_di_8__7_, up_di_8__6_, up_di_8__5_, up_di_8__4_,
         up_di_8__3_, up_di_8__2_, up_di_8__1_, up_di_8__0_, up_di_9__63_,
         up_di_9__62_, up_di_9__61_, up_di_9__60_, up_di_9__59_, up_di_9__58_,
         up_di_9__57_, up_di_9__56_, up_di_9__55_, up_di_9__54_, up_di_9__53_,
         up_di_9__52_, up_di_9__51_, up_di_9__50_, up_di_9__49_, up_di_9__48_,
         up_di_9__47_, up_di_9__46_, up_di_9__45_, up_di_9__44_, up_di_9__43_,
         up_di_9__42_, up_di_9__41_, up_di_9__40_, up_di_9__39_, up_di_9__38_,
         up_di_9__37_, up_di_9__36_, up_di_9__35_, up_di_9__34_, up_di_9__33_,
         up_di_9__32_, up_di_9__31_, up_di_9__30_, up_di_9__29_, up_di_9__28_,
         up_di_9__27_, up_di_9__26_, up_di_9__25_, up_di_9__24_, up_di_9__23_,
         up_di_9__22_, up_di_9__21_, up_di_9__20_, up_di_9__19_, up_di_9__18_,
         up_di_9__17_, up_di_9__16_, up_di_9__15_, up_di_9__14_, up_di_9__13_,
         up_di_9__12_, up_di_9__11_, up_di_9__10_, up_di_9__9_, up_di_9__8_,
         up_di_9__7_, up_di_9__6_, up_di_9__5_, up_di_9__4_, up_di_9__3_,
         up_di_9__2_, up_di_9__1_, up_di_9__0_, up_di_10__63_, up_di_10__62_,
         up_di_10__61_, up_di_10__60_, up_di_10__59_, up_di_10__58_,
         up_di_10__57_, up_di_10__56_, up_di_10__55_, up_di_10__54_,
         up_di_10__53_, up_di_10__52_, up_di_10__51_, up_di_10__50_,
         up_di_10__49_, up_di_10__48_, up_di_10__47_, up_di_10__46_,
         up_di_10__45_, up_di_10__44_, up_di_10__43_, up_di_10__42_,
         up_di_10__41_, up_di_10__40_, up_di_10__39_, up_di_10__38_,
         up_di_10__37_, up_di_10__36_, up_di_10__35_, up_di_10__34_,
         up_di_10__33_, up_di_10__32_, up_di_10__31_, up_di_10__30_,
         up_di_10__29_, up_di_10__28_, up_di_10__27_, up_di_10__26_,
         up_di_10__25_, up_di_10__24_, up_di_10__23_, up_di_10__22_,
         up_di_10__21_, up_di_10__20_, up_di_10__19_, up_di_10__18_,
         up_di_10__17_, up_di_10__16_, up_di_10__15_, up_di_10__14_,
         up_di_10__13_, up_di_10__12_, up_di_10__11_, up_di_10__10_,
         up_di_10__9_, up_di_10__8_, up_di_10__7_, up_di_10__6_, up_di_10__5_,
         up_di_10__4_, up_di_10__3_, up_di_10__2_, up_di_10__1_, up_di_10__0_,
         up_di_11__63_, up_di_11__62_, up_di_11__61_, up_di_11__60_,
         up_di_11__59_, up_di_11__58_, up_di_11__57_, up_di_11__56_,
         up_di_11__55_, up_di_11__54_, up_di_11__53_, up_di_11__52_,
         up_di_11__51_, up_di_11__50_, up_di_11__49_, up_di_11__48_,
         up_di_11__47_, up_di_11__46_, up_di_11__45_, up_di_11__44_,
         up_di_11__43_, up_di_11__42_, up_di_11__41_, up_di_11__40_,
         up_di_11__39_, up_di_11__38_, up_di_11__37_, up_di_11__36_,
         up_di_11__35_, up_di_11__34_, up_di_11__33_, up_di_11__32_,
         up_di_11__31_, up_di_11__30_, up_di_11__29_, up_di_11__28_,
         up_di_11__27_, up_di_11__26_, up_di_11__25_, up_di_11__24_,
         up_di_11__23_, up_di_11__22_, up_di_11__21_, up_di_11__20_,
         up_di_11__19_, up_di_11__18_, up_di_11__17_, up_di_11__16_,
         up_di_11__15_, up_di_11__14_, up_di_11__13_, up_di_11__12_,
         up_di_11__11_, up_di_11__10_, up_di_11__9_, up_di_11__8_,
         up_di_11__7_, up_di_11__6_, up_di_11__5_, up_di_11__4_, up_di_11__3_,
         up_di_11__2_, up_di_11__1_, up_di_11__0_, right_di_8__63_,
         right_di_8__62_, right_di_8__61_, right_di_8__60_, right_di_8__59_,
         right_di_8__58_, right_di_8__57_, right_di_8__56_, right_di_8__55_,
         right_di_8__54_, right_di_8__53_, right_di_8__52_, right_di_8__51_,
         right_di_8__50_, right_di_8__49_, right_di_8__48_, right_di_8__47_,
         right_di_8__46_, right_di_8__45_, right_di_8__44_, right_di_8__43_,
         right_di_8__42_, right_di_8__41_, right_di_8__40_, right_di_8__39_,
         right_di_8__38_, right_di_8__37_, right_di_8__36_, right_di_8__35_,
         right_di_8__34_, right_di_8__33_, right_di_8__32_, right_di_8__31_,
         right_di_8__30_, right_di_8__29_, right_di_8__28_, right_di_8__27_,
         right_di_8__26_, right_di_8__25_, right_di_8__24_, right_di_8__23_,
         right_di_8__22_, right_di_8__21_, right_di_8__20_, right_di_8__19_,
         right_di_8__18_, right_di_8__17_, right_di_8__16_, right_di_8__15_,
         right_di_8__14_, right_di_8__13_, right_di_8__12_, right_di_8__11_,
         right_di_8__10_, right_di_8__9_, right_di_8__8_, right_di_8__7_,
         right_di_8__6_, right_di_8__5_, right_di_8__4_, right_di_8__3_,
         right_di_8__2_, right_di_8__1_, right_di_8__0_, right_di_9__63_,
         right_di_9__62_, right_di_9__61_, right_di_9__60_, right_di_9__59_,
         right_di_9__58_, right_di_9__57_, right_di_9__56_, right_di_9__55_,
         right_di_9__54_, right_di_9__53_, right_di_9__52_, right_di_9__51_,
         right_di_9__50_, right_di_9__49_, right_di_9__48_, right_di_9__47_,
         right_di_9__46_, right_di_9__45_, right_di_9__44_, right_di_9__43_,
         right_di_9__42_, right_di_9__41_, right_di_9__40_, right_di_9__39_,
         right_di_9__38_, right_di_9__37_, right_di_9__36_, right_di_9__35_,
         right_di_9__34_, right_di_9__33_, right_di_9__32_, right_di_9__31_,
         right_di_9__30_, right_di_9__29_, right_di_9__28_, right_di_9__27_,
         right_di_9__26_, right_di_9__25_, right_di_9__24_, right_di_9__23_,
         right_di_9__22_, right_di_9__21_, right_di_9__20_, right_di_9__19_,
         right_di_9__18_, right_di_9__17_, right_di_9__16_, right_di_9__15_,
         right_di_9__14_, right_di_9__13_, right_di_9__12_, right_di_9__11_,
         right_di_9__10_, right_di_9__9_, right_di_9__8_, right_di_9__7_,
         right_di_9__6_, right_di_9__5_, right_di_9__4_, right_di_9__3_,
         right_di_9__2_, right_di_9__1_, right_di_9__0_, right_di_10__63_,
         right_di_10__62_, right_di_10__61_, right_di_10__60_,
         right_di_10__59_, right_di_10__58_, right_di_10__57_,
         right_di_10__56_, right_di_10__55_, right_di_10__54_,
         right_di_10__53_, right_di_10__52_, right_di_10__51_,
         right_di_10__50_, right_di_10__49_, right_di_10__48_,
         right_di_10__47_, right_di_10__46_, right_di_10__45_,
         right_di_10__44_, right_di_10__43_, right_di_10__42_,
         right_di_10__41_, right_di_10__40_, right_di_10__39_,
         right_di_10__38_, right_di_10__37_, right_di_10__36_,
         right_di_10__35_, right_di_10__34_, right_di_10__33_,
         right_di_10__32_, right_di_10__31_, right_di_10__30_,
         right_di_10__29_, right_di_10__28_, right_di_10__27_,
         right_di_10__26_, right_di_10__25_, right_di_10__24_,
         right_di_10__23_, right_di_10__22_, right_di_10__21_,
         right_di_10__20_, right_di_10__19_, right_di_10__18_,
         right_di_10__17_, right_di_10__16_, right_di_10__15_,
         right_di_10__14_, right_di_10__13_, right_di_10__12_,
         right_di_10__11_, right_di_10__10_, right_di_10__9_, right_di_10__8_,
         right_di_10__7_, right_di_10__6_, right_di_10__5_, right_di_10__4_,
         right_di_10__3_, right_di_10__2_, right_di_10__1_, right_di_10__0_,
         right_di_12__63_, right_di_12__62_, right_di_12__61_,
         right_di_12__60_, right_di_12__59_, right_di_12__58_,
         right_di_12__57_, right_di_12__56_, right_di_12__55_,
         right_di_12__54_, right_di_12__53_, right_di_12__52_,
         right_di_12__51_, right_di_12__50_, right_di_12__49_,
         right_di_12__48_, right_di_12__47_, right_di_12__46_,
         right_di_12__45_, right_di_12__44_, right_di_12__43_,
         right_di_12__42_, right_di_12__41_, right_di_12__40_,
         right_di_12__39_, right_di_12__38_, right_di_12__37_,
         right_di_12__36_, right_di_12__35_, right_di_12__34_,
         right_di_12__33_, right_di_12__32_, right_di_12__31_,
         right_di_12__30_, right_di_12__29_, right_di_12__28_,
         right_di_12__27_, right_di_12__26_, right_di_12__25_,
         right_di_12__24_, right_di_12__23_, right_di_12__22_,
         right_di_12__21_, right_di_12__20_, right_di_12__19_,
         right_di_12__18_, right_di_12__17_, right_di_12__16_,
         right_di_12__15_, right_di_12__14_, right_di_12__13_,
         right_di_12__12_, right_di_12__11_, right_di_12__10_, right_di_12__9_,
         right_di_12__8_, right_di_12__7_, right_di_12__6_, right_di_12__5_,
         right_di_12__4_, right_di_12__3_, right_di_12__2_, right_di_12__1_,
         right_di_12__0_, right_di_13__63_, right_di_13__62_, right_di_13__61_,
         right_di_13__60_, right_di_13__59_, right_di_13__58_,
         right_di_13__57_, right_di_13__56_, right_di_13__55_,
         right_di_13__54_, right_di_13__53_, right_di_13__52_,
         right_di_13__51_, right_di_13__50_, right_di_13__49_,
         right_di_13__48_, right_di_13__47_, right_di_13__46_,
         right_di_13__45_, right_di_13__44_, right_di_13__43_,
         right_di_13__42_, right_di_13__41_, right_di_13__40_,
         right_di_13__39_, right_di_13__38_, right_di_13__37_,
         right_di_13__36_, right_di_13__35_, right_di_13__34_,
         right_di_13__33_, right_di_13__32_, right_di_13__31_,
         right_di_13__30_, right_di_13__29_, right_di_13__28_,
         right_di_13__27_, right_di_13__26_, right_di_13__25_,
         right_di_13__24_, right_di_13__23_, right_di_13__22_,
         right_di_13__21_, right_di_13__20_, right_di_13__19_,
         right_di_13__18_, right_di_13__17_, right_di_13__16_,
         right_di_13__15_, right_di_13__14_, right_di_13__13_,
         right_di_13__12_, right_di_13__11_, right_di_13__10_, right_di_13__9_,
         right_di_13__8_, right_di_13__7_, right_di_13__6_, right_di_13__5_,
         right_di_13__4_, right_di_13__3_, right_di_13__2_, right_di_13__1_,
         right_di_13__0_, right_di_14__63_, right_di_14__62_, right_di_14__61_,
         right_di_14__60_, right_di_14__59_, right_di_14__58_,
         right_di_14__57_, right_di_14__56_, right_di_14__55_,
         right_di_14__54_, right_di_14__53_, right_di_14__52_,
         right_di_14__51_, right_di_14__50_, right_di_14__49_,
         right_di_14__48_, right_di_14__47_, right_di_14__46_,
         right_di_14__45_, right_di_14__44_, right_di_14__43_,
         right_di_14__42_, right_di_14__41_, right_di_14__40_,
         right_di_14__39_, right_di_14__38_, right_di_14__37_,
         right_di_14__36_, right_di_14__35_, right_di_14__34_,
         right_di_14__33_, right_di_14__32_, right_di_14__31_,
         right_di_14__30_, right_di_14__29_, right_di_14__28_,
         right_di_14__27_, right_di_14__26_, right_di_14__25_,
         right_di_14__24_, right_di_14__23_, right_di_14__22_,
         right_di_14__21_, right_di_14__20_, right_di_14__19_,
         right_di_14__18_, right_di_14__17_, right_di_14__16_,
         right_di_14__15_, right_di_14__14_, right_di_14__13_,
         right_di_14__12_, right_di_14__11_, right_di_14__10_, right_di_14__9_,
         right_di_14__8_, right_di_14__7_, right_di_14__6_, right_di_14__5_,
         right_di_14__4_, right_di_14__3_, right_di_14__2_, right_di_14__1_,
         right_di_14__0_, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28,
         SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30,
         SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32,
         SYNOPSYS_UNCONNECTED_33, SYNOPSYS_UNCONNECTED_34,
         SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36,
         SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38,
         SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40,
         SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42,
         SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44,
         SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46,
         SYNOPSYS_UNCONNECTED_47, SYNOPSYS_UNCONNECTED_48,
         SYNOPSYS_UNCONNECTED_49, SYNOPSYS_UNCONNECTED_50,
         SYNOPSYS_UNCONNECTED_51, SYNOPSYS_UNCONNECTED_52,
         SYNOPSYS_UNCONNECTED_53, SYNOPSYS_UNCONNECTED_54,
         SYNOPSYS_UNCONNECTED_55, SYNOPSYS_UNCONNECTED_56,
         SYNOPSYS_UNCONNECTED_57, SYNOPSYS_UNCONNECTED_58,
         SYNOPSYS_UNCONNECTED_59, SYNOPSYS_UNCONNECTED_60,
         SYNOPSYS_UNCONNECTED_61, SYNOPSYS_UNCONNECTED_62,
         SYNOPSYS_UNCONNECTED_63, SYNOPSYS_UNCONNECTED_64,
         SYNOPSYS_UNCONNECTED_65, SYNOPSYS_UNCONNECTED_66,
         SYNOPSYS_UNCONNECTED_67, SYNOPSYS_UNCONNECTED_68,
         SYNOPSYS_UNCONNECTED_69, SYNOPSYS_UNCONNECTED_70,
         SYNOPSYS_UNCONNECTED_71, SYNOPSYS_UNCONNECTED_72,
         SYNOPSYS_UNCONNECTED_73, SYNOPSYS_UNCONNECTED_74,
         SYNOPSYS_UNCONNECTED_75, SYNOPSYS_UNCONNECTED_76,
         SYNOPSYS_UNCONNECTED_77, SYNOPSYS_UNCONNECTED_78,
         SYNOPSYS_UNCONNECTED_79, SYNOPSYS_UNCONNECTED_80,
         SYNOPSYS_UNCONNECTED_81, SYNOPSYS_UNCONNECTED_82,
         SYNOPSYS_UNCONNECTED_83, SYNOPSYS_UNCONNECTED_84,
         SYNOPSYS_UNCONNECTED_85, SYNOPSYS_UNCONNECTED_86,
         SYNOPSYS_UNCONNECTED_87, SYNOPSYS_UNCONNECTED_88,
         SYNOPSYS_UNCONNECTED_89, SYNOPSYS_UNCONNECTED_90,
         SYNOPSYS_UNCONNECTED_91, SYNOPSYS_UNCONNECTED_92,
         SYNOPSYS_UNCONNECTED_93, SYNOPSYS_UNCONNECTED_94,
         SYNOPSYS_UNCONNECTED_95, SYNOPSYS_UNCONNECTED_96,
         SYNOPSYS_UNCONNECTED_97, SYNOPSYS_UNCONNECTED_98,
         SYNOPSYS_UNCONNECTED_99, SYNOPSYS_UNCONNECTED_100,
         SYNOPSYS_UNCONNECTED_101, SYNOPSYS_UNCONNECTED_102,
         SYNOPSYS_UNCONNECTED_103, SYNOPSYS_UNCONNECTED_104,
         SYNOPSYS_UNCONNECTED_105, SYNOPSYS_UNCONNECTED_106,
         SYNOPSYS_UNCONNECTED_107, SYNOPSYS_UNCONNECTED_108,
         SYNOPSYS_UNCONNECTED_109, SYNOPSYS_UNCONNECTED_110,
         SYNOPSYS_UNCONNECTED_111, SYNOPSYS_UNCONNECTED_112,
         SYNOPSYS_UNCONNECTED_113, SYNOPSYS_UNCONNECTED_114,
         SYNOPSYS_UNCONNECTED_115, SYNOPSYS_UNCONNECTED_116,
         SYNOPSYS_UNCONNECTED_117, SYNOPSYS_UNCONNECTED_118,
         SYNOPSYS_UNCONNECTED_119, SYNOPSYS_UNCONNECTED_120,
         SYNOPSYS_UNCONNECTED_121, SYNOPSYS_UNCONNECTED_122,
         SYNOPSYS_UNCONNECTED_123, SYNOPSYS_UNCONNECTED_124,
         SYNOPSYS_UNCONNECTED_125, SYNOPSYS_UNCONNECTED_126,
         SYNOPSYS_UNCONNECTED_127, SYNOPSYS_UNCONNECTED_128,
         SYNOPSYS_UNCONNECTED_129, SYNOPSYS_UNCONNECTED_130,
         SYNOPSYS_UNCONNECTED_131, SYNOPSYS_UNCONNECTED_132,
         SYNOPSYS_UNCONNECTED_133, SYNOPSYS_UNCONNECTED_134,
         SYNOPSYS_UNCONNECTED_135, SYNOPSYS_UNCONNECTED_136,
         SYNOPSYS_UNCONNECTED_137, SYNOPSYS_UNCONNECTED_138,
         SYNOPSYS_UNCONNECTED_139, SYNOPSYS_UNCONNECTED_140,
         SYNOPSYS_UNCONNECTED_141, SYNOPSYS_UNCONNECTED_142,
         SYNOPSYS_UNCONNECTED_143, SYNOPSYS_UNCONNECTED_144,
         SYNOPSYS_UNCONNECTED_145, SYNOPSYS_UNCONNECTED_146,
         SYNOPSYS_UNCONNECTED_147, SYNOPSYS_UNCONNECTED_148,
         SYNOPSYS_UNCONNECTED_149, SYNOPSYS_UNCONNECTED_150,
         SYNOPSYS_UNCONNECTED_151, SYNOPSYS_UNCONNECTED_152,
         SYNOPSYS_UNCONNECTED_153, SYNOPSYS_UNCONNECTED_154,
         SYNOPSYS_UNCONNECTED_155, SYNOPSYS_UNCONNECTED_156,
         SYNOPSYS_UNCONNECTED_157, SYNOPSYS_UNCONNECTED_158,
         SYNOPSYS_UNCONNECTED_159, SYNOPSYS_UNCONNECTED_160,
         SYNOPSYS_UNCONNECTED_161, SYNOPSYS_UNCONNECTED_162,
         SYNOPSYS_UNCONNECTED_163, SYNOPSYS_UNCONNECTED_164,
         SYNOPSYS_UNCONNECTED_165, SYNOPSYS_UNCONNECTED_166,
         SYNOPSYS_UNCONNECTED_167, SYNOPSYS_UNCONNECTED_168,
         SYNOPSYS_UNCONNECTED_169, SYNOPSYS_UNCONNECTED_170,
         SYNOPSYS_UNCONNECTED_171, SYNOPSYS_UNCONNECTED_172,
         SYNOPSYS_UNCONNECTED_173, SYNOPSYS_UNCONNECTED_174,
         SYNOPSYS_UNCONNECTED_175, SYNOPSYS_UNCONNECTED_176,
         SYNOPSYS_UNCONNECTED_177, SYNOPSYS_UNCONNECTED_178,
         SYNOPSYS_UNCONNECTED_179, SYNOPSYS_UNCONNECTED_180,
         SYNOPSYS_UNCONNECTED_181, SYNOPSYS_UNCONNECTED_182,
         SYNOPSYS_UNCONNECTED_183, SYNOPSYS_UNCONNECTED_184,
         SYNOPSYS_UNCONNECTED_185, SYNOPSYS_UNCONNECTED_186,
         SYNOPSYS_UNCONNECTED_187, SYNOPSYS_UNCONNECTED_188,
         SYNOPSYS_UNCONNECTED_189, SYNOPSYS_UNCONNECTED_190,
         SYNOPSYS_UNCONNECTED_191, SYNOPSYS_UNCONNECTED_192,
         SYNOPSYS_UNCONNECTED_193, SYNOPSYS_UNCONNECTED_194,
         SYNOPSYS_UNCONNECTED_195, SYNOPSYS_UNCONNECTED_196,
         SYNOPSYS_UNCONNECTED_197, SYNOPSYS_UNCONNECTED_198,
         SYNOPSYS_UNCONNECTED_199, SYNOPSYS_UNCONNECTED_200,
         SYNOPSYS_UNCONNECTED_201, SYNOPSYS_UNCONNECTED_202,
         SYNOPSYS_UNCONNECTED_203, SYNOPSYS_UNCONNECTED_204,
         SYNOPSYS_UNCONNECTED_205, SYNOPSYS_UNCONNECTED_206,
         SYNOPSYS_UNCONNECTED_207, SYNOPSYS_UNCONNECTED_208,
         SYNOPSYS_UNCONNECTED_209, SYNOPSYS_UNCONNECTED_210,
         SYNOPSYS_UNCONNECTED_211, SYNOPSYS_UNCONNECTED_212,
         SYNOPSYS_UNCONNECTED_213, SYNOPSYS_UNCONNECTED_214,
         SYNOPSYS_UNCONNECTED_215, SYNOPSYS_UNCONNECTED_216,
         SYNOPSYS_UNCONNECTED_217, SYNOPSYS_UNCONNECTED_218,
         SYNOPSYS_UNCONNECTED_219, SYNOPSYS_UNCONNECTED_220,
         SYNOPSYS_UNCONNECTED_221, SYNOPSYS_UNCONNECTED_222,
         SYNOPSYS_UNCONNECTED_223, SYNOPSYS_UNCONNECTED_224,
         SYNOPSYS_UNCONNECTED_225, SYNOPSYS_UNCONNECTED_226,
         SYNOPSYS_UNCONNECTED_227, SYNOPSYS_UNCONNECTED_228,
         SYNOPSYS_UNCONNECTED_229, SYNOPSYS_UNCONNECTED_230,
         SYNOPSYS_UNCONNECTED_231, SYNOPSYS_UNCONNECTED_232,
         SYNOPSYS_UNCONNECTED_233, SYNOPSYS_UNCONNECTED_234,
         SYNOPSYS_UNCONNECTED_235, SYNOPSYS_UNCONNECTED_236,
         SYNOPSYS_UNCONNECTED_237, SYNOPSYS_UNCONNECTED_238,
         SYNOPSYS_UNCONNECTED_239, SYNOPSYS_UNCONNECTED_240,
         SYNOPSYS_UNCONNECTED_241, SYNOPSYS_UNCONNECTED_242,
         SYNOPSYS_UNCONNECTED_243, SYNOPSYS_UNCONNECTED_244,
         SYNOPSYS_UNCONNECTED_245, SYNOPSYS_UNCONNECTED_246,
         SYNOPSYS_UNCONNECTED_247, SYNOPSYS_UNCONNECTED_248,
         SYNOPSYS_UNCONNECTED_249, SYNOPSYS_UNCONNECTED_250,
         SYNOPSYS_UNCONNECTED_251, SYNOPSYS_UNCONNECTED_252,
         SYNOPSYS_UNCONNECTED_253, SYNOPSYS_UNCONNECTED_254,
         SYNOPSYS_UNCONNECTED_255, SYNOPSYS_UNCONNECTED_256,
         SYNOPSYS_UNCONNECTED_257, SYNOPSYS_UNCONNECTED_258,
         SYNOPSYS_UNCONNECTED_259, SYNOPSYS_UNCONNECTED_260,
         SYNOPSYS_UNCONNECTED_261, SYNOPSYS_UNCONNECTED_262,
         SYNOPSYS_UNCONNECTED_263, SYNOPSYS_UNCONNECTED_264,
         SYNOPSYS_UNCONNECTED_265, SYNOPSYS_UNCONNECTED_266,
         SYNOPSYS_UNCONNECTED_267, SYNOPSYS_UNCONNECTED_268,
         SYNOPSYS_UNCONNECTED_269, SYNOPSYS_UNCONNECTED_270,
         SYNOPSYS_UNCONNECTED_271, SYNOPSYS_UNCONNECTED_272,
         SYNOPSYS_UNCONNECTED_273, SYNOPSYS_UNCONNECTED_274,
         SYNOPSYS_UNCONNECTED_275, SYNOPSYS_UNCONNECTED_276,
         SYNOPSYS_UNCONNECTED_277, SYNOPSYS_UNCONNECTED_278,
         SYNOPSYS_UNCONNECTED_279, SYNOPSYS_UNCONNECTED_280,
         SYNOPSYS_UNCONNECTED_281, SYNOPSYS_UNCONNECTED_282,
         SYNOPSYS_UNCONNECTED_283, SYNOPSYS_UNCONNECTED_284,
         SYNOPSYS_UNCONNECTED_285, SYNOPSYS_UNCONNECTED_286,
         SYNOPSYS_UNCONNECTED_287, SYNOPSYS_UNCONNECTED_288,
         SYNOPSYS_UNCONNECTED_289, SYNOPSYS_UNCONNECTED_290,
         SYNOPSYS_UNCONNECTED_291, SYNOPSYS_UNCONNECTED_292,
         SYNOPSYS_UNCONNECTED_293, SYNOPSYS_UNCONNECTED_294,
         SYNOPSYS_UNCONNECTED_295, SYNOPSYS_UNCONNECTED_296,
         SYNOPSYS_UNCONNECTED_297, SYNOPSYS_UNCONNECTED_298,
         SYNOPSYS_UNCONNECTED_299, SYNOPSYS_UNCONNECTED_300,
         SYNOPSYS_UNCONNECTED_301, SYNOPSYS_UNCONNECTED_302,
         SYNOPSYS_UNCONNECTED_303, SYNOPSYS_UNCONNECTED_304,
         SYNOPSYS_UNCONNECTED_305, SYNOPSYS_UNCONNECTED_306,
         SYNOPSYS_UNCONNECTED_307, SYNOPSYS_UNCONNECTED_308,
         SYNOPSYS_UNCONNECTED_309, SYNOPSYS_UNCONNECTED_310,
         SYNOPSYS_UNCONNECTED_311, SYNOPSYS_UNCONNECTED_312,
         SYNOPSYS_UNCONNECTED_313, SYNOPSYS_UNCONNECTED_314,
         SYNOPSYS_UNCONNECTED_315, SYNOPSYS_UNCONNECTED_316,
         SYNOPSYS_UNCONNECTED_317, SYNOPSYS_UNCONNECTED_318,
         SYNOPSYS_UNCONNECTED_319, SYNOPSYS_UNCONNECTED_320,
         SYNOPSYS_UNCONNECTED_321, SYNOPSYS_UNCONNECTED_322,
         SYNOPSYS_UNCONNECTED_323, SYNOPSYS_UNCONNECTED_324,
         SYNOPSYS_UNCONNECTED_325, SYNOPSYS_UNCONNECTED_326,
         SYNOPSYS_UNCONNECTED_327, SYNOPSYS_UNCONNECTED_328,
         SYNOPSYS_UNCONNECTED_329, SYNOPSYS_UNCONNECTED_330,
         SYNOPSYS_UNCONNECTED_331, SYNOPSYS_UNCONNECTED_332,
         SYNOPSYS_UNCONNECTED_333, SYNOPSYS_UNCONNECTED_334,
         SYNOPSYS_UNCONNECTED_335, SYNOPSYS_UNCONNECTED_336,
         SYNOPSYS_UNCONNECTED_337, SYNOPSYS_UNCONNECTED_338,
         SYNOPSYS_UNCONNECTED_339, SYNOPSYS_UNCONNECTED_340,
         SYNOPSYS_UNCONNECTED_341, SYNOPSYS_UNCONNECTED_342,
         SYNOPSYS_UNCONNECTED_343, SYNOPSYS_UNCONNECTED_344,
         SYNOPSYS_UNCONNECTED_345, SYNOPSYS_UNCONNECTED_346,
         SYNOPSYS_UNCONNECTED_347, SYNOPSYS_UNCONNECTED_348,
         SYNOPSYS_UNCONNECTED_349, SYNOPSYS_UNCONNECTED_350,
         SYNOPSYS_UNCONNECTED_351, SYNOPSYS_UNCONNECTED_352,
         SYNOPSYS_UNCONNECTED_353, SYNOPSYS_UNCONNECTED_354,
         SYNOPSYS_UNCONNECTED_355, SYNOPSYS_UNCONNECTED_356,
         SYNOPSYS_UNCONNECTED_357, SYNOPSYS_UNCONNECTED_358,
         SYNOPSYS_UNCONNECTED_359, SYNOPSYS_UNCONNECTED_360,
         SYNOPSYS_UNCONNECTED_361, SYNOPSYS_UNCONNECTED_362,
         SYNOPSYS_UNCONNECTED_363, SYNOPSYS_UNCONNECTED_364,
         SYNOPSYS_UNCONNECTED_365, SYNOPSYS_UNCONNECTED_366,
         SYNOPSYS_UNCONNECTED_367, SYNOPSYS_UNCONNECTED_368,
         SYNOPSYS_UNCONNECTED_369, SYNOPSYS_UNCONNECTED_370,
         SYNOPSYS_UNCONNECTED_371, SYNOPSYS_UNCONNECTED_372,
         SYNOPSYS_UNCONNECTED_373, SYNOPSYS_UNCONNECTED_374,
         SYNOPSYS_UNCONNECTED_375, SYNOPSYS_UNCONNECTED_376,
         SYNOPSYS_UNCONNECTED_377, SYNOPSYS_UNCONNECTED_378,
         SYNOPSYS_UNCONNECTED_379, SYNOPSYS_UNCONNECTED_380,
         SYNOPSYS_UNCONNECTED_381, SYNOPSYS_UNCONNECTED_382,
         SYNOPSYS_UNCONNECTED_383, SYNOPSYS_UNCONNECTED_384,
         SYNOPSYS_UNCONNECTED_385, SYNOPSYS_UNCONNECTED_386,
         SYNOPSYS_UNCONNECTED_387, SYNOPSYS_UNCONNECTED_388,
         SYNOPSYS_UNCONNECTED_389, SYNOPSYS_UNCONNECTED_390,
         SYNOPSYS_UNCONNECTED_391, SYNOPSYS_UNCONNECTED_392,
         SYNOPSYS_UNCONNECTED_393, SYNOPSYS_UNCONNECTED_394,
         SYNOPSYS_UNCONNECTED_395, SYNOPSYS_UNCONNECTED_396,
         SYNOPSYS_UNCONNECTED_397, SYNOPSYS_UNCONNECTED_398,
         SYNOPSYS_UNCONNECTED_399, SYNOPSYS_UNCONNECTED_400,
         SYNOPSYS_UNCONNECTED_401, SYNOPSYS_UNCONNECTED_402,
         SYNOPSYS_UNCONNECTED_403, SYNOPSYS_UNCONNECTED_404,
         SYNOPSYS_UNCONNECTED_405, SYNOPSYS_UNCONNECTED_406,
         SYNOPSYS_UNCONNECTED_407, SYNOPSYS_UNCONNECTED_408,
         SYNOPSYS_UNCONNECTED_409, SYNOPSYS_UNCONNECTED_410,
         SYNOPSYS_UNCONNECTED_411, SYNOPSYS_UNCONNECTED_412,
         SYNOPSYS_UNCONNECTED_413, SYNOPSYS_UNCONNECTED_414,
         SYNOPSYS_UNCONNECTED_415, SYNOPSYS_UNCONNECTED_416,
         SYNOPSYS_UNCONNECTED_417, SYNOPSYS_UNCONNECTED_418,
         SYNOPSYS_UNCONNECTED_419, SYNOPSYS_UNCONNECTED_420,
         SYNOPSYS_UNCONNECTED_421, SYNOPSYS_UNCONNECTED_422,
         SYNOPSYS_UNCONNECTED_423, SYNOPSYS_UNCONNECTED_424,
         SYNOPSYS_UNCONNECTED_425, SYNOPSYS_UNCONNECTED_426,
         SYNOPSYS_UNCONNECTED_427, SYNOPSYS_UNCONNECTED_428,
         SYNOPSYS_UNCONNECTED_429, SYNOPSYS_UNCONNECTED_430,
         SYNOPSYS_UNCONNECTED_431, SYNOPSYS_UNCONNECTED_432,
         SYNOPSYS_UNCONNECTED_433, SYNOPSYS_UNCONNECTED_434,
         SYNOPSYS_UNCONNECTED_435, SYNOPSYS_UNCONNECTED_436,
         SYNOPSYS_UNCONNECTED_437, SYNOPSYS_UNCONNECTED_438,
         SYNOPSYS_UNCONNECTED_439, SYNOPSYS_UNCONNECTED_440,
         SYNOPSYS_UNCONNECTED_441, SYNOPSYS_UNCONNECTED_442,
         SYNOPSYS_UNCONNECTED_443, SYNOPSYS_UNCONNECTED_444,
         SYNOPSYS_UNCONNECTED_445, SYNOPSYS_UNCONNECTED_446,
         SYNOPSYS_UNCONNECTED_447, SYNOPSYS_UNCONNECTED_448,
         SYNOPSYS_UNCONNECTED_449, SYNOPSYS_UNCONNECTED_450,
         SYNOPSYS_UNCONNECTED_451, SYNOPSYS_UNCONNECTED_452,
         SYNOPSYS_UNCONNECTED_453, SYNOPSYS_UNCONNECTED_454,
         SYNOPSYS_UNCONNECTED_455, SYNOPSYS_UNCONNECTED_456,
         SYNOPSYS_UNCONNECTED_457, SYNOPSYS_UNCONNECTED_458,
         SYNOPSYS_UNCONNECTED_459, SYNOPSYS_UNCONNECTED_460,
         SYNOPSYS_UNCONNECTED_461, SYNOPSYS_UNCONNECTED_462,
         SYNOPSYS_UNCONNECTED_463, SYNOPSYS_UNCONNECTED_464,
         SYNOPSYS_UNCONNECTED_465, SYNOPSYS_UNCONNECTED_466,
         SYNOPSYS_UNCONNECTED_467, SYNOPSYS_UNCONNECTED_468,
         SYNOPSYS_UNCONNECTED_469, SYNOPSYS_UNCONNECTED_470,
         SYNOPSYS_UNCONNECTED_471, SYNOPSYS_UNCONNECTED_472,
         SYNOPSYS_UNCONNECTED_473, SYNOPSYS_UNCONNECTED_474,
         SYNOPSYS_UNCONNECTED_475, SYNOPSYS_UNCONNECTED_476,
         SYNOPSYS_UNCONNECTED_477, SYNOPSYS_UNCONNECTED_478,
         SYNOPSYS_UNCONNECTED_479, SYNOPSYS_UNCONNECTED_480,
         SYNOPSYS_UNCONNECTED_481, SYNOPSYS_UNCONNECTED_482,
         SYNOPSYS_UNCONNECTED_483, SYNOPSYS_UNCONNECTED_484,
         SYNOPSYS_UNCONNECTED_485, SYNOPSYS_UNCONNECTED_486,
         SYNOPSYS_UNCONNECTED_487, SYNOPSYS_UNCONNECTED_488,
         SYNOPSYS_UNCONNECTED_489, SYNOPSYS_UNCONNECTED_490,
         SYNOPSYS_UNCONNECTED_491, SYNOPSYS_UNCONNECTED_492,
         SYNOPSYS_UNCONNECTED_493, SYNOPSYS_UNCONNECTED_494,
         SYNOPSYS_UNCONNECTED_495, SYNOPSYS_UNCONNECTED_496,
         SYNOPSYS_UNCONNECTED_497, SYNOPSYS_UNCONNECTED_498,
         SYNOPSYS_UNCONNECTED_499, SYNOPSYS_UNCONNECTED_500,
         SYNOPSYS_UNCONNECTED_501, SYNOPSYS_UNCONNECTED_502,
         SYNOPSYS_UNCONNECTED_503, SYNOPSYS_UNCONNECTED_504,
         SYNOPSYS_UNCONNECTED_505, SYNOPSYS_UNCONNECTED_506,
         SYNOPSYS_UNCONNECTED_507, SYNOPSYS_UNCONNECTED_508,
         SYNOPSYS_UNCONNECTED_509, SYNOPSYS_UNCONNECTED_510,
         SYNOPSYS_UNCONNECTED_511, SYNOPSYS_UNCONNECTED_512,
         SYNOPSYS_UNCONNECTED_513, SYNOPSYS_UNCONNECTED_514,
         SYNOPSYS_UNCONNECTED_515, SYNOPSYS_UNCONNECTED_516,
         SYNOPSYS_UNCONNECTED_517, SYNOPSYS_UNCONNECTED_518,
         SYNOPSYS_UNCONNECTED_519, SYNOPSYS_UNCONNECTED_520,
         SYNOPSYS_UNCONNECTED_521, SYNOPSYS_UNCONNECTED_522,
         SYNOPSYS_UNCONNECTED_523, SYNOPSYS_UNCONNECTED_524,
         SYNOPSYS_UNCONNECTED_525, SYNOPSYS_UNCONNECTED_526,
         SYNOPSYS_UNCONNECTED_527, SYNOPSYS_UNCONNECTED_528,
         SYNOPSYS_UNCONNECTED_529, SYNOPSYS_UNCONNECTED_530,
         SYNOPSYS_UNCONNECTED_531, SYNOPSYS_UNCONNECTED_532,
         SYNOPSYS_UNCONNECTED_533, SYNOPSYS_UNCONNECTED_534,
         SYNOPSYS_UNCONNECTED_535, SYNOPSYS_UNCONNECTED_536,
         SYNOPSYS_UNCONNECTED_537, SYNOPSYS_UNCONNECTED_538,
         SYNOPSYS_UNCONNECTED_539, SYNOPSYS_UNCONNECTED_540,
         SYNOPSYS_UNCONNECTED_541, SYNOPSYS_UNCONNECTED_542,
         SYNOPSYS_UNCONNECTED_543, SYNOPSYS_UNCONNECTED_544,
         SYNOPSYS_UNCONNECTED_545, SYNOPSYS_UNCONNECTED_546,
         SYNOPSYS_UNCONNECTED_547, SYNOPSYS_UNCONNECTED_548,
         SYNOPSYS_UNCONNECTED_549, SYNOPSYS_UNCONNECTED_550,
         SYNOPSYS_UNCONNECTED_551, SYNOPSYS_UNCONNECTED_552,
         SYNOPSYS_UNCONNECTED_553, SYNOPSYS_UNCONNECTED_554,
         SYNOPSYS_UNCONNECTED_555, SYNOPSYS_UNCONNECTED_556,
         SYNOPSYS_UNCONNECTED_557, SYNOPSYS_UNCONNECTED_558,
         SYNOPSYS_UNCONNECTED_559, SYNOPSYS_UNCONNECTED_560,
         SYNOPSYS_UNCONNECTED_561, SYNOPSYS_UNCONNECTED_562,
         SYNOPSYS_UNCONNECTED_563, SYNOPSYS_UNCONNECTED_564,
         SYNOPSYS_UNCONNECTED_565, SYNOPSYS_UNCONNECTED_566,
         SYNOPSYS_UNCONNECTED_567, SYNOPSYS_UNCONNECTED_568,
         SYNOPSYS_UNCONNECTED_569, SYNOPSYS_UNCONNECTED_570,
         SYNOPSYS_UNCONNECTED_571, SYNOPSYS_UNCONNECTED_572,
         SYNOPSYS_UNCONNECTED_573, SYNOPSYS_UNCONNECTED_574,
         SYNOPSYS_UNCONNECTED_575, SYNOPSYS_UNCONNECTED_576,
         SYNOPSYS_UNCONNECTED_577, SYNOPSYS_UNCONNECTED_578,
         SYNOPSYS_UNCONNECTED_579, SYNOPSYS_UNCONNECTED_580,
         SYNOPSYS_UNCONNECTED_581, SYNOPSYS_UNCONNECTED_582,
         SYNOPSYS_UNCONNECTED_583, SYNOPSYS_UNCONNECTED_584,
         SYNOPSYS_UNCONNECTED_585, SYNOPSYS_UNCONNECTED_586,
         SYNOPSYS_UNCONNECTED_587, SYNOPSYS_UNCONNECTED_588,
         SYNOPSYS_UNCONNECTED_589, SYNOPSYS_UNCONNECTED_590,
         SYNOPSYS_UNCONNECTED_591, SYNOPSYS_UNCONNECTED_592,
         SYNOPSYS_UNCONNECTED_593, SYNOPSYS_UNCONNECTED_594,
         SYNOPSYS_UNCONNECTED_595, SYNOPSYS_UNCONNECTED_596,
         SYNOPSYS_UNCONNECTED_597, SYNOPSYS_UNCONNECTED_598,
         SYNOPSYS_UNCONNECTED_599, SYNOPSYS_UNCONNECTED_600,
         SYNOPSYS_UNCONNECTED_601, SYNOPSYS_UNCONNECTED_602,
         SYNOPSYS_UNCONNECTED_603, SYNOPSYS_UNCONNECTED_604,
         SYNOPSYS_UNCONNECTED_605, SYNOPSYS_UNCONNECTED_606,
         SYNOPSYS_UNCONNECTED_607, SYNOPSYS_UNCONNECTED_608,
         SYNOPSYS_UNCONNECTED_609, SYNOPSYS_UNCONNECTED_610,
         SYNOPSYS_UNCONNECTED_611, SYNOPSYS_UNCONNECTED_612,
         SYNOPSYS_UNCONNECTED_613, SYNOPSYS_UNCONNECTED_614,
         SYNOPSYS_UNCONNECTED_615, SYNOPSYS_UNCONNECTED_616,
         SYNOPSYS_UNCONNECTED_617, SYNOPSYS_UNCONNECTED_618,
         SYNOPSYS_UNCONNECTED_619, SYNOPSYS_UNCONNECTED_620,
         SYNOPSYS_UNCONNECTED_621, SYNOPSYS_UNCONNECTED_622,
         SYNOPSYS_UNCONNECTED_623, SYNOPSYS_UNCONNECTED_624,
         SYNOPSYS_UNCONNECTED_625, SYNOPSYS_UNCONNECTED_626,
         SYNOPSYS_UNCONNECTED_627, SYNOPSYS_UNCONNECTED_628,
         SYNOPSYS_UNCONNECTED_629, SYNOPSYS_UNCONNECTED_630,
         SYNOPSYS_UNCONNECTED_631, SYNOPSYS_UNCONNECTED_632,
         SYNOPSYS_UNCONNECTED_633, SYNOPSYS_UNCONNECTED_634,
         SYNOPSYS_UNCONNECTED_635, SYNOPSYS_UNCONNECTED_636,
         SYNOPSYS_UNCONNECTED_637, SYNOPSYS_UNCONNECTED_638,
         SYNOPSYS_UNCONNECTED_639, SYNOPSYS_UNCONNECTED_640,
         SYNOPSYS_UNCONNECTED_641, SYNOPSYS_UNCONNECTED_642,
         SYNOPSYS_UNCONNECTED_643, SYNOPSYS_UNCONNECTED_644,
         SYNOPSYS_UNCONNECTED_645, SYNOPSYS_UNCONNECTED_646,
         SYNOPSYS_UNCONNECTED_647, SYNOPSYS_UNCONNECTED_648,
         SYNOPSYS_UNCONNECTED_649, SYNOPSYS_UNCONNECTED_650,
         SYNOPSYS_UNCONNECTED_651, SYNOPSYS_UNCONNECTED_652,
         SYNOPSYS_UNCONNECTED_653, SYNOPSYS_UNCONNECTED_654,
         SYNOPSYS_UNCONNECTED_655, SYNOPSYS_UNCONNECTED_656,
         SYNOPSYS_UNCONNECTED_657, SYNOPSYS_UNCONNECTED_658,
         SYNOPSYS_UNCONNECTED_659, SYNOPSYS_UNCONNECTED_660,
         SYNOPSYS_UNCONNECTED_661, SYNOPSYS_UNCONNECTED_662,
         SYNOPSYS_UNCONNECTED_663, SYNOPSYS_UNCONNECTED_664,
         SYNOPSYS_UNCONNECTED_665, SYNOPSYS_UNCONNECTED_666,
         SYNOPSYS_UNCONNECTED_667, SYNOPSYS_UNCONNECTED_668,
         SYNOPSYS_UNCONNECTED_669, SYNOPSYS_UNCONNECTED_670,
         SYNOPSYS_UNCONNECTED_671, SYNOPSYS_UNCONNECTED_672,
         SYNOPSYS_UNCONNECTED_673, SYNOPSYS_UNCONNECTED_674,
         SYNOPSYS_UNCONNECTED_675, SYNOPSYS_UNCONNECTED_676,
         SYNOPSYS_UNCONNECTED_677, SYNOPSYS_UNCONNECTED_678,
         SYNOPSYS_UNCONNECTED_679, SYNOPSYS_UNCONNECTED_680,
         SYNOPSYS_UNCONNECTED_681, SYNOPSYS_UNCONNECTED_682,
         SYNOPSYS_UNCONNECTED_683, SYNOPSYS_UNCONNECTED_684,
         SYNOPSYS_UNCONNECTED_685, SYNOPSYS_UNCONNECTED_686,
         SYNOPSYS_UNCONNECTED_687, SYNOPSYS_UNCONNECTED_688,
         SYNOPSYS_UNCONNECTED_689, SYNOPSYS_UNCONNECTED_690,
         SYNOPSYS_UNCONNECTED_691, SYNOPSYS_UNCONNECTED_692,
         SYNOPSYS_UNCONNECTED_693, SYNOPSYS_UNCONNECTED_694,
         SYNOPSYS_UNCONNECTED_695, SYNOPSYS_UNCONNECTED_696,
         SYNOPSYS_UNCONNECTED_697, SYNOPSYS_UNCONNECTED_698,
         SYNOPSYS_UNCONNECTED_699, SYNOPSYS_UNCONNECTED_700,
         SYNOPSYS_UNCONNECTED_701, SYNOPSYS_UNCONNECTED_702,
         SYNOPSYS_UNCONNECTED_703, SYNOPSYS_UNCONNECTED_704,
         SYNOPSYS_UNCONNECTED_705, SYNOPSYS_UNCONNECTED_706,
         SYNOPSYS_UNCONNECTED_707, SYNOPSYS_UNCONNECTED_708,
         SYNOPSYS_UNCONNECTED_709, SYNOPSYS_UNCONNECTED_710,
         SYNOPSYS_UNCONNECTED_711, SYNOPSYS_UNCONNECTED_712,
         SYNOPSYS_UNCONNECTED_713, SYNOPSYS_UNCONNECTED_714,
         SYNOPSYS_UNCONNECTED_715, SYNOPSYS_UNCONNECTED_716,
         SYNOPSYS_UNCONNECTED_717, SYNOPSYS_UNCONNECTED_718,
         SYNOPSYS_UNCONNECTED_719, SYNOPSYS_UNCONNECTED_720,
         SYNOPSYS_UNCONNECTED_721, SYNOPSYS_UNCONNECTED_722,
         SYNOPSYS_UNCONNECTED_723, SYNOPSYS_UNCONNECTED_724,
         SYNOPSYS_UNCONNECTED_725, SYNOPSYS_UNCONNECTED_726,
         SYNOPSYS_UNCONNECTED_727, SYNOPSYS_UNCONNECTED_728,
         SYNOPSYS_UNCONNECTED_729, SYNOPSYS_UNCONNECTED_730,
         SYNOPSYS_UNCONNECTED_731, SYNOPSYS_UNCONNECTED_732,
         SYNOPSYS_UNCONNECTED_733, SYNOPSYS_UNCONNECTED_734,
         SYNOPSYS_UNCONNECTED_735, SYNOPSYS_UNCONNECTED_736,
         SYNOPSYS_UNCONNECTED_737, SYNOPSYS_UNCONNECTED_738,
         SYNOPSYS_UNCONNECTED_739, SYNOPSYS_UNCONNECTED_740,
         SYNOPSYS_UNCONNECTED_741, SYNOPSYS_UNCONNECTED_742,
         SYNOPSYS_UNCONNECTED_743, SYNOPSYS_UNCONNECTED_744,
         SYNOPSYS_UNCONNECTED_745, SYNOPSYS_UNCONNECTED_746,
         SYNOPSYS_UNCONNECTED_747, SYNOPSYS_UNCONNECTED_748,
         SYNOPSYS_UNCONNECTED_749, SYNOPSYS_UNCONNECTED_750,
         SYNOPSYS_UNCONNECTED_751, SYNOPSYS_UNCONNECTED_752,
         SYNOPSYS_UNCONNECTED_753, SYNOPSYS_UNCONNECTED_754,
         SYNOPSYS_UNCONNECTED_755, SYNOPSYS_UNCONNECTED_756,
         SYNOPSYS_UNCONNECTED_757, SYNOPSYS_UNCONNECTED_758,
         SYNOPSYS_UNCONNECTED_759, SYNOPSYS_UNCONNECTED_760,
         SYNOPSYS_UNCONNECTED_761, SYNOPSYS_UNCONNECTED_762,
         SYNOPSYS_UNCONNECTED_763, SYNOPSYS_UNCONNECTED_764,
         SYNOPSYS_UNCONNECTED_765, SYNOPSYS_UNCONNECTED_766,
         SYNOPSYS_UNCONNECTED_767, SYNOPSYS_UNCONNECTED_768,
         SYNOPSYS_UNCONNECTED_769, SYNOPSYS_UNCONNECTED_770,
         SYNOPSYS_UNCONNECTED_771, SYNOPSYS_UNCONNECTED_772,
         SYNOPSYS_UNCONNECTED_773, SYNOPSYS_UNCONNECTED_774,
         SYNOPSYS_UNCONNECTED_775, SYNOPSYS_UNCONNECTED_776,
         SYNOPSYS_UNCONNECTED_777, SYNOPSYS_UNCONNECTED_778,
         SYNOPSYS_UNCONNECTED_779, SYNOPSYS_UNCONNECTED_780,
         SYNOPSYS_UNCONNECTED_781, SYNOPSYS_UNCONNECTED_782,
         SYNOPSYS_UNCONNECTED_783, SYNOPSYS_UNCONNECTED_784,
         SYNOPSYS_UNCONNECTED_785, SYNOPSYS_UNCONNECTED_786,
         SYNOPSYS_UNCONNECTED_787, SYNOPSYS_UNCONNECTED_788,
         SYNOPSYS_UNCONNECTED_789, SYNOPSYS_UNCONNECTED_790,
         SYNOPSYS_UNCONNECTED_791, SYNOPSYS_UNCONNECTED_792,
         SYNOPSYS_UNCONNECTED_793, SYNOPSYS_UNCONNECTED_794,
         SYNOPSYS_UNCONNECTED_795, SYNOPSYS_UNCONNECTED_796,
         SYNOPSYS_UNCONNECTED_797, SYNOPSYS_UNCONNECTED_798,
         SYNOPSYS_UNCONNECTED_799, SYNOPSYS_UNCONNECTED_800,
         SYNOPSYS_UNCONNECTED_801, SYNOPSYS_UNCONNECTED_802,
         SYNOPSYS_UNCONNECTED_803, SYNOPSYS_UNCONNECTED_804,
         SYNOPSYS_UNCONNECTED_805, SYNOPSYS_UNCONNECTED_806,
         SYNOPSYS_UNCONNECTED_807, SYNOPSYS_UNCONNECTED_808,
         SYNOPSYS_UNCONNECTED_809, SYNOPSYS_UNCONNECTED_810,
         SYNOPSYS_UNCONNECTED_811, SYNOPSYS_UNCONNECTED_812,
         SYNOPSYS_UNCONNECTED_813, SYNOPSYS_UNCONNECTED_814,
         SYNOPSYS_UNCONNECTED_815, SYNOPSYS_UNCONNECTED_816,
         SYNOPSYS_UNCONNECTED_817, SYNOPSYS_UNCONNECTED_818,
         SYNOPSYS_UNCONNECTED_819, SYNOPSYS_UNCONNECTED_820,
         SYNOPSYS_UNCONNECTED_821, SYNOPSYS_UNCONNECTED_822,
         SYNOPSYS_UNCONNECTED_823, SYNOPSYS_UNCONNECTED_824,
         SYNOPSYS_UNCONNECTED_825, SYNOPSYS_UNCONNECTED_826,
         SYNOPSYS_UNCONNECTED_827, SYNOPSYS_UNCONNECTED_828,
         SYNOPSYS_UNCONNECTED_829, SYNOPSYS_UNCONNECTED_830,
         SYNOPSYS_UNCONNECTED_831, SYNOPSYS_UNCONNECTED_832,
         SYNOPSYS_UNCONNECTED_833, SYNOPSYS_UNCONNECTED_834,
         SYNOPSYS_UNCONNECTED_835, SYNOPSYS_UNCONNECTED_836,
         SYNOPSYS_UNCONNECTED_837, SYNOPSYS_UNCONNECTED_838,
         SYNOPSYS_UNCONNECTED_839, SYNOPSYS_UNCONNECTED_840,
         SYNOPSYS_UNCONNECTED_841, SYNOPSYS_UNCONNECTED_842,
         SYNOPSYS_UNCONNECTED_843, SYNOPSYS_UNCONNECTED_844,
         SYNOPSYS_UNCONNECTED_845, SYNOPSYS_UNCONNECTED_846,
         SYNOPSYS_UNCONNECTED_847, SYNOPSYS_UNCONNECTED_848,
         SYNOPSYS_UNCONNECTED_849, SYNOPSYS_UNCONNECTED_850,
         SYNOPSYS_UNCONNECTED_851, SYNOPSYS_UNCONNECTED_852,
         SYNOPSYS_UNCONNECTED_853, SYNOPSYS_UNCONNECTED_854,
         SYNOPSYS_UNCONNECTED_855, SYNOPSYS_UNCONNECTED_856,
         SYNOPSYS_UNCONNECTED_857, SYNOPSYS_UNCONNECTED_858,
         SYNOPSYS_UNCONNECTED_859, SYNOPSYS_UNCONNECTED_860,
         SYNOPSYS_UNCONNECTED_861, SYNOPSYS_UNCONNECTED_862,
         SYNOPSYS_UNCONNECTED_863, SYNOPSYS_UNCONNECTED_864,
         SYNOPSYS_UNCONNECTED_865, SYNOPSYS_UNCONNECTED_866,
         SYNOPSYS_UNCONNECTED_867, SYNOPSYS_UNCONNECTED_868,
         SYNOPSYS_UNCONNECTED_869, SYNOPSYS_UNCONNECTED_870,
         SYNOPSYS_UNCONNECTED_871, SYNOPSYS_UNCONNECTED_872,
         SYNOPSYS_UNCONNECTED_873, SYNOPSYS_UNCONNECTED_874,
         SYNOPSYS_UNCONNECTED_875, SYNOPSYS_UNCONNECTED_876,
         SYNOPSYS_UNCONNECTED_877, SYNOPSYS_UNCONNECTED_878,
         SYNOPSYS_UNCONNECTED_879, SYNOPSYS_UNCONNECTED_880,
         SYNOPSYS_UNCONNECTED_881, SYNOPSYS_UNCONNECTED_882,
         SYNOPSYS_UNCONNECTED_883, SYNOPSYS_UNCONNECTED_884,
         SYNOPSYS_UNCONNECTED_885, SYNOPSYS_UNCONNECTED_886,
         SYNOPSYS_UNCONNECTED_887, SYNOPSYS_UNCONNECTED_888,
         SYNOPSYS_UNCONNECTED_889, SYNOPSYS_UNCONNECTED_890,
         SYNOPSYS_UNCONNECTED_891, SYNOPSYS_UNCONNECTED_892,
         SYNOPSYS_UNCONNECTED_893, SYNOPSYS_UNCONNECTED_894,
         SYNOPSYS_UNCONNECTED_895, SYNOPSYS_UNCONNECTED_896,
         SYNOPSYS_UNCONNECTED_897, SYNOPSYS_UNCONNECTED_898,
         SYNOPSYS_UNCONNECTED_899, SYNOPSYS_UNCONNECTED_900,
         SYNOPSYS_UNCONNECTED_901, SYNOPSYS_UNCONNECTED_902,
         SYNOPSYS_UNCONNECTED_903, SYNOPSYS_UNCONNECTED_904,
         SYNOPSYS_UNCONNECTED_905, SYNOPSYS_UNCONNECTED_906,
         SYNOPSYS_UNCONNECTED_907, SYNOPSYS_UNCONNECTED_908,
         SYNOPSYS_UNCONNECTED_909, SYNOPSYS_UNCONNECTED_910,
         SYNOPSYS_UNCONNECTED_911, SYNOPSYS_UNCONNECTED_912,
         SYNOPSYS_UNCONNECTED_913, SYNOPSYS_UNCONNECTED_914,
         SYNOPSYS_UNCONNECTED_915, SYNOPSYS_UNCONNECTED_916,
         SYNOPSYS_UNCONNECTED_917, SYNOPSYS_UNCONNECTED_918,
         SYNOPSYS_UNCONNECTED_919, SYNOPSYS_UNCONNECTED_920,
         SYNOPSYS_UNCONNECTED_921, SYNOPSYS_UNCONNECTED_922,
         SYNOPSYS_UNCONNECTED_923, SYNOPSYS_UNCONNECTED_924,
         SYNOPSYS_UNCONNECTED_925, SYNOPSYS_UNCONNECTED_926,
         SYNOPSYS_UNCONNECTED_927, SYNOPSYS_UNCONNECTED_928,
         SYNOPSYS_UNCONNECTED_929, SYNOPSYS_UNCONNECTED_930,
         SYNOPSYS_UNCONNECTED_931, SYNOPSYS_UNCONNECTED_932,
         SYNOPSYS_UNCONNECTED_933, SYNOPSYS_UNCONNECTED_934,
         SYNOPSYS_UNCONNECTED_935, SYNOPSYS_UNCONNECTED_936,
         SYNOPSYS_UNCONNECTED_937, SYNOPSYS_UNCONNECTED_938,
         SYNOPSYS_UNCONNECTED_939, SYNOPSYS_UNCONNECTED_940,
         SYNOPSYS_UNCONNECTED_941, SYNOPSYS_UNCONNECTED_942,
         SYNOPSYS_UNCONNECTED_943, SYNOPSYS_UNCONNECTED_944,
         SYNOPSYS_UNCONNECTED_945, SYNOPSYS_UNCONNECTED_946,
         SYNOPSYS_UNCONNECTED_947, SYNOPSYS_UNCONNECTED_948,
         SYNOPSYS_UNCONNECTED_949, SYNOPSYS_UNCONNECTED_950,
         SYNOPSYS_UNCONNECTED_951, SYNOPSYS_UNCONNECTED_952,
         SYNOPSYS_UNCONNECTED_953, SYNOPSYS_UNCONNECTED_954,
         SYNOPSYS_UNCONNECTED_955, SYNOPSYS_UNCONNECTED_956,
         SYNOPSYS_UNCONNECTED_957, SYNOPSYS_UNCONNECTED_958,
         SYNOPSYS_UNCONNECTED_959, SYNOPSYS_UNCONNECTED_960,
         SYNOPSYS_UNCONNECTED_961, SYNOPSYS_UNCONNECTED_962,
         SYNOPSYS_UNCONNECTED_963, SYNOPSYS_UNCONNECTED_964,
         SYNOPSYS_UNCONNECTED_965, SYNOPSYS_UNCONNECTED_966,
         SYNOPSYS_UNCONNECTED_967, SYNOPSYS_UNCONNECTED_968,
         SYNOPSYS_UNCONNECTED_969, SYNOPSYS_UNCONNECTED_970,
         SYNOPSYS_UNCONNECTED_971, SYNOPSYS_UNCONNECTED_972,
         SYNOPSYS_UNCONNECTED_973, SYNOPSYS_UNCONNECTED_974,
         SYNOPSYS_UNCONNECTED_975, SYNOPSYS_UNCONNECTED_976,
         SYNOPSYS_UNCONNECTED_977, SYNOPSYS_UNCONNECTED_978,
         SYNOPSYS_UNCONNECTED_979, SYNOPSYS_UNCONNECTED_980,
         SYNOPSYS_UNCONNECTED_981, SYNOPSYS_UNCONNECTED_982,
         SYNOPSYS_UNCONNECTED_983, SYNOPSYS_UNCONNECTED_984,
         SYNOPSYS_UNCONNECTED_985, SYNOPSYS_UNCONNECTED_986,
         SYNOPSYS_UNCONNECTED_987, SYNOPSYS_UNCONNECTED_988,
         SYNOPSYS_UNCONNECTED_989, SYNOPSYS_UNCONNECTED_990,
         SYNOPSYS_UNCONNECTED_991, SYNOPSYS_UNCONNECTED_992,
         SYNOPSYS_UNCONNECTED_993, SYNOPSYS_UNCONNECTED_994,
         SYNOPSYS_UNCONNECTED_995, SYNOPSYS_UNCONNECTED_996,
         SYNOPSYS_UNCONNECTED_997, SYNOPSYS_UNCONNECTED_998,
         SYNOPSYS_UNCONNECTED_999, SYNOPSYS_UNCONNECTED_1000,
         SYNOPSYS_UNCONNECTED_1001, SYNOPSYS_UNCONNECTED_1002,
         SYNOPSYS_UNCONNECTED_1003, SYNOPSYS_UNCONNECTED_1004,
         SYNOPSYS_UNCONNECTED_1005, SYNOPSYS_UNCONNECTED_1006,
         SYNOPSYS_UNCONNECTED_1007, SYNOPSYS_UNCONNECTED_1008,
         SYNOPSYS_UNCONNECTED_1009, SYNOPSYS_UNCONNECTED_1010,
         SYNOPSYS_UNCONNECTED_1011, SYNOPSYS_UNCONNECTED_1012,
         SYNOPSYS_UNCONNECTED_1013, SYNOPSYS_UNCONNECTED_1014,
         SYNOPSYS_UNCONNECTED_1015, SYNOPSYS_UNCONNECTED_1016,
         SYNOPSYS_UNCONNECTED_1017, SYNOPSYS_UNCONNECTED_1018,
         SYNOPSYS_UNCONNECTED_1019, SYNOPSYS_UNCONNECTED_1020,
         SYNOPSYS_UNCONNECTED_1021, SYNOPSYS_UNCONNECTED_1022,
         SYNOPSYS_UNCONNECTED_1023, SYNOPSYS_UNCONNECTED_1024;
  wire   [0:11] up_si;
  wire   [0:11] up_ro;
  wire   [0:2] right_si;
  wire   [0:2] right_ro;
  wire   [0:11] up_ri;
  wire   [0:14] right_ri;
  wire   [0:11] up_so;
  wire   [0:14] right_so;
  wire   [767:0] up_do;
  wire   [767:0] right_do;

  cardinal_router GY_0__GX_0__R ( .clk(clk), .reset(reset), .up_si(up_si[0]), 
        .down_si(1'b0), .left_si(1'b0), .right_si(right_si[0]), .NIC_si(
        node00_pesi), .up_di({up_di_0__63_, up_di_0__62_, up_di_0__61_, 
        up_di_0__60_, up_di_0__59_, up_di_0__58_, up_di_0__57_, up_di_0__56_, 
        up_di_0__55_, up_di_0__54_, up_di_0__53_, up_di_0__52_, up_di_0__51_, 
        up_di_0__50_, up_di_0__49_, up_di_0__48_, up_di_0__47_, up_di_0__46_, 
        up_di_0__45_, up_di_0__44_, up_di_0__43_, up_di_0__42_, up_di_0__41_, 
        up_di_0__40_, up_di_0__39_, up_di_0__38_, up_di_0__37_, up_di_0__36_, 
        up_di_0__35_, up_di_0__34_, up_di_0__33_, up_di_0__32_, up_di_0__31_, 
        up_di_0__30_, up_di_0__29_, up_di_0__28_, up_di_0__27_, up_di_0__26_, 
        up_di_0__25_, up_di_0__24_, up_di_0__23_, up_di_0__22_, up_di_0__21_, 
        up_di_0__20_, up_di_0__19_, up_di_0__18_, up_di_0__17_, up_di_0__16_, 
        up_di_0__15_, up_di_0__14_, up_di_0__13_, up_di_0__12_, up_di_0__11_, 
        up_di_0__10_, up_di_0__9_, up_di_0__8_, up_di_0__7_, up_di_0__6_, 
        up_di_0__5_, up_di_0__4_, up_di_0__3_, up_di_0__2_, up_di_0__1_, 
        up_di_0__0_}), .down_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .left_di({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .right_di({right_di_0__63_, right_di_0__62_, 
        right_di_0__61_, right_di_0__60_, right_di_0__59_, right_di_0__58_, 
        right_di_0__57_, right_di_0__56_, right_di_0__55_, right_di_0__54_, 
        right_di_0__53_, right_di_0__52_, right_di_0__51_, right_di_0__50_, 
        right_di_0__49_, right_di_0__48_, right_di_0__47_, right_di_0__46_, 
        right_di_0__45_, right_di_0__44_, right_di_0__43_, right_di_0__42_, 
        right_di_0__41_, right_di_0__40_, right_di_0__39_, right_di_0__38_, 
        right_di_0__37_, right_di_0__36_, right_di_0__35_, right_di_0__34_, 
        right_di_0__33_, right_di_0__32_, right_di_0__31_, right_di_0__30_, 
        right_di_0__29_, right_di_0__28_, right_di_0__27_, right_di_0__26_, 
        right_di_0__25_, right_di_0__24_, right_di_0__23_, right_di_0__22_, 
        right_di_0__21_, right_di_0__20_, right_di_0__19_, right_di_0__18_, 
        right_di_0__17_, right_di_0__16_, right_di_0__15_, right_di_0__14_, 
        right_di_0__13_, right_di_0__12_, right_di_0__11_, right_di_0__10_, 
        right_di_0__9_, right_di_0__8_, right_di_0__7_, right_di_0__6_, 
        right_di_0__5_, right_di_0__4_, right_di_0__3_, right_di_0__2_, 
        right_di_0__1_, right_di_0__0_}), .NIC_di(node00_pedi), .up_ri(
        up_ri[0]), .right_ri(right_ri[0]), .NIC_ri(node00_peri), .up_so(
        up_so[0]), .right_so(right_so[0]), .NIC_so(node00_peso), .up_do(
        up_do[767:704]), .down_do({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, 
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, 
        SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25, 
        SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27, 
        SYNOPSYS_UNCONNECTED_28, SYNOPSYS_UNCONNECTED_29, 
        SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31, 
        SYNOPSYS_UNCONNECTED_32, SYNOPSYS_UNCONNECTED_33, 
        SYNOPSYS_UNCONNECTED_34, SYNOPSYS_UNCONNECTED_35, 
        SYNOPSYS_UNCONNECTED_36, SYNOPSYS_UNCONNECTED_37, 
        SYNOPSYS_UNCONNECTED_38, SYNOPSYS_UNCONNECTED_39, 
        SYNOPSYS_UNCONNECTED_40, SYNOPSYS_UNCONNECTED_41, 
        SYNOPSYS_UNCONNECTED_42, SYNOPSYS_UNCONNECTED_43, 
        SYNOPSYS_UNCONNECTED_44, SYNOPSYS_UNCONNECTED_45, 
        SYNOPSYS_UNCONNECTED_46, SYNOPSYS_UNCONNECTED_47, 
        SYNOPSYS_UNCONNECTED_48, SYNOPSYS_UNCONNECTED_49, 
        SYNOPSYS_UNCONNECTED_50, SYNOPSYS_UNCONNECTED_51, 
        SYNOPSYS_UNCONNECTED_52, SYNOPSYS_UNCONNECTED_53, 
        SYNOPSYS_UNCONNECTED_54, SYNOPSYS_UNCONNECTED_55, 
        SYNOPSYS_UNCONNECTED_56, SYNOPSYS_UNCONNECTED_57, 
        SYNOPSYS_UNCONNECTED_58, SYNOPSYS_UNCONNECTED_59, 
        SYNOPSYS_UNCONNECTED_60, SYNOPSYS_UNCONNECTED_61, 
        SYNOPSYS_UNCONNECTED_62, SYNOPSYS_UNCONNECTED_63, 
        SYNOPSYS_UNCONNECTED_64}), .left_do({SYNOPSYS_UNCONNECTED_65, 
        SYNOPSYS_UNCONNECTED_66, SYNOPSYS_UNCONNECTED_67, 
        SYNOPSYS_UNCONNECTED_68, SYNOPSYS_UNCONNECTED_69, 
        SYNOPSYS_UNCONNECTED_70, SYNOPSYS_UNCONNECTED_71, 
        SYNOPSYS_UNCONNECTED_72, SYNOPSYS_UNCONNECTED_73, 
        SYNOPSYS_UNCONNECTED_74, SYNOPSYS_UNCONNECTED_75, 
        SYNOPSYS_UNCONNECTED_76, SYNOPSYS_UNCONNECTED_77, 
        SYNOPSYS_UNCONNECTED_78, SYNOPSYS_UNCONNECTED_79, 
        SYNOPSYS_UNCONNECTED_80, SYNOPSYS_UNCONNECTED_81, 
        SYNOPSYS_UNCONNECTED_82, SYNOPSYS_UNCONNECTED_83, 
        SYNOPSYS_UNCONNECTED_84, SYNOPSYS_UNCONNECTED_85, 
        SYNOPSYS_UNCONNECTED_86, SYNOPSYS_UNCONNECTED_87, 
        SYNOPSYS_UNCONNECTED_88, SYNOPSYS_UNCONNECTED_89, 
        SYNOPSYS_UNCONNECTED_90, SYNOPSYS_UNCONNECTED_91, 
        SYNOPSYS_UNCONNECTED_92, SYNOPSYS_UNCONNECTED_93, 
        SYNOPSYS_UNCONNECTED_94, SYNOPSYS_UNCONNECTED_95, 
        SYNOPSYS_UNCONNECTED_96, SYNOPSYS_UNCONNECTED_97, 
        SYNOPSYS_UNCONNECTED_98, SYNOPSYS_UNCONNECTED_99, 
        SYNOPSYS_UNCONNECTED_100, SYNOPSYS_UNCONNECTED_101, 
        SYNOPSYS_UNCONNECTED_102, SYNOPSYS_UNCONNECTED_103, 
        SYNOPSYS_UNCONNECTED_104, SYNOPSYS_UNCONNECTED_105, 
        SYNOPSYS_UNCONNECTED_106, SYNOPSYS_UNCONNECTED_107, 
        SYNOPSYS_UNCONNECTED_108, SYNOPSYS_UNCONNECTED_109, 
        SYNOPSYS_UNCONNECTED_110, SYNOPSYS_UNCONNECTED_111, 
        SYNOPSYS_UNCONNECTED_112, SYNOPSYS_UNCONNECTED_113, 
        SYNOPSYS_UNCONNECTED_114, SYNOPSYS_UNCONNECTED_115, 
        SYNOPSYS_UNCONNECTED_116, SYNOPSYS_UNCONNECTED_117, 
        SYNOPSYS_UNCONNECTED_118, SYNOPSYS_UNCONNECTED_119, 
        SYNOPSYS_UNCONNECTED_120, SYNOPSYS_UNCONNECTED_121, 
        SYNOPSYS_UNCONNECTED_122, SYNOPSYS_UNCONNECTED_123, 
        SYNOPSYS_UNCONNECTED_124, SYNOPSYS_UNCONNECTED_125, 
        SYNOPSYS_UNCONNECTED_126, SYNOPSYS_UNCONNECTED_127, 
        SYNOPSYS_UNCONNECTED_128}), .right_do(right_do[767:704]), .NIC_do(
        node00_pedo), .up_ro(up_ro[0]), .down_ro(1'b0), .left_ro(1'b0), 
        .right_ro(right_ro[0]), .NIC_ro(node00_pero), .polarity_to_NIC(
        node00_polarity) );
  cardinal_router GY_0__GX_1__R ( .clk(clk), .reset(reset), .up_si(up_si[1]), 
        .down_si(1'b0), .left_si(right_so[0]), .right_si(right_si[1]), 
        .NIC_si(node10_pesi), .up_di({up_di_1__63_, up_di_1__62_, up_di_1__61_, 
        up_di_1__60_, up_di_1__59_, up_di_1__58_, up_di_1__57_, up_di_1__56_, 
        up_di_1__55_, up_di_1__54_, up_di_1__53_, up_di_1__52_, up_di_1__51_, 
        up_di_1__50_, up_di_1__49_, up_di_1__48_, up_di_1__47_, up_di_1__46_, 
        up_di_1__45_, up_di_1__44_, up_di_1__43_, up_di_1__42_, up_di_1__41_, 
        up_di_1__40_, up_di_1__39_, up_di_1__38_, up_di_1__37_, up_di_1__36_, 
        up_di_1__35_, up_di_1__34_, up_di_1__33_, up_di_1__32_, up_di_1__31_, 
        up_di_1__30_, up_di_1__29_, up_di_1__28_, up_di_1__27_, up_di_1__26_, 
        up_di_1__25_, up_di_1__24_, up_di_1__23_, up_di_1__22_, up_di_1__21_, 
        up_di_1__20_, up_di_1__19_, up_di_1__18_, up_di_1__17_, up_di_1__16_, 
        up_di_1__15_, up_di_1__14_, up_di_1__13_, up_di_1__12_, up_di_1__11_, 
        up_di_1__10_, up_di_1__9_, up_di_1__8_, up_di_1__7_, up_di_1__6_, 
        up_di_1__5_, up_di_1__4_, up_di_1__3_, up_di_1__2_, up_di_1__1_, 
        up_di_1__0_}), .down_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .left_di(
        right_do[767:704]), .right_di({right_di_1__63_, right_di_1__62_, 
        right_di_1__61_, right_di_1__60_, right_di_1__59_, right_di_1__58_, 
        right_di_1__57_, right_di_1__56_, right_di_1__55_, right_di_1__54_, 
        right_di_1__53_, right_di_1__52_, right_di_1__51_, right_di_1__50_, 
        right_di_1__49_, right_di_1__48_, right_di_1__47_, right_di_1__46_, 
        right_di_1__45_, right_di_1__44_, right_di_1__43_, right_di_1__42_, 
        right_di_1__41_, right_di_1__40_, right_di_1__39_, right_di_1__38_, 
        right_di_1__37_, right_di_1__36_, right_di_1__35_, right_di_1__34_, 
        right_di_1__33_, right_di_1__32_, right_di_1__31_, right_di_1__30_, 
        right_di_1__29_, right_di_1__28_, right_di_1__27_, right_di_1__26_, 
        right_di_1__25_, right_di_1__24_, right_di_1__23_, right_di_1__22_, 
        right_di_1__21_, right_di_1__20_, right_di_1__19_, right_di_1__18_, 
        right_di_1__17_, right_di_1__16_, right_di_1__15_, right_di_1__14_, 
        right_di_1__13_, right_di_1__12_, right_di_1__11_, right_di_1__10_, 
        right_di_1__9_, right_di_1__8_, right_di_1__7_, right_di_1__6_, 
        right_di_1__5_, right_di_1__4_, right_di_1__3_, right_di_1__2_, 
        right_di_1__1_, right_di_1__0_}), .NIC_di(node10_pedi), .up_ri(
        up_ri[1]), .left_ri(right_ro[0]), .right_ri(right_ri[1]), .NIC_ri(
        node10_peri), .up_so(up_so[1]), .left_so(right_si[0]), .right_so(
        right_so[1]), .NIC_so(node10_peso), .up_do(up_do[703:640]), .down_do({
        SYNOPSYS_UNCONNECTED_129, SYNOPSYS_UNCONNECTED_130, 
        SYNOPSYS_UNCONNECTED_131, SYNOPSYS_UNCONNECTED_132, 
        SYNOPSYS_UNCONNECTED_133, SYNOPSYS_UNCONNECTED_134, 
        SYNOPSYS_UNCONNECTED_135, SYNOPSYS_UNCONNECTED_136, 
        SYNOPSYS_UNCONNECTED_137, SYNOPSYS_UNCONNECTED_138, 
        SYNOPSYS_UNCONNECTED_139, SYNOPSYS_UNCONNECTED_140, 
        SYNOPSYS_UNCONNECTED_141, SYNOPSYS_UNCONNECTED_142, 
        SYNOPSYS_UNCONNECTED_143, SYNOPSYS_UNCONNECTED_144, 
        SYNOPSYS_UNCONNECTED_145, SYNOPSYS_UNCONNECTED_146, 
        SYNOPSYS_UNCONNECTED_147, SYNOPSYS_UNCONNECTED_148, 
        SYNOPSYS_UNCONNECTED_149, SYNOPSYS_UNCONNECTED_150, 
        SYNOPSYS_UNCONNECTED_151, SYNOPSYS_UNCONNECTED_152, 
        SYNOPSYS_UNCONNECTED_153, SYNOPSYS_UNCONNECTED_154, 
        SYNOPSYS_UNCONNECTED_155, SYNOPSYS_UNCONNECTED_156, 
        SYNOPSYS_UNCONNECTED_157, SYNOPSYS_UNCONNECTED_158, 
        SYNOPSYS_UNCONNECTED_159, SYNOPSYS_UNCONNECTED_160, 
        SYNOPSYS_UNCONNECTED_161, SYNOPSYS_UNCONNECTED_162, 
        SYNOPSYS_UNCONNECTED_163, SYNOPSYS_UNCONNECTED_164, 
        SYNOPSYS_UNCONNECTED_165, SYNOPSYS_UNCONNECTED_166, 
        SYNOPSYS_UNCONNECTED_167, SYNOPSYS_UNCONNECTED_168, 
        SYNOPSYS_UNCONNECTED_169, SYNOPSYS_UNCONNECTED_170, 
        SYNOPSYS_UNCONNECTED_171, SYNOPSYS_UNCONNECTED_172, 
        SYNOPSYS_UNCONNECTED_173, SYNOPSYS_UNCONNECTED_174, 
        SYNOPSYS_UNCONNECTED_175, SYNOPSYS_UNCONNECTED_176, 
        SYNOPSYS_UNCONNECTED_177, SYNOPSYS_UNCONNECTED_178, 
        SYNOPSYS_UNCONNECTED_179, SYNOPSYS_UNCONNECTED_180, 
        SYNOPSYS_UNCONNECTED_181, SYNOPSYS_UNCONNECTED_182, 
        SYNOPSYS_UNCONNECTED_183, SYNOPSYS_UNCONNECTED_184, 
        SYNOPSYS_UNCONNECTED_185, SYNOPSYS_UNCONNECTED_186, 
        SYNOPSYS_UNCONNECTED_187, SYNOPSYS_UNCONNECTED_188, 
        SYNOPSYS_UNCONNECTED_189, SYNOPSYS_UNCONNECTED_190, 
        SYNOPSYS_UNCONNECTED_191, SYNOPSYS_UNCONNECTED_192}), .left_do({
        right_di_0__63_, right_di_0__62_, right_di_0__61_, right_di_0__60_, 
        right_di_0__59_, right_di_0__58_, right_di_0__57_, right_di_0__56_, 
        right_di_0__55_, right_di_0__54_, right_di_0__53_, right_di_0__52_, 
        right_di_0__51_, right_di_0__50_, right_di_0__49_, right_di_0__48_, 
        right_di_0__47_, right_di_0__46_, right_di_0__45_, right_di_0__44_, 
        right_di_0__43_, right_di_0__42_, right_di_0__41_, right_di_0__40_, 
        right_di_0__39_, right_di_0__38_, right_di_0__37_, right_di_0__36_, 
        right_di_0__35_, right_di_0__34_, right_di_0__33_, right_di_0__32_, 
        right_di_0__31_, right_di_0__30_, right_di_0__29_, right_di_0__28_, 
        right_di_0__27_, right_di_0__26_, right_di_0__25_, right_di_0__24_, 
        right_di_0__23_, right_di_0__22_, right_di_0__21_, right_di_0__20_, 
        right_di_0__19_, right_di_0__18_, right_di_0__17_, right_di_0__16_, 
        right_di_0__15_, right_di_0__14_, right_di_0__13_, right_di_0__12_, 
        right_di_0__11_, right_di_0__10_, right_di_0__9_, right_di_0__8_, 
        right_di_0__7_, right_di_0__6_, right_di_0__5_, right_di_0__4_, 
        right_di_0__3_, right_di_0__2_, right_di_0__1_, right_di_0__0_}), 
        .right_do(right_do[703:640]), .NIC_do(node10_pedo), .up_ro(up_ro[1]), 
        .down_ro(1'b0), .left_ro(right_ri[0]), .right_ro(right_ro[1]), 
        .NIC_ro(node10_pero), .polarity_to_NIC(node10_polarity) );
  cardinal_router GY_0__GX_2__R ( .clk(clk), .reset(reset), .up_si(up_si[2]), 
        .down_si(1'b0), .left_si(right_so[1]), .right_si(right_si[2]), 
        .NIC_si(node20_pesi), .up_di({up_di_2__63_, up_di_2__62_, up_di_2__61_, 
        up_di_2__60_, up_di_2__59_, up_di_2__58_, up_di_2__57_, up_di_2__56_, 
        up_di_2__55_, up_di_2__54_, up_di_2__53_, up_di_2__52_, up_di_2__51_, 
        up_di_2__50_, up_di_2__49_, up_di_2__48_, up_di_2__47_, up_di_2__46_, 
        up_di_2__45_, up_di_2__44_, up_di_2__43_, up_di_2__42_, up_di_2__41_, 
        up_di_2__40_, up_di_2__39_, up_di_2__38_, up_di_2__37_, up_di_2__36_, 
        up_di_2__35_, up_di_2__34_, up_di_2__33_, up_di_2__32_, up_di_2__31_, 
        up_di_2__30_, up_di_2__29_, up_di_2__28_, up_di_2__27_, up_di_2__26_, 
        up_di_2__25_, up_di_2__24_, up_di_2__23_, up_di_2__22_, up_di_2__21_, 
        up_di_2__20_, up_di_2__19_, up_di_2__18_, up_di_2__17_, up_di_2__16_, 
        up_di_2__15_, up_di_2__14_, up_di_2__13_, up_di_2__12_, up_di_2__11_, 
        up_di_2__10_, up_di_2__9_, up_di_2__8_, up_di_2__7_, up_di_2__6_, 
        up_di_2__5_, up_di_2__4_, up_di_2__3_, up_di_2__2_, up_di_2__1_, 
        up_di_2__0_}), .down_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .left_di(
        right_do[703:640]), .right_di({right_di_2__63_, right_di_2__62_, 
        right_di_2__61_, right_di_2__60_, right_di_2__59_, right_di_2__58_, 
        right_di_2__57_, right_di_2__56_, right_di_2__55_, right_di_2__54_, 
        right_di_2__53_, right_di_2__52_, right_di_2__51_, right_di_2__50_, 
        right_di_2__49_, right_di_2__48_, right_di_2__47_, right_di_2__46_, 
        right_di_2__45_, right_di_2__44_, right_di_2__43_, right_di_2__42_, 
        right_di_2__41_, right_di_2__40_, right_di_2__39_, right_di_2__38_, 
        right_di_2__37_, right_di_2__36_, right_di_2__35_, right_di_2__34_, 
        right_di_2__33_, right_di_2__32_, right_di_2__31_, right_di_2__30_, 
        right_di_2__29_, right_di_2__28_, right_di_2__27_, right_di_2__26_, 
        right_di_2__25_, right_di_2__24_, right_di_2__23_, right_di_2__22_, 
        right_di_2__21_, right_di_2__20_, right_di_2__19_, right_di_2__18_, 
        right_di_2__17_, right_di_2__16_, right_di_2__15_, right_di_2__14_, 
        right_di_2__13_, right_di_2__12_, right_di_2__11_, right_di_2__10_, 
        right_di_2__9_, right_di_2__8_, right_di_2__7_, right_di_2__6_, 
        right_di_2__5_, right_di_2__4_, right_di_2__3_, right_di_2__2_, 
        right_di_2__1_, right_di_2__0_}), .NIC_di(node20_pedi), .up_ri(
        up_ri[2]), .left_ri(right_ro[1]), .right_ri(right_ri[2]), .NIC_ri(
        node20_peri), .up_so(up_so[2]), .left_so(right_si[1]), .right_so(
        right_so[2]), .NIC_so(node20_peso), .up_do(up_do[639:576]), .down_do({
        SYNOPSYS_UNCONNECTED_193, SYNOPSYS_UNCONNECTED_194, 
        SYNOPSYS_UNCONNECTED_195, SYNOPSYS_UNCONNECTED_196, 
        SYNOPSYS_UNCONNECTED_197, SYNOPSYS_UNCONNECTED_198, 
        SYNOPSYS_UNCONNECTED_199, SYNOPSYS_UNCONNECTED_200, 
        SYNOPSYS_UNCONNECTED_201, SYNOPSYS_UNCONNECTED_202, 
        SYNOPSYS_UNCONNECTED_203, SYNOPSYS_UNCONNECTED_204, 
        SYNOPSYS_UNCONNECTED_205, SYNOPSYS_UNCONNECTED_206, 
        SYNOPSYS_UNCONNECTED_207, SYNOPSYS_UNCONNECTED_208, 
        SYNOPSYS_UNCONNECTED_209, SYNOPSYS_UNCONNECTED_210, 
        SYNOPSYS_UNCONNECTED_211, SYNOPSYS_UNCONNECTED_212, 
        SYNOPSYS_UNCONNECTED_213, SYNOPSYS_UNCONNECTED_214, 
        SYNOPSYS_UNCONNECTED_215, SYNOPSYS_UNCONNECTED_216, 
        SYNOPSYS_UNCONNECTED_217, SYNOPSYS_UNCONNECTED_218, 
        SYNOPSYS_UNCONNECTED_219, SYNOPSYS_UNCONNECTED_220, 
        SYNOPSYS_UNCONNECTED_221, SYNOPSYS_UNCONNECTED_222, 
        SYNOPSYS_UNCONNECTED_223, SYNOPSYS_UNCONNECTED_224, 
        SYNOPSYS_UNCONNECTED_225, SYNOPSYS_UNCONNECTED_226, 
        SYNOPSYS_UNCONNECTED_227, SYNOPSYS_UNCONNECTED_228, 
        SYNOPSYS_UNCONNECTED_229, SYNOPSYS_UNCONNECTED_230, 
        SYNOPSYS_UNCONNECTED_231, SYNOPSYS_UNCONNECTED_232, 
        SYNOPSYS_UNCONNECTED_233, SYNOPSYS_UNCONNECTED_234, 
        SYNOPSYS_UNCONNECTED_235, SYNOPSYS_UNCONNECTED_236, 
        SYNOPSYS_UNCONNECTED_237, SYNOPSYS_UNCONNECTED_238, 
        SYNOPSYS_UNCONNECTED_239, SYNOPSYS_UNCONNECTED_240, 
        SYNOPSYS_UNCONNECTED_241, SYNOPSYS_UNCONNECTED_242, 
        SYNOPSYS_UNCONNECTED_243, SYNOPSYS_UNCONNECTED_244, 
        SYNOPSYS_UNCONNECTED_245, SYNOPSYS_UNCONNECTED_246, 
        SYNOPSYS_UNCONNECTED_247, SYNOPSYS_UNCONNECTED_248, 
        SYNOPSYS_UNCONNECTED_249, SYNOPSYS_UNCONNECTED_250, 
        SYNOPSYS_UNCONNECTED_251, SYNOPSYS_UNCONNECTED_252, 
        SYNOPSYS_UNCONNECTED_253, SYNOPSYS_UNCONNECTED_254, 
        SYNOPSYS_UNCONNECTED_255, SYNOPSYS_UNCONNECTED_256}), .left_do({
        right_di_1__63_, right_di_1__62_, right_di_1__61_, right_di_1__60_, 
        right_di_1__59_, right_di_1__58_, right_di_1__57_, right_di_1__56_, 
        right_di_1__55_, right_di_1__54_, right_di_1__53_, right_di_1__52_, 
        right_di_1__51_, right_di_1__50_, right_di_1__49_, right_di_1__48_, 
        right_di_1__47_, right_di_1__46_, right_di_1__45_, right_di_1__44_, 
        right_di_1__43_, right_di_1__42_, right_di_1__41_, right_di_1__40_, 
        right_di_1__39_, right_di_1__38_, right_di_1__37_, right_di_1__36_, 
        right_di_1__35_, right_di_1__34_, right_di_1__33_, right_di_1__32_, 
        right_di_1__31_, right_di_1__30_, right_di_1__29_, right_di_1__28_, 
        right_di_1__27_, right_di_1__26_, right_di_1__25_, right_di_1__24_, 
        right_di_1__23_, right_di_1__22_, right_di_1__21_, right_di_1__20_, 
        right_di_1__19_, right_di_1__18_, right_di_1__17_, right_di_1__16_, 
        right_di_1__15_, right_di_1__14_, right_di_1__13_, right_di_1__12_, 
        right_di_1__11_, right_di_1__10_, right_di_1__9_, right_di_1__8_, 
        right_di_1__7_, right_di_1__6_, right_di_1__5_, right_di_1__4_, 
        right_di_1__3_, right_di_1__2_, right_di_1__1_, right_di_1__0_}), 
        .right_do(right_do[639:576]), .NIC_do(node20_pedo), .up_ro(up_ro[2]), 
        .down_ro(1'b0), .left_ro(right_ri[1]), .right_ro(right_ro[2]), 
        .NIC_ro(node20_pero), .polarity_to_NIC(node20_polarity) );
  cardinal_router GY_0__GX_3__R ( .clk(clk), .reset(reset), .up_si(up_si[3]), 
        .down_si(1'b0), .left_si(right_so[2]), .right_si(1'b0), .NIC_si(
        node30_pesi), .up_di({up_di_3__63_, up_di_3__62_, up_di_3__61_, 
        up_di_3__60_, up_di_3__59_, up_di_3__58_, up_di_3__57_, up_di_3__56_, 
        up_di_3__55_, up_di_3__54_, up_di_3__53_, up_di_3__52_, up_di_3__51_, 
        up_di_3__50_, up_di_3__49_, up_di_3__48_, up_di_3__47_, up_di_3__46_, 
        up_di_3__45_, up_di_3__44_, up_di_3__43_, up_di_3__42_, up_di_3__41_, 
        up_di_3__40_, up_di_3__39_, up_di_3__38_, up_di_3__37_, up_di_3__36_, 
        up_di_3__35_, up_di_3__34_, up_di_3__33_, up_di_3__32_, up_di_3__31_, 
        up_di_3__30_, up_di_3__29_, up_di_3__28_, up_di_3__27_, up_di_3__26_, 
        up_di_3__25_, up_di_3__24_, up_di_3__23_, up_di_3__22_, up_di_3__21_, 
        up_di_3__20_, up_di_3__19_, up_di_3__18_, up_di_3__17_, up_di_3__16_, 
        up_di_3__15_, up_di_3__14_, up_di_3__13_, up_di_3__12_, up_di_3__11_, 
        up_di_3__10_, up_di_3__9_, up_di_3__8_, up_di_3__7_, up_di_3__6_, 
        up_di_3__5_, up_di_3__4_, up_di_3__3_, up_di_3__2_, up_di_3__1_, 
        up_di_3__0_}), .down_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .left_di(
        right_do[639:576]), .right_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .NIC_di(
        node30_pedi), .up_ri(up_ri[3]), .left_ri(right_ro[2]), .NIC_ri(
        node30_peri), .up_so(up_so[3]), .left_so(right_si[2]), .NIC_so(
        node30_peso), .up_do(up_do[575:512]), .down_do({
        SYNOPSYS_UNCONNECTED_257, SYNOPSYS_UNCONNECTED_258, 
        SYNOPSYS_UNCONNECTED_259, SYNOPSYS_UNCONNECTED_260, 
        SYNOPSYS_UNCONNECTED_261, SYNOPSYS_UNCONNECTED_262, 
        SYNOPSYS_UNCONNECTED_263, SYNOPSYS_UNCONNECTED_264, 
        SYNOPSYS_UNCONNECTED_265, SYNOPSYS_UNCONNECTED_266, 
        SYNOPSYS_UNCONNECTED_267, SYNOPSYS_UNCONNECTED_268, 
        SYNOPSYS_UNCONNECTED_269, SYNOPSYS_UNCONNECTED_270, 
        SYNOPSYS_UNCONNECTED_271, SYNOPSYS_UNCONNECTED_272, 
        SYNOPSYS_UNCONNECTED_273, SYNOPSYS_UNCONNECTED_274, 
        SYNOPSYS_UNCONNECTED_275, SYNOPSYS_UNCONNECTED_276, 
        SYNOPSYS_UNCONNECTED_277, SYNOPSYS_UNCONNECTED_278, 
        SYNOPSYS_UNCONNECTED_279, SYNOPSYS_UNCONNECTED_280, 
        SYNOPSYS_UNCONNECTED_281, SYNOPSYS_UNCONNECTED_282, 
        SYNOPSYS_UNCONNECTED_283, SYNOPSYS_UNCONNECTED_284, 
        SYNOPSYS_UNCONNECTED_285, SYNOPSYS_UNCONNECTED_286, 
        SYNOPSYS_UNCONNECTED_287, SYNOPSYS_UNCONNECTED_288, 
        SYNOPSYS_UNCONNECTED_289, SYNOPSYS_UNCONNECTED_290, 
        SYNOPSYS_UNCONNECTED_291, SYNOPSYS_UNCONNECTED_292, 
        SYNOPSYS_UNCONNECTED_293, SYNOPSYS_UNCONNECTED_294, 
        SYNOPSYS_UNCONNECTED_295, SYNOPSYS_UNCONNECTED_296, 
        SYNOPSYS_UNCONNECTED_297, SYNOPSYS_UNCONNECTED_298, 
        SYNOPSYS_UNCONNECTED_299, SYNOPSYS_UNCONNECTED_300, 
        SYNOPSYS_UNCONNECTED_301, SYNOPSYS_UNCONNECTED_302, 
        SYNOPSYS_UNCONNECTED_303, SYNOPSYS_UNCONNECTED_304, 
        SYNOPSYS_UNCONNECTED_305, SYNOPSYS_UNCONNECTED_306, 
        SYNOPSYS_UNCONNECTED_307, SYNOPSYS_UNCONNECTED_308, 
        SYNOPSYS_UNCONNECTED_309, SYNOPSYS_UNCONNECTED_310, 
        SYNOPSYS_UNCONNECTED_311, SYNOPSYS_UNCONNECTED_312, 
        SYNOPSYS_UNCONNECTED_313, SYNOPSYS_UNCONNECTED_314, 
        SYNOPSYS_UNCONNECTED_315, SYNOPSYS_UNCONNECTED_316, 
        SYNOPSYS_UNCONNECTED_317, SYNOPSYS_UNCONNECTED_318, 
        SYNOPSYS_UNCONNECTED_319, SYNOPSYS_UNCONNECTED_320}), .left_do({
        right_di_2__63_, right_di_2__62_, right_di_2__61_, right_di_2__60_, 
        right_di_2__59_, right_di_2__58_, right_di_2__57_, right_di_2__56_, 
        right_di_2__55_, right_di_2__54_, right_di_2__53_, right_di_2__52_, 
        right_di_2__51_, right_di_2__50_, right_di_2__49_, right_di_2__48_, 
        right_di_2__47_, right_di_2__46_, right_di_2__45_, right_di_2__44_, 
        right_di_2__43_, right_di_2__42_, right_di_2__41_, right_di_2__40_, 
        right_di_2__39_, right_di_2__38_, right_di_2__37_, right_di_2__36_, 
        right_di_2__35_, right_di_2__34_, right_di_2__33_, right_di_2__32_, 
        right_di_2__31_, right_di_2__30_, right_di_2__29_, right_di_2__28_, 
        right_di_2__27_, right_di_2__26_, right_di_2__25_, right_di_2__24_, 
        right_di_2__23_, right_di_2__22_, right_di_2__21_, right_di_2__20_, 
        right_di_2__19_, right_di_2__18_, right_di_2__17_, right_di_2__16_, 
        right_di_2__15_, right_di_2__14_, right_di_2__13_, right_di_2__12_, 
        right_di_2__11_, right_di_2__10_, right_di_2__9_, right_di_2__8_, 
        right_di_2__7_, right_di_2__6_, right_di_2__5_, right_di_2__4_, 
        right_di_2__3_, right_di_2__2_, right_di_2__1_, right_di_2__0_}), 
        .right_do({SYNOPSYS_UNCONNECTED_321, SYNOPSYS_UNCONNECTED_322, 
        SYNOPSYS_UNCONNECTED_323, SYNOPSYS_UNCONNECTED_324, 
        SYNOPSYS_UNCONNECTED_325, SYNOPSYS_UNCONNECTED_326, 
        SYNOPSYS_UNCONNECTED_327, SYNOPSYS_UNCONNECTED_328, 
        SYNOPSYS_UNCONNECTED_329, SYNOPSYS_UNCONNECTED_330, 
        SYNOPSYS_UNCONNECTED_331, SYNOPSYS_UNCONNECTED_332, 
        SYNOPSYS_UNCONNECTED_333, SYNOPSYS_UNCONNECTED_334, 
        SYNOPSYS_UNCONNECTED_335, SYNOPSYS_UNCONNECTED_336, 
        SYNOPSYS_UNCONNECTED_337, SYNOPSYS_UNCONNECTED_338, 
        SYNOPSYS_UNCONNECTED_339, SYNOPSYS_UNCONNECTED_340, 
        SYNOPSYS_UNCONNECTED_341, SYNOPSYS_UNCONNECTED_342, 
        SYNOPSYS_UNCONNECTED_343, SYNOPSYS_UNCONNECTED_344, 
        SYNOPSYS_UNCONNECTED_345, SYNOPSYS_UNCONNECTED_346, 
        SYNOPSYS_UNCONNECTED_347, SYNOPSYS_UNCONNECTED_348, 
        SYNOPSYS_UNCONNECTED_349, SYNOPSYS_UNCONNECTED_350, 
        SYNOPSYS_UNCONNECTED_351, SYNOPSYS_UNCONNECTED_352, 
        SYNOPSYS_UNCONNECTED_353, SYNOPSYS_UNCONNECTED_354, 
        SYNOPSYS_UNCONNECTED_355, SYNOPSYS_UNCONNECTED_356, 
        SYNOPSYS_UNCONNECTED_357, SYNOPSYS_UNCONNECTED_358, 
        SYNOPSYS_UNCONNECTED_359, SYNOPSYS_UNCONNECTED_360, 
        SYNOPSYS_UNCONNECTED_361, SYNOPSYS_UNCONNECTED_362, 
        SYNOPSYS_UNCONNECTED_363, SYNOPSYS_UNCONNECTED_364, 
        SYNOPSYS_UNCONNECTED_365, SYNOPSYS_UNCONNECTED_366, 
        SYNOPSYS_UNCONNECTED_367, SYNOPSYS_UNCONNECTED_368, 
        SYNOPSYS_UNCONNECTED_369, SYNOPSYS_UNCONNECTED_370, 
        SYNOPSYS_UNCONNECTED_371, SYNOPSYS_UNCONNECTED_372, 
        SYNOPSYS_UNCONNECTED_373, SYNOPSYS_UNCONNECTED_374, 
        SYNOPSYS_UNCONNECTED_375, SYNOPSYS_UNCONNECTED_376, 
        SYNOPSYS_UNCONNECTED_377, SYNOPSYS_UNCONNECTED_378, 
        SYNOPSYS_UNCONNECTED_379, SYNOPSYS_UNCONNECTED_380, 
        SYNOPSYS_UNCONNECTED_381, SYNOPSYS_UNCONNECTED_382, 
        SYNOPSYS_UNCONNECTED_383, SYNOPSYS_UNCONNECTED_384}), .NIC_do(
        node30_pedo), .up_ro(up_ro[3]), .down_ro(1'b0), .left_ro(right_ri[2]), 
        .right_ro(1'b0), .NIC_ro(node30_pero), .polarity_to_NIC(
        node30_polarity) );
  cardinal_router GY_1__GX_0__R ( .clk(clk), .reset(reset), .up_si(up_si[4]), 
        .down_si(up_so[0]), .left_si(1'b0), .right_si(right_si_4), .NIC_si(
        node01_pesi), .up_di({up_di_4__63_, up_di_4__62_, up_di_4__61_, 
        up_di_4__60_, up_di_4__59_, up_di_4__58_, up_di_4__57_, up_di_4__56_, 
        up_di_4__55_, up_di_4__54_, up_di_4__53_, up_di_4__52_, up_di_4__51_, 
        up_di_4__50_, up_di_4__49_, up_di_4__48_, up_di_4__47_, up_di_4__46_, 
        up_di_4__45_, up_di_4__44_, up_di_4__43_, up_di_4__42_, up_di_4__41_, 
        up_di_4__40_, up_di_4__39_, up_di_4__38_, up_di_4__37_, up_di_4__36_, 
        up_di_4__35_, up_di_4__34_, up_di_4__33_, up_di_4__32_, up_di_4__31_, 
        up_di_4__30_, up_di_4__29_, up_di_4__28_, up_di_4__27_, up_di_4__26_, 
        up_di_4__25_, up_di_4__24_, up_di_4__23_, up_di_4__22_, up_di_4__21_, 
        up_di_4__20_, up_di_4__19_, up_di_4__18_, up_di_4__17_, up_di_4__16_, 
        up_di_4__15_, up_di_4__14_, up_di_4__13_, up_di_4__12_, up_di_4__11_, 
        up_di_4__10_, up_di_4__9_, up_di_4__8_, up_di_4__7_, up_di_4__6_, 
        up_di_4__5_, up_di_4__4_, up_di_4__3_, up_di_4__2_, up_di_4__1_, 
        up_di_4__0_}), .down_di(up_do[767:704]), .left_di({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .right_di({right_di_4__63_, right_di_4__62_, right_di_4__61_, 
        right_di_4__60_, right_di_4__59_, right_di_4__58_, right_di_4__57_, 
        right_di_4__56_, right_di_4__55_, right_di_4__54_, right_di_4__53_, 
        right_di_4__52_, right_di_4__51_, right_di_4__50_, right_di_4__49_, 
        right_di_4__48_, right_di_4__47_, right_di_4__46_, right_di_4__45_, 
        right_di_4__44_, right_di_4__43_, right_di_4__42_, right_di_4__41_, 
        right_di_4__40_, right_di_4__39_, right_di_4__38_, right_di_4__37_, 
        right_di_4__36_, right_di_4__35_, right_di_4__34_, right_di_4__33_, 
        right_di_4__32_, right_di_4__31_, right_di_4__30_, right_di_4__29_, 
        right_di_4__28_, right_di_4__27_, right_di_4__26_, right_di_4__25_, 
        right_di_4__24_, right_di_4__23_, right_di_4__22_, right_di_4__21_, 
        right_di_4__20_, right_di_4__19_, right_di_4__18_, right_di_4__17_, 
        right_di_4__16_, right_di_4__15_, right_di_4__14_, right_di_4__13_, 
        right_di_4__12_, right_di_4__11_, right_di_4__10_, right_di_4__9_, 
        right_di_4__8_, right_di_4__7_, right_di_4__6_, right_di_4__5_, 
        right_di_4__4_, right_di_4__3_, right_di_4__2_, right_di_4__1_, 
        right_di_4__0_}), .NIC_di(node01_pedi), .up_ri(up_ri[4]), .down_ri(
        up_ro[0]), .right_ri(right_ri[4]), .NIC_ri(node01_peri), .up_so(
        up_so[4]), .down_so(up_si[0]), .right_so(right_so[4]), .NIC_so(
        node01_peso), .up_do(up_do[511:448]), .down_do({up_di_0__63_, 
        up_di_0__62_, up_di_0__61_, up_di_0__60_, up_di_0__59_, up_di_0__58_, 
        up_di_0__57_, up_di_0__56_, up_di_0__55_, up_di_0__54_, up_di_0__53_, 
        up_di_0__52_, up_di_0__51_, up_di_0__50_, up_di_0__49_, up_di_0__48_, 
        up_di_0__47_, up_di_0__46_, up_di_0__45_, up_di_0__44_, up_di_0__43_, 
        up_di_0__42_, up_di_0__41_, up_di_0__40_, up_di_0__39_, up_di_0__38_, 
        up_di_0__37_, up_di_0__36_, up_di_0__35_, up_di_0__34_, up_di_0__33_, 
        up_di_0__32_, up_di_0__31_, up_di_0__30_, up_di_0__29_, up_di_0__28_, 
        up_di_0__27_, up_di_0__26_, up_di_0__25_, up_di_0__24_, up_di_0__23_, 
        up_di_0__22_, up_di_0__21_, up_di_0__20_, up_di_0__19_, up_di_0__18_, 
        up_di_0__17_, up_di_0__16_, up_di_0__15_, up_di_0__14_, up_di_0__13_, 
        up_di_0__12_, up_di_0__11_, up_di_0__10_, up_di_0__9_, up_di_0__8_, 
        up_di_0__7_, up_di_0__6_, up_di_0__5_, up_di_0__4_, up_di_0__3_, 
        up_di_0__2_, up_di_0__1_, up_di_0__0_}), .left_do({
        SYNOPSYS_UNCONNECTED_385, SYNOPSYS_UNCONNECTED_386, 
        SYNOPSYS_UNCONNECTED_387, SYNOPSYS_UNCONNECTED_388, 
        SYNOPSYS_UNCONNECTED_389, SYNOPSYS_UNCONNECTED_390, 
        SYNOPSYS_UNCONNECTED_391, SYNOPSYS_UNCONNECTED_392, 
        SYNOPSYS_UNCONNECTED_393, SYNOPSYS_UNCONNECTED_394, 
        SYNOPSYS_UNCONNECTED_395, SYNOPSYS_UNCONNECTED_396, 
        SYNOPSYS_UNCONNECTED_397, SYNOPSYS_UNCONNECTED_398, 
        SYNOPSYS_UNCONNECTED_399, SYNOPSYS_UNCONNECTED_400, 
        SYNOPSYS_UNCONNECTED_401, SYNOPSYS_UNCONNECTED_402, 
        SYNOPSYS_UNCONNECTED_403, SYNOPSYS_UNCONNECTED_404, 
        SYNOPSYS_UNCONNECTED_405, SYNOPSYS_UNCONNECTED_406, 
        SYNOPSYS_UNCONNECTED_407, SYNOPSYS_UNCONNECTED_408, 
        SYNOPSYS_UNCONNECTED_409, SYNOPSYS_UNCONNECTED_410, 
        SYNOPSYS_UNCONNECTED_411, SYNOPSYS_UNCONNECTED_412, 
        SYNOPSYS_UNCONNECTED_413, SYNOPSYS_UNCONNECTED_414, 
        SYNOPSYS_UNCONNECTED_415, SYNOPSYS_UNCONNECTED_416, 
        SYNOPSYS_UNCONNECTED_417, SYNOPSYS_UNCONNECTED_418, 
        SYNOPSYS_UNCONNECTED_419, SYNOPSYS_UNCONNECTED_420, 
        SYNOPSYS_UNCONNECTED_421, SYNOPSYS_UNCONNECTED_422, 
        SYNOPSYS_UNCONNECTED_423, SYNOPSYS_UNCONNECTED_424, 
        SYNOPSYS_UNCONNECTED_425, SYNOPSYS_UNCONNECTED_426, 
        SYNOPSYS_UNCONNECTED_427, SYNOPSYS_UNCONNECTED_428, 
        SYNOPSYS_UNCONNECTED_429, SYNOPSYS_UNCONNECTED_430, 
        SYNOPSYS_UNCONNECTED_431, SYNOPSYS_UNCONNECTED_432, 
        SYNOPSYS_UNCONNECTED_433, SYNOPSYS_UNCONNECTED_434, 
        SYNOPSYS_UNCONNECTED_435, SYNOPSYS_UNCONNECTED_436, 
        SYNOPSYS_UNCONNECTED_437, SYNOPSYS_UNCONNECTED_438, 
        SYNOPSYS_UNCONNECTED_439, SYNOPSYS_UNCONNECTED_440, 
        SYNOPSYS_UNCONNECTED_441, SYNOPSYS_UNCONNECTED_442, 
        SYNOPSYS_UNCONNECTED_443, SYNOPSYS_UNCONNECTED_444, 
        SYNOPSYS_UNCONNECTED_445, SYNOPSYS_UNCONNECTED_446, 
        SYNOPSYS_UNCONNECTED_447, SYNOPSYS_UNCONNECTED_448}), .right_do(
        right_do[575:512]), .NIC_do(node01_pedo), .up_ro(up_ro[4]), .down_ro(
        up_ri[0]), .left_ro(1'b0), .right_ro(right_ro_4), .NIC_ro(node01_pero), 
        .polarity_to_NIC(node01_polarity) );
  cardinal_router GY_1__GX_1__R ( .clk(clk), .reset(reset), .up_si(up_si[5]), 
        .down_si(up_so[1]), .left_si(right_so[4]), .right_si(right_si_5), 
        .NIC_si(node11_pesi), .up_di({up_di_5__63_, up_di_5__62_, up_di_5__61_, 
        up_di_5__60_, up_di_5__59_, up_di_5__58_, up_di_5__57_, up_di_5__56_, 
        up_di_5__55_, up_di_5__54_, up_di_5__53_, up_di_5__52_, up_di_5__51_, 
        up_di_5__50_, up_di_5__49_, up_di_5__48_, up_di_5__47_, up_di_5__46_, 
        up_di_5__45_, up_di_5__44_, up_di_5__43_, up_di_5__42_, up_di_5__41_, 
        up_di_5__40_, up_di_5__39_, up_di_5__38_, up_di_5__37_, up_di_5__36_, 
        up_di_5__35_, up_di_5__34_, up_di_5__33_, up_di_5__32_, up_di_5__31_, 
        up_di_5__30_, up_di_5__29_, up_di_5__28_, up_di_5__27_, up_di_5__26_, 
        up_di_5__25_, up_di_5__24_, up_di_5__23_, up_di_5__22_, up_di_5__21_, 
        up_di_5__20_, up_di_5__19_, up_di_5__18_, up_di_5__17_, up_di_5__16_, 
        up_di_5__15_, up_di_5__14_, up_di_5__13_, up_di_5__12_, up_di_5__11_, 
        up_di_5__10_, up_di_5__9_, up_di_5__8_, up_di_5__7_, up_di_5__6_, 
        up_di_5__5_, up_di_5__4_, up_di_5__3_, up_di_5__2_, up_di_5__1_, 
        up_di_5__0_}), .down_di(up_do[703:640]), .left_di(right_do[575:512]), 
        .right_di({right_di_5__63_, right_di_5__62_, right_di_5__61_, 
        right_di_5__60_, right_di_5__59_, right_di_5__58_, right_di_5__57_, 
        right_di_5__56_, right_di_5__55_, right_di_5__54_, right_di_5__53_, 
        right_di_5__52_, right_di_5__51_, right_di_5__50_, right_di_5__49_, 
        right_di_5__48_, right_di_5__47_, right_di_5__46_, right_di_5__45_, 
        right_di_5__44_, right_di_5__43_, right_di_5__42_, right_di_5__41_, 
        right_di_5__40_, right_di_5__39_, right_di_5__38_, right_di_5__37_, 
        right_di_5__36_, right_di_5__35_, right_di_5__34_, right_di_5__33_, 
        right_di_5__32_, right_di_5__31_, right_di_5__30_, right_di_5__29_, 
        right_di_5__28_, right_di_5__27_, right_di_5__26_, right_di_5__25_, 
        right_di_5__24_, right_di_5__23_, right_di_5__22_, right_di_5__21_, 
        right_di_5__20_, right_di_5__19_, right_di_5__18_, right_di_5__17_, 
        right_di_5__16_, right_di_5__15_, right_di_5__14_, right_di_5__13_, 
        right_di_5__12_, right_di_5__11_, right_di_5__10_, right_di_5__9_, 
        right_di_5__8_, right_di_5__7_, right_di_5__6_, right_di_5__5_, 
        right_di_5__4_, right_di_5__3_, right_di_5__2_, right_di_5__1_, 
        right_di_5__0_}), .NIC_di(node11_pedi), .up_ri(up_ri[5]), .down_ri(
        up_ro[1]), .left_ri(right_ro_4), .right_ri(right_ri[5]), .NIC_ri(
        node11_peri), .up_so(up_so[5]), .down_so(up_si[1]), .left_so(
        right_si_4), .right_so(right_so[5]), .NIC_so(node11_peso), .up_do(
        up_do[447:384]), .down_do({up_di_1__63_, up_di_1__62_, up_di_1__61_, 
        up_di_1__60_, up_di_1__59_, up_di_1__58_, up_di_1__57_, up_di_1__56_, 
        up_di_1__55_, up_di_1__54_, up_di_1__53_, up_di_1__52_, up_di_1__51_, 
        up_di_1__50_, up_di_1__49_, up_di_1__48_, up_di_1__47_, up_di_1__46_, 
        up_di_1__45_, up_di_1__44_, up_di_1__43_, up_di_1__42_, up_di_1__41_, 
        up_di_1__40_, up_di_1__39_, up_di_1__38_, up_di_1__37_, up_di_1__36_, 
        up_di_1__35_, up_di_1__34_, up_di_1__33_, up_di_1__32_, up_di_1__31_, 
        up_di_1__30_, up_di_1__29_, up_di_1__28_, up_di_1__27_, up_di_1__26_, 
        up_di_1__25_, up_di_1__24_, up_di_1__23_, up_di_1__22_, up_di_1__21_, 
        up_di_1__20_, up_di_1__19_, up_di_1__18_, up_di_1__17_, up_di_1__16_, 
        up_di_1__15_, up_di_1__14_, up_di_1__13_, up_di_1__12_, up_di_1__11_, 
        up_di_1__10_, up_di_1__9_, up_di_1__8_, up_di_1__7_, up_di_1__6_, 
        up_di_1__5_, up_di_1__4_, up_di_1__3_, up_di_1__2_, up_di_1__1_, 
        up_di_1__0_}), .left_do({right_di_4__63_, right_di_4__62_, 
        right_di_4__61_, right_di_4__60_, right_di_4__59_, right_di_4__58_, 
        right_di_4__57_, right_di_4__56_, right_di_4__55_, right_di_4__54_, 
        right_di_4__53_, right_di_4__52_, right_di_4__51_, right_di_4__50_, 
        right_di_4__49_, right_di_4__48_, right_di_4__47_, right_di_4__46_, 
        right_di_4__45_, right_di_4__44_, right_di_4__43_, right_di_4__42_, 
        right_di_4__41_, right_di_4__40_, right_di_4__39_, right_di_4__38_, 
        right_di_4__37_, right_di_4__36_, right_di_4__35_, right_di_4__34_, 
        right_di_4__33_, right_di_4__32_, right_di_4__31_, right_di_4__30_, 
        right_di_4__29_, right_di_4__28_, right_di_4__27_, right_di_4__26_, 
        right_di_4__25_, right_di_4__24_, right_di_4__23_, right_di_4__22_, 
        right_di_4__21_, right_di_4__20_, right_di_4__19_, right_di_4__18_, 
        right_di_4__17_, right_di_4__16_, right_di_4__15_, right_di_4__14_, 
        right_di_4__13_, right_di_4__12_, right_di_4__11_, right_di_4__10_, 
        right_di_4__9_, right_di_4__8_, right_di_4__7_, right_di_4__6_, 
        right_di_4__5_, right_di_4__4_, right_di_4__3_, right_di_4__2_, 
        right_di_4__1_, right_di_4__0_}), .right_do(right_do[511:448]), 
        .NIC_do(node11_pedo), .up_ro(up_ro[5]), .down_ro(up_ri[1]), .left_ro(
        right_ri[4]), .right_ro(right_ro_5), .NIC_ro(node11_pero), 
        .polarity_to_NIC(node11_polarity) );
  cardinal_router GY_1__GX_2__R ( .clk(clk), .reset(reset), .up_si(up_si[6]), 
        .down_si(up_so[2]), .left_si(right_so[5]), .right_si(right_si_6), 
        .NIC_si(node21_pesi), .up_di({up_di_6__63_, up_di_6__62_, up_di_6__61_, 
        up_di_6__60_, up_di_6__59_, up_di_6__58_, up_di_6__57_, up_di_6__56_, 
        up_di_6__55_, up_di_6__54_, up_di_6__53_, up_di_6__52_, up_di_6__51_, 
        up_di_6__50_, up_di_6__49_, up_di_6__48_, up_di_6__47_, up_di_6__46_, 
        up_di_6__45_, up_di_6__44_, up_di_6__43_, up_di_6__42_, up_di_6__41_, 
        up_di_6__40_, up_di_6__39_, up_di_6__38_, up_di_6__37_, up_di_6__36_, 
        up_di_6__35_, up_di_6__34_, up_di_6__33_, up_di_6__32_, up_di_6__31_, 
        up_di_6__30_, up_di_6__29_, up_di_6__28_, up_di_6__27_, up_di_6__26_, 
        up_di_6__25_, up_di_6__24_, up_di_6__23_, up_di_6__22_, up_di_6__21_, 
        up_di_6__20_, up_di_6__19_, up_di_6__18_, up_di_6__17_, up_di_6__16_, 
        up_di_6__15_, up_di_6__14_, up_di_6__13_, up_di_6__12_, up_di_6__11_, 
        up_di_6__10_, up_di_6__9_, up_di_6__8_, up_di_6__7_, up_di_6__6_, 
        up_di_6__5_, up_di_6__4_, up_di_6__3_, up_di_6__2_, up_di_6__1_, 
        up_di_6__0_}), .down_di(up_do[639:576]), .left_di(right_do[511:448]), 
        .right_di({right_di_6__63_, right_di_6__62_, right_di_6__61_, 
        right_di_6__60_, right_di_6__59_, right_di_6__58_, right_di_6__57_, 
        right_di_6__56_, right_di_6__55_, right_di_6__54_, right_di_6__53_, 
        right_di_6__52_, right_di_6__51_, right_di_6__50_, right_di_6__49_, 
        right_di_6__48_, right_di_6__47_, right_di_6__46_, right_di_6__45_, 
        right_di_6__44_, right_di_6__43_, right_di_6__42_, right_di_6__41_, 
        right_di_6__40_, right_di_6__39_, right_di_6__38_, right_di_6__37_, 
        right_di_6__36_, right_di_6__35_, right_di_6__34_, right_di_6__33_, 
        right_di_6__32_, right_di_6__31_, right_di_6__30_, right_di_6__29_, 
        right_di_6__28_, right_di_6__27_, right_di_6__26_, right_di_6__25_, 
        right_di_6__24_, right_di_6__23_, right_di_6__22_, right_di_6__21_, 
        right_di_6__20_, right_di_6__19_, right_di_6__18_, right_di_6__17_, 
        right_di_6__16_, right_di_6__15_, right_di_6__14_, right_di_6__13_, 
        right_di_6__12_, right_di_6__11_, right_di_6__10_, right_di_6__9_, 
        right_di_6__8_, right_di_6__7_, right_di_6__6_, right_di_6__5_, 
        right_di_6__4_, right_di_6__3_, right_di_6__2_, right_di_6__1_, 
        right_di_6__0_}), .NIC_di(node21_pedi), .up_ri(up_ri[6]), .down_ri(
        up_ro[2]), .left_ri(right_ro_5), .right_ri(right_ri[6]), .NIC_ri(
        node21_peri), .up_so(up_so[6]), .down_so(up_si[2]), .left_so(
        right_si_5), .right_so(right_so[6]), .NIC_so(node21_peso), .up_do(
        up_do[383:320]), .down_do({up_di_2__63_, up_di_2__62_, up_di_2__61_, 
        up_di_2__60_, up_di_2__59_, up_di_2__58_, up_di_2__57_, up_di_2__56_, 
        up_di_2__55_, up_di_2__54_, up_di_2__53_, up_di_2__52_, up_di_2__51_, 
        up_di_2__50_, up_di_2__49_, up_di_2__48_, up_di_2__47_, up_di_2__46_, 
        up_di_2__45_, up_di_2__44_, up_di_2__43_, up_di_2__42_, up_di_2__41_, 
        up_di_2__40_, up_di_2__39_, up_di_2__38_, up_di_2__37_, up_di_2__36_, 
        up_di_2__35_, up_di_2__34_, up_di_2__33_, up_di_2__32_, up_di_2__31_, 
        up_di_2__30_, up_di_2__29_, up_di_2__28_, up_di_2__27_, up_di_2__26_, 
        up_di_2__25_, up_di_2__24_, up_di_2__23_, up_di_2__22_, up_di_2__21_, 
        up_di_2__20_, up_di_2__19_, up_di_2__18_, up_di_2__17_, up_di_2__16_, 
        up_di_2__15_, up_di_2__14_, up_di_2__13_, up_di_2__12_, up_di_2__11_, 
        up_di_2__10_, up_di_2__9_, up_di_2__8_, up_di_2__7_, up_di_2__6_, 
        up_di_2__5_, up_di_2__4_, up_di_2__3_, up_di_2__2_, up_di_2__1_, 
        up_di_2__0_}), .left_do({right_di_5__63_, right_di_5__62_, 
        right_di_5__61_, right_di_5__60_, right_di_5__59_, right_di_5__58_, 
        right_di_5__57_, right_di_5__56_, right_di_5__55_, right_di_5__54_, 
        right_di_5__53_, right_di_5__52_, right_di_5__51_, right_di_5__50_, 
        right_di_5__49_, right_di_5__48_, right_di_5__47_, right_di_5__46_, 
        right_di_5__45_, right_di_5__44_, right_di_5__43_, right_di_5__42_, 
        right_di_5__41_, right_di_5__40_, right_di_5__39_, right_di_5__38_, 
        right_di_5__37_, right_di_5__36_, right_di_5__35_, right_di_5__34_, 
        right_di_5__33_, right_di_5__32_, right_di_5__31_, right_di_5__30_, 
        right_di_5__29_, right_di_5__28_, right_di_5__27_, right_di_5__26_, 
        right_di_5__25_, right_di_5__24_, right_di_5__23_, right_di_5__22_, 
        right_di_5__21_, right_di_5__20_, right_di_5__19_, right_di_5__18_, 
        right_di_5__17_, right_di_5__16_, right_di_5__15_, right_di_5__14_, 
        right_di_5__13_, right_di_5__12_, right_di_5__11_, right_di_5__10_, 
        right_di_5__9_, right_di_5__8_, right_di_5__7_, right_di_5__6_, 
        right_di_5__5_, right_di_5__4_, right_di_5__3_, right_di_5__2_, 
        right_di_5__1_, right_di_5__0_}), .right_do(right_do[447:384]), 
        .NIC_do(node21_pedo), .up_ro(up_ro[6]), .down_ro(up_ri[2]), .left_ro(
        right_ri[5]), .right_ro(right_ro_6), .NIC_ro(node21_pero), 
        .polarity_to_NIC(node21_polarity) );
  cardinal_router GY_1__GX_3__R ( .clk(clk), .reset(reset), .up_si(up_si[7]), 
        .down_si(up_so[3]), .left_si(right_so[6]), .right_si(1'b0), .NIC_si(
        node31_pesi), .up_di({up_di_7__63_, up_di_7__62_, up_di_7__61_, 
        up_di_7__60_, up_di_7__59_, up_di_7__58_, up_di_7__57_, up_di_7__56_, 
        up_di_7__55_, up_di_7__54_, up_di_7__53_, up_di_7__52_, up_di_7__51_, 
        up_di_7__50_, up_di_7__49_, up_di_7__48_, up_di_7__47_, up_di_7__46_, 
        up_di_7__45_, up_di_7__44_, up_di_7__43_, up_di_7__42_, up_di_7__41_, 
        up_di_7__40_, up_di_7__39_, up_di_7__38_, up_di_7__37_, up_di_7__36_, 
        up_di_7__35_, up_di_7__34_, up_di_7__33_, up_di_7__32_, up_di_7__31_, 
        up_di_7__30_, up_di_7__29_, up_di_7__28_, up_di_7__27_, up_di_7__26_, 
        up_di_7__25_, up_di_7__24_, up_di_7__23_, up_di_7__22_, up_di_7__21_, 
        up_di_7__20_, up_di_7__19_, up_di_7__18_, up_di_7__17_, up_di_7__16_, 
        up_di_7__15_, up_di_7__14_, up_di_7__13_, up_di_7__12_, up_di_7__11_, 
        up_di_7__10_, up_di_7__9_, up_di_7__8_, up_di_7__7_, up_di_7__6_, 
        up_di_7__5_, up_di_7__4_, up_di_7__3_, up_di_7__2_, up_di_7__1_, 
        up_di_7__0_}), .down_di(up_do[575:512]), .left_di(right_do[447:384]), 
        .right_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .NIC_di(node31_pedi), .up_ri(
        up_ri[7]), .down_ri(up_ro[3]), .left_ri(right_ro_6), .NIC_ri(
        node31_peri), .up_so(up_so[7]), .down_so(up_si[3]), .left_so(
        right_si_6), .NIC_so(node31_peso), .up_do(up_do[319:256]), .down_do({
        up_di_3__63_, up_di_3__62_, up_di_3__61_, up_di_3__60_, up_di_3__59_, 
        up_di_3__58_, up_di_3__57_, up_di_3__56_, up_di_3__55_, up_di_3__54_, 
        up_di_3__53_, up_di_3__52_, up_di_3__51_, up_di_3__50_, up_di_3__49_, 
        up_di_3__48_, up_di_3__47_, up_di_3__46_, up_di_3__45_, up_di_3__44_, 
        up_di_3__43_, up_di_3__42_, up_di_3__41_, up_di_3__40_, up_di_3__39_, 
        up_di_3__38_, up_di_3__37_, up_di_3__36_, up_di_3__35_, up_di_3__34_, 
        up_di_3__33_, up_di_3__32_, up_di_3__31_, up_di_3__30_, up_di_3__29_, 
        up_di_3__28_, up_di_3__27_, up_di_3__26_, up_di_3__25_, up_di_3__24_, 
        up_di_3__23_, up_di_3__22_, up_di_3__21_, up_di_3__20_, up_di_3__19_, 
        up_di_3__18_, up_di_3__17_, up_di_3__16_, up_di_3__15_, up_di_3__14_, 
        up_di_3__13_, up_di_3__12_, up_di_3__11_, up_di_3__10_, up_di_3__9_, 
        up_di_3__8_, up_di_3__7_, up_di_3__6_, up_di_3__5_, up_di_3__4_, 
        up_di_3__3_, up_di_3__2_, up_di_3__1_, up_di_3__0_}), .left_do({
        right_di_6__63_, right_di_6__62_, right_di_6__61_, right_di_6__60_, 
        right_di_6__59_, right_di_6__58_, right_di_6__57_, right_di_6__56_, 
        right_di_6__55_, right_di_6__54_, right_di_6__53_, right_di_6__52_, 
        right_di_6__51_, right_di_6__50_, right_di_6__49_, right_di_6__48_, 
        right_di_6__47_, right_di_6__46_, right_di_6__45_, right_di_6__44_, 
        right_di_6__43_, right_di_6__42_, right_di_6__41_, right_di_6__40_, 
        right_di_6__39_, right_di_6__38_, right_di_6__37_, right_di_6__36_, 
        right_di_6__35_, right_di_6__34_, right_di_6__33_, right_di_6__32_, 
        right_di_6__31_, right_di_6__30_, right_di_6__29_, right_di_6__28_, 
        right_di_6__27_, right_di_6__26_, right_di_6__25_, right_di_6__24_, 
        right_di_6__23_, right_di_6__22_, right_di_6__21_, right_di_6__20_, 
        right_di_6__19_, right_di_6__18_, right_di_6__17_, right_di_6__16_, 
        right_di_6__15_, right_di_6__14_, right_di_6__13_, right_di_6__12_, 
        right_di_6__11_, right_di_6__10_, right_di_6__9_, right_di_6__8_, 
        right_di_6__7_, right_di_6__6_, right_di_6__5_, right_di_6__4_, 
        right_di_6__3_, right_di_6__2_, right_di_6__1_, right_di_6__0_}), 
        .right_do({SYNOPSYS_UNCONNECTED_449, SYNOPSYS_UNCONNECTED_450, 
        SYNOPSYS_UNCONNECTED_451, SYNOPSYS_UNCONNECTED_452, 
        SYNOPSYS_UNCONNECTED_453, SYNOPSYS_UNCONNECTED_454, 
        SYNOPSYS_UNCONNECTED_455, SYNOPSYS_UNCONNECTED_456, 
        SYNOPSYS_UNCONNECTED_457, SYNOPSYS_UNCONNECTED_458, 
        SYNOPSYS_UNCONNECTED_459, SYNOPSYS_UNCONNECTED_460, 
        SYNOPSYS_UNCONNECTED_461, SYNOPSYS_UNCONNECTED_462, 
        SYNOPSYS_UNCONNECTED_463, SYNOPSYS_UNCONNECTED_464, 
        SYNOPSYS_UNCONNECTED_465, SYNOPSYS_UNCONNECTED_466, 
        SYNOPSYS_UNCONNECTED_467, SYNOPSYS_UNCONNECTED_468, 
        SYNOPSYS_UNCONNECTED_469, SYNOPSYS_UNCONNECTED_470, 
        SYNOPSYS_UNCONNECTED_471, SYNOPSYS_UNCONNECTED_472, 
        SYNOPSYS_UNCONNECTED_473, SYNOPSYS_UNCONNECTED_474, 
        SYNOPSYS_UNCONNECTED_475, SYNOPSYS_UNCONNECTED_476, 
        SYNOPSYS_UNCONNECTED_477, SYNOPSYS_UNCONNECTED_478, 
        SYNOPSYS_UNCONNECTED_479, SYNOPSYS_UNCONNECTED_480, 
        SYNOPSYS_UNCONNECTED_481, SYNOPSYS_UNCONNECTED_482, 
        SYNOPSYS_UNCONNECTED_483, SYNOPSYS_UNCONNECTED_484, 
        SYNOPSYS_UNCONNECTED_485, SYNOPSYS_UNCONNECTED_486, 
        SYNOPSYS_UNCONNECTED_487, SYNOPSYS_UNCONNECTED_488, 
        SYNOPSYS_UNCONNECTED_489, SYNOPSYS_UNCONNECTED_490, 
        SYNOPSYS_UNCONNECTED_491, SYNOPSYS_UNCONNECTED_492, 
        SYNOPSYS_UNCONNECTED_493, SYNOPSYS_UNCONNECTED_494, 
        SYNOPSYS_UNCONNECTED_495, SYNOPSYS_UNCONNECTED_496, 
        SYNOPSYS_UNCONNECTED_497, SYNOPSYS_UNCONNECTED_498, 
        SYNOPSYS_UNCONNECTED_499, SYNOPSYS_UNCONNECTED_500, 
        SYNOPSYS_UNCONNECTED_501, SYNOPSYS_UNCONNECTED_502, 
        SYNOPSYS_UNCONNECTED_503, SYNOPSYS_UNCONNECTED_504, 
        SYNOPSYS_UNCONNECTED_505, SYNOPSYS_UNCONNECTED_506, 
        SYNOPSYS_UNCONNECTED_507, SYNOPSYS_UNCONNECTED_508, 
        SYNOPSYS_UNCONNECTED_509, SYNOPSYS_UNCONNECTED_510, 
        SYNOPSYS_UNCONNECTED_511, SYNOPSYS_UNCONNECTED_512}), .NIC_do(
        node31_pedo), .up_ro(up_ro[7]), .down_ro(up_ri[3]), .left_ro(
        right_ri[6]), .right_ro(1'b0), .NIC_ro(node31_pero), .polarity_to_NIC(
        node31_polarity) );
  cardinal_router GY_2__GX_0__R ( .clk(clk), .reset(reset), .up_si(up_si[8]), 
        .down_si(up_so[4]), .left_si(1'b0), .right_si(right_si_8), .NIC_si(
        node02_pesi), .up_di({up_di_8__63_, up_di_8__62_, up_di_8__61_, 
        up_di_8__60_, up_di_8__59_, up_di_8__58_, up_di_8__57_, up_di_8__56_, 
        up_di_8__55_, up_di_8__54_, up_di_8__53_, up_di_8__52_, up_di_8__51_, 
        up_di_8__50_, up_di_8__49_, up_di_8__48_, up_di_8__47_, up_di_8__46_, 
        up_di_8__45_, up_di_8__44_, up_di_8__43_, up_di_8__42_, up_di_8__41_, 
        up_di_8__40_, up_di_8__39_, up_di_8__38_, up_di_8__37_, up_di_8__36_, 
        up_di_8__35_, up_di_8__34_, up_di_8__33_, up_di_8__32_, up_di_8__31_, 
        up_di_8__30_, up_di_8__29_, up_di_8__28_, up_di_8__27_, up_di_8__26_, 
        up_di_8__25_, up_di_8__24_, up_di_8__23_, up_di_8__22_, up_di_8__21_, 
        up_di_8__20_, up_di_8__19_, up_di_8__18_, up_di_8__17_, up_di_8__16_, 
        up_di_8__15_, up_di_8__14_, up_di_8__13_, up_di_8__12_, up_di_8__11_, 
        up_di_8__10_, up_di_8__9_, up_di_8__8_, up_di_8__7_, up_di_8__6_, 
        up_di_8__5_, up_di_8__4_, up_di_8__3_, up_di_8__2_, up_di_8__1_, 
        up_di_8__0_}), .down_di(up_do[511:448]), .left_di({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .right_di({right_di_8__63_, right_di_8__62_, right_di_8__61_, 
        right_di_8__60_, right_di_8__59_, right_di_8__58_, right_di_8__57_, 
        right_di_8__56_, right_di_8__55_, right_di_8__54_, right_di_8__53_, 
        right_di_8__52_, right_di_8__51_, right_di_8__50_, right_di_8__49_, 
        right_di_8__48_, right_di_8__47_, right_di_8__46_, right_di_8__45_, 
        right_di_8__44_, right_di_8__43_, right_di_8__42_, right_di_8__41_, 
        right_di_8__40_, right_di_8__39_, right_di_8__38_, right_di_8__37_, 
        right_di_8__36_, right_di_8__35_, right_di_8__34_, right_di_8__33_, 
        right_di_8__32_, right_di_8__31_, right_di_8__30_, right_di_8__29_, 
        right_di_8__28_, right_di_8__27_, right_di_8__26_, right_di_8__25_, 
        right_di_8__24_, right_di_8__23_, right_di_8__22_, right_di_8__21_, 
        right_di_8__20_, right_di_8__19_, right_di_8__18_, right_di_8__17_, 
        right_di_8__16_, right_di_8__15_, right_di_8__14_, right_di_8__13_, 
        right_di_8__12_, right_di_8__11_, right_di_8__10_, right_di_8__9_, 
        right_di_8__8_, right_di_8__7_, right_di_8__6_, right_di_8__5_, 
        right_di_8__4_, right_di_8__3_, right_di_8__2_, right_di_8__1_, 
        right_di_8__0_}), .NIC_di(node02_pedi), .up_ri(up_ri[8]), .down_ri(
        up_ro[4]), .right_ri(right_ri[8]), .NIC_ri(node02_peri), .up_so(
        up_so[8]), .down_so(up_si[4]), .right_so(right_so[8]), .NIC_so(
        node02_peso), .up_do(up_do[255:192]), .down_do({up_di_4__63_, 
        up_di_4__62_, up_di_4__61_, up_di_4__60_, up_di_4__59_, up_di_4__58_, 
        up_di_4__57_, up_di_4__56_, up_di_4__55_, up_di_4__54_, up_di_4__53_, 
        up_di_4__52_, up_di_4__51_, up_di_4__50_, up_di_4__49_, up_di_4__48_, 
        up_di_4__47_, up_di_4__46_, up_di_4__45_, up_di_4__44_, up_di_4__43_, 
        up_di_4__42_, up_di_4__41_, up_di_4__40_, up_di_4__39_, up_di_4__38_, 
        up_di_4__37_, up_di_4__36_, up_di_4__35_, up_di_4__34_, up_di_4__33_, 
        up_di_4__32_, up_di_4__31_, up_di_4__30_, up_di_4__29_, up_di_4__28_, 
        up_di_4__27_, up_di_4__26_, up_di_4__25_, up_di_4__24_, up_di_4__23_, 
        up_di_4__22_, up_di_4__21_, up_di_4__20_, up_di_4__19_, up_di_4__18_, 
        up_di_4__17_, up_di_4__16_, up_di_4__15_, up_di_4__14_, up_di_4__13_, 
        up_di_4__12_, up_di_4__11_, up_di_4__10_, up_di_4__9_, up_di_4__8_, 
        up_di_4__7_, up_di_4__6_, up_di_4__5_, up_di_4__4_, up_di_4__3_, 
        up_di_4__2_, up_di_4__1_, up_di_4__0_}), .left_do({
        SYNOPSYS_UNCONNECTED_513, SYNOPSYS_UNCONNECTED_514, 
        SYNOPSYS_UNCONNECTED_515, SYNOPSYS_UNCONNECTED_516, 
        SYNOPSYS_UNCONNECTED_517, SYNOPSYS_UNCONNECTED_518, 
        SYNOPSYS_UNCONNECTED_519, SYNOPSYS_UNCONNECTED_520, 
        SYNOPSYS_UNCONNECTED_521, SYNOPSYS_UNCONNECTED_522, 
        SYNOPSYS_UNCONNECTED_523, SYNOPSYS_UNCONNECTED_524, 
        SYNOPSYS_UNCONNECTED_525, SYNOPSYS_UNCONNECTED_526, 
        SYNOPSYS_UNCONNECTED_527, SYNOPSYS_UNCONNECTED_528, 
        SYNOPSYS_UNCONNECTED_529, SYNOPSYS_UNCONNECTED_530, 
        SYNOPSYS_UNCONNECTED_531, SYNOPSYS_UNCONNECTED_532, 
        SYNOPSYS_UNCONNECTED_533, SYNOPSYS_UNCONNECTED_534, 
        SYNOPSYS_UNCONNECTED_535, SYNOPSYS_UNCONNECTED_536, 
        SYNOPSYS_UNCONNECTED_537, SYNOPSYS_UNCONNECTED_538, 
        SYNOPSYS_UNCONNECTED_539, SYNOPSYS_UNCONNECTED_540, 
        SYNOPSYS_UNCONNECTED_541, SYNOPSYS_UNCONNECTED_542, 
        SYNOPSYS_UNCONNECTED_543, SYNOPSYS_UNCONNECTED_544, 
        SYNOPSYS_UNCONNECTED_545, SYNOPSYS_UNCONNECTED_546, 
        SYNOPSYS_UNCONNECTED_547, SYNOPSYS_UNCONNECTED_548, 
        SYNOPSYS_UNCONNECTED_549, SYNOPSYS_UNCONNECTED_550, 
        SYNOPSYS_UNCONNECTED_551, SYNOPSYS_UNCONNECTED_552, 
        SYNOPSYS_UNCONNECTED_553, SYNOPSYS_UNCONNECTED_554, 
        SYNOPSYS_UNCONNECTED_555, SYNOPSYS_UNCONNECTED_556, 
        SYNOPSYS_UNCONNECTED_557, SYNOPSYS_UNCONNECTED_558, 
        SYNOPSYS_UNCONNECTED_559, SYNOPSYS_UNCONNECTED_560, 
        SYNOPSYS_UNCONNECTED_561, SYNOPSYS_UNCONNECTED_562, 
        SYNOPSYS_UNCONNECTED_563, SYNOPSYS_UNCONNECTED_564, 
        SYNOPSYS_UNCONNECTED_565, SYNOPSYS_UNCONNECTED_566, 
        SYNOPSYS_UNCONNECTED_567, SYNOPSYS_UNCONNECTED_568, 
        SYNOPSYS_UNCONNECTED_569, SYNOPSYS_UNCONNECTED_570, 
        SYNOPSYS_UNCONNECTED_571, SYNOPSYS_UNCONNECTED_572, 
        SYNOPSYS_UNCONNECTED_573, SYNOPSYS_UNCONNECTED_574, 
        SYNOPSYS_UNCONNECTED_575, SYNOPSYS_UNCONNECTED_576}), .right_do(
        right_do[383:320]), .NIC_do(node02_pedo), .up_ro(up_ro[8]), .down_ro(
        up_ri[4]), .left_ro(1'b0), .right_ro(right_ro_8), .NIC_ro(node02_pero), 
        .polarity_to_NIC(node02_polarity) );
  cardinal_router GY_2__GX_1__R ( .clk(clk), .reset(reset), .up_si(up_si[9]), 
        .down_si(up_so[5]), .left_si(right_so[8]), .right_si(right_si_9), 
        .NIC_si(node12_pesi), .up_di({up_di_9__63_, up_di_9__62_, up_di_9__61_, 
        up_di_9__60_, up_di_9__59_, up_di_9__58_, up_di_9__57_, up_di_9__56_, 
        up_di_9__55_, up_di_9__54_, up_di_9__53_, up_di_9__52_, up_di_9__51_, 
        up_di_9__50_, up_di_9__49_, up_di_9__48_, up_di_9__47_, up_di_9__46_, 
        up_di_9__45_, up_di_9__44_, up_di_9__43_, up_di_9__42_, up_di_9__41_, 
        up_di_9__40_, up_di_9__39_, up_di_9__38_, up_di_9__37_, up_di_9__36_, 
        up_di_9__35_, up_di_9__34_, up_di_9__33_, up_di_9__32_, up_di_9__31_, 
        up_di_9__30_, up_di_9__29_, up_di_9__28_, up_di_9__27_, up_di_9__26_, 
        up_di_9__25_, up_di_9__24_, up_di_9__23_, up_di_9__22_, up_di_9__21_, 
        up_di_9__20_, up_di_9__19_, up_di_9__18_, up_di_9__17_, up_di_9__16_, 
        up_di_9__15_, up_di_9__14_, up_di_9__13_, up_di_9__12_, up_di_9__11_, 
        up_di_9__10_, up_di_9__9_, up_di_9__8_, up_di_9__7_, up_di_9__6_, 
        up_di_9__5_, up_di_9__4_, up_di_9__3_, up_di_9__2_, up_di_9__1_, 
        up_di_9__0_}), .down_di(up_do[447:384]), .left_di(right_do[383:320]), 
        .right_di({right_di_9__63_, right_di_9__62_, right_di_9__61_, 
        right_di_9__60_, right_di_9__59_, right_di_9__58_, right_di_9__57_, 
        right_di_9__56_, right_di_9__55_, right_di_9__54_, right_di_9__53_, 
        right_di_9__52_, right_di_9__51_, right_di_9__50_, right_di_9__49_, 
        right_di_9__48_, right_di_9__47_, right_di_9__46_, right_di_9__45_, 
        right_di_9__44_, right_di_9__43_, right_di_9__42_, right_di_9__41_, 
        right_di_9__40_, right_di_9__39_, right_di_9__38_, right_di_9__37_, 
        right_di_9__36_, right_di_9__35_, right_di_9__34_, right_di_9__33_, 
        right_di_9__32_, right_di_9__31_, right_di_9__30_, right_di_9__29_, 
        right_di_9__28_, right_di_9__27_, right_di_9__26_, right_di_9__25_, 
        right_di_9__24_, right_di_9__23_, right_di_9__22_, right_di_9__21_, 
        right_di_9__20_, right_di_9__19_, right_di_9__18_, right_di_9__17_, 
        right_di_9__16_, right_di_9__15_, right_di_9__14_, right_di_9__13_, 
        right_di_9__12_, right_di_9__11_, right_di_9__10_, right_di_9__9_, 
        right_di_9__8_, right_di_9__7_, right_di_9__6_, right_di_9__5_, 
        right_di_9__4_, right_di_9__3_, right_di_9__2_, right_di_9__1_, 
        right_di_9__0_}), .NIC_di(node12_pedi), .up_ri(up_ri[9]), .down_ri(
        up_ro[5]), .left_ri(right_ro_8), .right_ri(right_ri[9]), .NIC_ri(
        node12_peri), .up_so(up_so[9]), .down_so(up_si[5]), .left_so(
        right_si_8), .right_so(right_so[9]), .NIC_so(node12_peso), .up_do(
        up_do[191:128]), .down_do({up_di_5__63_, up_di_5__62_, up_di_5__61_, 
        up_di_5__60_, up_di_5__59_, up_di_5__58_, up_di_5__57_, up_di_5__56_, 
        up_di_5__55_, up_di_5__54_, up_di_5__53_, up_di_5__52_, up_di_5__51_, 
        up_di_5__50_, up_di_5__49_, up_di_5__48_, up_di_5__47_, up_di_5__46_, 
        up_di_5__45_, up_di_5__44_, up_di_5__43_, up_di_5__42_, up_di_5__41_, 
        up_di_5__40_, up_di_5__39_, up_di_5__38_, up_di_5__37_, up_di_5__36_, 
        up_di_5__35_, up_di_5__34_, up_di_5__33_, up_di_5__32_, up_di_5__31_, 
        up_di_5__30_, up_di_5__29_, up_di_5__28_, up_di_5__27_, up_di_5__26_, 
        up_di_5__25_, up_di_5__24_, up_di_5__23_, up_di_5__22_, up_di_5__21_, 
        up_di_5__20_, up_di_5__19_, up_di_5__18_, up_di_5__17_, up_di_5__16_, 
        up_di_5__15_, up_di_5__14_, up_di_5__13_, up_di_5__12_, up_di_5__11_, 
        up_di_5__10_, up_di_5__9_, up_di_5__8_, up_di_5__7_, up_di_5__6_, 
        up_di_5__5_, up_di_5__4_, up_di_5__3_, up_di_5__2_, up_di_5__1_, 
        up_di_5__0_}), .left_do({right_di_8__63_, right_di_8__62_, 
        right_di_8__61_, right_di_8__60_, right_di_8__59_, right_di_8__58_, 
        right_di_8__57_, right_di_8__56_, right_di_8__55_, right_di_8__54_, 
        right_di_8__53_, right_di_8__52_, right_di_8__51_, right_di_8__50_, 
        right_di_8__49_, right_di_8__48_, right_di_8__47_, right_di_8__46_, 
        right_di_8__45_, right_di_8__44_, right_di_8__43_, right_di_8__42_, 
        right_di_8__41_, right_di_8__40_, right_di_8__39_, right_di_8__38_, 
        right_di_8__37_, right_di_8__36_, right_di_8__35_, right_di_8__34_, 
        right_di_8__33_, right_di_8__32_, right_di_8__31_, right_di_8__30_, 
        right_di_8__29_, right_di_8__28_, right_di_8__27_, right_di_8__26_, 
        right_di_8__25_, right_di_8__24_, right_di_8__23_, right_di_8__22_, 
        right_di_8__21_, right_di_8__20_, right_di_8__19_, right_di_8__18_, 
        right_di_8__17_, right_di_8__16_, right_di_8__15_, right_di_8__14_, 
        right_di_8__13_, right_di_8__12_, right_di_8__11_, right_di_8__10_, 
        right_di_8__9_, right_di_8__8_, right_di_8__7_, right_di_8__6_, 
        right_di_8__5_, right_di_8__4_, right_di_8__3_, right_di_8__2_, 
        right_di_8__1_, right_di_8__0_}), .right_do(right_do[319:256]), 
        .NIC_do(node12_pedo), .up_ro(up_ro[9]), .down_ro(up_ri[5]), .left_ro(
        right_ri[8]), .right_ro(right_ro_9), .NIC_ro(node12_pero), 
        .polarity_to_NIC(node12_polarity) );
  cardinal_router GY_2__GX_2__R ( .clk(clk), .reset(reset), .up_si(up_si[10]), 
        .down_si(up_so[6]), .left_si(right_so[9]), .right_si(right_si_10), 
        .NIC_si(node22_pesi), .up_di({up_di_10__63_, up_di_10__62_, 
        up_di_10__61_, up_di_10__60_, up_di_10__59_, up_di_10__58_, 
        up_di_10__57_, up_di_10__56_, up_di_10__55_, up_di_10__54_, 
        up_di_10__53_, up_di_10__52_, up_di_10__51_, up_di_10__50_, 
        up_di_10__49_, up_di_10__48_, up_di_10__47_, up_di_10__46_, 
        up_di_10__45_, up_di_10__44_, up_di_10__43_, up_di_10__42_, 
        up_di_10__41_, up_di_10__40_, up_di_10__39_, up_di_10__38_, 
        up_di_10__37_, up_di_10__36_, up_di_10__35_, up_di_10__34_, 
        up_di_10__33_, up_di_10__32_, up_di_10__31_, up_di_10__30_, 
        up_di_10__29_, up_di_10__28_, up_di_10__27_, up_di_10__26_, 
        up_di_10__25_, up_di_10__24_, up_di_10__23_, up_di_10__22_, 
        up_di_10__21_, up_di_10__20_, up_di_10__19_, up_di_10__18_, 
        up_di_10__17_, up_di_10__16_, up_di_10__15_, up_di_10__14_, 
        up_di_10__13_, up_di_10__12_, up_di_10__11_, up_di_10__10_, 
        up_di_10__9_, up_di_10__8_, up_di_10__7_, up_di_10__6_, up_di_10__5_, 
        up_di_10__4_, up_di_10__3_, up_di_10__2_, up_di_10__1_, up_di_10__0_}), 
        .down_di(up_do[383:320]), .left_di(right_do[319:256]), .right_di({
        right_di_10__63_, right_di_10__62_, right_di_10__61_, right_di_10__60_, 
        right_di_10__59_, right_di_10__58_, right_di_10__57_, right_di_10__56_, 
        right_di_10__55_, right_di_10__54_, right_di_10__53_, right_di_10__52_, 
        right_di_10__51_, right_di_10__50_, right_di_10__49_, right_di_10__48_, 
        right_di_10__47_, right_di_10__46_, right_di_10__45_, right_di_10__44_, 
        right_di_10__43_, right_di_10__42_, right_di_10__41_, right_di_10__40_, 
        right_di_10__39_, right_di_10__38_, right_di_10__37_, right_di_10__36_, 
        right_di_10__35_, right_di_10__34_, right_di_10__33_, right_di_10__32_, 
        right_di_10__31_, right_di_10__30_, right_di_10__29_, right_di_10__28_, 
        right_di_10__27_, right_di_10__26_, right_di_10__25_, right_di_10__24_, 
        right_di_10__23_, right_di_10__22_, right_di_10__21_, right_di_10__20_, 
        right_di_10__19_, right_di_10__18_, right_di_10__17_, right_di_10__16_, 
        right_di_10__15_, right_di_10__14_, right_di_10__13_, right_di_10__12_, 
        right_di_10__11_, right_di_10__10_, right_di_10__9_, right_di_10__8_, 
        right_di_10__7_, right_di_10__6_, right_di_10__5_, right_di_10__4_, 
        right_di_10__3_, right_di_10__2_, right_di_10__1_, right_di_10__0_}), 
        .NIC_di(node22_pedi), .up_ri(up_ri[10]), .down_ri(up_ro[6]), .left_ri(
        right_ro_9), .right_ri(right_ri[10]), .NIC_ri(node22_peri), .up_so(
        up_so[10]), .down_so(up_si[6]), .left_so(right_si_9), .right_so(
        right_so[10]), .NIC_so(node22_peso), .up_do(up_do[127:64]), .down_do({
        up_di_6__63_, up_di_6__62_, up_di_6__61_, up_di_6__60_, up_di_6__59_, 
        up_di_6__58_, up_di_6__57_, up_di_6__56_, up_di_6__55_, up_di_6__54_, 
        up_di_6__53_, up_di_6__52_, up_di_6__51_, up_di_6__50_, up_di_6__49_, 
        up_di_6__48_, up_di_6__47_, up_di_6__46_, up_di_6__45_, up_di_6__44_, 
        up_di_6__43_, up_di_6__42_, up_di_6__41_, up_di_6__40_, up_di_6__39_, 
        up_di_6__38_, up_di_6__37_, up_di_6__36_, up_di_6__35_, up_di_6__34_, 
        up_di_6__33_, up_di_6__32_, up_di_6__31_, up_di_6__30_, up_di_6__29_, 
        up_di_6__28_, up_di_6__27_, up_di_6__26_, up_di_6__25_, up_di_6__24_, 
        up_di_6__23_, up_di_6__22_, up_di_6__21_, up_di_6__20_, up_di_6__19_, 
        up_di_6__18_, up_di_6__17_, up_di_6__16_, up_di_6__15_, up_di_6__14_, 
        up_di_6__13_, up_di_6__12_, up_di_6__11_, up_di_6__10_, up_di_6__9_, 
        up_di_6__8_, up_di_6__7_, up_di_6__6_, up_di_6__5_, up_di_6__4_, 
        up_di_6__3_, up_di_6__2_, up_di_6__1_, up_di_6__0_}), .left_do({
        right_di_9__63_, right_di_9__62_, right_di_9__61_, right_di_9__60_, 
        right_di_9__59_, right_di_9__58_, right_di_9__57_, right_di_9__56_, 
        right_di_9__55_, right_di_9__54_, right_di_9__53_, right_di_9__52_, 
        right_di_9__51_, right_di_9__50_, right_di_9__49_, right_di_9__48_, 
        right_di_9__47_, right_di_9__46_, right_di_9__45_, right_di_9__44_, 
        right_di_9__43_, right_di_9__42_, right_di_9__41_, right_di_9__40_, 
        right_di_9__39_, right_di_9__38_, right_di_9__37_, right_di_9__36_, 
        right_di_9__35_, right_di_9__34_, right_di_9__33_, right_di_9__32_, 
        right_di_9__31_, right_di_9__30_, right_di_9__29_, right_di_9__28_, 
        right_di_9__27_, right_di_9__26_, right_di_9__25_, right_di_9__24_, 
        right_di_9__23_, right_di_9__22_, right_di_9__21_, right_di_9__20_, 
        right_di_9__19_, right_di_9__18_, right_di_9__17_, right_di_9__16_, 
        right_di_9__15_, right_di_9__14_, right_di_9__13_, right_di_9__12_, 
        right_di_9__11_, right_di_9__10_, right_di_9__9_, right_di_9__8_, 
        right_di_9__7_, right_di_9__6_, right_di_9__5_, right_di_9__4_, 
        right_di_9__3_, right_di_9__2_, right_di_9__1_, right_di_9__0_}), 
        .right_do(right_do[255:192]), .NIC_do(node22_pedo), .up_ro(up_ro[10]), 
        .down_ro(up_ri[6]), .left_ro(right_ri[9]), .right_ro(right_ro_10), 
        .NIC_ro(node22_pero), .polarity_to_NIC(node22_polarity) );
  cardinal_router GY_2__GX_3__R ( .clk(clk), .reset(reset), .up_si(up_si[11]), 
        .down_si(up_so[7]), .left_si(right_so[10]), .right_si(1'b0), .NIC_si(
        node32_pesi), .up_di({up_di_11__63_, up_di_11__62_, up_di_11__61_, 
        up_di_11__60_, up_di_11__59_, up_di_11__58_, up_di_11__57_, 
        up_di_11__56_, up_di_11__55_, up_di_11__54_, up_di_11__53_, 
        up_di_11__52_, up_di_11__51_, up_di_11__50_, up_di_11__49_, 
        up_di_11__48_, up_di_11__47_, up_di_11__46_, up_di_11__45_, 
        up_di_11__44_, up_di_11__43_, up_di_11__42_, up_di_11__41_, 
        up_di_11__40_, up_di_11__39_, up_di_11__38_, up_di_11__37_, 
        up_di_11__36_, up_di_11__35_, up_di_11__34_, up_di_11__33_, 
        up_di_11__32_, up_di_11__31_, up_di_11__30_, up_di_11__29_, 
        up_di_11__28_, up_di_11__27_, up_di_11__26_, up_di_11__25_, 
        up_di_11__24_, up_di_11__23_, up_di_11__22_, up_di_11__21_, 
        up_di_11__20_, up_di_11__19_, up_di_11__18_, up_di_11__17_, 
        up_di_11__16_, up_di_11__15_, up_di_11__14_, up_di_11__13_, 
        up_di_11__12_, up_di_11__11_, up_di_11__10_, up_di_11__9_, 
        up_di_11__8_, up_di_11__7_, up_di_11__6_, up_di_11__5_, up_di_11__4_, 
        up_di_11__3_, up_di_11__2_, up_di_11__1_, up_di_11__0_}), .down_di(
        up_do[319:256]), .left_di(right_do[255:192]), .right_di({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .NIC_di(node32_pedi), .up_ri(up_ri[11]), .down_ri(
        up_ro[7]), .left_ri(right_ro_10), .NIC_ri(node32_peri), .up_so(
        up_so[11]), .down_so(up_si[7]), .left_so(right_si_10), .NIC_so(
        node32_peso), .up_do(up_do[63:0]), .down_do({up_di_7__63_, 
        up_di_7__62_, up_di_7__61_, up_di_7__60_, up_di_7__59_, up_di_7__58_, 
        up_di_7__57_, up_di_7__56_, up_di_7__55_, up_di_7__54_, up_di_7__53_, 
        up_di_7__52_, up_di_7__51_, up_di_7__50_, up_di_7__49_, up_di_7__48_, 
        up_di_7__47_, up_di_7__46_, up_di_7__45_, up_di_7__44_, up_di_7__43_, 
        up_di_7__42_, up_di_7__41_, up_di_7__40_, up_di_7__39_, up_di_7__38_, 
        up_di_7__37_, up_di_7__36_, up_di_7__35_, up_di_7__34_, up_di_7__33_, 
        up_di_7__32_, up_di_7__31_, up_di_7__30_, up_di_7__29_, up_di_7__28_, 
        up_di_7__27_, up_di_7__26_, up_di_7__25_, up_di_7__24_, up_di_7__23_, 
        up_di_7__22_, up_di_7__21_, up_di_7__20_, up_di_7__19_, up_di_7__18_, 
        up_di_7__17_, up_di_7__16_, up_di_7__15_, up_di_7__14_, up_di_7__13_, 
        up_di_7__12_, up_di_7__11_, up_di_7__10_, up_di_7__9_, up_di_7__8_, 
        up_di_7__7_, up_di_7__6_, up_di_7__5_, up_di_7__4_, up_di_7__3_, 
        up_di_7__2_, up_di_7__1_, up_di_7__0_}), .left_do({right_di_10__63_, 
        right_di_10__62_, right_di_10__61_, right_di_10__60_, right_di_10__59_, 
        right_di_10__58_, right_di_10__57_, right_di_10__56_, right_di_10__55_, 
        right_di_10__54_, right_di_10__53_, right_di_10__52_, right_di_10__51_, 
        right_di_10__50_, right_di_10__49_, right_di_10__48_, right_di_10__47_, 
        right_di_10__46_, right_di_10__45_, right_di_10__44_, right_di_10__43_, 
        right_di_10__42_, right_di_10__41_, right_di_10__40_, right_di_10__39_, 
        right_di_10__38_, right_di_10__37_, right_di_10__36_, right_di_10__35_, 
        right_di_10__34_, right_di_10__33_, right_di_10__32_, right_di_10__31_, 
        right_di_10__30_, right_di_10__29_, right_di_10__28_, right_di_10__27_, 
        right_di_10__26_, right_di_10__25_, right_di_10__24_, right_di_10__23_, 
        right_di_10__22_, right_di_10__21_, right_di_10__20_, right_di_10__19_, 
        right_di_10__18_, right_di_10__17_, right_di_10__16_, right_di_10__15_, 
        right_di_10__14_, right_di_10__13_, right_di_10__12_, right_di_10__11_, 
        right_di_10__10_, right_di_10__9_, right_di_10__8_, right_di_10__7_, 
        right_di_10__6_, right_di_10__5_, right_di_10__4_, right_di_10__3_, 
        right_di_10__2_, right_di_10__1_, right_di_10__0_}), .right_do({
        SYNOPSYS_UNCONNECTED_577, SYNOPSYS_UNCONNECTED_578, 
        SYNOPSYS_UNCONNECTED_579, SYNOPSYS_UNCONNECTED_580, 
        SYNOPSYS_UNCONNECTED_581, SYNOPSYS_UNCONNECTED_582, 
        SYNOPSYS_UNCONNECTED_583, SYNOPSYS_UNCONNECTED_584, 
        SYNOPSYS_UNCONNECTED_585, SYNOPSYS_UNCONNECTED_586, 
        SYNOPSYS_UNCONNECTED_587, SYNOPSYS_UNCONNECTED_588, 
        SYNOPSYS_UNCONNECTED_589, SYNOPSYS_UNCONNECTED_590, 
        SYNOPSYS_UNCONNECTED_591, SYNOPSYS_UNCONNECTED_592, 
        SYNOPSYS_UNCONNECTED_593, SYNOPSYS_UNCONNECTED_594, 
        SYNOPSYS_UNCONNECTED_595, SYNOPSYS_UNCONNECTED_596, 
        SYNOPSYS_UNCONNECTED_597, SYNOPSYS_UNCONNECTED_598, 
        SYNOPSYS_UNCONNECTED_599, SYNOPSYS_UNCONNECTED_600, 
        SYNOPSYS_UNCONNECTED_601, SYNOPSYS_UNCONNECTED_602, 
        SYNOPSYS_UNCONNECTED_603, SYNOPSYS_UNCONNECTED_604, 
        SYNOPSYS_UNCONNECTED_605, SYNOPSYS_UNCONNECTED_606, 
        SYNOPSYS_UNCONNECTED_607, SYNOPSYS_UNCONNECTED_608, 
        SYNOPSYS_UNCONNECTED_609, SYNOPSYS_UNCONNECTED_610, 
        SYNOPSYS_UNCONNECTED_611, SYNOPSYS_UNCONNECTED_612, 
        SYNOPSYS_UNCONNECTED_613, SYNOPSYS_UNCONNECTED_614, 
        SYNOPSYS_UNCONNECTED_615, SYNOPSYS_UNCONNECTED_616, 
        SYNOPSYS_UNCONNECTED_617, SYNOPSYS_UNCONNECTED_618, 
        SYNOPSYS_UNCONNECTED_619, SYNOPSYS_UNCONNECTED_620, 
        SYNOPSYS_UNCONNECTED_621, SYNOPSYS_UNCONNECTED_622, 
        SYNOPSYS_UNCONNECTED_623, SYNOPSYS_UNCONNECTED_624, 
        SYNOPSYS_UNCONNECTED_625, SYNOPSYS_UNCONNECTED_626, 
        SYNOPSYS_UNCONNECTED_627, SYNOPSYS_UNCONNECTED_628, 
        SYNOPSYS_UNCONNECTED_629, SYNOPSYS_UNCONNECTED_630, 
        SYNOPSYS_UNCONNECTED_631, SYNOPSYS_UNCONNECTED_632, 
        SYNOPSYS_UNCONNECTED_633, SYNOPSYS_UNCONNECTED_634, 
        SYNOPSYS_UNCONNECTED_635, SYNOPSYS_UNCONNECTED_636, 
        SYNOPSYS_UNCONNECTED_637, SYNOPSYS_UNCONNECTED_638, 
        SYNOPSYS_UNCONNECTED_639, SYNOPSYS_UNCONNECTED_640}), .NIC_do(
        node32_pedo), .up_ro(up_ro[11]), .down_ro(up_ri[7]), .left_ro(
        right_ri[10]), .right_ro(1'b0), .NIC_ro(node32_pero), 
        .polarity_to_NIC(node32_polarity) );
  cardinal_router GY_3__GX_0__R ( .clk(clk), .reset(reset), .up_si(1'b0), 
        .down_si(up_so[8]), .left_si(1'b0), .right_si(right_si_12), .NIC_si(
        node03_pesi), .up_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .down_di(
        up_do[255:192]), .left_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .right_di({
        right_di_12__63_, right_di_12__62_, right_di_12__61_, right_di_12__60_, 
        right_di_12__59_, right_di_12__58_, right_di_12__57_, right_di_12__56_, 
        right_di_12__55_, right_di_12__54_, right_di_12__53_, right_di_12__52_, 
        right_di_12__51_, right_di_12__50_, right_di_12__49_, right_di_12__48_, 
        right_di_12__47_, right_di_12__46_, right_di_12__45_, right_di_12__44_, 
        right_di_12__43_, right_di_12__42_, right_di_12__41_, right_di_12__40_, 
        right_di_12__39_, right_di_12__38_, right_di_12__37_, right_di_12__36_, 
        right_di_12__35_, right_di_12__34_, right_di_12__33_, right_di_12__32_, 
        right_di_12__31_, right_di_12__30_, right_di_12__29_, right_di_12__28_, 
        right_di_12__27_, right_di_12__26_, right_di_12__25_, right_di_12__24_, 
        right_di_12__23_, right_di_12__22_, right_di_12__21_, right_di_12__20_, 
        right_di_12__19_, right_di_12__18_, right_di_12__17_, right_di_12__16_, 
        right_di_12__15_, right_di_12__14_, right_di_12__13_, right_di_12__12_, 
        right_di_12__11_, right_di_12__10_, right_di_12__9_, right_di_12__8_, 
        right_di_12__7_, right_di_12__6_, right_di_12__5_, right_di_12__4_, 
        right_di_12__3_, right_di_12__2_, right_di_12__1_, right_di_12__0_}), 
        .NIC_di(node03_pedi), .down_ri(up_ro[8]), .right_ri(right_ri[12]), 
        .NIC_ri(node03_peri), .down_so(up_si[8]), .right_so(right_so[12]), 
        .NIC_so(node03_peso), .up_do({SYNOPSYS_UNCONNECTED_641, 
        SYNOPSYS_UNCONNECTED_642, SYNOPSYS_UNCONNECTED_643, 
        SYNOPSYS_UNCONNECTED_644, SYNOPSYS_UNCONNECTED_645, 
        SYNOPSYS_UNCONNECTED_646, SYNOPSYS_UNCONNECTED_647, 
        SYNOPSYS_UNCONNECTED_648, SYNOPSYS_UNCONNECTED_649, 
        SYNOPSYS_UNCONNECTED_650, SYNOPSYS_UNCONNECTED_651, 
        SYNOPSYS_UNCONNECTED_652, SYNOPSYS_UNCONNECTED_653, 
        SYNOPSYS_UNCONNECTED_654, SYNOPSYS_UNCONNECTED_655, 
        SYNOPSYS_UNCONNECTED_656, SYNOPSYS_UNCONNECTED_657, 
        SYNOPSYS_UNCONNECTED_658, SYNOPSYS_UNCONNECTED_659, 
        SYNOPSYS_UNCONNECTED_660, SYNOPSYS_UNCONNECTED_661, 
        SYNOPSYS_UNCONNECTED_662, SYNOPSYS_UNCONNECTED_663, 
        SYNOPSYS_UNCONNECTED_664, SYNOPSYS_UNCONNECTED_665, 
        SYNOPSYS_UNCONNECTED_666, SYNOPSYS_UNCONNECTED_667, 
        SYNOPSYS_UNCONNECTED_668, SYNOPSYS_UNCONNECTED_669, 
        SYNOPSYS_UNCONNECTED_670, SYNOPSYS_UNCONNECTED_671, 
        SYNOPSYS_UNCONNECTED_672, SYNOPSYS_UNCONNECTED_673, 
        SYNOPSYS_UNCONNECTED_674, SYNOPSYS_UNCONNECTED_675, 
        SYNOPSYS_UNCONNECTED_676, SYNOPSYS_UNCONNECTED_677, 
        SYNOPSYS_UNCONNECTED_678, SYNOPSYS_UNCONNECTED_679, 
        SYNOPSYS_UNCONNECTED_680, SYNOPSYS_UNCONNECTED_681, 
        SYNOPSYS_UNCONNECTED_682, SYNOPSYS_UNCONNECTED_683, 
        SYNOPSYS_UNCONNECTED_684, SYNOPSYS_UNCONNECTED_685, 
        SYNOPSYS_UNCONNECTED_686, SYNOPSYS_UNCONNECTED_687, 
        SYNOPSYS_UNCONNECTED_688, SYNOPSYS_UNCONNECTED_689, 
        SYNOPSYS_UNCONNECTED_690, SYNOPSYS_UNCONNECTED_691, 
        SYNOPSYS_UNCONNECTED_692, SYNOPSYS_UNCONNECTED_693, 
        SYNOPSYS_UNCONNECTED_694, SYNOPSYS_UNCONNECTED_695, 
        SYNOPSYS_UNCONNECTED_696, SYNOPSYS_UNCONNECTED_697, 
        SYNOPSYS_UNCONNECTED_698, SYNOPSYS_UNCONNECTED_699, 
        SYNOPSYS_UNCONNECTED_700, SYNOPSYS_UNCONNECTED_701, 
        SYNOPSYS_UNCONNECTED_702, SYNOPSYS_UNCONNECTED_703, 
        SYNOPSYS_UNCONNECTED_704}), .down_do({up_di_8__63_, up_di_8__62_, 
        up_di_8__61_, up_di_8__60_, up_di_8__59_, up_di_8__58_, up_di_8__57_, 
        up_di_8__56_, up_di_8__55_, up_di_8__54_, up_di_8__53_, up_di_8__52_, 
        up_di_8__51_, up_di_8__50_, up_di_8__49_, up_di_8__48_, up_di_8__47_, 
        up_di_8__46_, up_di_8__45_, up_di_8__44_, up_di_8__43_, up_di_8__42_, 
        up_di_8__41_, up_di_8__40_, up_di_8__39_, up_di_8__38_, up_di_8__37_, 
        up_di_8__36_, up_di_8__35_, up_di_8__34_, up_di_8__33_, up_di_8__32_, 
        up_di_8__31_, up_di_8__30_, up_di_8__29_, up_di_8__28_, up_di_8__27_, 
        up_di_8__26_, up_di_8__25_, up_di_8__24_, up_di_8__23_, up_di_8__22_, 
        up_di_8__21_, up_di_8__20_, up_di_8__19_, up_di_8__18_, up_di_8__17_, 
        up_di_8__16_, up_di_8__15_, up_di_8__14_, up_di_8__13_, up_di_8__12_, 
        up_di_8__11_, up_di_8__10_, up_di_8__9_, up_di_8__8_, up_di_8__7_, 
        up_di_8__6_, up_di_8__5_, up_di_8__4_, up_di_8__3_, up_di_8__2_, 
        up_di_8__1_, up_di_8__0_}), .left_do({SYNOPSYS_UNCONNECTED_705, 
        SYNOPSYS_UNCONNECTED_706, SYNOPSYS_UNCONNECTED_707, 
        SYNOPSYS_UNCONNECTED_708, SYNOPSYS_UNCONNECTED_709, 
        SYNOPSYS_UNCONNECTED_710, SYNOPSYS_UNCONNECTED_711, 
        SYNOPSYS_UNCONNECTED_712, SYNOPSYS_UNCONNECTED_713, 
        SYNOPSYS_UNCONNECTED_714, SYNOPSYS_UNCONNECTED_715, 
        SYNOPSYS_UNCONNECTED_716, SYNOPSYS_UNCONNECTED_717, 
        SYNOPSYS_UNCONNECTED_718, SYNOPSYS_UNCONNECTED_719, 
        SYNOPSYS_UNCONNECTED_720, SYNOPSYS_UNCONNECTED_721, 
        SYNOPSYS_UNCONNECTED_722, SYNOPSYS_UNCONNECTED_723, 
        SYNOPSYS_UNCONNECTED_724, SYNOPSYS_UNCONNECTED_725, 
        SYNOPSYS_UNCONNECTED_726, SYNOPSYS_UNCONNECTED_727, 
        SYNOPSYS_UNCONNECTED_728, SYNOPSYS_UNCONNECTED_729, 
        SYNOPSYS_UNCONNECTED_730, SYNOPSYS_UNCONNECTED_731, 
        SYNOPSYS_UNCONNECTED_732, SYNOPSYS_UNCONNECTED_733, 
        SYNOPSYS_UNCONNECTED_734, SYNOPSYS_UNCONNECTED_735, 
        SYNOPSYS_UNCONNECTED_736, SYNOPSYS_UNCONNECTED_737, 
        SYNOPSYS_UNCONNECTED_738, SYNOPSYS_UNCONNECTED_739, 
        SYNOPSYS_UNCONNECTED_740, SYNOPSYS_UNCONNECTED_741, 
        SYNOPSYS_UNCONNECTED_742, SYNOPSYS_UNCONNECTED_743, 
        SYNOPSYS_UNCONNECTED_744, SYNOPSYS_UNCONNECTED_745, 
        SYNOPSYS_UNCONNECTED_746, SYNOPSYS_UNCONNECTED_747, 
        SYNOPSYS_UNCONNECTED_748, SYNOPSYS_UNCONNECTED_749, 
        SYNOPSYS_UNCONNECTED_750, SYNOPSYS_UNCONNECTED_751, 
        SYNOPSYS_UNCONNECTED_752, SYNOPSYS_UNCONNECTED_753, 
        SYNOPSYS_UNCONNECTED_754, SYNOPSYS_UNCONNECTED_755, 
        SYNOPSYS_UNCONNECTED_756, SYNOPSYS_UNCONNECTED_757, 
        SYNOPSYS_UNCONNECTED_758, SYNOPSYS_UNCONNECTED_759, 
        SYNOPSYS_UNCONNECTED_760, SYNOPSYS_UNCONNECTED_761, 
        SYNOPSYS_UNCONNECTED_762, SYNOPSYS_UNCONNECTED_763, 
        SYNOPSYS_UNCONNECTED_764, SYNOPSYS_UNCONNECTED_765, 
        SYNOPSYS_UNCONNECTED_766, SYNOPSYS_UNCONNECTED_767, 
        SYNOPSYS_UNCONNECTED_768}), .right_do(right_do[191:128]), .NIC_do(
        node03_pedo), .up_ro(1'b0), .down_ro(up_ri[8]), .left_ro(1'b0), 
        .right_ro(right_ro_12), .NIC_ro(node03_pero), .polarity_to_NIC(
        node03_polarity) );
  cardinal_router GY_3__GX_1__R ( .clk(clk), .reset(reset), .up_si(1'b0), 
        .down_si(up_so[9]), .left_si(right_so[12]), .right_si(right_si_13), 
        .NIC_si(node13_pesi), .up_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .down_di(
        up_do[191:128]), .left_di(right_do[191:128]), .right_di({
        right_di_13__63_, right_di_13__62_, right_di_13__61_, right_di_13__60_, 
        right_di_13__59_, right_di_13__58_, right_di_13__57_, right_di_13__56_, 
        right_di_13__55_, right_di_13__54_, right_di_13__53_, right_di_13__52_, 
        right_di_13__51_, right_di_13__50_, right_di_13__49_, right_di_13__48_, 
        right_di_13__47_, right_di_13__46_, right_di_13__45_, right_di_13__44_, 
        right_di_13__43_, right_di_13__42_, right_di_13__41_, right_di_13__40_, 
        right_di_13__39_, right_di_13__38_, right_di_13__37_, right_di_13__36_, 
        right_di_13__35_, right_di_13__34_, right_di_13__33_, right_di_13__32_, 
        right_di_13__31_, right_di_13__30_, right_di_13__29_, right_di_13__28_, 
        right_di_13__27_, right_di_13__26_, right_di_13__25_, right_di_13__24_, 
        right_di_13__23_, right_di_13__22_, right_di_13__21_, right_di_13__20_, 
        right_di_13__19_, right_di_13__18_, right_di_13__17_, right_di_13__16_, 
        right_di_13__15_, right_di_13__14_, right_di_13__13_, right_di_13__12_, 
        right_di_13__11_, right_di_13__10_, right_di_13__9_, right_di_13__8_, 
        right_di_13__7_, right_di_13__6_, right_di_13__5_, right_di_13__4_, 
        right_di_13__3_, right_di_13__2_, right_di_13__1_, right_di_13__0_}), 
        .NIC_di(node13_pedi), .down_ri(up_ro[9]), .left_ri(right_ro_12), 
        .right_ri(right_ri[13]), .NIC_ri(node13_peri), .down_so(up_si[9]), 
        .left_so(right_si_12), .right_so(right_so[13]), .NIC_so(node13_peso), 
        .up_do({SYNOPSYS_UNCONNECTED_769, SYNOPSYS_UNCONNECTED_770, 
        SYNOPSYS_UNCONNECTED_771, SYNOPSYS_UNCONNECTED_772, 
        SYNOPSYS_UNCONNECTED_773, SYNOPSYS_UNCONNECTED_774, 
        SYNOPSYS_UNCONNECTED_775, SYNOPSYS_UNCONNECTED_776, 
        SYNOPSYS_UNCONNECTED_777, SYNOPSYS_UNCONNECTED_778, 
        SYNOPSYS_UNCONNECTED_779, SYNOPSYS_UNCONNECTED_780, 
        SYNOPSYS_UNCONNECTED_781, SYNOPSYS_UNCONNECTED_782, 
        SYNOPSYS_UNCONNECTED_783, SYNOPSYS_UNCONNECTED_784, 
        SYNOPSYS_UNCONNECTED_785, SYNOPSYS_UNCONNECTED_786, 
        SYNOPSYS_UNCONNECTED_787, SYNOPSYS_UNCONNECTED_788, 
        SYNOPSYS_UNCONNECTED_789, SYNOPSYS_UNCONNECTED_790, 
        SYNOPSYS_UNCONNECTED_791, SYNOPSYS_UNCONNECTED_792, 
        SYNOPSYS_UNCONNECTED_793, SYNOPSYS_UNCONNECTED_794, 
        SYNOPSYS_UNCONNECTED_795, SYNOPSYS_UNCONNECTED_796, 
        SYNOPSYS_UNCONNECTED_797, SYNOPSYS_UNCONNECTED_798, 
        SYNOPSYS_UNCONNECTED_799, SYNOPSYS_UNCONNECTED_800, 
        SYNOPSYS_UNCONNECTED_801, SYNOPSYS_UNCONNECTED_802, 
        SYNOPSYS_UNCONNECTED_803, SYNOPSYS_UNCONNECTED_804, 
        SYNOPSYS_UNCONNECTED_805, SYNOPSYS_UNCONNECTED_806, 
        SYNOPSYS_UNCONNECTED_807, SYNOPSYS_UNCONNECTED_808, 
        SYNOPSYS_UNCONNECTED_809, SYNOPSYS_UNCONNECTED_810, 
        SYNOPSYS_UNCONNECTED_811, SYNOPSYS_UNCONNECTED_812, 
        SYNOPSYS_UNCONNECTED_813, SYNOPSYS_UNCONNECTED_814, 
        SYNOPSYS_UNCONNECTED_815, SYNOPSYS_UNCONNECTED_816, 
        SYNOPSYS_UNCONNECTED_817, SYNOPSYS_UNCONNECTED_818, 
        SYNOPSYS_UNCONNECTED_819, SYNOPSYS_UNCONNECTED_820, 
        SYNOPSYS_UNCONNECTED_821, SYNOPSYS_UNCONNECTED_822, 
        SYNOPSYS_UNCONNECTED_823, SYNOPSYS_UNCONNECTED_824, 
        SYNOPSYS_UNCONNECTED_825, SYNOPSYS_UNCONNECTED_826, 
        SYNOPSYS_UNCONNECTED_827, SYNOPSYS_UNCONNECTED_828, 
        SYNOPSYS_UNCONNECTED_829, SYNOPSYS_UNCONNECTED_830, 
        SYNOPSYS_UNCONNECTED_831, SYNOPSYS_UNCONNECTED_832}), .down_do({
        up_di_9__63_, up_di_9__62_, up_di_9__61_, up_di_9__60_, up_di_9__59_, 
        up_di_9__58_, up_di_9__57_, up_di_9__56_, up_di_9__55_, up_di_9__54_, 
        up_di_9__53_, up_di_9__52_, up_di_9__51_, up_di_9__50_, up_di_9__49_, 
        up_di_9__48_, up_di_9__47_, up_di_9__46_, up_di_9__45_, up_di_9__44_, 
        up_di_9__43_, up_di_9__42_, up_di_9__41_, up_di_9__40_, up_di_9__39_, 
        up_di_9__38_, up_di_9__37_, up_di_9__36_, up_di_9__35_, up_di_9__34_, 
        up_di_9__33_, up_di_9__32_, up_di_9__31_, up_di_9__30_, up_di_9__29_, 
        up_di_9__28_, up_di_9__27_, up_di_9__26_, up_di_9__25_, up_di_9__24_, 
        up_di_9__23_, up_di_9__22_, up_di_9__21_, up_di_9__20_, up_di_9__19_, 
        up_di_9__18_, up_di_9__17_, up_di_9__16_, up_di_9__15_, up_di_9__14_, 
        up_di_9__13_, up_di_9__12_, up_di_9__11_, up_di_9__10_, up_di_9__9_, 
        up_di_9__8_, up_di_9__7_, up_di_9__6_, up_di_9__5_, up_di_9__4_, 
        up_di_9__3_, up_di_9__2_, up_di_9__1_, up_di_9__0_}), .left_do({
        right_di_12__63_, right_di_12__62_, right_di_12__61_, right_di_12__60_, 
        right_di_12__59_, right_di_12__58_, right_di_12__57_, right_di_12__56_, 
        right_di_12__55_, right_di_12__54_, right_di_12__53_, right_di_12__52_, 
        right_di_12__51_, right_di_12__50_, right_di_12__49_, right_di_12__48_, 
        right_di_12__47_, right_di_12__46_, right_di_12__45_, right_di_12__44_, 
        right_di_12__43_, right_di_12__42_, right_di_12__41_, right_di_12__40_, 
        right_di_12__39_, right_di_12__38_, right_di_12__37_, right_di_12__36_, 
        right_di_12__35_, right_di_12__34_, right_di_12__33_, right_di_12__32_, 
        right_di_12__31_, right_di_12__30_, right_di_12__29_, right_di_12__28_, 
        right_di_12__27_, right_di_12__26_, right_di_12__25_, right_di_12__24_, 
        right_di_12__23_, right_di_12__22_, right_di_12__21_, right_di_12__20_, 
        right_di_12__19_, right_di_12__18_, right_di_12__17_, right_di_12__16_, 
        right_di_12__15_, right_di_12__14_, right_di_12__13_, right_di_12__12_, 
        right_di_12__11_, right_di_12__10_, right_di_12__9_, right_di_12__8_, 
        right_di_12__7_, right_di_12__6_, right_di_12__5_, right_di_12__4_, 
        right_di_12__3_, right_di_12__2_, right_di_12__1_, right_di_12__0_}), 
        .right_do(right_do[127:64]), .NIC_do(node13_pedo), .up_ro(1'b0), 
        .down_ro(up_ri[9]), .left_ro(right_ri[12]), .right_ro(right_ro_13), 
        .NIC_ro(node13_pero), .polarity_to_NIC(node13_polarity) );
  cardinal_router GY_3__GX_2__R ( .clk(clk), .reset(reset), .up_si(1'b0), 
        .down_si(up_so[10]), .left_si(right_so[13]), .right_si(right_si_14), 
        .NIC_si(node23_pesi), .up_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .down_di(
        up_do[127:64]), .left_di(right_do[127:64]), .right_di({
        right_di_14__63_, right_di_14__62_, right_di_14__61_, right_di_14__60_, 
        right_di_14__59_, right_di_14__58_, right_di_14__57_, right_di_14__56_, 
        right_di_14__55_, right_di_14__54_, right_di_14__53_, right_di_14__52_, 
        right_di_14__51_, right_di_14__50_, right_di_14__49_, right_di_14__48_, 
        right_di_14__47_, right_di_14__46_, right_di_14__45_, right_di_14__44_, 
        right_di_14__43_, right_di_14__42_, right_di_14__41_, right_di_14__40_, 
        right_di_14__39_, right_di_14__38_, right_di_14__37_, right_di_14__36_, 
        right_di_14__35_, right_di_14__34_, right_di_14__33_, right_di_14__32_, 
        right_di_14__31_, right_di_14__30_, right_di_14__29_, right_di_14__28_, 
        right_di_14__27_, right_di_14__26_, right_di_14__25_, right_di_14__24_, 
        right_di_14__23_, right_di_14__22_, right_di_14__21_, right_di_14__20_, 
        right_di_14__19_, right_di_14__18_, right_di_14__17_, right_di_14__16_, 
        right_di_14__15_, right_di_14__14_, right_di_14__13_, right_di_14__12_, 
        right_di_14__11_, right_di_14__10_, right_di_14__9_, right_di_14__8_, 
        right_di_14__7_, right_di_14__6_, right_di_14__5_, right_di_14__4_, 
        right_di_14__3_, right_di_14__2_, right_di_14__1_, right_di_14__0_}), 
        .NIC_di(node23_pedi), .down_ri(up_ro[10]), .left_ri(right_ro_13), 
        .right_ri(right_ri[14]), .NIC_ri(node23_peri), .down_so(up_si[10]), 
        .left_so(right_si_13), .right_so(right_so[14]), .NIC_so(node23_peso), 
        .up_do({SYNOPSYS_UNCONNECTED_833, SYNOPSYS_UNCONNECTED_834, 
        SYNOPSYS_UNCONNECTED_835, SYNOPSYS_UNCONNECTED_836, 
        SYNOPSYS_UNCONNECTED_837, SYNOPSYS_UNCONNECTED_838, 
        SYNOPSYS_UNCONNECTED_839, SYNOPSYS_UNCONNECTED_840, 
        SYNOPSYS_UNCONNECTED_841, SYNOPSYS_UNCONNECTED_842, 
        SYNOPSYS_UNCONNECTED_843, SYNOPSYS_UNCONNECTED_844, 
        SYNOPSYS_UNCONNECTED_845, SYNOPSYS_UNCONNECTED_846, 
        SYNOPSYS_UNCONNECTED_847, SYNOPSYS_UNCONNECTED_848, 
        SYNOPSYS_UNCONNECTED_849, SYNOPSYS_UNCONNECTED_850, 
        SYNOPSYS_UNCONNECTED_851, SYNOPSYS_UNCONNECTED_852, 
        SYNOPSYS_UNCONNECTED_853, SYNOPSYS_UNCONNECTED_854, 
        SYNOPSYS_UNCONNECTED_855, SYNOPSYS_UNCONNECTED_856, 
        SYNOPSYS_UNCONNECTED_857, SYNOPSYS_UNCONNECTED_858, 
        SYNOPSYS_UNCONNECTED_859, SYNOPSYS_UNCONNECTED_860, 
        SYNOPSYS_UNCONNECTED_861, SYNOPSYS_UNCONNECTED_862, 
        SYNOPSYS_UNCONNECTED_863, SYNOPSYS_UNCONNECTED_864, 
        SYNOPSYS_UNCONNECTED_865, SYNOPSYS_UNCONNECTED_866, 
        SYNOPSYS_UNCONNECTED_867, SYNOPSYS_UNCONNECTED_868, 
        SYNOPSYS_UNCONNECTED_869, SYNOPSYS_UNCONNECTED_870, 
        SYNOPSYS_UNCONNECTED_871, SYNOPSYS_UNCONNECTED_872, 
        SYNOPSYS_UNCONNECTED_873, SYNOPSYS_UNCONNECTED_874, 
        SYNOPSYS_UNCONNECTED_875, SYNOPSYS_UNCONNECTED_876, 
        SYNOPSYS_UNCONNECTED_877, SYNOPSYS_UNCONNECTED_878, 
        SYNOPSYS_UNCONNECTED_879, SYNOPSYS_UNCONNECTED_880, 
        SYNOPSYS_UNCONNECTED_881, SYNOPSYS_UNCONNECTED_882, 
        SYNOPSYS_UNCONNECTED_883, SYNOPSYS_UNCONNECTED_884, 
        SYNOPSYS_UNCONNECTED_885, SYNOPSYS_UNCONNECTED_886, 
        SYNOPSYS_UNCONNECTED_887, SYNOPSYS_UNCONNECTED_888, 
        SYNOPSYS_UNCONNECTED_889, SYNOPSYS_UNCONNECTED_890, 
        SYNOPSYS_UNCONNECTED_891, SYNOPSYS_UNCONNECTED_892, 
        SYNOPSYS_UNCONNECTED_893, SYNOPSYS_UNCONNECTED_894, 
        SYNOPSYS_UNCONNECTED_895, SYNOPSYS_UNCONNECTED_896}), .down_do({
        up_di_10__63_, up_di_10__62_, up_di_10__61_, up_di_10__60_, 
        up_di_10__59_, up_di_10__58_, up_di_10__57_, up_di_10__56_, 
        up_di_10__55_, up_di_10__54_, up_di_10__53_, up_di_10__52_, 
        up_di_10__51_, up_di_10__50_, up_di_10__49_, up_di_10__48_, 
        up_di_10__47_, up_di_10__46_, up_di_10__45_, up_di_10__44_, 
        up_di_10__43_, up_di_10__42_, up_di_10__41_, up_di_10__40_, 
        up_di_10__39_, up_di_10__38_, up_di_10__37_, up_di_10__36_, 
        up_di_10__35_, up_di_10__34_, up_di_10__33_, up_di_10__32_, 
        up_di_10__31_, up_di_10__30_, up_di_10__29_, up_di_10__28_, 
        up_di_10__27_, up_di_10__26_, up_di_10__25_, up_di_10__24_, 
        up_di_10__23_, up_di_10__22_, up_di_10__21_, up_di_10__20_, 
        up_di_10__19_, up_di_10__18_, up_di_10__17_, up_di_10__16_, 
        up_di_10__15_, up_di_10__14_, up_di_10__13_, up_di_10__12_, 
        up_di_10__11_, up_di_10__10_, up_di_10__9_, up_di_10__8_, up_di_10__7_, 
        up_di_10__6_, up_di_10__5_, up_di_10__4_, up_di_10__3_, up_di_10__2_, 
        up_di_10__1_, up_di_10__0_}), .left_do({right_di_13__63_, 
        right_di_13__62_, right_di_13__61_, right_di_13__60_, right_di_13__59_, 
        right_di_13__58_, right_di_13__57_, right_di_13__56_, right_di_13__55_, 
        right_di_13__54_, right_di_13__53_, right_di_13__52_, right_di_13__51_, 
        right_di_13__50_, right_di_13__49_, right_di_13__48_, right_di_13__47_, 
        right_di_13__46_, right_di_13__45_, right_di_13__44_, right_di_13__43_, 
        right_di_13__42_, right_di_13__41_, right_di_13__40_, right_di_13__39_, 
        right_di_13__38_, right_di_13__37_, right_di_13__36_, right_di_13__35_, 
        right_di_13__34_, right_di_13__33_, right_di_13__32_, right_di_13__31_, 
        right_di_13__30_, right_di_13__29_, right_di_13__28_, right_di_13__27_, 
        right_di_13__26_, right_di_13__25_, right_di_13__24_, right_di_13__23_, 
        right_di_13__22_, right_di_13__21_, right_di_13__20_, right_di_13__19_, 
        right_di_13__18_, right_di_13__17_, right_di_13__16_, right_di_13__15_, 
        right_di_13__14_, right_di_13__13_, right_di_13__12_, right_di_13__11_, 
        right_di_13__10_, right_di_13__9_, right_di_13__8_, right_di_13__7_, 
        right_di_13__6_, right_di_13__5_, right_di_13__4_, right_di_13__3_, 
        right_di_13__2_, right_di_13__1_, right_di_13__0_}), .right_do(
        right_do[63:0]), .NIC_do(node23_pedo), .up_ro(1'b0), .down_ro(
        up_ri[10]), .left_ro(right_ri[13]), .right_ro(right_ro_14), .NIC_ro(
        node23_pero), .polarity_to_NIC(node23_polarity) );
  cardinal_router GY_3__GX_3__R ( .clk(clk), .reset(reset), .up_si(1'b0), 
        .down_si(up_so[11]), .left_si(right_so[14]), .right_si(1'b0), .NIC_si(
        node33_pesi), .up_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .down_di(up_do[63:0]), .left_di(right_do[63:0]), .right_di({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .NIC_di(
        node33_pedi), .down_ri(up_ro[11]), .left_ri(right_ro_14), .NIC_ri(
        node33_peri), .down_so(up_si[11]), .left_so(right_si_14), .NIC_so(
        node33_peso), .up_do({SYNOPSYS_UNCONNECTED_897, 
        SYNOPSYS_UNCONNECTED_898, SYNOPSYS_UNCONNECTED_899, 
        SYNOPSYS_UNCONNECTED_900, SYNOPSYS_UNCONNECTED_901, 
        SYNOPSYS_UNCONNECTED_902, SYNOPSYS_UNCONNECTED_903, 
        SYNOPSYS_UNCONNECTED_904, SYNOPSYS_UNCONNECTED_905, 
        SYNOPSYS_UNCONNECTED_906, SYNOPSYS_UNCONNECTED_907, 
        SYNOPSYS_UNCONNECTED_908, SYNOPSYS_UNCONNECTED_909, 
        SYNOPSYS_UNCONNECTED_910, SYNOPSYS_UNCONNECTED_911, 
        SYNOPSYS_UNCONNECTED_912, SYNOPSYS_UNCONNECTED_913, 
        SYNOPSYS_UNCONNECTED_914, SYNOPSYS_UNCONNECTED_915, 
        SYNOPSYS_UNCONNECTED_916, SYNOPSYS_UNCONNECTED_917, 
        SYNOPSYS_UNCONNECTED_918, SYNOPSYS_UNCONNECTED_919, 
        SYNOPSYS_UNCONNECTED_920, SYNOPSYS_UNCONNECTED_921, 
        SYNOPSYS_UNCONNECTED_922, SYNOPSYS_UNCONNECTED_923, 
        SYNOPSYS_UNCONNECTED_924, SYNOPSYS_UNCONNECTED_925, 
        SYNOPSYS_UNCONNECTED_926, SYNOPSYS_UNCONNECTED_927, 
        SYNOPSYS_UNCONNECTED_928, SYNOPSYS_UNCONNECTED_929, 
        SYNOPSYS_UNCONNECTED_930, SYNOPSYS_UNCONNECTED_931, 
        SYNOPSYS_UNCONNECTED_932, SYNOPSYS_UNCONNECTED_933, 
        SYNOPSYS_UNCONNECTED_934, SYNOPSYS_UNCONNECTED_935, 
        SYNOPSYS_UNCONNECTED_936, SYNOPSYS_UNCONNECTED_937, 
        SYNOPSYS_UNCONNECTED_938, SYNOPSYS_UNCONNECTED_939, 
        SYNOPSYS_UNCONNECTED_940, SYNOPSYS_UNCONNECTED_941, 
        SYNOPSYS_UNCONNECTED_942, SYNOPSYS_UNCONNECTED_943, 
        SYNOPSYS_UNCONNECTED_944, SYNOPSYS_UNCONNECTED_945, 
        SYNOPSYS_UNCONNECTED_946, SYNOPSYS_UNCONNECTED_947, 
        SYNOPSYS_UNCONNECTED_948, SYNOPSYS_UNCONNECTED_949, 
        SYNOPSYS_UNCONNECTED_950, SYNOPSYS_UNCONNECTED_951, 
        SYNOPSYS_UNCONNECTED_952, SYNOPSYS_UNCONNECTED_953, 
        SYNOPSYS_UNCONNECTED_954, SYNOPSYS_UNCONNECTED_955, 
        SYNOPSYS_UNCONNECTED_956, SYNOPSYS_UNCONNECTED_957, 
        SYNOPSYS_UNCONNECTED_958, SYNOPSYS_UNCONNECTED_959, 
        SYNOPSYS_UNCONNECTED_960}), .down_do({up_di_11__63_, up_di_11__62_, 
        up_di_11__61_, up_di_11__60_, up_di_11__59_, up_di_11__58_, 
        up_di_11__57_, up_di_11__56_, up_di_11__55_, up_di_11__54_, 
        up_di_11__53_, up_di_11__52_, up_di_11__51_, up_di_11__50_, 
        up_di_11__49_, up_di_11__48_, up_di_11__47_, up_di_11__46_, 
        up_di_11__45_, up_di_11__44_, up_di_11__43_, up_di_11__42_, 
        up_di_11__41_, up_di_11__40_, up_di_11__39_, up_di_11__38_, 
        up_di_11__37_, up_di_11__36_, up_di_11__35_, up_di_11__34_, 
        up_di_11__33_, up_di_11__32_, up_di_11__31_, up_di_11__30_, 
        up_di_11__29_, up_di_11__28_, up_di_11__27_, up_di_11__26_, 
        up_di_11__25_, up_di_11__24_, up_di_11__23_, up_di_11__22_, 
        up_di_11__21_, up_di_11__20_, up_di_11__19_, up_di_11__18_, 
        up_di_11__17_, up_di_11__16_, up_di_11__15_, up_di_11__14_, 
        up_di_11__13_, up_di_11__12_, up_di_11__11_, up_di_11__10_, 
        up_di_11__9_, up_di_11__8_, up_di_11__7_, up_di_11__6_, up_di_11__5_, 
        up_di_11__4_, up_di_11__3_, up_di_11__2_, up_di_11__1_, up_di_11__0_}), 
        .left_do({right_di_14__63_, right_di_14__62_, right_di_14__61_, 
        right_di_14__60_, right_di_14__59_, right_di_14__58_, right_di_14__57_, 
        right_di_14__56_, right_di_14__55_, right_di_14__54_, right_di_14__53_, 
        right_di_14__52_, right_di_14__51_, right_di_14__50_, right_di_14__49_, 
        right_di_14__48_, right_di_14__47_, right_di_14__46_, right_di_14__45_, 
        right_di_14__44_, right_di_14__43_, right_di_14__42_, right_di_14__41_, 
        right_di_14__40_, right_di_14__39_, right_di_14__38_, right_di_14__37_, 
        right_di_14__36_, right_di_14__35_, right_di_14__34_, right_di_14__33_, 
        right_di_14__32_, right_di_14__31_, right_di_14__30_, right_di_14__29_, 
        right_di_14__28_, right_di_14__27_, right_di_14__26_, right_di_14__25_, 
        right_di_14__24_, right_di_14__23_, right_di_14__22_, right_di_14__21_, 
        right_di_14__20_, right_di_14__19_, right_di_14__18_, right_di_14__17_, 
        right_di_14__16_, right_di_14__15_, right_di_14__14_, right_di_14__13_, 
        right_di_14__12_, right_di_14__11_, right_di_14__10_, right_di_14__9_, 
        right_di_14__8_, right_di_14__7_, right_di_14__6_, right_di_14__5_, 
        right_di_14__4_, right_di_14__3_, right_di_14__2_, right_di_14__1_, 
        right_di_14__0_}), .right_do({SYNOPSYS_UNCONNECTED_961, 
        SYNOPSYS_UNCONNECTED_962, SYNOPSYS_UNCONNECTED_963, 
        SYNOPSYS_UNCONNECTED_964, SYNOPSYS_UNCONNECTED_965, 
        SYNOPSYS_UNCONNECTED_966, SYNOPSYS_UNCONNECTED_967, 
        SYNOPSYS_UNCONNECTED_968, SYNOPSYS_UNCONNECTED_969, 
        SYNOPSYS_UNCONNECTED_970, SYNOPSYS_UNCONNECTED_971, 
        SYNOPSYS_UNCONNECTED_972, SYNOPSYS_UNCONNECTED_973, 
        SYNOPSYS_UNCONNECTED_974, SYNOPSYS_UNCONNECTED_975, 
        SYNOPSYS_UNCONNECTED_976, SYNOPSYS_UNCONNECTED_977, 
        SYNOPSYS_UNCONNECTED_978, SYNOPSYS_UNCONNECTED_979, 
        SYNOPSYS_UNCONNECTED_980, SYNOPSYS_UNCONNECTED_981, 
        SYNOPSYS_UNCONNECTED_982, SYNOPSYS_UNCONNECTED_983, 
        SYNOPSYS_UNCONNECTED_984, SYNOPSYS_UNCONNECTED_985, 
        SYNOPSYS_UNCONNECTED_986, SYNOPSYS_UNCONNECTED_987, 
        SYNOPSYS_UNCONNECTED_988, SYNOPSYS_UNCONNECTED_989, 
        SYNOPSYS_UNCONNECTED_990, SYNOPSYS_UNCONNECTED_991, 
        SYNOPSYS_UNCONNECTED_992, SYNOPSYS_UNCONNECTED_993, 
        SYNOPSYS_UNCONNECTED_994, SYNOPSYS_UNCONNECTED_995, 
        SYNOPSYS_UNCONNECTED_996, SYNOPSYS_UNCONNECTED_997, 
        SYNOPSYS_UNCONNECTED_998, SYNOPSYS_UNCONNECTED_999, 
        SYNOPSYS_UNCONNECTED_1000, SYNOPSYS_UNCONNECTED_1001, 
        SYNOPSYS_UNCONNECTED_1002, SYNOPSYS_UNCONNECTED_1003, 
        SYNOPSYS_UNCONNECTED_1004, SYNOPSYS_UNCONNECTED_1005, 
        SYNOPSYS_UNCONNECTED_1006, SYNOPSYS_UNCONNECTED_1007, 
        SYNOPSYS_UNCONNECTED_1008, SYNOPSYS_UNCONNECTED_1009, 
        SYNOPSYS_UNCONNECTED_1010, SYNOPSYS_UNCONNECTED_1011, 
        SYNOPSYS_UNCONNECTED_1012, SYNOPSYS_UNCONNECTED_1013, 
        SYNOPSYS_UNCONNECTED_1014, SYNOPSYS_UNCONNECTED_1015, 
        SYNOPSYS_UNCONNECTED_1016, SYNOPSYS_UNCONNECTED_1017, 
        SYNOPSYS_UNCONNECTED_1018, SYNOPSYS_UNCONNECTED_1019, 
        SYNOPSYS_UNCONNECTED_1020, SYNOPSYS_UNCONNECTED_1021, 
        SYNOPSYS_UNCONNECTED_1022, SYNOPSYS_UNCONNECTED_1023, 
        SYNOPSYS_UNCONNECTED_1024}), .NIC_do(node33_pedo), .up_ro(1'b0), 
        .down_ro(up_ri[11]), .left_ro(right_ri[14]), .right_ro(1'b0), .NIC_ro(
        node33_pero), .polarity_to_NIC(node33_polarity) );
endmodule

