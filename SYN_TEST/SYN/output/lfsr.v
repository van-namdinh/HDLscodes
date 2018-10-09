/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Aug 27 10:45:00 2018
/////////////////////////////////////////////////////////////


module LFSR ( i_Clk, i_Enable, i_Seed_DV, i_Seed_Data, o_LFSR_Data );
  input [7:0] i_Seed_Data;
  output [7:0] o_LFSR_Data;
  input i_Clk, i_Enable, i_Seed_DV;
  wire   n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49;

  DFF_X1 \r_LFSR_reg[1]  ( .D(n28), .CK(i_Clk), .Q(o_LFSR_Data[0]), .QN(n46)
         );
  DFF_X1 \r_LFSR_reg[2]  ( .D(n27), .CK(i_Clk), .Q(o_LFSR_Data[1]), .QN(n47)
         );
  DFF_X1 \r_LFSR_reg[3]  ( .D(n26), .CK(i_Clk), .Q(o_LFSR_Data[2]), .QN(n48)
         );
  DFF_X1 \r_LFSR_reg[4]  ( .D(n25), .CK(i_Clk), .Q(o_LFSR_Data[3]), .QN(n44)
         );
  DFF_X1 \r_LFSR_reg[5]  ( .D(n24), .CK(i_Clk), .Q(o_LFSR_Data[4]), .QN(n45)
         );
  DFF_X1 \r_LFSR_reg[6]  ( .D(n23), .CK(i_Clk), .Q(o_LFSR_Data[5]), .QN(n43)
         );
  DFF_X1 \r_LFSR_reg[7]  ( .D(n22), .CK(i_Clk), .Q(o_LFSR_Data[6]), .QN(n49)
         );
  DFF_X1 \r_LFSR_reg[8]  ( .D(n21), .CK(i_Clk), .Q(o_LFSR_Data[7]) );
  XNOR2_X1 U30 ( .A(n44), .B(o_LFSR_Data[4]), .ZN(n30) );
  XOR2_X1 U31 ( .A(o_LFSR_Data[7]), .B(n43), .Z(n29) );
  XNOR2_X1 U32 ( .A(n30), .B(n29), .ZN(n32) );
  INV_X1 U33 ( .A(i_Enable), .ZN(n39) );
  OR2_X1 U34 ( .A1(n39), .A2(i_Seed_DV), .ZN(n42) );
  AND2_X1 U35 ( .A1(i_Enable), .A2(i_Seed_DV), .ZN(n40) );
  AOI22_X1 U36 ( .A1(i_Seed_Data[0]), .A2(n40), .B1(o_LFSR_Data[0]), .B2(n39), 
        .ZN(n31) );
  OAI21_X1 U37 ( .B1(n32), .B2(n42), .A(n31), .ZN(n28) );
  AOI22_X1 U38 ( .A1(i_Seed_Data[1]), .A2(n40), .B1(o_LFSR_Data[1]), .B2(n39), 
        .ZN(n33) );
  OAI21_X1 U39 ( .B1(n46), .B2(n42), .A(n33), .ZN(n27) );
  AOI22_X1 U40 ( .A1(i_Seed_Data[2]), .A2(n40), .B1(o_LFSR_Data[2]), .B2(n39), 
        .ZN(n34) );
  OAI21_X1 U41 ( .B1(n42), .B2(n47), .A(n34), .ZN(n26) );
  AOI22_X1 U42 ( .A1(i_Seed_Data[3]), .A2(n40), .B1(o_LFSR_Data[3]), .B2(n39), 
        .ZN(n35) );
  OAI21_X1 U43 ( .B1(n42), .B2(n48), .A(n35), .ZN(n25) );
  AOI22_X1 U44 ( .A1(i_Seed_Data[4]), .A2(n40), .B1(o_LFSR_Data[4]), .B2(n39), 
        .ZN(n36) );
  OAI21_X1 U45 ( .B1(n42), .B2(n44), .A(n36), .ZN(n24) );
  AOI22_X1 U46 ( .A1(i_Seed_Data[5]), .A2(n40), .B1(o_LFSR_Data[5]), .B2(n39), 
        .ZN(n37) );
  OAI21_X1 U47 ( .B1(n42), .B2(n45), .A(n37), .ZN(n23) );
  AOI22_X1 U48 ( .A1(i_Seed_Data[6]), .A2(n40), .B1(o_LFSR_Data[6]), .B2(n39), 
        .ZN(n38) );
  OAI21_X1 U49 ( .B1(n42), .B2(n43), .A(n38), .ZN(n22) );
  AOI22_X1 U50 ( .A1(i_Seed_Data[7]), .A2(n40), .B1(o_LFSR_Data[7]), .B2(n39), 
        .ZN(n41) );
  OAI21_X1 U51 ( .B1(n42), .B2(n49), .A(n41), .ZN(n21) );
endmodule

