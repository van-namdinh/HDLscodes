
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_synapse_unit is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_synapse_unit;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_synapse_unit.all;

entity synapse_unit is

   port( i_syn_weight : in std_logic_vector (31 downto 0);  i_G : in 
         std_logic_vector (1 downto 0);  i_syn_prn : in std_logic_vector (7 
         downto 0);  i_mode_sel : in std_logic;  o_syn_weight : out 
         std_logic_vector (7 downto 0));

end synapse_unit;

architecture SYN_synapse_unit_arch of synapse_unit is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI211_X1
      port( C1, C2, A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
      n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, 
      n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, 
      n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, 
      n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, 
      n144, n145, n146, n147, n148, n149, n150 : std_logic;

begin
   
   U90 : NOR2_X1 port map( A1 => i_G(0), A2 => i_G(1), ZN => n116);
   U91 : INV_X1 port map( A => i_G(1), ZN => n81);
   U92 : AND2_X1 port map( A1 => n81, A2 => i_G(0), ZN => n114);
   U93 : AOI22_X1 port map( A1 => n116, A2 => i_syn_weight(24), B1 => n114, B2 
                           => i_syn_weight(16), ZN => n83);
   U94 : NOR2_X1 port map( A1 => i_G(0), A2 => n81, ZN => n115);
   U95 : AND2_X1 port map( A1 => i_G(0), A2 => i_G(1), ZN => n117);
   U96 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(8), B1 => n117, B2 
                           => i_syn_weight(0), ZN => n82);
   U97 : NAND2_X1 port map( A1 => n83, A2 => n82, ZN => n90);
   U98 : INV_X1 port map( A => n90, ZN => n137);
   U99 : INV_X1 port map( A => i_mode_sel, ZN => n135);
   U100 : AOI22_X1 port map( A1 => n116, A2 => i_syn_weight(29), B1 => n114, B2
                           => i_syn_weight(21), ZN => n85);
   U101 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(13), B1 => n117, B2
                           => i_syn_weight(5), ZN => n84);
   U102 : NAND2_X1 port map( A1 => n85, A2 => n84, ZN => n146);
   U103 : AOI22_X1 port map( A1 => n116, A2 => i_syn_weight(27), B1 => n114, B2
                           => i_syn_weight(19), ZN => n87);
   U104 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(11), B1 => n117, B2
                           => i_syn_weight(3), ZN => n86);
   U105 : NAND2_X1 port map( A1 => n87, A2 => n86, ZN => n143);
   U106 : AOI22_X1 port map( A1 => n116, A2 => i_syn_weight(25), B1 => n114, B2
                           => i_syn_weight(17), ZN => n89);
   U107 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(9), B1 => n117, B2 
                           => i_syn_weight(1), ZN => n88);
   U108 : NAND2_X1 port map( A1 => n89, A2 => n88, ZN => n138);
   U109 : NOR2_X1 port map( A1 => n138, A2 => n90, ZN => n103);
   U110 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(10), B1 => n114, B2
                           => i_syn_weight(18), ZN => n92);
   U111 : AOI22_X1 port map( A1 => n117, A2 => i_syn_weight(2), B1 => n116, B2 
                           => i_syn_weight(26), ZN => n91);
   U112 : AND2_X1 port map( A1 => n92, A2 => n91, ZN => n142);
   U113 : NAND2_X1 port map( A1 => n103, A2 => n142, ZN => n108);
   U114 : NOR2_X1 port map( A1 => n143, A2 => n108, ZN => n98);
   U115 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(12), B1 => n114, B2
                           => i_syn_weight(20), ZN => n94);
   U116 : AOI22_X1 port map( A1 => n117, A2 => i_syn_weight(4), B1 => n116, B2 
                           => i_syn_weight(28), ZN => n93);
   U117 : AND2_X1 port map( A1 => n94, A2 => n93, ZN => n145);
   U118 : NAND2_X1 port map( A1 => n98, A2 => n145, ZN => n113);
   U119 : AOI22_X1 port map( A1 => n116, A2 => i_syn_weight(31), B1 => n114, B2
                           => i_syn_weight(23), ZN => n96);
   U120 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(15), B1 => n117, B2
                           => i_syn_weight(7), ZN => n95);
   U121 : NAND2_X1 port map( A1 => n96, A2 => n95, ZN => n139);
   U122 : NAND2_X1 port map( A1 => n113, A2 => n139, ZN => n97);
   U123 : XOR2_X1 port map( A => n146, B => n97, Z => n125);
   U124 : NOR2_X1 port map( A1 => i_syn_prn(5), A2 => n125, ZN => n133);
   U125 : INV_X1 port map( A => n139, ZN => n150);
   U126 : NOR2_X1 port map( A1 => n98, A2 => n150, ZN => n99);
   U127 : XOR2_X1 port map( A => n99, B => n145, Z => n124);
   U128 : NOR2_X1 port map( A1 => n103, A2 => n150, ZN => n100);
   U129 : XOR2_X1 port map( A => n100, B => n142, Z => n107);
   U130 : NOR2_X1 port map( A1 => n150, A2 => n137, ZN => n102);
   U131 : NOR2_X1 port map( A1 => n138, A2 => n102, ZN => n101);
   U132 : AOI221_X1 port map( B1 => i_syn_prn(0), B2 => n137, C1 => n102, C2 =>
                           n138, A => n101, ZN => n105);
   U133 : AOI21_X1 port map( B1 => i_syn_prn(0), B2 => n103, A => i_syn_prn(1),
                           ZN => n104);
   U134 : NOR2_X1 port map( A1 => n105, A2 => n104, ZN => n106);
   U135 : AOI222_X1 port map( A1 => n107, A2 => i_syn_prn(2), B1 => n107, B2 =>
                           n106, C1 => i_syn_prn(2), C2 => n106, ZN => n112);
   U136 : NAND2_X1 port map( A1 => n108, A2 => n139, ZN => n109);
   U137 : XNOR2_X1 port map( A => n109, B => n143, ZN => n111);
   U138 : INV_X1 port map( A => i_syn_prn(3), ZN => n110);
   U139 : AOI222_X1 port map( A1 => n112, A2 => n111, B1 => n112, B2 => n110, 
                           C1 => n111, C2 => n110, ZN => n122);
   U140 : NOR2_X1 port map( A1 => n146, A2 => n113, ZN => n123);
   U141 : NOR2_X1 port map( A1 => n123, A2 => n150, ZN => n120);
   U142 : AOI22_X1 port map( A1 => n115, A2 => i_syn_weight(14), B1 => n114, B2
                           => i_syn_weight(22), ZN => n119);
   U143 : AOI22_X1 port map( A1 => n117, A2 => i_syn_weight(6), B1 => n116, B2 
                           => i_syn_weight(30), ZN => n118);
   U144 : AND2_X1 port map( A1 => n119, A2 => n118, ZN => n148);
   U145 : XOR2_X1 port map( A => n120, B => n148, Z => n129);
   U146 : OR2_X1 port map( A1 => n129, A2 => i_syn_prn(6), ZN => n121);
   U147 : OAI211_X1 port map( C1 => n124, C2 => i_syn_prn(4), A => n122, B => 
                           n121, ZN => n132);
   U148 : NAND3_X1 port map( A1 => n148, A2 => n123, A3 => n139, ZN => n131);
   U149 : OAI211_X1 port map( C1 => n125, C2 => i_syn_prn(5), A => i_syn_prn(4)
                           , B => n124, ZN => n127);
   U150 : NAND2_X1 port map( A1 => n125, A2 => i_syn_prn(5), ZN => n126);
   U151 : NAND2_X1 port map( A1 => n127, A2 => n126, ZN => n128);
   U152 : AOI222_X1 port map( A1 => n129, A2 => i_syn_prn(6), B1 => n129, B2 =>
                           n128, C1 => i_syn_prn(6), C2 => n128, ZN => n130);
   U153 : OAI211_X1 port map( C1 => n133, C2 => n132, A => n131, B => n130, ZN 
                           => n134);
   U154 : NOR3_X1 port map( A1 => i_syn_prn(7), A2 => n135, A3 => n134, ZN => 
                           n140);
   U155 : INV_X1 port map( A => n140, ZN => n136);
   U156 : OAI21_X1 port map( B1 => n137, B2 => i_mode_sel, A => n136, ZN => 
                           o_syn_weight(0));
   U157 : INV_X1 port map( A => n138, ZN => n141);
   U158 : NAND2_X1 port map( A1 => n140, A2 => n139, ZN => n149);
   U159 : OAI21_X1 port map( B1 => n141, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(1));
   U160 : OAI21_X1 port map( B1 => n142, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(2));
   U161 : INV_X1 port map( A => n143, ZN => n144);
   U162 : OAI21_X1 port map( B1 => n144, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(3));
   U163 : OAI21_X1 port map( B1 => n145, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(4));
   U164 : INV_X1 port map( A => n146, ZN => n147);
   U165 : OAI21_X1 port map( B1 => n147, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(5));
   U166 : OAI21_X1 port map( B1 => n148, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(6));
   U167 : OAI21_X1 port map( B1 => n150, B2 => i_mode_sel, A => n149, ZN => 
                           o_syn_weight(7));

end SYN_synapse_unit_arch;
