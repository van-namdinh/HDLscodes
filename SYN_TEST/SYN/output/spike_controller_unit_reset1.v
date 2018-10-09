/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 31 14:22:24 2018
/////////////////////////////////////////////////////////////


module spike_controller_unit ( i_clk, i_rst, i_spike_en, i_spike_num, 
        o_spike_en, o_leak_en );
  input [7:0] i_spike_num;
  input i_clk, i_rst, i_spike_en;
  output o_spike_en, o_leak_en;
  wire   N14, N15, N16, N17, N18, N19, N20, N21, N24, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65;
  wire   [7:0] count_net;
  assign o_spike_en = N24;

  DFFS_X1 \count_net_reg[7]  ( .D(N21), .CK(i_clk), .SN(n29), .Q(count_net[7])
         );
  DFFS_X1 \count_net_reg[6]  ( .D(N20), .CK(i_clk), .SN(n29), .Q(count_net[6])
         );
  DFFS_X1 \count_net_reg[5]  ( .D(N19), .CK(i_clk), .SN(n29), .QN(n63) );
  DFFS_X1 \count_net_reg[4]  ( .D(N18), .CK(i_clk), .SN(n29), .Q(count_net[4])
         );
  DFFS_X1 \count_net_reg[3]  ( .D(N17), .CK(i_clk), .SN(n29), .QN(n64) );
  DFFS_X1 \count_net_reg[2]  ( .D(N16), .CK(i_clk), .SN(n29), .Q(count_net[2])
         );
  DFFS_X1 \count_net_reg[1]  ( .D(N15), .CK(i_clk), .SN(n29), .Q(count_net[1]), 
        .QN(n65) );
  DFFS_X1 \count_net_reg[0]  ( .D(N14), .CK(i_clk), .SN(n29), .Q(count_net[0])
         );
  INV_X1 U42 ( .A(i_rst), .ZN(n29) );
  NOR3_X1 U43 ( .A1(count_net[2]), .A2(count_net[0]), .A3(count_net[1]), .ZN(
        n35) );
  NAND2_X1 U44 ( .A1(n35), .A2(n64), .ZN(n37) );
  NOR2_X1 U45 ( .A1(count_net[4]), .A2(n37), .ZN(n39) );
  NAND2_X1 U46 ( .A1(n39), .A2(n63), .ZN(n41) );
  NOR2_X1 U47 ( .A1(count_net[6]), .A2(n41), .ZN(n61) );
  INV_X1 U48 ( .A(n61), .ZN(n44) );
  NOR2_X1 U49 ( .A1(count_net[7]), .A2(n44), .ZN(o_leak_en) );
  INV_X1 U50 ( .A(i_spike_num[0]), .ZN(n48) );
  INV_X1 U51 ( .A(i_spike_en), .ZN(n45) );
  AOI22_X1 U52 ( .A1(i_spike_en), .A2(n48), .B1(count_net[0]), .B2(n45), .ZN(
        N14) );
  INV_X1 U53 ( .A(i_spike_num[1]), .ZN(n31) );
  NOR2_X1 U54 ( .A1(count_net[0]), .A2(count_net[1]), .ZN(n32) );
  AOI21_X1 U55 ( .B1(count_net[1]), .B2(count_net[0]), .A(n32), .ZN(n30) );
  AOI22_X1 U56 ( .A1(i_spike_en), .A2(n31), .B1(n30), .B2(n45), .ZN(N15) );
  INV_X1 U57 ( .A(i_spike_num[2]), .ZN(n50) );
  INV_X1 U58 ( .A(n32), .ZN(n33) );
  AOI21_X1 U59 ( .B1(count_net[2]), .B2(n33), .A(n35), .ZN(n34) );
  AOI22_X1 U60 ( .A1(i_spike_en), .A2(n50), .B1(n34), .B2(n45), .ZN(N16) );
  OAI21_X1 U61 ( .B1(n35), .B2(n64), .A(n37), .ZN(n36) );
  MUX2_X1 U62 ( .A(i_spike_num[3]), .B(n36), .S(n45), .Z(N17) );
  INV_X1 U63 ( .A(i_spike_num[4]), .ZN(n55) );
  AOI21_X1 U64 ( .B1(count_net[4]), .B2(n37), .A(n39), .ZN(n38) );
  AOI22_X1 U65 ( .A1(i_spike_en), .A2(n55), .B1(n38), .B2(n45), .ZN(N18) );
  OAI21_X1 U66 ( .B1(n39), .B2(n63), .A(n41), .ZN(n40) );
  MUX2_X1 U67 ( .A(i_spike_num[5]), .B(n40), .S(n45), .Z(N19) );
  INV_X1 U68 ( .A(i_spike_num[6]), .ZN(n43) );
  AOI21_X1 U69 ( .B1(count_net[6]), .B2(n41), .A(n61), .ZN(n42) );
  AOI22_X1 U70 ( .A1(i_spike_en), .A2(n43), .B1(n42), .B2(n45), .ZN(N20) );
  INV_X1 U71 ( .A(i_spike_num[7]), .ZN(n47) );
  AOI21_X1 U72 ( .B1(count_net[7]), .B2(n44), .A(o_leak_en), .ZN(n46) );
  AOI22_X1 U73 ( .A1(i_spike_en), .A2(n47), .B1(n46), .B2(n45), .ZN(N21) );
  NAND2_X1 U74 ( .A1(count_net[0]), .A2(n48), .ZN(n49) );
  AOI222_X1 U75 ( .A1(i_spike_num[1]), .A2(n65), .B1(i_spike_num[1]), .B2(n49), 
        .C1(n65), .C2(n49), .ZN(n51) );
  AOI222_X1 U76 ( .A1(count_net[2]), .A2(n51), .B1(count_net[2]), .B2(n50), 
        .C1(n51), .C2(n50), .ZN(n52) );
  AOI222_X1 U77 ( .A1(i_spike_num[3]), .A2(n52), .B1(i_spike_num[3]), .B2(n64), 
        .C1(n52), .C2(n64), .ZN(n54) );
  OR2_X1 U78 ( .A1(n55), .A2(n54), .ZN(n56) );
  NOR2_X1 U79 ( .A1(i_spike_num[5]), .A2(n63), .ZN(n53) );
  AOI221_X1 U80 ( .B1(count_net[4]), .B2(n56), .C1(n55), .C2(n54), .A(n53), 
        .ZN(n57) );
  AOI21_X1 U81 ( .B1(i_spike_num[5]), .B2(n63), .A(n57), .ZN(n58) );
  NOR2_X1 U82 ( .A1(count_net[6]), .A2(n58), .ZN(n60) );
  AOI21_X1 U83 ( .B1(n58), .B2(count_net[6]), .A(i_spike_num[7]), .ZN(n59) );
  OAI21_X1 U84 ( .B1(i_spike_num[6]), .B2(n60), .A(n59), .ZN(n62) );
  NOR3_X1 U85 ( .A1(n62), .A2(count_net[7]), .A3(n61), .ZN(N24) );
endmodule

