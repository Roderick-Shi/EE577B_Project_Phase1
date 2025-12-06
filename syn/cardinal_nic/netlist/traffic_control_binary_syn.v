/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-5
// Date      : Sun Oct 12 11:36:47 2025
/////////////////////////////////////////////////////////////


module traffic_control_binary ( clk, reset, ERR, PA, PB, L_A, L_B, RA, RB );
  output [2:0] L_A;
  output [2:0] L_B;
  input clk, reset, ERR, PA, PB;
  output RA, RB;
  wire   regPA, regPB, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, n4, n5, n7, n8, n10, n11, n12, n13, n14, n15, n18, n19, n20, n21,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124;
  wire   [3:0] cnt;
  wire   [7:0] state;

  DFFPOSX1 state_reg_7_ ( .D(N92), .CLK(clk), .Q(state[7]) );
  DFFPOSX1 state_reg_6_ ( .D(N91), .CLK(clk), .Q(state[6]) );
  DFFPOSX1 state_reg_5_ ( .D(N90), .CLK(clk), .Q(state[5]) );
  DFFPOSX1 state_reg_4_ ( .D(N89), .CLK(clk), .Q(state[4]) );
  DFFPOSX1 state_reg_3_ ( .D(N88), .CLK(clk), .Q(state[3]) );
  DFFPOSX1 state_reg_0_ ( .D(n110), .CLK(clk), .Q(state[0]) );
  DFFPOSX1 state_reg_2_ ( .D(n122), .CLK(clk), .Q(state[2]) );
  DFFPOSX1 cnt_reg_3_ ( .D(n86), .CLK(clk), .Q(cnt[3]) );
  DFFPOSX1 state_reg_1_ ( .D(n114), .CLK(clk), .Q(state[1]) );
  DFFPOSX1 regPB_reg ( .D(n83), .CLK(clk), .Q(regPB) );
  DFFPOSX1 regPA_reg ( .D(n84), .CLK(clk), .Q(regPA) );
  DFFPOSX1 cnt_reg_0_ ( .D(N93), .CLK(clk), .Q(cnt[0]) );
  DFFPOSX1 cnt_reg_1_ ( .D(N94), .CLK(clk), .Q(cnt[1]) );
  DFFPOSX1 cnt_reg_2_ ( .D(N95), .CLK(clk), .Q(cnt[2]) );
  OAI21X1 U38 ( .A(n113), .B(n15), .C(n101), .Y(n83) );
  OAI21X1 U40 ( .A(n14), .B(n113), .C(n105), .Y(n84) );
  OAI21X1 U43 ( .A(n30), .B(n31), .C(n116), .Y(n29) );
  NAND3X1 U46 ( .A(n115), .B(N86), .C(n37), .Y(n35) );
  XOR2X1 U47 ( .A(n8), .B(n7), .Y(n37) );
  NAND3X1 U48 ( .A(cnt[3]), .B(n38), .C(n5), .Y(n34) );
  OAI21X1 U49 ( .A(n107), .B(n117), .C(n108), .Y(N95) );
  AOI21X1 U51 ( .A(cnt[2]), .B(n120), .C(n11), .Y(n39) );
  OAI21X1 U52 ( .A(n36), .B(n47), .C(n90), .Y(N94) );
  AOI21X1 U53 ( .A(n5), .B(n46), .C(n42), .Y(n45) );
  NOR3X1 U54 ( .A(n36), .B(n122), .C(n30), .Y(n42) );
  OAI21X1 U55 ( .A(n13), .B(n12), .C(n120), .Y(n46) );
  OAI21X1 U56 ( .A(cnt[0]), .B(n117), .C(n92), .Y(N93) );
  NAND3X1 U59 ( .A(n31), .B(N86), .C(n30), .Y(n49) );
  AOI21X1 U60 ( .A(n110), .B(n122), .C(n43), .Y(n50) );
  NAND3X1 U61 ( .A(n27), .B(n51), .C(n36), .Y(n40) );
  XOR2X1 U63 ( .A(n21), .B(n31), .Y(n53) );
  XOR2X1 U64 ( .A(state[0]), .B(n7), .Y(n52) );
  OAI21X1 U66 ( .A(n124), .B(n21), .C(n55), .Y(n31) );
  OAI21X1 U67 ( .A(n97), .B(n57), .C(n124), .Y(n55) );
  OAI21X1 U68 ( .A(n106), .B(n14), .C(n89), .Y(n57) );
  NAND3X1 U69 ( .A(n51), .B(n24), .C(state[2]), .Y(n59) );
  NAND3X1 U70 ( .A(n111), .B(n118), .C(n100), .Y(n56) );
  NAND3X1 U71 ( .A(state[1]), .B(n10), .C(n63), .Y(n62) );
  NOR3X1 U72 ( .A(n24), .B(state[2]), .C(regPA), .Y(n63) );
  NAND3X1 U74 ( .A(n10), .B(n124), .C(n75), .Y(n65) );
  OAI21X1 U75 ( .A(n18), .B(n66), .C(state[1]), .Y(n64) );
  OAI21X1 U76 ( .A(n10), .B(n112), .C(n121), .Y(n66) );
  OAI21X1 U79 ( .A(n124), .B(n24), .C(n91), .Y(n30) );
  NAND3X1 U81 ( .A(n71), .B(n72), .C(n98), .Y(n70) );
  AOI22X1 U82 ( .A(n10), .B(n74), .C(n75), .D(n51), .Y(n73) );
  AOI22X1 U83 ( .A(state[2]), .B(n77), .C(state[0]), .D(n51), .Y(n76) );
  OAI21X1 U84 ( .A(regPB), .B(n51), .C(n24), .Y(n77) );
  NAND3X1 U85 ( .A(n24), .B(n23), .C(n10), .Y(n58) );
  NAND3X1 U87 ( .A(n118), .B(n109), .C(n124), .Y(L_B[1]) );
  NAND3X1 U88 ( .A(n119), .B(n33), .C(n124), .Y(L_B[0]) );
  NAND3X1 U90 ( .A(n119), .B(n102), .C(n124), .Y(L_A[1]) );
  NAND3X1 U92 ( .A(n111), .B(n33), .C(n104), .Y(n80) );
  NAND3X1 U97 ( .A(n124), .B(n33), .C(n20), .Y(L_A[0]) );
  OAI21X1 U98 ( .A(n121), .B(n23), .C(n118), .Y(n74) );
  NAND3X1 U99 ( .A(n24), .B(n23), .C(state[2]), .Y(n61) );
  NOR3X1 U101 ( .A(state[3]), .B(state[4]), .C(n19), .Y(n54) );
  NOR3X1 U102 ( .A(state[5]), .B(state[7]), .C(state[6]), .Y(n82) );
  AND2X1 U103 ( .A(n64), .B(n87), .Y(n43) );
  OR2X1 U104 ( .A(n120), .B(cnt[2]), .Y(n38) );
  AND2X1 U105 ( .A(regPB), .B(n116), .Y(RB) );
  AND2X1 U106 ( .A(n116), .B(regPA), .Y(RA) );
  AND2X1 U107 ( .A(n4), .B(n88), .Y(n47) );
  AND2X1 U108 ( .A(n124), .B(n103), .Y(L_B[2]) );
  OR2X1 U109 ( .A(n106), .B(regPA), .Y(n71) );
  OR2X1 U110 ( .A(n96), .B(n23), .Y(n72) );
  BUFX2 U111 ( .A(n50), .Y(n85) );
  AND2X1 U112 ( .A(n95), .B(n94), .Y(N96) );
  INVX1 U113 ( .A(N96), .Y(n86) );
  BUFX2 U114 ( .A(n65), .Y(n87) );
  BUFX2 U115 ( .A(n49), .Y(n88) );
  BUFX2 U116 ( .A(n59), .Y(n89) );
  BUFX2 U117 ( .A(n45), .Y(n90) );
  AND2X1 U118 ( .A(n124), .B(n93), .Y(n69) );
  INVX1 U119 ( .A(n69), .Y(n91) );
  AND2X1 U120 ( .A(n99), .B(n115), .Y(n48) );
  INVX1 U121 ( .A(n48), .Y(n92) );
  BUFX2 U122 ( .A(n70), .Y(n93) );
  BUFX2 U123 ( .A(n35), .Y(n94) );
  BUFX2 U124 ( .A(n34), .Y(n95) );
  BUFX2 U125 ( .A(n76), .Y(n96) );
  BUFX2 U126 ( .A(n56), .Y(n97) );
  BUFX2 U127 ( .A(n73), .Y(n98) );
  INVX1 U128 ( .A(n47), .Y(n99) );
  BUFX2 U129 ( .A(n62), .Y(n100) );
  AND2X1 U130 ( .A(PB), .B(n27), .Y(n26) );
  INVX1 U131 ( .A(n26), .Y(n101) );
  INVX1 U132 ( .A(L_B[2]), .Y(n102) );
  BUFX2 U133 ( .A(n80), .Y(n103) );
  AND2X1 U134 ( .A(state[2]), .B(n24), .Y(n81) );
  INVX1 U135 ( .A(n81), .Y(n104) );
  AND2X1 U136 ( .A(PA), .B(n27), .Y(n28) );
  INVX1 U137 ( .A(n28), .Y(n105) );
  BUFX2 U138 ( .A(n58), .Y(n106) );
  BUFX2 U139 ( .A(n39), .Y(n107) );
  AND2X1 U140 ( .A(n42), .B(n43), .Y(n41) );
  INVX1 U141 ( .A(n41), .Y(n108) );
  AND2X1 U142 ( .A(n124), .B(n21), .Y(L_A[2]) );
  INVX1 U143 ( .A(L_A[2]), .Y(n109) );
  AND2X1 U144 ( .A(n7), .B(n27), .Y(N85) );
  INVX1 U145 ( .A(N85), .Y(n110) );
  AND2X1 U146 ( .A(n112), .B(n23), .Y(n60) );
  INVX1 U147 ( .A(n60), .Y(n111) );
  OR2X1 U148 ( .A(n24), .B(n21), .Y(n67) );
  INVX1 U149 ( .A(n67), .Y(n112) );
  AND2X1 U150 ( .A(n27), .B(n29), .Y(n25) );
  INVX1 U151 ( .A(n25), .Y(n113) );
  AND2X1 U152 ( .A(n43), .B(n27), .Y(N86) );
  INVX1 U153 ( .A(N86), .Y(n114) );
  AND2X1 U154 ( .A(n52), .B(n53), .Y(n36) );
  INVX1 U155 ( .A(n36), .Y(n115) );
  OR2X1 U156 ( .A(n33), .B(n18), .Y(n32) );
  INVX1 U157 ( .A(n32), .Y(n116) );
  OR2X1 U158 ( .A(n121), .B(state[1]), .Y(n33) );
  BUFX2 U159 ( .A(n40), .Y(n117) );
  BUFX2 U160 ( .A(n61), .Y(n118) );
  AND2X1 U161 ( .A(state[0]), .B(n23), .Y(n75) );
  INVX1 U162 ( .A(n75), .Y(n119) );
  AND2X1 U163 ( .A(n12), .B(n13), .Y(n44) );
  INVX1 U164 ( .A(n44), .Y(n120) );
  AND2X1 U165 ( .A(n24), .B(n21), .Y(n68) );
  INVX1 U166 ( .A(n68), .Y(n121) );
  AND2X1 U167 ( .A(n8), .B(n27), .Y(N87) );
  INVX1 U168 ( .A(N87), .Y(n122) );
  INVX1 U169 ( .A(n30), .Y(n7) );
  INVX1 U170 ( .A(n31), .Y(n8) );
  INVX1 U171 ( .A(n117), .Y(n5) );
  INVX1 U172 ( .A(n51), .Y(n10) );
  INVX1 U173 ( .A(n85), .Y(n4) );
  INVX1 U174 ( .A(n74), .Y(n20) );
  INVX1 U175 ( .A(n124), .Y(n18) );
  OR2X1 U176 ( .A(n38), .B(cnt[3]), .Y(n51) );
  BUFX2 U177 ( .A(n54), .Y(n124) );
  INVX1 U178 ( .A(n82), .Y(n19) );
  INVX1 U179 ( .A(regPB), .Y(n15) );
  INVX1 U180 ( .A(state[2]), .Y(n21) );
  INVX1 U181 ( .A(n38), .Y(n11) );
  OR2X1 U182 ( .A(ERR), .B(reset), .Y(n123) );
  INVX1 U183 ( .A(n123), .Y(n27) );
  INVX1 U184 ( .A(state[1]), .Y(n23) );
  INVX1 U185 ( .A(state[0]), .Y(n24) );
  INVX1 U186 ( .A(regPA), .Y(n14) );
  AND2X1 U187 ( .A(state[3]), .B(n27), .Y(N88) );
  AND2X1 U188 ( .A(state[4]), .B(n27), .Y(N89) );
  AND2X1 U189 ( .A(state[5]), .B(n27), .Y(N90) );
  AND2X1 U190 ( .A(state[6]), .B(n27), .Y(N91) );
  AND2X1 U191 ( .A(state[7]), .B(n27), .Y(N92) );
  INVX1 U192 ( .A(cnt[0]), .Y(n13) );
  INVX1 U193 ( .A(cnt[1]), .Y(n12) );
endmodule

