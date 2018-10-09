/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Aug 27 09:25:42 2018
/////////////////////////////////////////////////////////////


module synapse_unit ( i_syn_weight, i_G, i_syn_prn, i_mode_sel, o_syn_weight
 );
  input [31:0] i_syn_weight;
  input [1:0] i_G;
  input [7:0] i_syn_prn;
  output [7:0] o_syn_weight;
  input i_mode_sel;
  wire   n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150;

  NOR2_X1 U90 ( .A1(i_G[0]), .A2(i_G[1]), .ZN(n116) );
  INV_X1 U91 ( .A(i_G[1]), .ZN(n81) );
  AND2_X1 U92 ( .A1(n81), .A2(i_G[0]), .ZN(n114) );
  AOI22_X1 U93 ( .A1(n116), .A2(i_syn_weight[24]), .B1(n114), .B2(
        i_syn_weight[16]), .ZN(n83) );
  NOR2_X1 U94 ( .A1(i_G[0]), .A2(n81), .ZN(n115) );
  AND2_X1 U95 ( .A1(i_G[0]), .A2(i_G[1]), .ZN(n117) );
  AOI22_X1 U96 ( .A1(n115), .A2(i_syn_weight[8]), .B1(n117), .B2(
        i_syn_weight[0]), .ZN(n82) );
  NAND2_X1 U97 ( .A1(n83), .A2(n82), .ZN(n90) );
  INV_X1 U98 ( .A(n90), .ZN(n137) );
  INV_X1 U99 ( .A(i_mode_sel), .ZN(n135) );
  AOI22_X1 U100 ( .A1(n116), .A2(i_syn_weight[29]), .B1(n114), .B2(
        i_syn_weight[21]), .ZN(n85) );
  AOI22_X1 U101 ( .A1(n115), .A2(i_syn_weight[13]), .B1(n117), .B2(
        i_syn_weight[5]), .ZN(n84) );
  NAND2_X1 U102 ( .A1(n85), .A2(n84), .ZN(n146) );
  AOI22_X1 U103 ( .A1(n116), .A2(i_syn_weight[27]), .B1(n114), .B2(
        i_syn_weight[19]), .ZN(n87) );
  AOI22_X1 U104 ( .A1(n115), .A2(i_syn_weight[11]), .B1(n117), .B2(
        i_syn_weight[3]), .ZN(n86) );
  NAND2_X1 U105 ( .A1(n87), .A2(n86), .ZN(n143) );
  AOI22_X1 U106 ( .A1(n116), .A2(i_syn_weight[25]), .B1(n114), .B2(
        i_syn_weight[17]), .ZN(n89) );
  AOI22_X1 U107 ( .A1(n115), .A2(i_syn_weight[9]), .B1(n117), .B2(
        i_syn_weight[1]), .ZN(n88) );
  NAND2_X1 U108 ( .A1(n89), .A2(n88), .ZN(n138) );
  NOR2_X1 U109 ( .A1(n138), .A2(n90), .ZN(n103) );
  AOI22_X1 U110 ( .A1(n115), .A2(i_syn_weight[10]), .B1(n114), .B2(
        i_syn_weight[18]), .ZN(n92) );
  AOI22_X1 U111 ( .A1(n117), .A2(i_syn_weight[2]), .B1(n116), .B2(
        i_syn_weight[26]), .ZN(n91) );
  AND2_X1 U112 ( .A1(n92), .A2(n91), .ZN(n142) );
  NAND2_X1 U113 ( .A1(n103), .A2(n142), .ZN(n108) );
  NOR2_X1 U114 ( .A1(n143), .A2(n108), .ZN(n98) );
  AOI22_X1 U115 ( .A1(n115), .A2(i_syn_weight[12]), .B1(n114), .B2(
        i_syn_weight[20]), .ZN(n94) );
  AOI22_X1 U116 ( .A1(n117), .A2(i_syn_weight[4]), .B1(n116), .B2(
        i_syn_weight[28]), .ZN(n93) );
  AND2_X1 U117 ( .A1(n94), .A2(n93), .ZN(n145) );
  NAND2_X1 U118 ( .A1(n98), .A2(n145), .ZN(n113) );
  AOI22_X1 U119 ( .A1(n116), .A2(i_syn_weight[31]), .B1(n114), .B2(
        i_syn_weight[23]), .ZN(n96) );
  AOI22_X1 U120 ( .A1(n115), .A2(i_syn_weight[15]), .B1(n117), .B2(
        i_syn_weight[7]), .ZN(n95) );
  NAND2_X1 U121 ( .A1(n96), .A2(n95), .ZN(n139) );
  NAND2_X1 U122 ( .A1(n113), .A2(n139), .ZN(n97) );
  XOR2_X1 U123 ( .A(n146), .B(n97), .Z(n125) );
  NOR2_X1 U124 ( .A1(i_syn_prn[5]), .A2(n125), .ZN(n133) );
  INV_X1 U125 ( .A(n139), .ZN(n150) );
  NOR2_X1 U126 ( .A1(n98), .A2(n150), .ZN(n99) );
  XOR2_X1 U127 ( .A(n99), .B(n145), .Z(n124) );
  NOR2_X1 U128 ( .A1(n103), .A2(n150), .ZN(n100) );
  XOR2_X1 U129 ( .A(n100), .B(n142), .Z(n107) );
  NOR2_X1 U130 ( .A1(n150), .A2(n137), .ZN(n102) );
  NOR2_X1 U131 ( .A1(n138), .A2(n102), .ZN(n101) );
  AOI221_X1 U132 ( .B1(i_syn_prn[0]), .B2(n137), .C1(n102), .C2(n138), .A(n101), .ZN(n105) );
  AOI21_X1 U133 ( .B1(i_syn_prn[0]), .B2(n103), .A(i_syn_prn[1]), .ZN(n104) );
  NOR2_X1 U134 ( .A1(n105), .A2(n104), .ZN(n106) );
  AOI222_X1 U135 ( .A1(n107), .A2(i_syn_prn[2]), .B1(n107), .B2(n106), .C1(
        i_syn_prn[2]), .C2(n106), .ZN(n112) );
  NAND2_X1 U136 ( .A1(n108), .A2(n139), .ZN(n109) );
  XNOR2_X1 U137 ( .A(n109), .B(n143), .ZN(n111) );
  INV_X1 U138 ( .A(i_syn_prn[3]), .ZN(n110) );
  AOI222_X1 U139 ( .A1(n112), .A2(n111), .B1(n112), .B2(n110), .C1(n111), .C2(
        n110), .ZN(n122) );
  NOR2_X1 U140 ( .A1(n146), .A2(n113), .ZN(n123) );
  NOR2_X1 U141 ( .A1(n123), .A2(n150), .ZN(n120) );
  AOI22_X1 U142 ( .A1(n115), .A2(i_syn_weight[14]), .B1(n114), .B2(
        i_syn_weight[22]), .ZN(n119) );
  AOI22_X1 U143 ( .A1(n117), .A2(i_syn_weight[6]), .B1(n116), .B2(
        i_syn_weight[30]), .ZN(n118) );
  AND2_X1 U144 ( .A1(n119), .A2(n118), .ZN(n148) );
  XOR2_X1 U145 ( .A(n120), .B(n148), .Z(n129) );
  OR2_X1 U146 ( .A1(n129), .A2(i_syn_prn[6]), .ZN(n121) );
  OAI211_X1 U147 ( .C1(n124), .C2(i_syn_prn[4]), .A(n122), .B(n121), .ZN(n132)
         );
  NAND3_X1 U148 ( .A1(n148), .A2(n123), .A3(n139), .ZN(n131) );
  OAI211_X1 U149 ( .C1(n125), .C2(i_syn_prn[5]), .A(i_syn_prn[4]), .B(n124), 
        .ZN(n127) );
  NAND2_X1 U150 ( .A1(n125), .A2(i_syn_prn[5]), .ZN(n126) );
  NAND2_X1 U151 ( .A1(n127), .A2(n126), .ZN(n128) );
  AOI222_X1 U152 ( .A1(n129), .A2(i_syn_prn[6]), .B1(n129), .B2(n128), .C1(
        i_syn_prn[6]), .C2(n128), .ZN(n130) );
  OAI211_X1 U153 ( .C1(n133), .C2(n132), .A(n131), .B(n130), .ZN(n134) );
  NOR3_X1 U154 ( .A1(i_syn_prn[7]), .A2(n135), .A3(n134), .ZN(n140) );
  INV_X1 U155 ( .A(n140), .ZN(n136) );
  OAI21_X1 U156 ( .B1(n137), .B2(i_mode_sel), .A(n136), .ZN(o_syn_weight[0])
         );
  INV_X1 U157 ( .A(n138), .ZN(n141) );
  NAND2_X1 U158 ( .A1(n140), .A2(n139), .ZN(n149) );
  OAI21_X1 U159 ( .B1(n141), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[1])
         );
  OAI21_X1 U160 ( .B1(n142), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[2])
         );
  INV_X1 U161 ( .A(n143), .ZN(n144) );
  OAI21_X1 U162 ( .B1(n144), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[3])
         );
  OAI21_X1 U163 ( .B1(n145), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[4])
         );
  INV_X1 U164 ( .A(n146), .ZN(n147) );
  OAI21_X1 U165 ( .B1(n147), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[5])
         );
  OAI21_X1 U166 ( .B1(n148), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[6])
         );
  OAI21_X1 U167 ( .B1(n150), .B2(i_mode_sel), .A(n149), .ZN(o_syn_weight[7])
         );
endmodule

