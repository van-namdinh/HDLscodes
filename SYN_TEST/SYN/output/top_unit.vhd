
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_top_unit is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_top_unit;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_top_unit.all;

entity top_unit is

   port( i_clk, i_rst, i_lfsr_en, i_Seed_DV : in std_logic;  i_Seed_Data, 
         i_leak_weight : in std_logic_vector (7 downto 0);  i_leak_mode_sel : 
         in std_logic;  i_syn_weight : in std_logic_vector (31 downto 0);  i_G 
         : in std_logic_vector (1 downto 0);  i_syn_mode_sel, 
         i_leak_reversal_mode, i_spike_en, i_leak_en : in std_logic;  i_V, i_M,
         i_alpha, i_beta, i_V_reset : in std_logic_vector (7 downto 0);  
         i_kappa : in std_logic;  i_gamma : in std_logic_vector (1 downto 0);  
         o_V : out std_logic_vector (7 downto 0);  o_spike : out std_logic);

end top_unit;

architecture SYN_top_unit_arc of top_unit is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI211_X1
      port( C1, C2, A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component HA_X1
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND4_X1
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component OR4_X1
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI211_X1
      port( C1, C2, A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR4_X2
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X2
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFF_X1
      port( D, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal leak_prn_7_port, leak_prn_6_port, leak_prn_5_port, leak_prn_4_port, 
      leak_prn_3_port, leak_prn_2_port, leak_prn_1_port, leak_prn_0_port, 
      syn_prn_7_port, syn_prn_6_port, syn_prn_5_port, syn_prn_4_port, 
      syn_prn_3_port, syn_prn_2_port, syn_prn_1_port, syn_prn_0_port, 
      reset_prn_7_port, reset_prn_6_port, reset_prn_5_port, reset_prn_4_port, 
      reset_prn_3_port, reset_prn_2_port, reset_prn_1_port, reset_prn_0_port, 
      V_net_7_port, V_net_6_port, V_net_5_port, V_net_4_port, V_net_3_port, 
      V_net_2_port, V_net_1_port, V_net_0_port, INTEGRATOR_o_V_net_0_port, 
      INTEGRATOR_o_V_net_1_port, INTEGRATOR_o_V_net_2_port, 
      INTEGRATOR_o_V_net_3_port, INTEGRATOR_o_V_net_4_port, 
      INTEGRATOR_o_V_net_5_port, INTEGRATOR_o_V_net_6_port, 
      INTEGRATOR_o_V_net_7_port, n263, n264, n265, n266, n267, n268, n269, n270
      , n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
      n283, n284, n285, n286, n293, n294, n295, n296, n297, n298, n299, n300, 
      n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, 
      n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, 
      n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, 
      n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, 
      n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, 
      n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, 
      n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, 
      n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, 
      n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, 
      n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, 
      n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, 
      n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, 
      n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, 
      n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, 
      n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, 
      n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, 
      n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, 
      n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, 
      n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, 
      n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, 
      n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, 
      n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, 
      n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, 
      n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, 
      n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, 
      n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, 
      n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, 
      n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, 
      n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, 
      n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, 
      n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, 
      n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, 
      n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, 
      n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, 
      n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, 
      n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, 
      n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, 
      n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, 
      n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, 
      n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, 
      n_1000, n_1001, n_1002, n_1003, n_1004, n_1005, n_1006, n_1007, n_1008, 
      n_1009, n_1010, n_1011, n_1012, n_1013 : std_logic;

begin
   
   LFSR1_r_LFSR_reg_8_inst : DFF_X1 port map( D => n286, CK => i_clk, Q => 
                           leak_prn_7_port, QN => n771);
   LFSR1_r_LFSR_reg_1_inst : DFF_X1 port map( D => n285, CK => i_clk, Q => 
                           leak_prn_0_port, QN => n777);
   LFSR1_r_LFSR_reg_2_inst : DFF_X1 port map( D => n284, CK => i_clk, Q => 
                           leak_prn_1_port, QN => n_1000);
   LFSR1_r_LFSR_reg_3_inst : DFF_X1 port map( D => n283, CK => i_clk, Q => 
                           leak_prn_2_port, QN => n772);
   LFSR1_r_LFSR_reg_4_inst : DFF_X1 port map( D => n282, CK => i_clk, Q => 
                           leak_prn_3_port, QN => n774);
   LFSR1_r_LFSR_reg_5_inst : DFF_X1 port map( D => n281, CK => i_clk, Q => 
                           leak_prn_4_port, QN => n761);
   LFSR1_r_LFSR_reg_6_inst : DFF_X1 port map( D => n280, CK => i_clk, Q => 
                           leak_prn_5_port, QN => n_1001);
   LFSR1_r_LFSR_reg_7_inst : DFF_X1 port map( D => n279, CK => i_clk, Q => 
                           leak_prn_6_port, QN => n_1002);
   LFSR3_r_LFSR_reg_8_inst : DFF_X1 port map( D => n278, CK => i_clk, Q => 
                           reset_prn_7_port, QN => n_1003);
   LFSR3_r_LFSR_reg_1_inst : DFF_X1 port map( D => n277, CK => i_clk, Q => 
                           reset_prn_0_port, QN => n779);
   LFSR3_r_LFSR_reg_2_inst : DFF_X1 port map( D => n276, CK => i_clk, Q => 
                           reset_prn_1_port, QN => n_1004);
   LFSR3_r_LFSR_reg_3_inst : DFF_X1 port map( D => n275, CK => i_clk, Q => 
                           reset_prn_2_port, QN => n_1005);
   LFSR3_r_LFSR_reg_4_inst : DFF_X1 port map( D => n274, CK => i_clk, Q => 
                           reset_prn_3_port, QN => n_1006);
   LFSR3_r_LFSR_reg_5_inst : DFF_X1 port map( D => n273, CK => i_clk, Q => 
                           reset_prn_4_port, QN => n_1007);
   LFSR3_r_LFSR_reg_6_inst : DFF_X1 port map( D => n272, CK => i_clk, Q => 
                           reset_prn_5_port, QN => n_1008);
   LFSR3_r_LFSR_reg_7_inst : DFF_X1 port map( D => n271, CK => i_clk, Q => 
                           reset_prn_6_port, QN => n_1009);
   LFSR2_r_LFSR_reg_8_inst : DFF_X1 port map( D => n270, CK => i_clk, Q => 
                           syn_prn_7_port, QN => n775);
   LFSR2_r_LFSR_reg_1_inst : DFF_X1 port map( D => n269, CK => i_clk, Q => 
                           syn_prn_0_port, QN => n778);
   LFSR2_r_LFSR_reg_2_inst : DFF_X1 port map( D => n268, CK => i_clk, Q => 
                           syn_prn_1_port, QN => n_1010);
   LFSR2_r_LFSR_reg_3_inst : DFF_X1 port map( D => n267, CK => i_clk, Q => 
                           syn_prn_2_port, QN => n773);
   LFSR2_r_LFSR_reg_4_inst : DFF_X1 port map( D => n266, CK => i_clk, Q => 
                           syn_prn_3_port, QN => n776);
   LFSR2_r_LFSR_reg_5_inst : DFF_X1 port map( D => n265, CK => i_clk, Q => 
                           syn_prn_4_port, QN => n762);
   LFSR2_r_LFSR_reg_6_inst : DFF_X1 port map( D => n264, CK => i_clk, Q => 
                           syn_prn_5_port, QN => n_1011);
   LFSR2_r_LFSR_reg_7_inst : DFF_X1 port map( D => n263, CK => i_clk, Q => 
                           syn_prn_6_port, QN => n_1012);
   INTEGRATOR_o_V_reg_0_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_0_port
                           , CK => i_clk, RN => n780, Q => V_net_0_port, QN => 
                           n767);
   INTEGRATOR_o_V_reg_1_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_1_port
                           , CK => i_clk, RN => n780, Q => V_net_1_port, QN => 
                           n760);
   INTEGRATOR_o_V_reg_2_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_2_port
                           , CK => i_clk, RN => n780, Q => V_net_2_port, QN => 
                           n768);
   INTEGRATOR_o_V_reg_3_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_3_port
                           , CK => i_clk, RN => n780, Q => V_net_3_port, QN => 
                           n765);
   INTEGRATOR_o_V_reg_4_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_4_port
                           , CK => i_clk, RN => n780, Q => V_net_4_port, QN => 
                           n769);
   INTEGRATOR_o_V_reg_5_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_5_port
                           , CK => i_clk, RN => n780, Q => V_net_5_port, QN => 
                           n764);
   INTEGRATOR_o_V_reg_6_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_6_port
                           , CK => i_clk, RN => n780, Q => V_net_6_port, QN => 
                           n766);
   INTEGRATOR_o_V_reg_7_inst : DFFR_X1 port map( D => INTEGRATOR_o_V_net_7_port
                           , CK => i_clk, RN => n780, Q => V_net_7_port, QN => 
                           n770);
   INTEGRATOR_o_V_valid_reg : DFFR_X1 port map( D => i_leak_en, CK => i_clk, RN
                           => n780, Q => n_1013, QN => n763);
   U334 : NOR3_X2 port map( A1 => n385, A2 => i_gamma(1), A3 => i_gamma(0), ZN 
                           => n508);
   U335 : NOR4_X2 port map( A1 => n624, A2 => n661, A3 => n660, A4 => n623, ZN 
                           => n683);
   U336 : INV_X1 port map( A => i_rst, ZN => n780);
   U337 : AND2_X1 port map( A1 => i_M(6), A2 => reset_prn_6_port, ZN => n488);
   U338 : AND2_X1 port map( A1 => i_M(5), A2 => reset_prn_5_port, ZN => n471);
   U339 : AND2_X1 port map( A1 => i_M(4), A2 => reset_prn_4_port, ZN => n455);
   U340 : AND2_X1 port map( A1 => i_M(3), A2 => reset_prn_3_port, ZN => n439);
   U341 : AND2_X1 port map( A1 => i_M(2), A2 => reset_prn_2_port, ZN => n422);
   U342 : AND2_X1 port map( A1 => i_M(1), A2 => reset_prn_1_port, ZN => n406);
   U343 : AND2_X1 port map( A1 => i_M(0), A2 => reset_prn_0_port, ZN => n393);
   U344 : AND2_X1 port map( A1 => i_M(7), A2 => reset_prn_7_port, ZN => n489);
   U345 : XOR2_X1 port map( A => n489, B => i_alpha(7), Z => n293);
   U346 : XOR2_X1 port map( A => n294, B => n293, Z => n486);
   U347 : INV_X1 port map( A => n486, ZN => n317);
   U348 : FA_X1 port map( A => n488, B => i_alpha(6), CI => n295, CO => n294, S
                           => n469);
   U349 : FA_X1 port map( A => n471, B => i_alpha(5), CI => n296, CO => n295, S
                           => n453);
   U350 : INV_X1 port map( A => n453, ZN => n312);
   U351 : FA_X1 port map( A => n455, B => i_alpha(4), CI => n297, CO => n296, S
                           => n437);
   U352 : OR2_X1 port map( A1 => n437, A2 => n769, ZN => n310);
   U353 : FA_X1 port map( A => n439, B => i_alpha(3), CI => n298, CO => n297, S
                           => n420);
   U354 : INV_X1 port map( A => n420, ZN => n308);
   U355 : NAND2_X1 port map( A1 => n437, A2 => n769, ZN => n307);
   U356 : FA_X1 port map( A => n422, B => i_alpha(2), CI => n299, CO => n298, S
                           => n404);
   U357 : OR2_X1 port map( A1 => n404, A2 => n768, ZN => n305);
   U358 : FA_X1 port map( A => n406, B => i_alpha(1), CI => n300, CO => n299, S
                           => n392);
   U359 : INV_X1 port map( A => n392, ZN => n303);
   U360 : NAND2_X1 port map( A1 => n404, A2 => n768, ZN => n302);
   U361 : HA_X1 port map( A => n393, B => i_alpha(0), CO => n300, S => n375);
   U362 : OAI211_X1 port map( C1 => n392, C2 => n760, A => n375, B => n767, ZN 
                           => n301);
   U363 : OAI211_X1 port map( C1 => V_net_1_port, C2 => n303, A => n302, B => 
                           n301, ZN => n304);
   U364 : OAI211_X1 port map( C1 => n420, C2 => n765, A => n305, B => n304, ZN 
                           => n306);
   U365 : OAI211_X1 port map( C1 => V_net_3_port, C2 => n308, A => n307, B => 
                           n306, ZN => n309);
   U366 : OAI211_X1 port map( C1 => n453, C2 => n764, A => n310, B => n309, ZN 
                           => n311);
   U367 : OAI21_X1 port map( B1 => n312, B2 => V_net_5_port, A => n311, ZN => 
                           n313);
   U368 : OAI21_X1 port map( B1 => n469, B2 => n766, A => n313, ZN => n315);
   U369 : NAND2_X1 port map( A1 => n469, A2 => n766, ZN => n314);
   U370 : OAI211_X1 port map( C1 => n486, C2 => n770, A => n315, B => n314, ZN 
                           => n316);
   U371 : OAI21_X1 port map( B1 => n317, B2 => V_net_7_port, A => n316, ZN => 
                           n382);
   U372 : INV_X1 port map( A => n382, ZN => n385);
   U373 : NOR2_X1 port map( A1 => n385, A2 => n763, ZN => o_spike);
   U374 : INV_X1 port map( A => i_beta(5), ZN => n328);
   U375 : NOR2_X1 port map( A1 => i_beta(1), A2 => i_beta(0), ZN => n320);
   U376 : INV_X1 port map( A => n320, ZN => n321);
   U377 : NOR2_X1 port map( A1 => i_beta(2), A2 => n321, ZN => n326);
   U378 : INV_X1 port map( A => i_beta(3), ZN => n325);
   U379 : NAND2_X1 port map( A1 => n326, A2 => n325, ZN => n324);
   U380 : NOR2_X1 port map( A1 => i_beta(4), A2 => n324, ZN => n327);
   U381 : NAND2_X1 port map( A1 => n328, A2 => n327, ZN => n319);
   U382 : NOR2_X1 port map( A1 => i_beta(6), A2 => n319, ZN => n318);
   U383 : XNOR2_X1 port map( A => n318, B => i_beta(7), ZN => n509);
   U384 : XOR2_X1 port map( A => i_beta(6), B => n319, Z => n480);
   U385 : AOI21_X1 port map( B1 => i_beta(4), B2 => n324, A => n327, ZN => n448
                           );
   U386 : AOI21_X1 port map( B1 => i_beta(2), B2 => n321, A => n326, ZN => n415
                           );
   U387 : INV_X1 port map( A => n406, ZN => n336);
   U388 : INV_X1 port map( A => i_beta(0), ZN => n341);
   U389 : NAND2_X1 port map( A1 => n341, A2 => n393, ZN => n335);
   U390 : AOI21_X1 port map( B1 => i_beta(0), B2 => i_beta(1), A => n320, ZN =>
                           n399);
   U391 : AOI222_X1 port map( A1 => n336, A2 => n335, B1 => n336, B2 => n321, 
                           C1 => n335, C2 => n399, ZN => n346);
   U392 : INV_X1 port map( A => n346, ZN => n323);
   U393 : INV_X1 port map( A => n422, ZN => n322);
   U394 : AOI222_X1 port map( A1 => n415, A2 => n323, B1 => n415, B2 => n322, 
                           C1 => n323, C2 => n322, ZN => n350);
   U395 : OAI21_X1 port map( B1 => n326, B2 => n325, A => n324, ZN => n431);
   U396 : INV_X1 port map( A => n356, ZN => n354);
   U397 : INV_X1 port map( A => n455, ZN => n355);
   U398 : AOI222_X1 port map( A1 => n448, A2 => n354, B1 => n448, B2 => n355, 
                           C1 => n354, C2 => n355, ZN => n332);
   U399 : XOR2_X1 port map( A => n328, B => n327, Z => n464);
   U400 : INV_X1 port map( A => n464, ZN => n334);
   U401 : INV_X1 port map( A => n364, ZN => n362);
   U402 : INV_X1 port map( A => n488, ZN => n363);
   U403 : AOI222_X1 port map( A1 => n480, A2 => n362, B1 => n480, B2 => n363, 
                           C1 => n362, C2 => n363, ZN => n330);
   U404 : AOI21_X1 port map( B1 => n489, B2 => n330, A => i_kappa, ZN => n329);
   U405 : OAI21_X1 port map( B1 => n489, B2 => n330, A => n329, ZN => n331);
   U406 : XOR2_X1 port map( A => n509, B => n331, Z => n371);
   U407 : FA_X1 port map( A => n471, B => n332, CI => n334, CO => n364, S => 
                           n333);
   U408 : INV_X1 port map( A => i_kappa, ZN => n381);
   U409 : AOI22_X1 port map( A1 => i_kappa, A2 => n334, B1 => n333, B2 => n381,
                           ZN => n361);
   U410 : INV_X1 port map( A => n335, ZN => n337);
   U411 : AOI221_X1 port map( B1 => n406, B2 => n337, C1 => n336, C2 => n335, A
                           => i_kappa, ZN => n338);
   U412 : XOR2_X1 port map( A => n338, B => n399, Z => n344);
   U413 : INV_X1 port map( A => n393, ZN => n339);
   U414 : NOR2_X1 port map( A1 => n339, A2 => i_kappa, ZN => n340);
   U415 : INV_X1 port map( A => n340, ZN => n342);
   U416 : OAI221_X1 port map( B1 => i_beta(0), B2 => n342, C1 => n341, C2 => 
                           n340, A => V_net_0_port, ZN => n343);
   U417 : AOI222_X1 port map( A1 => n344, A2 => n760, B1 => n344, B2 => n343, 
                           C1 => n760, C2 => n343, ZN => n349);
   U418 : NOR2_X1 port map( A1 => n422, A2 => n346, ZN => n345);
   U419 : AOI211_X1 port map( C1 => n422, C2 => n346, A => i_kappa, B => n345, 
                           ZN => n347);
   U420 : XNOR2_X1 port map( A => n347, B => n415, ZN => n348);
   U421 : AOI222_X1 port map( A1 => n349, A2 => V_net_2_port, B1 => n349, B2 =>
                           n348, C1 => V_net_2_port, C2 => n348, ZN => n353);
   U422 : FA_X1 port map( A => n439, B => n350, CI => n431, CO => n356, S => 
                           n351);
   U423 : AOI22_X1 port map( A1 => i_kappa, A2 => n431, B1 => n351, B2 => n381,
                           ZN => n352);
   U424 : AOI222_X1 port map( A1 => n353, A2 => n765, B1 => n353, B2 => n352, 
                           C1 => n765, C2 => n352, ZN => n359);
   U425 : AOI221_X1 port map( B1 => n455, B2 => n356, C1 => n355, C2 => n354, A
                           => i_kappa, ZN => n357);
   U426 : XNOR2_X1 port map( A => n357, B => n448, ZN => n358);
   U427 : AOI222_X1 port map( A1 => n359, A2 => V_net_4_port, B1 => n359, B2 =>
                           n358, C1 => V_net_4_port, C2 => n358, ZN => n360);
   U428 : AOI222_X1 port map( A1 => n361, A2 => n764, B1 => n361, B2 => n360, 
                           C1 => n764, C2 => n360, ZN => n368);
   U429 : AOI221_X1 port map( B1 => n488, B2 => n364, C1 => n363, C2 => n362, A
                           => i_kappa, ZN => n365);
   U430 : XNOR2_X1 port map( A => n365, B => n480, ZN => n367);
   U431 : OR2_X1 port map( A1 => n368, A2 => n367, ZN => n369);
   U432 : NOR2_X1 port map( A1 => V_net_7_port, A2 => n371, ZN => n366);
   U433 : AOI221_X1 port map( B1 => V_net_6_port, B2 => n369, C1 => n368, C2 =>
                           n367, A => n366, ZN => n370);
   U434 : AOI21_X1 port map( B1 => V_net_7_port, B2 => n371, A => n370, ZN => 
                           n384);
   U435 : OR4_X1 port map( A1 => n384, A2 => i_kappa, A3 => i_gamma(1), A4 => 
                           n382, ZN => n374);
   U436 : INV_X1 port map( A => i_gamma(0), ZN => n372);
   U437 : NOR2_X1 port map( A1 => n374, A2 => n372, ZN => n492);
   U438 : NOR2_X1 port map( A1 => n372, A2 => i_gamma(1), ZN => n373);
   U439 : AND2_X1 port map( A1 => n382, A2 => n373, ZN => n485);
   U440 : NOR2_X1 port map( A1 => n492, A2 => n485, ZN => n500);
   U441 : NOR2_X1 port map( A1 => n500, A2 => n767, ZN => n391);
   U442 : NOR2_X1 port map( A1 => n374, A2 => i_gamma(0), ZN => n494);
   U443 : OR2_X1 port map( A1 => n494, A2 => n485, ZN => n498);
   U444 : NAND2_X1 port map( A1 => n375, A2 => n485, ZN => n379);
   U445 : NAND2_X1 port map( A1 => n376, A2 => n492, ZN => n378);
   U446 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(0), ZN => n377);
   U447 : NAND3_X1 port map( A1 => n379, A2 => n378, A3 => n377, ZN => n380);
   U448 : XOR2_X1 port map( A => n380, B => n498, Z => n390);
   U449 : OR2_X1 port map( A1 => n382, A2 => n381, ZN => n383);
   U450 : AOI22_X1 port map( A1 => n384, A2 => n385, B1 => i_gamma(1), B2 => 
                           n383, ZN => n512);
   U451 : NOR2_X1 port map( A1 => n384, A2 => n383, ZN => n510);
   U452 : AOI22_X1 port map( A1 => n510, A2 => i_beta(0), B1 => n508, B2 => 
                           i_V_reset(0), ZN => n386);
   U453 : OAI21_X1 port map( B1 => n512, B2 => n767, A => n386, ZN => n387);
   U454 : NOR2_X1 port map( A1 => n388, A2 => n387, ZN => n389);
   U455 : NOR2_X1 port map( A1 => n389, A2 => n763, ZN => o_V(0));
   U456 : FA_X1 port map( A => n391, B => n498, CI => n390, CO => n414, S => 
                           n388);
   U457 : NOR2_X1 port map( A1 => n500, A2 => n760, ZN => n413);
   U458 : NAND2_X1 port map( A1 => n392, A2 => n485, ZN => n397);
   U459 : HA_X1 port map( A => i_beta(0), B => n393, CO => n405, S => n376);
   U460 : NAND2_X1 port map( A1 => n394, A2 => n492, ZN => n396);
   U461 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(1), ZN => n395);
   U462 : NAND3_X1 port map( A1 => n397, A2 => n396, A3 => n395, ZN => n398);
   U463 : XOR2_X1 port map( A => n398, B => n498, Z => n412);
   U464 : AOI22_X1 port map( A1 => n510, A2 => n399, B1 => n508, B2 => 
                           i_V_reset(1), ZN => n400);
   U465 : OAI21_X1 port map( B1 => n512, B2 => n760, A => n400, ZN => n401);
   U466 : NOR2_X1 port map( A1 => n402, A2 => n401, ZN => n403);
   U467 : NOR2_X1 port map( A1 => n403, A2 => n763, ZN => o_V(1));
   U468 : NAND2_X1 port map( A1 => n404, A2 => n485, ZN => n410);
   U469 : FA_X1 port map( A => i_beta(1), B => n406, CI => n405, CO => n421, S 
                           => n394);
   U470 : NAND2_X1 port map( A1 => n407, A2 => n492, ZN => n409);
   U471 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(2), ZN => n408);
   U472 : NAND3_X1 port map( A1 => n410, A2 => n409, A3 => n408, ZN => n411);
   U473 : XOR2_X1 port map( A => n411, B => n498, Z => n430);
   U474 : NOR2_X1 port map( A1 => n500, A2 => n768, ZN => n429);
   U475 : FA_X1 port map( A => n414, B => n413, CI => n412, CO => n428, S => 
                           n402);
   U476 : AOI22_X1 port map( A1 => n510, A2 => n415, B1 => n508, B2 => 
                           i_V_reset(2), ZN => n416);
   U477 : OAI21_X1 port map( B1 => n512, B2 => n768, A => n416, ZN => n417);
   U478 : NOR2_X1 port map( A1 => n418, A2 => n417, ZN => n419);
   U479 : NOR2_X1 port map( A1 => n419, A2 => n763, ZN => o_V(2));
   U480 : NAND2_X1 port map( A1 => n420, A2 => n485, ZN => n426);
   U481 : FA_X1 port map( A => i_beta(2), B => n422, CI => n421, CO => n438, S 
                           => n407);
   U482 : NAND2_X1 port map( A1 => n423, A2 => n492, ZN => n425);
   U483 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(3), ZN => n424);
   U484 : NAND3_X1 port map( A1 => n426, A2 => n425, A3 => n424, ZN => n427);
   U485 : XOR2_X1 port map( A => n427, B => n498, Z => n447);
   U486 : NOR2_X1 port map( A1 => n500, A2 => n765, ZN => n446);
   U487 : FA_X1 port map( A => n430, B => n429, CI => n428, CO => n445, S => 
                           n418);
   U488 : INV_X1 port map( A => n431, ZN => n432);
   U489 : AOI22_X1 port map( A1 => n510, A2 => n432, B1 => n508, B2 => 
                           i_V_reset(3), ZN => n433);
   U490 : OAI21_X1 port map( B1 => n512, B2 => n765, A => n433, ZN => n434);
   U491 : NOR2_X1 port map( A1 => n435, A2 => n434, ZN => n436);
   U492 : NOR2_X1 port map( A1 => n436, A2 => n763, ZN => o_V(3));
   U493 : NAND2_X1 port map( A1 => n437, A2 => n485, ZN => n443);
   U494 : FA_X1 port map( A => i_beta(3), B => n439, CI => n438, CO => n454, S 
                           => n423);
   U495 : NAND2_X1 port map( A1 => n440, A2 => n492, ZN => n442);
   U496 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(4), ZN => n441);
   U497 : NAND3_X1 port map( A1 => n443, A2 => n442, A3 => n441, ZN => n444);
   U498 : XOR2_X1 port map( A => n444, B => n498, Z => n463);
   U499 : NOR2_X1 port map( A1 => n500, A2 => n769, ZN => n462);
   U500 : FA_X1 port map( A => n447, B => n446, CI => n445, CO => n461, S => 
                           n435);
   U501 : AOI22_X1 port map( A1 => n510, A2 => n448, B1 => n508, B2 => 
                           i_V_reset(4), ZN => n449);
   U502 : OAI21_X1 port map( B1 => n512, B2 => n769, A => n449, ZN => n450);
   U503 : NOR2_X1 port map( A1 => n451, A2 => n450, ZN => n452);
   U504 : NOR2_X1 port map( A1 => n452, A2 => n763, ZN => o_V(4));
   U505 : NAND2_X1 port map( A1 => n453, A2 => n485, ZN => n459);
   U506 : FA_X1 port map( A => i_beta(4), B => n455, CI => n454, CO => n470, S 
                           => n440);
   U507 : NAND2_X1 port map( A1 => n456, A2 => n492, ZN => n458);
   U508 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(5), ZN => n457);
   U509 : NAND3_X1 port map( A1 => n459, A2 => n458, A3 => n457, ZN => n460);
   U510 : XOR2_X1 port map( A => n460, B => n498, Z => n479);
   U511 : NOR2_X1 port map( A1 => n500, A2 => n764, ZN => n478);
   U512 : FA_X1 port map( A => n463, B => n462, CI => n461, CO => n477, S => 
                           n451);
   U513 : AOI22_X1 port map( A1 => n510, A2 => n464, B1 => n508, B2 => 
                           i_V_reset(5), ZN => n465);
   U514 : OAI21_X1 port map( B1 => n512, B2 => n764, A => n465, ZN => n466);
   U515 : NOR2_X1 port map( A1 => n467, A2 => n466, ZN => n468);
   U516 : NOR2_X1 port map( A1 => n468, A2 => n763, ZN => o_V(5));
   U517 : NAND2_X1 port map( A1 => n469, A2 => n485, ZN => n475);
   U518 : FA_X1 port map( A => i_beta(5), B => n471, CI => n470, CO => n487, S 
                           => n456);
   U519 : NAND2_X1 port map( A1 => n472, A2 => n492, ZN => n474);
   U520 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(6), ZN => n473);
   U521 : NAND3_X1 port map( A1 => n475, A2 => n474, A3 => n473, ZN => n476);
   U522 : XOR2_X1 port map( A => n476, B => n498, Z => n505);
   U523 : NOR2_X1 port map( A1 => n500, A2 => n766, ZN => n504);
   U524 : FA_X1 port map( A => n479, B => n478, CI => n477, CO => n503, S => 
                           n467);
   U525 : AOI22_X1 port map( A1 => n510, A2 => n480, B1 => n508, B2 => 
                           i_V_reset(6), ZN => n481);
   U526 : OAI21_X1 port map( B1 => n512, B2 => n766, A => n481, ZN => n482);
   U527 : NOR2_X1 port map( A1 => n483, A2 => n482, ZN => n484);
   U528 : NOR2_X1 port map( A1 => n484, A2 => n763, ZN => o_V(6));
   U529 : NAND2_X1 port map( A1 => n486, A2 => n485, ZN => n497);
   U530 : FA_X1 port map( A => i_beta(6), B => n488, CI => n487, CO => n491, S 
                           => n472);
   U531 : XOR2_X1 port map( A => i_beta(7), B => n489, Z => n490);
   U532 : XOR2_X1 port map( A => n491, B => n490, Z => n493);
   U533 : NAND2_X1 port map( A1 => n493, A2 => n492, ZN => n496);
   U534 : NAND2_X1 port map( A1 => n494, A2 => i_V_reset(7), ZN => n495);
   U535 : NAND3_X1 port map( A1 => n497, A2 => n496, A3 => n495, ZN => n499);
   U536 : XOR2_X1 port map( A => n499, B => n498, Z => n502);
   U537 : NOR2_X1 port map( A1 => n500, A2 => n770, ZN => n501);
   U538 : XOR2_X1 port map( A => n502, B => n501, Z => n507);
   U539 : FA_X1 port map( A => n505, B => n504, CI => n503, CO => n506, S => 
                           n483);
   U540 : XOR2_X1 port map( A => n507, B => n506, Z => n514);
   U541 : AOI22_X1 port map( A1 => n510, A2 => n509, B1 => n508, B2 => 
                           i_V_reset(7), ZN => n511);
   U542 : OAI21_X1 port map( B1 => n512, B2 => n770, A => n511, ZN => n513);
   U543 : NOR2_X1 port map( A1 => n514, A2 => n513, ZN => n515);
   U544 : NOR2_X1 port map( A1 => n515, A2 => n763, ZN => o_V(7));
   U545 : XOR2_X1 port map( A => reset_prn_7_port, B => reset_prn_5_port, Z => 
                           n516);
   U546 : XNOR2_X1 port map( A => reset_prn_3_port, B => n516, ZN => n518);
   U547 : INV_X1 port map( A => i_lfsr_en, ZN => n757);
   U548 : NOR2_X1 port map( A1 => i_Seed_DV, A2 => n757, ZN => n756);
   U549 : CLKBUF_X1 port map( A => n756, Z => n753);
   U550 : NAND2_X1 port map( A1 => reset_prn_4_port, A2 => n518, ZN => n517);
   U551 : OAI211_X1 port map( C1 => reset_prn_4_port, C2 => n518, A => n753, B 
                           => n517, ZN => n519);
   U552 : AND2_X1 port map( A1 => i_lfsr_en, A2 => i_Seed_DV, ZN => n729);
   U553 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(0), ZN => n744);
   U554 : OAI211_X1 port map( C1 => i_lfsr_en, C2 => n779, A => n519, B => n744
                           , ZN => n277);
   U555 : NAND2_X1 port map( A1 => i_V(7), A2 => i_leak_reversal_mode, ZN => 
                           n567);
   U556 : NOR2_X1 port map( A1 => n567, A2 => i_spike_en, ZN => n692);
   U557 : INV_X1 port map( A => i_leak_weight(0), ZN => n553);
   U558 : INV_X1 port map( A => i_leak_weight(6), ZN => n565);
   U559 : INV_X1 port map( A => i_leak_weight(4), ZN => n561);
   U560 : NOR3_X1 port map( A1 => i_leak_weight(2), A2 => i_leak_weight(1), A3 
                           => i_leak_weight(0), ZN => n535);
   U561 : INV_X1 port map( A => i_leak_weight(3), ZN => n559);
   U562 : AND2_X1 port map( A1 => n535, A2 => n559, ZN => n523);
   U563 : NAND2_X1 port map( A1 => n561, A2 => n523, ZN => n521);
   U564 : NOR2_X1 port map( A1 => n521, A2 => i_leak_weight(5), ZN => n549);
   U565 : INV_X1 port map( A => i_leak_weight(7), ZN => n680);
   U566 : NOR2_X1 port map( A1 => n549, A2 => n680, ZN => n520);
   U567 : XOR2_X1 port map( A => n565, B => n520, Z => n546);
   U568 : INV_X1 port map( A => i_leak_weight(5), ZN => n563);
   U569 : NAND2_X1 port map( A1 => n521, A2 => i_leak_weight(7), ZN => n522);
   U570 : XNOR2_X1 port map( A => n563, B => n522, ZN => n527);
   U571 : NOR2_X1 port map( A1 => n680, A2 => n523, ZN => n524);
   U572 : XOR2_X1 port map( A => n524, B => n561, Z => n537);
   U573 : OAI211_X1 port map( C1 => leak_prn_5_port, C2 => n527, A => n537, B 
                           => leak_prn_4_port, ZN => n526);
   U574 : NAND2_X1 port map( A1 => leak_prn_5_port, A2 => n527, ZN => n525);
   U575 : NAND2_X1 port map( A1 => n526, A2 => n525, ZN => n545);
   U576 : NOR2_X1 port map( A1 => leak_prn_5_port, A2 => n527, ZN => n543);
   U577 : OAI21_X1 port map( B1 => i_leak_weight(1), B2 => i_leak_weight(0), A 
                           => i_leak_weight(7), ZN => n528);
   U578 : INV_X1 port map( A => i_leak_weight(2), ZN => n557);
   U579 : XOR2_X1 port map( A => n528, B => n557, Z => n534);
   U580 : NOR2_X1 port map( A1 => i_leak_weight(1), A2 => i_leak_weight(0), ZN 
                           => n532);
   U581 : NOR2_X1 port map( A1 => n680, A2 => n553, ZN => n530);
   U582 : AOI22_X1 port map( A1 => leak_prn_0_port, A2 => n553, B1 => n530, B2 
                           => i_leak_weight(1), ZN => n529);
   U583 : OAI21_X1 port map( B1 => n530, B2 => i_leak_weight(1), A => n529, ZN 
                           => n531);
   U584 : OAI221_X1 port map( B1 => leak_prn_1_port, B2 => n532, C1 => 
                           leak_prn_1_port, C2 => leak_prn_0_port, A => n531, 
                           ZN => n533);
   U585 : AOI222_X1 port map( A1 => n534, A2 => n772, B1 => n534, B2 => n533, 
                           C1 => n772, C2 => n533, ZN => n541);
   U586 : NOR2_X1 port map( A1 => n535, A2 => n680, ZN => n536);
   U587 : XOR2_X1 port map( A => n559, B => n536, Z => n540);
   U588 : AND2_X1 port map( A1 => leak_prn_3_port, A2 => n541, ZN => n539);
   U589 : OR2_X1 port map( A1 => n537, A2 => leak_prn_4_port, ZN => n538);
   U590 : OAI221_X1 port map( B1 => leak_prn_3_port, B2 => n541, C1 => n540, C2
                           => n539, A => n538, ZN => n542);
   U591 : NOR2_X1 port map( A1 => n543, A2 => n542, ZN => n544);
   U592 : OAI22_X1 port map( A1 => leak_prn_6_port, A2 => n546, B1 => n545, B2 
                           => n544, ZN => n548);
   U593 : NAND2_X1 port map( A1 => leak_prn_6_port, A2 => n546, ZN => n547);
   U594 : NAND2_X1 port map( A1 => n548, A2 => n547, ZN => n551);
   U595 : AND3_X1 port map( A1 => n565, A2 => i_leak_weight(7), A3 => n549, ZN 
                           => n550);
   U596 : NOR2_X1 port map( A1 => n551, A2 => n550, ZN => n554);
   U597 : NAND3_X1 port map( A1 => n554, A2 => i_leak_mode_sel, A3 => n771, ZN 
                           => n552);
   U598 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n553, A => n552, ZN 
                           => n667);
   U599 : INV_X1 port map( A => n667, ZN => n669);
   U600 : INV_X1 port map( A => i_leak_weight(1), ZN => n555);
   U601 : NAND4_X1 port map( A1 => n554, A2 => i_leak_weight(7), A3 => 
                           i_leak_mode_sel, A4 => n771, ZN => n679);
   U602 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n555, A => n679, ZN 
                           => n556);
   U603 : INV_X1 port map( A => n556, ZN => n673);
   U604 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n557, A => n679, ZN 
                           => n558);
   U605 : INV_X1 port map( A => n558, ZN => n656);
   U606 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n559, A => n679, ZN 
                           => n560);
   U607 : INV_X1 port map( A => n560, ZN => n648);
   U608 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n561, A => n679, ZN 
                           => n562);
   U609 : INV_X1 port map( A => n562, ZN => n641);
   U610 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n563, A => n679, ZN 
                           => n564);
   U611 : INV_X1 port map( A => n564, ZN => n633);
   U612 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n565, A => n679, ZN 
                           => n566);
   U613 : INV_X1 port map( A => n566, ZN => n677);
   U614 : NAND2_X1 port map( A1 => n686, A2 => n567, ZN => n688);
   U615 : AND2_X1 port map( A1 => i_G(0), A2 => i_G(1), ZN => n583);
   U616 : NOR2_X1 port map( A1 => i_G(0), A2 => i_G(1), ZN => n586);
   U617 : AOI22_X1 port map( A1 => n583, A2 => i_syn_weight(6), B1 => n586, B2 
                           => i_syn_weight(30), ZN => n570);
   U618 : INV_X1 port map( A => i_G(1), ZN => n568);
   U619 : NOR2_X1 port map( A1 => i_G(0), A2 => n568, ZN => n584);
   U620 : AND2_X1 port map( A1 => n568, A2 => i_G(0), ZN => n585);
   U621 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(14), B1 => n585, B2
                           => i_syn_weight(22), ZN => n569);
   U622 : AND2_X1 port map( A1 => n570, A2 => n569, ZN => n590);
   U623 : INV_X1 port map( A => n590, ZN => n625);
   U624 : INV_X1 port map( A => i_syn_mode_sel, ZN => n684);
   U625 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(15), B1 => n583, B2
                           => i_syn_weight(7), ZN => n572);
   U626 : AOI22_X1 port map( A1 => n586, A2 => i_syn_weight(31), B1 => n585, B2
                           => i_syn_weight(23), ZN => n571);
   U627 : NAND2_X1 port map( A1 => n572, A2 => n571, ZN => n685);
   U628 : INV_X1 port map( A => n685, ZN => n624);
   U629 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(9), B1 => n583, B2 
                           => i_syn_weight(1), ZN => n574);
   U630 : AOI22_X1 port map( A1 => n586, A2 => i_syn_weight(25), B1 => n585, B2
                           => i_syn_weight(17), ZN => n573);
   U631 : AND2_X1 port map( A1 => n574, A2 => n573, ZN => n670);
   U632 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(8), B1 => n583, B2 
                           => i_syn_weight(0), ZN => n576);
   U633 : AOI22_X1 port map( A1 => n586, A2 => i_syn_weight(24), B1 => n585, B2
                           => i_syn_weight(16), ZN => n575);
   U634 : NAND2_X1 port map( A1 => n576, A2 => n575, ZN => n663);
   U635 : INV_X1 port map( A => n663, ZN => n604);
   U636 : AND2_X1 port map( A1 => n670, A2 => n604, ZN => n608);
   U637 : AOI22_X1 port map( A1 => n583, A2 => i_syn_weight(2), B1 => n586, B2 
                           => i_syn_weight(26), ZN => n578);
   U638 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(10), B1 => n585, B2
                           => i_syn_weight(18), ZN => n577);
   U639 : AND2_X1 port map( A1 => n578, A2 => n577, ZN => n653);
   U640 : NAND2_X1 port map( A1 => n608, A2 => n653, ZN => n600);
   U641 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(11), B1 => n583, B2
                           => i_syn_weight(3), ZN => n580);
   U642 : AOI22_X1 port map( A1 => n586, A2 => i_syn_weight(27), B1 => n585, B2
                           => i_syn_weight(19), ZN => n579);
   U643 : NAND2_X1 port map( A1 => n580, A2 => n579, ZN => n646);
   U644 : NOR2_X1 port map( A1 => n600, A2 => n646, ZN => n595);
   U645 : AOI22_X1 port map( A1 => n583, A2 => i_syn_weight(4), B1 => n586, B2 
                           => i_syn_weight(28), ZN => n582);
   U646 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(12), B1 => n585, B2
                           => i_syn_weight(20), ZN => n581);
   U647 : AND2_X1 port map( A1 => n582, A2 => n581, ZN => n638);
   U648 : NAND2_X1 port map( A1 => n595, A2 => n638, ZN => n592);
   U649 : AOI22_X1 port map( A1 => n584, A2 => i_syn_weight(13), B1 => n583, B2
                           => i_syn_weight(5), ZN => n588);
   U650 : AOI22_X1 port map( A1 => n586, A2 => i_syn_weight(29), B1 => n585, B2
                           => i_syn_weight(21), ZN => n587);
   U651 : NAND2_X1 port map( A1 => n588, A2 => n587, ZN => n631);
   U652 : NOR2_X1 port map( A1 => n592, A2 => n631, ZN => n589);
   U653 : AND3_X1 port map( A1 => n590, A2 => n589, A3 => n685, ZN => n661);
   U654 : NOR2_X1 port map( A1 => n624, A2 => n589, ZN => n591);
   U655 : XOR2_X1 port map( A => n591, B => n590, Z => n620);
   U656 : INV_X1 port map( A => n631, ZN => n594);
   U657 : NAND2_X1 port map( A1 => n592, A2 => n685, ZN => n593);
   U658 : XNOR2_X1 port map( A => n594, B => n593, ZN => n599);
   U659 : NOR2_X1 port map( A1 => n595, A2 => n624, ZN => n596);
   U660 : XOR2_X1 port map( A => n596, B => n638, Z => n611);
   U661 : OAI211_X1 port map( C1 => n599, C2 => syn_prn_5_port, A => n611, B =>
                           syn_prn_4_port, ZN => n598);
   U662 : NAND2_X1 port map( A1 => n599, A2 => syn_prn_5_port, ZN => n597);
   U663 : NAND2_X1 port map( A1 => n598, A2 => n597, ZN => n619);
   U664 : NOR2_X1 port map( A1 => syn_prn_5_port, A2 => n599, ZN => n617);
   U665 : INV_X1 port map( A => n646, ZN => n602);
   U666 : NAND2_X1 port map( A1 => n600, A2 => n685, ZN => n601);
   U667 : XNOR2_X1 port map( A => n602, B => n601, ZN => n615);
   U668 : NOR2_X1 port map( A1 => n624, A2 => n608, ZN => n603);
   U669 : XNOR2_X1 port map( A => n653, B => n603, ZN => n610);
   U670 : NAND2_X1 port map( A1 => n685, A2 => n663, ZN => n606);
   U671 : AOI22_X1 port map( A1 => n604, A2 => syn_prn_0_port, B1 => n670, B2 
                           => n606, ZN => n605);
   U672 : OAI21_X1 port map( B1 => n670, B2 => n606, A => n605, ZN => n607);
   U673 : OAI221_X1 port map( B1 => syn_prn_1_port, B2 => n608, C1 => 
                           syn_prn_1_port, C2 => syn_prn_0_port, A => n607, ZN 
                           => n609);
   U674 : AOI222_X1 port map( A1 => n773, A2 => n610, B1 => n773, B2 => n609, 
                           C1 => n610, C2 => n609, ZN => n614);
   U675 : AND2_X1 port map( A1 => n615, A2 => n614, ZN => n613);
   U676 : OR2_X1 port map( A1 => syn_prn_4_port, A2 => n611, ZN => n612);
   U677 : OAI221_X1 port map( B1 => n615, B2 => n614, C1 => syn_prn_3_port, C2 
                           => n613, A => n612, ZN => n616);
   U678 : NOR2_X1 port map( A1 => n617, A2 => n616, ZN => n618);
   U679 : OAI22_X1 port map( A1 => n620, A2 => syn_prn_6_port, B1 => n619, B2 
                           => n618, ZN => n622);
   U680 : NAND2_X1 port map( A1 => n620, A2 => syn_prn_6_port, ZN => n621);
   U681 : NAND2_X1 port map( A1 => n622, A2 => n621, ZN => n660);
   U682 : NAND2_X1 port map( A1 => i_syn_mode_sel, A2 => n775, ZN => n623);
   U683 : AOI21_X1 port map( B1 => n625, B2 => n684, A => n683, ZN => n626);
   U684 : INV_X1 port map( A => i_spike_en, ZN => n686);
   U685 : OAI22_X1 port map( A1 => n677, A2 => n688, B1 => n626, B2 => n686, ZN
                           => n627);
   U686 : AOI21_X1 port map( B1 => n692, B2 => n628, A => n627, ZN => n629);
   U687 : INV_X1 port map( A => n629, ZN => n699);
   U688 : HA_X1 port map( A => n630, B => n633, CO => n678, S => n635);
   U689 : AOI21_X1 port map( B1 => n684, B2 => n631, A => n683, ZN => n632);
   U690 : OAI22_X1 port map( A1 => n633, A2 => n688, B1 => n632, B2 => n686, ZN
                           => n634);
   U691 : AOI21_X1 port map( B1 => n692, B2 => n635, A => n634, ZN => n636);
   U692 : INV_X1 port map( A => n636, ZN => n702);
   U693 : HA_X1 port map( A => n637, B => n641, CO => n630, S => n643);
   U694 : INV_X1 port map( A => n638, ZN => n639);
   U695 : AOI21_X1 port map( B1 => n684, B2 => n639, A => n683, ZN => n640);
   U696 : OAI22_X1 port map( A1 => n641, A2 => n688, B1 => n640, B2 => n686, ZN
                           => n642);
   U697 : AOI21_X1 port map( B1 => n692, B2 => n643, A => n642, ZN => n644);
   U698 : INV_X1 port map( A => n644, ZN => n705);
   U699 : HA_X1 port map( A => n645, B => n648, CO => n637, S => n650);
   U700 : AOI21_X1 port map( B1 => n684, B2 => n646, A => n683, ZN => n647);
   U701 : OAI22_X1 port map( A1 => n648, A2 => n688, B1 => n647, B2 => n686, ZN
                           => n649);
   U702 : AOI21_X1 port map( B1 => n692, B2 => n650, A => n649, ZN => n651);
   U703 : INV_X1 port map( A => n651, ZN => n708);
   U704 : HA_X1 port map( A => n652, B => n656, CO => n645, S => n658);
   U705 : INV_X1 port map( A => n653, ZN => n654);
   U706 : AOI21_X1 port map( B1 => n684, B2 => n654, A => n683, ZN => n655);
   U707 : OAI22_X1 port map( A1 => n656, A2 => n688, B1 => n655, B2 => n686, ZN
                           => n657);
   U708 : AOI21_X1 port map( B1 => n692, B2 => n658, A => n657, ZN => n659);
   U709 : INV_X1 port map( A => n659, ZN => n711);
   U710 : NOR3_X1 port map( A1 => n661, A2 => n660, A3 => syn_prn_7_port, ZN =>
                           n662);
   U711 : NOR2_X1 port map( A1 => n662, A2 => n684, ZN => n665);
   U712 : OAI21_X1 port map( B1 => i_syn_mode_sel, B2 => n663, A => i_spike_en,
                           ZN => n664);
   U713 : OAI22_X1 port map( A1 => n669, A2 => n688, B1 => n665, B2 => n664, ZN
                           => n666);
   U714 : AOI21_X1 port map( B1 => n692, B2 => n667, A => n666, ZN => n668);
   U715 : INV_X1 port map( A => n668, ZN => n716);
   U716 : HA_X1 port map( A => n669, B => n673, CO => n652, S => n675);
   U717 : INV_X1 port map( A => n670, ZN => n671);
   U718 : AOI21_X1 port map( B1 => n684, B2 => n671, A => n683, ZN => n672);
   U719 : OAI22_X1 port map( A1 => n673, A2 => n688, B1 => n672, B2 => n686, ZN
                           => n674);
   U720 : AOI21_X1 port map( B1 => n692, B2 => n675, A => n674, ZN => n676);
   U721 : INV_X1 port map( A => n676, ZN => n713);
   U722 : HA_X1 port map( A => n678, B => n677, CO => n682, S => n628);
   U723 : OAI21_X1 port map( B1 => i_leak_mode_sel, B2 => n680, A => n679, ZN 
                           => n681);
   U724 : INV_X1 port map( A => n681, ZN => n689);
   U725 : XOR2_X1 port map( A => n682, B => n689, Z => n691);
   U726 : AOI21_X1 port map( B1 => n685, B2 => n684, A => n683, ZN => n687);
   U727 : OAI22_X1 port map( A1 => n689, A2 => n688, B1 => n687, B2 => n686, ZN
                           => n690);
   U728 : AOI21_X1 port map( B1 => n692, B2 => n691, A => n690, ZN => n693);
   U729 : INV_X1 port map( A => n693, ZN => n694);
   U730 : XOR2_X1 port map( A => n694, B => V_net_7_port, Z => n695);
   U731 : XOR2_X1 port map( A => n696, B => n695, Z => n697);
   U732 : NOR2_X1 port map( A1 => i_leak_en, A2 => i_spike_en, ZN => n717);
   U733 : MUX2_X1 port map( A => n697, B => i_V(7), S => n717, Z => 
                           INTEGRATOR_o_V_net_7_port);
   U734 : FA_X1 port map( A => n699, B => V_net_6_port, CI => n698, CO => n696,
                           S => n700);
   U735 : MUX2_X1 port map( A => n700, B => i_V(6), S => n717, Z => 
                           INTEGRATOR_o_V_net_6_port);
   U736 : FA_X1 port map( A => n702, B => V_net_5_port, CI => n701, CO => n698,
                           S => n703);
   U737 : MUX2_X1 port map( A => n703, B => i_V(5), S => n717, Z => 
                           INTEGRATOR_o_V_net_5_port);
   U738 : FA_X1 port map( A => n705, B => V_net_4_port, CI => n704, CO => n701,
                           S => n706);
   U739 : MUX2_X1 port map( A => n706, B => i_V(4), S => n717, Z => 
                           INTEGRATOR_o_V_net_4_port);
   U740 : FA_X1 port map( A => n708, B => V_net_3_port, CI => n707, CO => n704,
                           S => n709);
   U741 : MUX2_X1 port map( A => n709, B => i_V(3), S => n717, Z => 
                           INTEGRATOR_o_V_net_3_port);
   U742 : FA_X1 port map( A => n711, B => V_net_2_port, CI => n710, CO => n707,
                           S => n712);
   U743 : MUX2_X1 port map( A => n712, B => i_V(2), S => n717, Z => 
                           INTEGRATOR_o_V_net_2_port);
   U744 : FA_X1 port map( A => n714, B => V_net_1_port, CI => n713, CO => n710,
                           S => n715);
   U745 : MUX2_X1 port map( A => n715, B => i_V(1), S => n717, Z => 
                           INTEGRATOR_o_V_net_1_port);
   U746 : HA_X1 port map( A => n716, B => V_net_0_port, CO => n714, S => n718);
   U747 : MUX2_X1 port map( A => n718, B => i_V(0), S => n717, Z => 
                           INTEGRATOR_o_V_net_0_port);
   U748 : AOI22_X1 port map( A1 => leak_prn_6_port, A2 => n756, B1 => 
                           leak_prn_7_port, B2 => n757, ZN => n719);
   U749 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(7), ZN => n738);
   U750 : NAND2_X1 port map( A1 => n719, A2 => n738, ZN => n286);
   U751 : AOI22_X1 port map( A1 => leak_prn_4_port, A2 => leak_prn_3_port, B1 
                           => n774, B2 => n761, ZN => n720);
   U752 : XNOR2_X1 port map( A => leak_prn_5_port, B => n720, ZN => n722);
   U753 : NAND2_X1 port map( A1 => leak_prn_7_port, A2 => n722, ZN => n721);
   U754 : OAI211_X1 port map( C1 => leak_prn_7_port, C2 => n722, A => n753, B 
                           => n721, ZN => n723);
   U755 : OAI211_X1 port map( C1 => i_lfsr_en, C2 => n777, A => n744, B => n723
                           , ZN => n285);
   U756 : AOI22_X1 port map( A1 => leak_prn_1_port, A2 => n757, B1 => 
                           leak_prn_0_port, B2 => n753, ZN => n724);
   U757 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(1), ZN => n745);
   U758 : NAND2_X1 port map( A1 => n724, A2 => n745, ZN => n284);
   U759 : AOI22_X1 port map( A1 => leak_prn_2_port, A2 => n757, B1 => 
                           leak_prn_1_port, B2 => n753, ZN => n725);
   U760 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(2), ZN => n747);
   U761 : NAND2_X1 port map( A1 => n725, A2 => n747, ZN => n283);
   U762 : AOI22_X1 port map( A1 => leak_prn_2_port, A2 => n756, B1 => 
                           leak_prn_3_port, B2 => n757, ZN => n726);
   U763 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(3), ZN => n749);
   U764 : NAND2_X1 port map( A1 => n726, A2 => n749, ZN => n282);
   U765 : AOI22_X1 port map( A1 => leak_prn_4_port, A2 => n757, B1 => 
                           leak_prn_3_port, B2 => n753, ZN => n727);
   U766 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(4), ZN => n751);
   U767 : NAND2_X1 port map( A1 => n727, A2 => n751, ZN => n281);
   U768 : AOI22_X1 port map( A1 => leak_prn_5_port, A2 => n757, B1 => 
                           leak_prn_4_port, B2 => n753, ZN => n728);
   U769 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(5), ZN => n754);
   U770 : NAND2_X1 port map( A1 => n728, A2 => n754, ZN => n280);
   U771 : AOI22_X1 port map( A1 => leak_prn_6_port, A2 => n757, B1 => 
                           leak_prn_5_port, B2 => n753, ZN => n730);
   U772 : NAND2_X1 port map( A1 => n729, A2 => i_Seed_Data(6), ZN => n758);
   U773 : NAND2_X1 port map( A1 => n730, A2 => n758, ZN => n279);
   U774 : AOI22_X1 port map( A1 => reset_prn_6_port, A2 => n756, B1 => 
                           reset_prn_7_port, B2 => n757, ZN => n731);
   U775 : NAND2_X1 port map( A1 => n731, A2 => n738, ZN => n278);
   U776 : AOI22_X1 port map( A1 => reset_prn_1_port, A2 => n757, B1 => 
                           reset_prn_0_port, B2 => n753, ZN => n732);
   U777 : NAND2_X1 port map( A1 => n732, A2 => n745, ZN => n276);
   U778 : AOI22_X1 port map( A1 => reset_prn_1_port, A2 => n756, B1 => 
                           reset_prn_2_port, B2 => n757, ZN => n733);
   U779 : NAND2_X1 port map( A1 => n733, A2 => n747, ZN => n275);
   U780 : AOI22_X1 port map( A1 => reset_prn_2_port, A2 => n756, B1 => 
                           reset_prn_3_port, B2 => n757, ZN => n734);
   U781 : NAND2_X1 port map( A1 => n734, A2 => n749, ZN => n274);
   U782 : AOI22_X1 port map( A1 => reset_prn_4_port, A2 => n757, B1 => n753, B2
                           => reset_prn_3_port, ZN => n735);
   U783 : NAND2_X1 port map( A1 => n735, A2 => n751, ZN => n273);
   U784 : AOI22_X1 port map( A1 => reset_prn_4_port, A2 => n756, B1 => 
                           reset_prn_5_port, B2 => n757, ZN => n736);
   U785 : NAND2_X1 port map( A1 => n736, A2 => n754, ZN => n272);
   U786 : AOI22_X1 port map( A1 => reset_prn_6_port, A2 => n757, B1 => n753, B2
                           => reset_prn_5_port, ZN => n737);
   U787 : NAND2_X1 port map( A1 => n737, A2 => n758, ZN => n271);
   U788 : AOI22_X1 port map( A1 => syn_prn_6_port, A2 => n756, B1 => 
                           syn_prn_7_port, B2 => n757, ZN => n739);
   U789 : NAND2_X1 port map( A1 => n739, A2 => n738, ZN => n270);
   U790 : AOI22_X1 port map( A1 => syn_prn_4_port, A2 => syn_prn_3_port, B1 => 
                           n776, B2 => n762, ZN => n740);
   U791 : XNOR2_X1 port map( A => syn_prn_5_port, B => n740, ZN => n742);
   U792 : NAND2_X1 port map( A1 => syn_prn_7_port, A2 => n742, ZN => n741);
   U793 : OAI211_X1 port map( C1 => syn_prn_7_port, C2 => n742, A => n753, B =>
                           n741, ZN => n743);
   U794 : OAI211_X1 port map( C1 => i_lfsr_en, C2 => n778, A => n744, B => n743
                           , ZN => n269);
   U795 : AOI22_X1 port map( A1 => syn_prn_1_port, A2 => n757, B1 => 
                           syn_prn_0_port, B2 => n756, ZN => n746);
   U796 : NAND2_X1 port map( A1 => n746, A2 => n745, ZN => n268);
   U797 : AOI22_X1 port map( A1 => syn_prn_2_port, A2 => n757, B1 => 
                           syn_prn_1_port, B2 => n756, ZN => n748);
   U798 : NAND2_X1 port map( A1 => n748, A2 => n747, ZN => n267);
   U799 : AOI22_X1 port map( A1 => syn_prn_3_port, A2 => n757, B1 => 
                           syn_prn_2_port, B2 => n753, ZN => n750);
   U800 : NAND2_X1 port map( A1 => n750, A2 => n749, ZN => n266);
   U801 : AOI22_X1 port map( A1 => syn_prn_4_port, A2 => n757, B1 => 
                           syn_prn_3_port, B2 => n753, ZN => n752);
   U802 : NAND2_X1 port map( A1 => n752, A2 => n751, ZN => n265);
   U803 : AOI22_X1 port map( A1 => syn_prn_5_port, A2 => n757, B1 => 
                           syn_prn_4_port, B2 => n753, ZN => n755);
   U804 : NAND2_X1 port map( A1 => n755, A2 => n754, ZN => n264);
   U805 : AOI22_X1 port map( A1 => syn_prn_6_port, A2 => n757, B1 => 
                           syn_prn_5_port, B2 => n756, ZN => n759);
   U806 : NAND2_X1 port map( A1 => n759, A2 => n758, ZN => n263);

end SYN_top_unit_arc;
