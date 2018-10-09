/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 24 15:54:04 2018
/////////////////////////////////////////////////////////////


module leak_unit ( i_leak_weight, i_leak_prn, i_mode_sel, o_leak_weight );
  input [7:0] i_leak_weight;
  input [7:0] i_leak_prn;
  output [7:0] o_leak_weight;
  input i_mode_sel;
  wire   N8, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96;
  assign N8 = i_leak_weight[0];

  INV_X1 U62 ( .A(N8), .ZN(n87) );
  INV_X1 U63 ( .A(i_mode_sel), .ZN(n85) );
  NOR4_X1 U64 ( .A1(i_leak_weight[3]), .A2(i_leak_weight[2]), .A3(
        i_leak_weight[1]), .A4(N8), .ZN(n54) );
  INV_X1 U65 ( .A(i_leak_weight[4]), .ZN(n92) );
  NAND2_X1 U66 ( .A1(n54), .A2(n92), .ZN(n69) );
  NAND2_X1 U67 ( .A1(n69), .A2(i_leak_weight[7]), .ZN(n53) );
  XOR2_X1 U68 ( .A(i_leak_weight[5]), .B(n53), .Z(n75) );
  NOR2_X1 U69 ( .A1(i_leak_prn[5]), .A2(n75), .ZN(n83) );
  INV_X1 U70 ( .A(i_leak_weight[7]), .ZN(n96) );
  NOR2_X1 U71 ( .A1(n96), .A2(n54), .ZN(n55) );
  XNOR2_X1 U72 ( .A(n55), .B(i_leak_weight[4]), .ZN(n74) );
  NOR3_X1 U73 ( .A1(i_leak_weight[2]), .A2(i_leak_weight[1]), .A3(N8), .ZN(n56) );
  NOR2_X1 U74 ( .A1(n56), .A2(n96), .ZN(n57) );
  XOR2_X1 U75 ( .A(i_leak_weight[3]), .B(n57), .Z(n68) );
  NOR2_X1 U76 ( .A1(n96), .A2(n87), .ZN(n59) );
  NOR2_X1 U77 ( .A1(i_leak_weight[1]), .A2(n59), .ZN(n58) );
  AOI221_X1 U78 ( .B1(n87), .B2(i_leak_prn[0]), .C1(n59), .C2(i_leak_weight[1]), .A(n58), .ZN(n62) );
  NOR2_X1 U79 ( .A1(i_leak_weight[1]), .A2(N8), .ZN(n60) );
  AOI21_X1 U80 ( .B1(i_leak_prn[0]), .B2(n60), .A(i_leak_prn[1]), .ZN(n61) );
  NOR2_X1 U81 ( .A1(n62), .A2(n61), .ZN(n65) );
  OAI21_X1 U82 ( .B1(i_leak_weight[1]), .B2(N8), .A(i_leak_weight[7]), .ZN(n63) );
  XOR2_X1 U83 ( .A(i_leak_weight[2]), .B(n63), .Z(n64) );
  AOI222_X1 U84 ( .A1(i_leak_prn[2]), .A2(n65), .B1(i_leak_prn[2]), .B2(n64), 
        .C1(n65), .C2(n64), .ZN(n67) );
  INV_X1 U85 ( .A(i_leak_prn[3]), .ZN(n66) );
  AOI222_X1 U86 ( .A1(n68), .A2(n67), .B1(n68), .B2(n66), .C1(n67), .C2(n66), 
        .ZN(n72) );
  NOR2_X1 U87 ( .A1(i_leak_weight[5]), .A2(n69), .ZN(n73) );
  NOR2_X1 U88 ( .A1(n73), .A2(n96), .ZN(n70) );
  XNOR2_X1 U89 ( .A(i_leak_weight[6]), .B(n70), .ZN(n79) );
  OR2_X1 U90 ( .A1(i_leak_prn[6]), .A2(n79), .ZN(n71) );
  OAI211_X1 U91 ( .C1(i_leak_prn[4]), .C2(n74), .A(n72), .B(n71), .ZN(n82) );
  INV_X1 U92 ( .A(i_leak_weight[6]), .ZN(n94) );
  NAND3_X1 U93 ( .A1(i_leak_weight[7]), .A2(n73), .A3(n94), .ZN(n81) );
  OAI211_X1 U94 ( .C1(i_leak_prn[5]), .C2(n75), .A(n74), .B(i_leak_prn[4]), 
        .ZN(n77) );
  NAND2_X1 U95 ( .A1(i_leak_prn[5]), .A2(n75), .ZN(n76) );
  NAND2_X1 U96 ( .A1(n77), .A2(n76), .ZN(n78) );
  AOI222_X1 U97 ( .A1(i_leak_prn[6]), .A2(n79), .B1(i_leak_prn[6]), .B2(n78), 
        .C1(n79), .C2(n78), .ZN(n80) );
  OAI211_X1 U98 ( .C1(n83), .C2(n82), .A(n81), .B(n80), .ZN(n84) );
  NOR3_X1 U99 ( .A1(i_leak_prn[7]), .A2(n85), .A3(n84), .ZN(n88) );
  INV_X1 U100 ( .A(n88), .ZN(n86) );
  OAI21_X1 U101 ( .B1(i_mode_sel), .B2(n87), .A(n86), .ZN(o_leak_weight[0]) );
  INV_X1 U102 ( .A(i_leak_weight[1]), .ZN(n89) );
  NAND2_X1 U103 ( .A1(i_leak_weight[7]), .A2(n88), .ZN(n95) );
  OAI21_X1 U104 ( .B1(i_mode_sel), .B2(n89), .A(n95), .ZN(o_leak_weight[1]) );
  INV_X1 U105 ( .A(i_leak_weight[2]), .ZN(n90) );
  OAI21_X1 U106 ( .B1(i_mode_sel), .B2(n90), .A(n95), .ZN(o_leak_weight[2]) );
  INV_X1 U107 ( .A(i_leak_weight[3]), .ZN(n91) );
  OAI21_X1 U108 ( .B1(i_mode_sel), .B2(n91), .A(n95), .ZN(o_leak_weight[3]) );
  OAI21_X1 U109 ( .B1(i_mode_sel), .B2(n92), .A(n95), .ZN(o_leak_weight[4]) );
  INV_X1 U110 ( .A(i_leak_weight[5]), .ZN(n93) );
  OAI21_X1 U111 ( .B1(i_mode_sel), .B2(n93), .A(n95), .ZN(o_leak_weight[5]) );
  OAI21_X1 U112 ( .B1(i_mode_sel), .B2(n94), .A(n95), .ZN(o_leak_weight[6]) );
  OAI21_X1 U113 ( .B1(i_mode_sel), .B2(n96), .A(n95), .ZN(o_leak_weight[7]) );
endmodule

