/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 24 16:04:52 2018
/////////////////////////////////////////////////////////////


module integrator_unit ( i_clk, i_rst, i_V, i_syn_weight, i_leak_weight, 
        i_spike_en, i_leak_en, o_V, o_V_valid );
  input [7:0] i_V;
  input [7:0] i_syn_weight;
  input [7:0] i_leak_weight;
  output [7:0] o_V;
  input i_clk, i_rst, i_spike_en, i_leak_en;
  output o_V_valid;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39;
  wire   [7:0] o_V_net;

  DFFR_X1 o_V_valid_reg ( .D(i_leak_en), .CK(i_clk), .RN(n39), .Q(o_V_valid)
         );
  DFFR_X1 \o_V_reg[7]  ( .D(o_V_net[7]), .CK(i_clk), .RN(n39), .Q(o_V[7]) );
  DFFR_X1 \o_V_reg[6]  ( .D(o_V_net[6]), .CK(i_clk), .RN(n39), .Q(o_V[6]) );
  DFFR_X1 \o_V_reg[5]  ( .D(o_V_net[5]), .CK(i_clk), .RN(n39), .Q(o_V[5]) );
  DFFR_X1 \o_V_reg[4]  ( .D(o_V_net[4]), .CK(i_clk), .RN(n39), .Q(o_V[4]) );
  DFFR_X1 \o_V_reg[3]  ( .D(o_V_net[3]), .CK(i_clk), .RN(n39), .Q(o_V[3]) );
  DFFR_X1 \o_V_reg[2]  ( .D(o_V_net[2]), .CK(i_clk), .RN(n39), .Q(o_V[2]) );
  DFFR_X1 \o_V_reg[1]  ( .D(o_V_net[1]), .CK(i_clk), .RN(n39), .Q(o_V[1]) );
  DFFR_X1 \o_V_reg[0]  ( .D(o_V_net[0]), .CK(i_clk), .RN(n39), .Q(o_V[0]) );
  INV_X1 U15 ( .A(i_rst), .ZN(n39) );
  INV_X1 U16 ( .A(i_spike_en), .ZN(n12) );
  AOI22_X1 U17 ( .A1(n12), .A2(i_leak_weight[6]), .B1(i_spike_en), .B2(
        i_syn_weight[6]), .ZN(n5) );
  INV_X1 U18 ( .A(n5), .ZN(n19) );
  AOI22_X1 U19 ( .A1(n12), .A2(i_leak_weight[5]), .B1(i_spike_en), .B2(
        i_syn_weight[5]), .ZN(n6) );
  INV_X1 U20 ( .A(n6), .ZN(n22) );
  AOI22_X1 U21 ( .A1(n12), .A2(i_leak_weight[4]), .B1(i_spike_en), .B2(
        i_syn_weight[4]), .ZN(n7) );
  INV_X1 U22 ( .A(n7), .ZN(n25) );
  AOI22_X1 U23 ( .A1(n12), .A2(i_leak_weight[3]), .B1(i_spike_en), .B2(
        i_syn_weight[3]), .ZN(n8) );
  INV_X1 U24 ( .A(n8), .ZN(n28) );
  AOI22_X1 U25 ( .A1(n12), .A2(i_leak_weight[2]), .B1(i_spike_en), .B2(
        i_syn_weight[2]), .ZN(n9) );
  INV_X1 U26 ( .A(n9), .ZN(n31) );
  AOI22_X1 U27 ( .A1(n12), .A2(i_leak_weight[1]), .B1(i_spike_en), .B2(
        i_syn_weight[1]), .ZN(n10) );
  INV_X1 U28 ( .A(n10), .ZN(n34) );
  AOI22_X1 U29 ( .A1(n12), .A2(i_leak_weight[0]), .B1(i_spike_en), .B2(
        i_syn_weight[0]), .ZN(n11) );
  INV_X1 U30 ( .A(n11), .ZN(n36) );
  AOI22_X1 U31 ( .A1(n12), .A2(i_leak_weight[7]), .B1(i_spike_en), .B2(
        i_syn_weight[7]), .ZN(n13) );
  INV_X1 U32 ( .A(n13), .ZN(n14) );
  XOR2_X1 U33 ( .A(n14), .B(o_V[7]), .Z(n15) );
  XOR2_X1 U34 ( .A(n16), .B(n15), .Z(n17) );
  NOR2_X1 U35 ( .A1(i_leak_en), .A2(i_spike_en), .ZN(n37) );
  MUX2_X1 U36 ( .A(n17), .B(i_V[7]), .S(n37), .Z(o_V_net[7]) );
  FA_X1 U37 ( .A(n19), .B(o_V[6]), .CI(n18), .CO(n16), .S(n20) );
  MUX2_X1 U38 ( .A(n20), .B(i_V[6]), .S(n37), .Z(o_V_net[6]) );
  FA_X1 U39 ( .A(n22), .B(o_V[5]), .CI(n21), .CO(n18), .S(n23) );
  MUX2_X1 U40 ( .A(n23), .B(i_V[5]), .S(n37), .Z(o_V_net[5]) );
  FA_X1 U41 ( .A(n25), .B(o_V[4]), .CI(n24), .CO(n21), .S(n26) );
  MUX2_X1 U42 ( .A(n26), .B(i_V[4]), .S(n37), .Z(o_V_net[4]) );
  FA_X1 U43 ( .A(n28), .B(o_V[3]), .CI(n27), .CO(n24), .S(n29) );
  MUX2_X1 U44 ( .A(n29), .B(i_V[3]), .S(n37), .Z(o_V_net[3]) );
  FA_X1 U45 ( .A(n31), .B(o_V[2]), .CI(n30), .CO(n27), .S(n32) );
  MUX2_X1 U46 ( .A(n32), .B(i_V[2]), .S(n37), .Z(o_V_net[2]) );
  FA_X1 U47 ( .A(n34), .B(o_V[1]), .CI(n33), .CO(n30), .S(n35) );
  MUX2_X1 U48 ( .A(n35), .B(i_V[1]), .S(n37), .Z(o_V_net[1]) );
  HA_X1 U49 ( .A(n36), .B(o_V[0]), .CO(n33), .S(n38) );
  MUX2_X1 U50 ( .A(n38), .B(i_V[0]), .S(n37), .Z(o_V_net[0]) );
endmodule

