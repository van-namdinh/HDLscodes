/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Aug 27 10:58:45 2018
/////////////////////////////////////////////////////////////


module top_unit ( i_clk, i_rst, i_lfsr_en, i_Seed_DV, i_Seed_Data, 
        i_leak_weight, i_leak_mode_sel, i_syn_weight, i_G, i_syn_mode_sel, 
        i_leak_reversal_mode, i_spike_en, i_leak_en, i_V, i_M, i_alpha, i_beta, 
        i_V_reset, i_kappa, i_gamma, o_V, o_spike );
  input [7:0] i_Seed_Data;
  input [7:0] i_leak_weight;
  input [31:0] i_syn_weight;
  input [1:0] i_G;
  input [7:0] i_V;
  input [7:0] i_M;
  input [7:0] i_alpha;
  input [7:0] i_beta;
  input [7:0] i_V_reset;
  input [1:0] i_gamma;
  output [7:0] o_V;
  input i_clk, i_rst, i_lfsr_en, i_Seed_DV, i_leak_mode_sel, i_syn_mode_sel,
         i_leak_reversal_mode, i_spike_en, i_leak_en, i_kappa;
  output o_spike;
  wire   \LEAK/N8 , \RESET/N8 , n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n293, n294, n295, n296, n297, n298,
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
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780;
  wire   [7:0] leak_prn;
  wire   [7:0] syn_prn;
  wire   [7:0] reset_prn;
  wire   [7:0] V_net;
  wire   [7:0] \INTEGRATOR/o_V_net ;
  assign \LEAK/N8  = i_leak_weight[0];
  assign \RESET/N8  = i_beta[0];

  DFF_X1 \LFSR1/r_LFSR_reg[8]  ( .D(n286), .CK(i_clk), .Q(leak_prn[7]), .QN(
        n771) );
  DFF_X1 \LFSR1/r_LFSR_reg[1]  ( .D(n285), .CK(i_clk), .Q(leak_prn[0]), .QN(
        n777) );
  DFF_X1 \LFSR1/r_LFSR_reg[2]  ( .D(n284), .CK(i_clk), .Q(leak_prn[1]) );
  DFF_X1 \LFSR1/r_LFSR_reg[3]  ( .D(n283), .CK(i_clk), .Q(leak_prn[2]), .QN(
        n772) );
  DFF_X1 \LFSR1/r_LFSR_reg[4]  ( .D(n282), .CK(i_clk), .Q(leak_prn[3]), .QN(
        n774) );
  DFF_X1 \LFSR1/r_LFSR_reg[5]  ( .D(n281), .CK(i_clk), .Q(leak_prn[4]), .QN(
        n761) );
  DFF_X1 \LFSR1/r_LFSR_reg[6]  ( .D(n280), .CK(i_clk), .Q(leak_prn[5]) );
  DFF_X1 \LFSR1/r_LFSR_reg[7]  ( .D(n279), .CK(i_clk), .Q(leak_prn[6]) );
  DFF_X1 \LFSR3/r_LFSR_reg[8]  ( .D(n278), .CK(i_clk), .Q(reset_prn[7]) );
  DFF_X1 \LFSR3/r_LFSR_reg[1]  ( .D(n277), .CK(i_clk), .Q(reset_prn[0]), .QN(
        n779) );
  DFF_X1 \LFSR3/r_LFSR_reg[2]  ( .D(n276), .CK(i_clk), .Q(reset_prn[1]) );
  DFF_X1 \LFSR3/r_LFSR_reg[3]  ( .D(n275), .CK(i_clk), .Q(reset_prn[2]) );
  DFF_X1 \LFSR3/r_LFSR_reg[4]  ( .D(n274), .CK(i_clk), .Q(reset_prn[3]) );
  DFF_X1 \LFSR3/r_LFSR_reg[5]  ( .D(n273), .CK(i_clk), .Q(reset_prn[4]) );
  DFF_X1 \LFSR3/r_LFSR_reg[6]  ( .D(n272), .CK(i_clk), .Q(reset_prn[5]) );
  DFF_X1 \LFSR3/r_LFSR_reg[7]  ( .D(n271), .CK(i_clk), .Q(reset_prn[6]) );
  DFF_X1 \LFSR2/r_LFSR_reg[8]  ( .D(n270), .CK(i_clk), .Q(syn_prn[7]), .QN(
        n775) );
  DFF_X1 \LFSR2/r_LFSR_reg[1]  ( .D(n269), .CK(i_clk), .Q(syn_prn[0]), .QN(
        n778) );
  DFF_X1 \LFSR2/r_LFSR_reg[2]  ( .D(n268), .CK(i_clk), .Q(syn_prn[1]) );
  DFF_X1 \LFSR2/r_LFSR_reg[3]  ( .D(n267), .CK(i_clk), .Q(syn_prn[2]), .QN(
        n773) );
  DFF_X1 \LFSR2/r_LFSR_reg[4]  ( .D(n266), .CK(i_clk), .Q(syn_prn[3]), .QN(
        n776) );
  DFF_X1 \LFSR2/r_LFSR_reg[5]  ( .D(n265), .CK(i_clk), .Q(syn_prn[4]), .QN(
        n762) );
  DFF_X1 \LFSR2/r_LFSR_reg[6]  ( .D(n264), .CK(i_clk), .Q(syn_prn[5]) );
  DFF_X1 \LFSR2/r_LFSR_reg[7]  ( .D(n263), .CK(i_clk), .Q(syn_prn[6]) );
  DFFR_X1 \INTEGRATOR/o_V_reg[0]  ( .D(\INTEGRATOR/o_V_net [0]), .CK(i_clk), 
        .RN(n780), .Q(V_net[0]), .QN(n767) );
  DFFR_X1 \INTEGRATOR/o_V_reg[1]  ( .D(\INTEGRATOR/o_V_net [1]), .CK(i_clk), 
        .RN(n780), .Q(V_net[1]), .QN(n760) );
  DFFR_X1 \INTEGRATOR/o_V_reg[2]  ( .D(\INTEGRATOR/o_V_net [2]), .CK(i_clk), 
        .RN(n780), .Q(V_net[2]), .QN(n768) );
  DFFR_X1 \INTEGRATOR/o_V_reg[3]  ( .D(\INTEGRATOR/o_V_net [3]), .CK(i_clk), 
        .RN(n780), .Q(V_net[3]), .QN(n765) );
  DFFR_X1 \INTEGRATOR/o_V_reg[4]  ( .D(\INTEGRATOR/o_V_net [4]), .CK(i_clk), 
        .RN(n780), .Q(V_net[4]), .QN(n769) );
  DFFR_X1 \INTEGRATOR/o_V_reg[5]  ( .D(\INTEGRATOR/o_V_net [5]), .CK(i_clk), 
        .RN(n780), .Q(V_net[5]), .QN(n764) );
  DFFR_X1 \INTEGRATOR/o_V_reg[6]  ( .D(\INTEGRATOR/o_V_net [6]), .CK(i_clk), 
        .RN(n780), .Q(V_net[6]), .QN(n766) );
  DFFR_X1 \INTEGRATOR/o_V_reg[7]  ( .D(\INTEGRATOR/o_V_net [7]), .CK(i_clk), 
        .RN(n780), .Q(V_net[7]), .QN(n770) );
  DFFR_X1 \INTEGRATOR/o_V_valid_reg  ( .D(i_leak_en), .CK(i_clk), .RN(n780), 
        .QN(n763) );
  NOR3_X2 U334 ( .A1(n385), .A2(i_gamma[1]), .A3(i_gamma[0]), .ZN(n508) );
  NOR4_X2 U335 ( .A1(n624), .A2(n661), .A3(n660), .A4(n623), .ZN(n683) );
  INV_X1 U336 ( .A(i_rst), .ZN(n780) );
  AND2_X1 U337 ( .A1(i_M[6]), .A2(reset_prn[6]), .ZN(n488) );
  AND2_X1 U338 ( .A1(i_M[5]), .A2(reset_prn[5]), .ZN(n471) );
  AND2_X1 U339 ( .A1(i_M[4]), .A2(reset_prn[4]), .ZN(n455) );
  AND2_X1 U340 ( .A1(i_M[3]), .A2(reset_prn[3]), .ZN(n439) );
  AND2_X1 U341 ( .A1(i_M[2]), .A2(reset_prn[2]), .ZN(n422) );
  AND2_X1 U342 ( .A1(i_M[1]), .A2(reset_prn[1]), .ZN(n406) );
  AND2_X1 U343 ( .A1(i_M[0]), .A2(reset_prn[0]), .ZN(n393) );
  AND2_X1 U344 ( .A1(i_M[7]), .A2(reset_prn[7]), .ZN(n489) );
  XOR2_X1 U345 ( .A(n489), .B(i_alpha[7]), .Z(n293) );
  XOR2_X1 U346 ( .A(n294), .B(n293), .Z(n486) );
  INV_X1 U347 ( .A(n486), .ZN(n317) );
  FA_X1 U348 ( .A(n488), .B(i_alpha[6]), .CI(n295), .CO(n294), .S(n469) );
  FA_X1 U349 ( .A(n471), .B(i_alpha[5]), .CI(n296), .CO(n295), .S(n453) );
  INV_X1 U350 ( .A(n453), .ZN(n312) );
  FA_X1 U351 ( .A(n455), .B(i_alpha[4]), .CI(n297), .CO(n296), .S(n437) );
  OR2_X1 U352 ( .A1(n437), .A2(n769), .ZN(n310) );
  FA_X1 U353 ( .A(n439), .B(i_alpha[3]), .CI(n298), .CO(n297), .S(n420) );
  INV_X1 U354 ( .A(n420), .ZN(n308) );
  NAND2_X1 U355 ( .A1(n437), .A2(n769), .ZN(n307) );
  FA_X1 U356 ( .A(n422), .B(i_alpha[2]), .CI(n299), .CO(n298), .S(n404) );
  OR2_X1 U357 ( .A1(n404), .A2(n768), .ZN(n305) );
  FA_X1 U358 ( .A(n406), .B(i_alpha[1]), .CI(n300), .CO(n299), .S(n392) );
  INV_X1 U359 ( .A(n392), .ZN(n303) );
  NAND2_X1 U360 ( .A1(n404), .A2(n768), .ZN(n302) );
  HA_X1 U361 ( .A(n393), .B(i_alpha[0]), .CO(n300), .S(n375) );
  OAI211_X1 U362 ( .C1(n392), .C2(n760), .A(n375), .B(n767), .ZN(n301) );
  OAI211_X1 U363 ( .C1(V_net[1]), .C2(n303), .A(n302), .B(n301), .ZN(n304) );
  OAI211_X1 U364 ( .C1(n420), .C2(n765), .A(n305), .B(n304), .ZN(n306) );
  OAI211_X1 U365 ( .C1(V_net[3]), .C2(n308), .A(n307), .B(n306), .ZN(n309) );
  OAI211_X1 U366 ( .C1(n453), .C2(n764), .A(n310), .B(n309), .ZN(n311) );
  OAI21_X1 U367 ( .B1(n312), .B2(V_net[5]), .A(n311), .ZN(n313) );
  OAI21_X1 U368 ( .B1(n469), .B2(n766), .A(n313), .ZN(n315) );
  NAND2_X1 U369 ( .A1(n469), .A2(n766), .ZN(n314) );
  OAI211_X1 U370 ( .C1(n486), .C2(n770), .A(n315), .B(n314), .ZN(n316) );
  OAI21_X1 U371 ( .B1(n317), .B2(V_net[7]), .A(n316), .ZN(n382) );
  INV_X1 U372 ( .A(n382), .ZN(n385) );
  NOR2_X1 U373 ( .A1(n385), .A2(n763), .ZN(o_spike) );
  INV_X1 U374 ( .A(i_beta[5]), .ZN(n328) );
  NOR2_X1 U375 ( .A1(i_beta[1]), .A2(\RESET/N8 ), .ZN(n320) );
  INV_X1 U376 ( .A(n320), .ZN(n321) );
  NOR2_X1 U377 ( .A1(i_beta[2]), .A2(n321), .ZN(n326) );
  INV_X1 U378 ( .A(i_beta[3]), .ZN(n325) );
  NAND2_X1 U379 ( .A1(n326), .A2(n325), .ZN(n324) );
  NOR2_X1 U380 ( .A1(i_beta[4]), .A2(n324), .ZN(n327) );
  NAND2_X1 U381 ( .A1(n328), .A2(n327), .ZN(n319) );
  NOR2_X1 U382 ( .A1(i_beta[6]), .A2(n319), .ZN(n318) );
  XNOR2_X1 U383 ( .A(n318), .B(i_beta[7]), .ZN(n509) );
  XOR2_X1 U384 ( .A(i_beta[6]), .B(n319), .Z(n480) );
  AOI21_X1 U385 ( .B1(i_beta[4]), .B2(n324), .A(n327), .ZN(n448) );
  AOI21_X1 U386 ( .B1(i_beta[2]), .B2(n321), .A(n326), .ZN(n415) );
  INV_X1 U387 ( .A(n406), .ZN(n336) );
  INV_X1 U388 ( .A(\RESET/N8 ), .ZN(n341) );
  NAND2_X1 U389 ( .A1(n341), .A2(n393), .ZN(n335) );
  AOI21_X1 U390 ( .B1(\RESET/N8 ), .B2(i_beta[1]), .A(n320), .ZN(n399) );
  AOI222_X1 U391 ( .A1(n336), .A2(n335), .B1(n336), .B2(n321), .C1(n335), .C2(
        n399), .ZN(n346) );
  INV_X1 U392 ( .A(n346), .ZN(n323) );
  INV_X1 U393 ( .A(n422), .ZN(n322) );
  AOI222_X1 U394 ( .A1(n415), .A2(n323), .B1(n415), .B2(n322), .C1(n323), .C2(
        n322), .ZN(n350) );
  OAI21_X1 U395 ( .B1(n326), .B2(n325), .A(n324), .ZN(n431) );
  INV_X1 U396 ( .A(n356), .ZN(n354) );
  INV_X1 U397 ( .A(n455), .ZN(n355) );
  AOI222_X1 U398 ( .A1(n448), .A2(n354), .B1(n448), .B2(n355), .C1(n354), .C2(
        n355), .ZN(n332) );
  XOR2_X1 U399 ( .A(n328), .B(n327), .Z(n464) );
  INV_X1 U400 ( .A(n464), .ZN(n334) );
  INV_X1 U401 ( .A(n364), .ZN(n362) );
  INV_X1 U402 ( .A(n488), .ZN(n363) );
  AOI222_X1 U403 ( .A1(n480), .A2(n362), .B1(n480), .B2(n363), .C1(n362), .C2(
        n363), .ZN(n330) );
  AOI21_X1 U404 ( .B1(n489), .B2(n330), .A(i_kappa), .ZN(n329) );
  OAI21_X1 U405 ( .B1(n489), .B2(n330), .A(n329), .ZN(n331) );
  XOR2_X1 U406 ( .A(n509), .B(n331), .Z(n371) );
  FA_X1 U407 ( .A(n471), .B(n332), .CI(n334), .CO(n364), .S(n333) );
  INV_X1 U408 ( .A(i_kappa), .ZN(n381) );
  AOI22_X1 U409 ( .A1(i_kappa), .A2(n334), .B1(n333), .B2(n381), .ZN(n361) );
  INV_X1 U410 ( .A(n335), .ZN(n337) );
  AOI221_X1 U411 ( .B1(n406), .B2(n337), .C1(n336), .C2(n335), .A(i_kappa), 
        .ZN(n338) );
  XOR2_X1 U412 ( .A(n338), .B(n399), .Z(n344) );
  INV_X1 U413 ( .A(n393), .ZN(n339) );
  NOR2_X1 U414 ( .A1(n339), .A2(i_kappa), .ZN(n340) );
  INV_X1 U415 ( .A(n340), .ZN(n342) );
  OAI221_X1 U416 ( .B1(\RESET/N8 ), .B2(n342), .C1(n341), .C2(n340), .A(
        V_net[0]), .ZN(n343) );
  AOI222_X1 U417 ( .A1(n344), .A2(n760), .B1(n344), .B2(n343), .C1(n760), .C2(
        n343), .ZN(n349) );
  NOR2_X1 U418 ( .A1(n422), .A2(n346), .ZN(n345) );
  AOI211_X1 U419 ( .C1(n422), .C2(n346), .A(i_kappa), .B(n345), .ZN(n347) );
  XNOR2_X1 U420 ( .A(n347), .B(n415), .ZN(n348) );
  AOI222_X1 U421 ( .A1(n349), .A2(V_net[2]), .B1(n349), .B2(n348), .C1(
        V_net[2]), .C2(n348), .ZN(n353) );
  FA_X1 U422 ( .A(n439), .B(n350), .CI(n431), .CO(n356), .S(n351) );
  AOI22_X1 U423 ( .A1(i_kappa), .A2(n431), .B1(n351), .B2(n381), .ZN(n352) );
  AOI222_X1 U424 ( .A1(n353), .A2(n765), .B1(n353), .B2(n352), .C1(n765), .C2(
        n352), .ZN(n359) );
  AOI221_X1 U425 ( .B1(n455), .B2(n356), .C1(n355), .C2(n354), .A(i_kappa), 
        .ZN(n357) );
  XNOR2_X1 U426 ( .A(n357), .B(n448), .ZN(n358) );
  AOI222_X1 U427 ( .A1(n359), .A2(V_net[4]), .B1(n359), .B2(n358), .C1(
        V_net[4]), .C2(n358), .ZN(n360) );
  AOI222_X1 U428 ( .A1(n361), .A2(n764), .B1(n361), .B2(n360), .C1(n764), .C2(
        n360), .ZN(n368) );
  AOI221_X1 U429 ( .B1(n488), .B2(n364), .C1(n363), .C2(n362), .A(i_kappa), 
        .ZN(n365) );
  XNOR2_X1 U430 ( .A(n365), .B(n480), .ZN(n367) );
  OR2_X1 U431 ( .A1(n368), .A2(n367), .ZN(n369) );
  NOR2_X1 U432 ( .A1(V_net[7]), .A2(n371), .ZN(n366) );
  AOI221_X1 U433 ( .B1(V_net[6]), .B2(n369), .C1(n368), .C2(n367), .A(n366), 
        .ZN(n370) );
  AOI21_X1 U434 ( .B1(V_net[7]), .B2(n371), .A(n370), .ZN(n384) );
  OR4_X1 U435 ( .A1(n384), .A2(i_kappa), .A3(i_gamma[1]), .A4(n382), .ZN(n374)
         );
  INV_X1 U436 ( .A(i_gamma[0]), .ZN(n372) );
  NOR2_X1 U437 ( .A1(n374), .A2(n372), .ZN(n492) );
  NOR2_X1 U438 ( .A1(n372), .A2(i_gamma[1]), .ZN(n373) );
  AND2_X1 U439 ( .A1(n382), .A2(n373), .ZN(n485) );
  NOR2_X1 U440 ( .A1(n492), .A2(n485), .ZN(n500) );
  NOR2_X1 U441 ( .A1(n500), .A2(n767), .ZN(n391) );
  NOR2_X1 U442 ( .A1(n374), .A2(i_gamma[0]), .ZN(n494) );
  OR2_X1 U443 ( .A1(n494), .A2(n485), .ZN(n498) );
  NAND2_X1 U444 ( .A1(n375), .A2(n485), .ZN(n379) );
  NAND2_X1 U445 ( .A1(n376), .A2(n492), .ZN(n378) );
  NAND2_X1 U446 ( .A1(n494), .A2(i_V_reset[0]), .ZN(n377) );
  NAND3_X1 U447 ( .A1(n379), .A2(n378), .A3(n377), .ZN(n380) );
  XOR2_X1 U448 ( .A(n380), .B(n498), .Z(n390) );
  OR2_X1 U449 ( .A1(n382), .A2(n381), .ZN(n383) );
  AOI22_X1 U450 ( .A1(n384), .A2(n385), .B1(i_gamma[1]), .B2(n383), .ZN(n512)
         );
  NOR2_X1 U451 ( .A1(n384), .A2(n383), .ZN(n510) );
  AOI22_X1 U452 ( .A1(n510), .A2(\RESET/N8 ), .B1(n508), .B2(i_V_reset[0]), 
        .ZN(n386) );
  OAI21_X1 U453 ( .B1(n512), .B2(n767), .A(n386), .ZN(n387) );
  NOR2_X1 U454 ( .A1(n388), .A2(n387), .ZN(n389) );
  NOR2_X1 U455 ( .A1(n389), .A2(n763), .ZN(o_V[0]) );
  FA_X1 U456 ( .A(n391), .B(n498), .CI(n390), .CO(n414), .S(n388) );
  NOR2_X1 U457 ( .A1(n500), .A2(n760), .ZN(n413) );
  NAND2_X1 U458 ( .A1(n392), .A2(n485), .ZN(n397) );
  HA_X1 U459 ( .A(\RESET/N8 ), .B(n393), .CO(n405), .S(n376) );
  NAND2_X1 U460 ( .A1(n394), .A2(n492), .ZN(n396) );
  NAND2_X1 U461 ( .A1(n494), .A2(i_V_reset[1]), .ZN(n395) );
  NAND3_X1 U462 ( .A1(n397), .A2(n396), .A3(n395), .ZN(n398) );
  XOR2_X1 U463 ( .A(n398), .B(n498), .Z(n412) );
  AOI22_X1 U464 ( .A1(n510), .A2(n399), .B1(n508), .B2(i_V_reset[1]), .ZN(n400) );
  OAI21_X1 U465 ( .B1(n512), .B2(n760), .A(n400), .ZN(n401) );
  NOR2_X1 U466 ( .A1(n402), .A2(n401), .ZN(n403) );
  NOR2_X1 U467 ( .A1(n403), .A2(n763), .ZN(o_V[1]) );
  NAND2_X1 U468 ( .A1(n404), .A2(n485), .ZN(n410) );
  FA_X1 U469 ( .A(i_beta[1]), .B(n406), .CI(n405), .CO(n421), .S(n394) );
  NAND2_X1 U470 ( .A1(n407), .A2(n492), .ZN(n409) );
  NAND2_X1 U471 ( .A1(n494), .A2(i_V_reset[2]), .ZN(n408) );
  NAND3_X1 U472 ( .A1(n410), .A2(n409), .A3(n408), .ZN(n411) );
  XOR2_X1 U473 ( .A(n411), .B(n498), .Z(n430) );
  NOR2_X1 U474 ( .A1(n500), .A2(n768), .ZN(n429) );
  FA_X1 U475 ( .A(n414), .B(n413), .CI(n412), .CO(n428), .S(n402) );
  AOI22_X1 U476 ( .A1(n510), .A2(n415), .B1(n508), .B2(i_V_reset[2]), .ZN(n416) );
  OAI21_X1 U477 ( .B1(n512), .B2(n768), .A(n416), .ZN(n417) );
  NOR2_X1 U478 ( .A1(n418), .A2(n417), .ZN(n419) );
  NOR2_X1 U479 ( .A1(n419), .A2(n763), .ZN(o_V[2]) );
  NAND2_X1 U480 ( .A1(n420), .A2(n485), .ZN(n426) );
  FA_X1 U481 ( .A(i_beta[2]), .B(n422), .CI(n421), .CO(n438), .S(n407) );
  NAND2_X1 U482 ( .A1(n423), .A2(n492), .ZN(n425) );
  NAND2_X1 U483 ( .A1(n494), .A2(i_V_reset[3]), .ZN(n424) );
  NAND3_X1 U484 ( .A1(n426), .A2(n425), .A3(n424), .ZN(n427) );
  XOR2_X1 U485 ( .A(n427), .B(n498), .Z(n447) );
  NOR2_X1 U486 ( .A1(n500), .A2(n765), .ZN(n446) );
  FA_X1 U487 ( .A(n430), .B(n429), .CI(n428), .CO(n445), .S(n418) );
  INV_X1 U488 ( .A(n431), .ZN(n432) );
  AOI22_X1 U489 ( .A1(n510), .A2(n432), .B1(n508), .B2(i_V_reset[3]), .ZN(n433) );
  OAI21_X1 U490 ( .B1(n512), .B2(n765), .A(n433), .ZN(n434) );
  NOR2_X1 U491 ( .A1(n435), .A2(n434), .ZN(n436) );
  NOR2_X1 U492 ( .A1(n436), .A2(n763), .ZN(o_V[3]) );
  NAND2_X1 U493 ( .A1(n437), .A2(n485), .ZN(n443) );
  FA_X1 U494 ( .A(i_beta[3]), .B(n439), .CI(n438), .CO(n454), .S(n423) );
  NAND2_X1 U495 ( .A1(n440), .A2(n492), .ZN(n442) );
  NAND2_X1 U496 ( .A1(n494), .A2(i_V_reset[4]), .ZN(n441) );
  NAND3_X1 U497 ( .A1(n443), .A2(n442), .A3(n441), .ZN(n444) );
  XOR2_X1 U498 ( .A(n444), .B(n498), .Z(n463) );
  NOR2_X1 U499 ( .A1(n500), .A2(n769), .ZN(n462) );
  FA_X1 U500 ( .A(n447), .B(n446), .CI(n445), .CO(n461), .S(n435) );
  AOI22_X1 U501 ( .A1(n510), .A2(n448), .B1(n508), .B2(i_V_reset[4]), .ZN(n449) );
  OAI21_X1 U502 ( .B1(n512), .B2(n769), .A(n449), .ZN(n450) );
  NOR2_X1 U503 ( .A1(n451), .A2(n450), .ZN(n452) );
  NOR2_X1 U504 ( .A1(n452), .A2(n763), .ZN(o_V[4]) );
  NAND2_X1 U505 ( .A1(n453), .A2(n485), .ZN(n459) );
  FA_X1 U506 ( .A(i_beta[4]), .B(n455), .CI(n454), .CO(n470), .S(n440) );
  NAND2_X1 U507 ( .A1(n456), .A2(n492), .ZN(n458) );
  NAND2_X1 U508 ( .A1(n494), .A2(i_V_reset[5]), .ZN(n457) );
  NAND3_X1 U509 ( .A1(n459), .A2(n458), .A3(n457), .ZN(n460) );
  XOR2_X1 U510 ( .A(n460), .B(n498), .Z(n479) );
  NOR2_X1 U511 ( .A1(n500), .A2(n764), .ZN(n478) );
  FA_X1 U512 ( .A(n463), .B(n462), .CI(n461), .CO(n477), .S(n451) );
  AOI22_X1 U513 ( .A1(n510), .A2(n464), .B1(n508), .B2(i_V_reset[5]), .ZN(n465) );
  OAI21_X1 U514 ( .B1(n512), .B2(n764), .A(n465), .ZN(n466) );
  NOR2_X1 U515 ( .A1(n467), .A2(n466), .ZN(n468) );
  NOR2_X1 U516 ( .A1(n468), .A2(n763), .ZN(o_V[5]) );
  NAND2_X1 U517 ( .A1(n469), .A2(n485), .ZN(n475) );
  FA_X1 U518 ( .A(i_beta[5]), .B(n471), .CI(n470), .CO(n487), .S(n456) );
  NAND2_X1 U519 ( .A1(n472), .A2(n492), .ZN(n474) );
  NAND2_X1 U520 ( .A1(n494), .A2(i_V_reset[6]), .ZN(n473) );
  NAND3_X1 U521 ( .A1(n475), .A2(n474), .A3(n473), .ZN(n476) );
  XOR2_X1 U522 ( .A(n476), .B(n498), .Z(n505) );
  NOR2_X1 U523 ( .A1(n500), .A2(n766), .ZN(n504) );
  FA_X1 U524 ( .A(n479), .B(n478), .CI(n477), .CO(n503), .S(n467) );
  AOI22_X1 U525 ( .A1(n510), .A2(n480), .B1(n508), .B2(i_V_reset[6]), .ZN(n481) );
  OAI21_X1 U526 ( .B1(n512), .B2(n766), .A(n481), .ZN(n482) );
  NOR2_X1 U527 ( .A1(n483), .A2(n482), .ZN(n484) );
  NOR2_X1 U528 ( .A1(n484), .A2(n763), .ZN(o_V[6]) );
  NAND2_X1 U529 ( .A1(n486), .A2(n485), .ZN(n497) );
  FA_X1 U530 ( .A(i_beta[6]), .B(n488), .CI(n487), .CO(n491), .S(n472) );
  XOR2_X1 U531 ( .A(i_beta[7]), .B(n489), .Z(n490) );
  XOR2_X1 U532 ( .A(n491), .B(n490), .Z(n493) );
  NAND2_X1 U533 ( .A1(n493), .A2(n492), .ZN(n496) );
  NAND2_X1 U534 ( .A1(n494), .A2(i_V_reset[7]), .ZN(n495) );
  NAND3_X1 U535 ( .A1(n497), .A2(n496), .A3(n495), .ZN(n499) );
  XOR2_X1 U536 ( .A(n499), .B(n498), .Z(n502) );
  NOR2_X1 U537 ( .A1(n500), .A2(n770), .ZN(n501) );
  XOR2_X1 U538 ( .A(n502), .B(n501), .Z(n507) );
  FA_X1 U539 ( .A(n505), .B(n504), .CI(n503), .CO(n506), .S(n483) );
  XOR2_X1 U540 ( .A(n507), .B(n506), .Z(n514) );
  AOI22_X1 U541 ( .A1(n510), .A2(n509), .B1(n508), .B2(i_V_reset[7]), .ZN(n511) );
  OAI21_X1 U542 ( .B1(n512), .B2(n770), .A(n511), .ZN(n513) );
  NOR2_X1 U543 ( .A1(n514), .A2(n513), .ZN(n515) );
  NOR2_X1 U544 ( .A1(n515), .A2(n763), .ZN(o_V[7]) );
  XOR2_X1 U545 ( .A(reset_prn[7]), .B(reset_prn[5]), .Z(n516) );
  XNOR2_X1 U546 ( .A(reset_prn[3]), .B(n516), .ZN(n518) );
  INV_X1 U547 ( .A(i_lfsr_en), .ZN(n757) );
  NOR2_X1 U548 ( .A1(i_Seed_DV), .A2(n757), .ZN(n756) );
  CLKBUF_X1 U549 ( .A(n756), .Z(n753) );
  NAND2_X1 U550 ( .A1(reset_prn[4]), .A2(n518), .ZN(n517) );
  OAI211_X1 U551 ( .C1(reset_prn[4]), .C2(n518), .A(n753), .B(n517), .ZN(n519)
         );
  AND2_X1 U552 ( .A1(i_lfsr_en), .A2(i_Seed_DV), .ZN(n729) );
  NAND2_X1 U553 ( .A1(n729), .A2(i_Seed_Data[0]), .ZN(n744) );
  OAI211_X1 U554 ( .C1(i_lfsr_en), .C2(n779), .A(n519), .B(n744), .ZN(n277) );
  NAND2_X1 U555 ( .A1(i_V[7]), .A2(i_leak_reversal_mode), .ZN(n567) );
  NOR2_X1 U556 ( .A1(n567), .A2(i_spike_en), .ZN(n692) );
  INV_X1 U557 ( .A(\LEAK/N8 ), .ZN(n553) );
  INV_X1 U558 ( .A(i_leak_weight[6]), .ZN(n565) );
  INV_X1 U559 ( .A(i_leak_weight[4]), .ZN(n561) );
  NOR3_X1 U560 ( .A1(i_leak_weight[2]), .A2(i_leak_weight[1]), .A3(\LEAK/N8 ), 
        .ZN(n535) );
  INV_X1 U561 ( .A(i_leak_weight[3]), .ZN(n559) );
  AND2_X1 U562 ( .A1(n535), .A2(n559), .ZN(n523) );
  NAND2_X1 U563 ( .A1(n561), .A2(n523), .ZN(n521) );
  NOR2_X1 U564 ( .A1(n521), .A2(i_leak_weight[5]), .ZN(n549) );
  INV_X1 U565 ( .A(i_leak_weight[7]), .ZN(n680) );
  NOR2_X1 U566 ( .A1(n549), .A2(n680), .ZN(n520) );
  XOR2_X1 U567 ( .A(n565), .B(n520), .Z(n546) );
  INV_X1 U568 ( .A(i_leak_weight[5]), .ZN(n563) );
  NAND2_X1 U569 ( .A1(n521), .A2(i_leak_weight[7]), .ZN(n522) );
  XNOR2_X1 U570 ( .A(n563), .B(n522), .ZN(n527) );
  NOR2_X1 U571 ( .A1(n680), .A2(n523), .ZN(n524) );
  XOR2_X1 U572 ( .A(n524), .B(n561), .Z(n537) );
  OAI211_X1 U573 ( .C1(leak_prn[5]), .C2(n527), .A(n537), .B(leak_prn[4]), 
        .ZN(n526) );
  NAND2_X1 U574 ( .A1(leak_prn[5]), .A2(n527), .ZN(n525) );
  NAND2_X1 U575 ( .A1(n526), .A2(n525), .ZN(n545) );
  NOR2_X1 U576 ( .A1(leak_prn[5]), .A2(n527), .ZN(n543) );
  OAI21_X1 U577 ( .B1(i_leak_weight[1]), .B2(\LEAK/N8 ), .A(i_leak_weight[7]), 
        .ZN(n528) );
  INV_X1 U578 ( .A(i_leak_weight[2]), .ZN(n557) );
  XOR2_X1 U579 ( .A(n528), .B(n557), .Z(n534) );
  NOR2_X1 U580 ( .A1(i_leak_weight[1]), .A2(\LEAK/N8 ), .ZN(n532) );
  NOR2_X1 U581 ( .A1(n680), .A2(n553), .ZN(n530) );
  AOI22_X1 U582 ( .A1(leak_prn[0]), .A2(n553), .B1(n530), .B2(i_leak_weight[1]), .ZN(n529) );
  OAI21_X1 U583 ( .B1(n530), .B2(i_leak_weight[1]), .A(n529), .ZN(n531) );
  OAI221_X1 U584 ( .B1(leak_prn[1]), .B2(n532), .C1(leak_prn[1]), .C2(
        leak_prn[0]), .A(n531), .ZN(n533) );
  AOI222_X1 U585 ( .A1(n534), .A2(n772), .B1(n534), .B2(n533), .C1(n772), .C2(
        n533), .ZN(n541) );
  NOR2_X1 U586 ( .A1(n535), .A2(n680), .ZN(n536) );
  XOR2_X1 U587 ( .A(n559), .B(n536), .Z(n540) );
  AND2_X1 U588 ( .A1(leak_prn[3]), .A2(n541), .ZN(n539) );
  OR2_X1 U589 ( .A1(n537), .A2(leak_prn[4]), .ZN(n538) );
  OAI221_X1 U590 ( .B1(leak_prn[3]), .B2(n541), .C1(n540), .C2(n539), .A(n538), 
        .ZN(n542) );
  NOR2_X1 U591 ( .A1(n543), .A2(n542), .ZN(n544) );
  OAI22_X1 U592 ( .A1(leak_prn[6]), .A2(n546), .B1(n545), .B2(n544), .ZN(n548)
         );
  NAND2_X1 U593 ( .A1(leak_prn[6]), .A2(n546), .ZN(n547) );
  NAND2_X1 U594 ( .A1(n548), .A2(n547), .ZN(n551) );
  AND3_X1 U595 ( .A1(n565), .A2(i_leak_weight[7]), .A3(n549), .ZN(n550) );
  NOR2_X1 U596 ( .A1(n551), .A2(n550), .ZN(n554) );
  NAND3_X1 U597 ( .A1(n554), .A2(i_leak_mode_sel), .A3(n771), .ZN(n552) );
  OAI21_X1 U598 ( .B1(i_leak_mode_sel), .B2(n553), .A(n552), .ZN(n667) );
  INV_X1 U599 ( .A(n667), .ZN(n669) );
  INV_X1 U600 ( .A(i_leak_weight[1]), .ZN(n555) );
  NAND4_X1 U601 ( .A1(n554), .A2(i_leak_weight[7]), .A3(i_leak_mode_sel), .A4(
        n771), .ZN(n679) );
  OAI21_X1 U602 ( .B1(i_leak_mode_sel), .B2(n555), .A(n679), .ZN(n556) );
  INV_X1 U603 ( .A(n556), .ZN(n673) );
  OAI21_X1 U604 ( .B1(i_leak_mode_sel), .B2(n557), .A(n679), .ZN(n558) );
  INV_X1 U605 ( .A(n558), .ZN(n656) );
  OAI21_X1 U606 ( .B1(i_leak_mode_sel), .B2(n559), .A(n679), .ZN(n560) );
  INV_X1 U607 ( .A(n560), .ZN(n648) );
  OAI21_X1 U608 ( .B1(i_leak_mode_sel), .B2(n561), .A(n679), .ZN(n562) );
  INV_X1 U609 ( .A(n562), .ZN(n641) );
  OAI21_X1 U610 ( .B1(i_leak_mode_sel), .B2(n563), .A(n679), .ZN(n564) );
  INV_X1 U611 ( .A(n564), .ZN(n633) );
  OAI21_X1 U612 ( .B1(i_leak_mode_sel), .B2(n565), .A(n679), .ZN(n566) );
  INV_X1 U613 ( .A(n566), .ZN(n677) );
  NAND2_X1 U614 ( .A1(n686), .A2(n567), .ZN(n688) );
  AND2_X1 U615 ( .A1(i_G[0]), .A2(i_G[1]), .ZN(n583) );
  NOR2_X1 U616 ( .A1(i_G[0]), .A2(i_G[1]), .ZN(n586) );
  AOI22_X1 U617 ( .A1(n583), .A2(i_syn_weight[6]), .B1(n586), .B2(
        i_syn_weight[30]), .ZN(n570) );
  INV_X1 U618 ( .A(i_G[1]), .ZN(n568) );
  NOR2_X1 U619 ( .A1(i_G[0]), .A2(n568), .ZN(n584) );
  AND2_X1 U620 ( .A1(n568), .A2(i_G[0]), .ZN(n585) );
  AOI22_X1 U621 ( .A1(n584), .A2(i_syn_weight[14]), .B1(n585), .B2(
        i_syn_weight[22]), .ZN(n569) );
  AND2_X1 U622 ( .A1(n570), .A2(n569), .ZN(n590) );
  INV_X1 U623 ( .A(n590), .ZN(n625) );
  INV_X1 U624 ( .A(i_syn_mode_sel), .ZN(n684) );
  AOI22_X1 U625 ( .A1(n584), .A2(i_syn_weight[15]), .B1(n583), .B2(
        i_syn_weight[7]), .ZN(n572) );
  AOI22_X1 U626 ( .A1(n586), .A2(i_syn_weight[31]), .B1(n585), .B2(
        i_syn_weight[23]), .ZN(n571) );
  NAND2_X1 U627 ( .A1(n572), .A2(n571), .ZN(n685) );
  INV_X1 U628 ( .A(n685), .ZN(n624) );
  AOI22_X1 U629 ( .A1(n584), .A2(i_syn_weight[9]), .B1(n583), .B2(
        i_syn_weight[1]), .ZN(n574) );
  AOI22_X1 U630 ( .A1(n586), .A2(i_syn_weight[25]), .B1(n585), .B2(
        i_syn_weight[17]), .ZN(n573) );
  AND2_X1 U631 ( .A1(n574), .A2(n573), .ZN(n670) );
  AOI22_X1 U632 ( .A1(n584), .A2(i_syn_weight[8]), .B1(n583), .B2(
        i_syn_weight[0]), .ZN(n576) );
  AOI22_X1 U633 ( .A1(n586), .A2(i_syn_weight[24]), .B1(n585), .B2(
        i_syn_weight[16]), .ZN(n575) );
  NAND2_X1 U634 ( .A1(n576), .A2(n575), .ZN(n663) );
  INV_X1 U635 ( .A(n663), .ZN(n604) );
  AND2_X1 U636 ( .A1(n670), .A2(n604), .ZN(n608) );
  AOI22_X1 U637 ( .A1(n583), .A2(i_syn_weight[2]), .B1(n586), .B2(
        i_syn_weight[26]), .ZN(n578) );
  AOI22_X1 U638 ( .A1(n584), .A2(i_syn_weight[10]), .B1(n585), .B2(
        i_syn_weight[18]), .ZN(n577) );
  AND2_X1 U639 ( .A1(n578), .A2(n577), .ZN(n653) );
  NAND2_X1 U640 ( .A1(n608), .A2(n653), .ZN(n600) );
  AOI22_X1 U641 ( .A1(n584), .A2(i_syn_weight[11]), .B1(n583), .B2(
        i_syn_weight[3]), .ZN(n580) );
  AOI22_X1 U642 ( .A1(n586), .A2(i_syn_weight[27]), .B1(n585), .B2(
        i_syn_weight[19]), .ZN(n579) );
  NAND2_X1 U643 ( .A1(n580), .A2(n579), .ZN(n646) );
  NOR2_X1 U644 ( .A1(n600), .A2(n646), .ZN(n595) );
  AOI22_X1 U645 ( .A1(n583), .A2(i_syn_weight[4]), .B1(n586), .B2(
        i_syn_weight[28]), .ZN(n582) );
  AOI22_X1 U646 ( .A1(n584), .A2(i_syn_weight[12]), .B1(n585), .B2(
        i_syn_weight[20]), .ZN(n581) );
  AND2_X1 U647 ( .A1(n582), .A2(n581), .ZN(n638) );
  NAND2_X1 U648 ( .A1(n595), .A2(n638), .ZN(n592) );
  AOI22_X1 U649 ( .A1(n584), .A2(i_syn_weight[13]), .B1(n583), .B2(
        i_syn_weight[5]), .ZN(n588) );
  AOI22_X1 U650 ( .A1(n586), .A2(i_syn_weight[29]), .B1(n585), .B2(
        i_syn_weight[21]), .ZN(n587) );
  NAND2_X1 U651 ( .A1(n588), .A2(n587), .ZN(n631) );
  NOR2_X1 U652 ( .A1(n592), .A2(n631), .ZN(n589) );
  AND3_X1 U653 ( .A1(n590), .A2(n589), .A3(n685), .ZN(n661) );
  NOR2_X1 U654 ( .A1(n624), .A2(n589), .ZN(n591) );
  XOR2_X1 U655 ( .A(n591), .B(n590), .Z(n620) );
  INV_X1 U656 ( .A(n631), .ZN(n594) );
  NAND2_X1 U657 ( .A1(n592), .A2(n685), .ZN(n593) );
  XNOR2_X1 U658 ( .A(n594), .B(n593), .ZN(n599) );
  NOR2_X1 U659 ( .A1(n595), .A2(n624), .ZN(n596) );
  XOR2_X1 U660 ( .A(n596), .B(n638), .Z(n611) );
  OAI211_X1 U661 ( .C1(n599), .C2(syn_prn[5]), .A(n611), .B(syn_prn[4]), .ZN(
        n598) );
  NAND2_X1 U662 ( .A1(n599), .A2(syn_prn[5]), .ZN(n597) );
  NAND2_X1 U663 ( .A1(n598), .A2(n597), .ZN(n619) );
  NOR2_X1 U664 ( .A1(syn_prn[5]), .A2(n599), .ZN(n617) );
  INV_X1 U665 ( .A(n646), .ZN(n602) );
  NAND2_X1 U666 ( .A1(n600), .A2(n685), .ZN(n601) );
  XNOR2_X1 U667 ( .A(n602), .B(n601), .ZN(n615) );
  NOR2_X1 U668 ( .A1(n624), .A2(n608), .ZN(n603) );
  XNOR2_X1 U669 ( .A(n653), .B(n603), .ZN(n610) );
  NAND2_X1 U670 ( .A1(n685), .A2(n663), .ZN(n606) );
  AOI22_X1 U671 ( .A1(n604), .A2(syn_prn[0]), .B1(n670), .B2(n606), .ZN(n605)
         );
  OAI21_X1 U672 ( .B1(n670), .B2(n606), .A(n605), .ZN(n607) );
  OAI221_X1 U673 ( .B1(syn_prn[1]), .B2(n608), .C1(syn_prn[1]), .C2(syn_prn[0]), .A(n607), .ZN(n609) );
  AOI222_X1 U674 ( .A1(n773), .A2(n610), .B1(n773), .B2(n609), .C1(n610), .C2(
        n609), .ZN(n614) );
  AND2_X1 U675 ( .A1(n615), .A2(n614), .ZN(n613) );
  OR2_X1 U676 ( .A1(syn_prn[4]), .A2(n611), .ZN(n612) );
  OAI221_X1 U677 ( .B1(n615), .B2(n614), .C1(syn_prn[3]), .C2(n613), .A(n612), 
        .ZN(n616) );
  NOR2_X1 U678 ( .A1(n617), .A2(n616), .ZN(n618) );
  OAI22_X1 U679 ( .A1(n620), .A2(syn_prn[6]), .B1(n619), .B2(n618), .ZN(n622)
         );
  NAND2_X1 U680 ( .A1(n620), .A2(syn_prn[6]), .ZN(n621) );
  NAND2_X1 U681 ( .A1(n622), .A2(n621), .ZN(n660) );
  NAND2_X1 U682 ( .A1(i_syn_mode_sel), .A2(n775), .ZN(n623) );
  AOI21_X1 U683 ( .B1(n625), .B2(n684), .A(n683), .ZN(n626) );
  INV_X1 U684 ( .A(i_spike_en), .ZN(n686) );
  OAI22_X1 U685 ( .A1(n677), .A2(n688), .B1(n626), .B2(n686), .ZN(n627) );
  AOI21_X1 U686 ( .B1(n692), .B2(n628), .A(n627), .ZN(n629) );
  INV_X1 U687 ( .A(n629), .ZN(n699) );
  HA_X1 U688 ( .A(n630), .B(n633), .CO(n678), .S(n635) );
  AOI21_X1 U689 ( .B1(n684), .B2(n631), .A(n683), .ZN(n632) );
  OAI22_X1 U690 ( .A1(n633), .A2(n688), .B1(n632), .B2(n686), .ZN(n634) );
  AOI21_X1 U691 ( .B1(n692), .B2(n635), .A(n634), .ZN(n636) );
  INV_X1 U692 ( .A(n636), .ZN(n702) );
  HA_X1 U693 ( .A(n637), .B(n641), .CO(n630), .S(n643) );
  INV_X1 U694 ( .A(n638), .ZN(n639) );
  AOI21_X1 U695 ( .B1(n684), .B2(n639), .A(n683), .ZN(n640) );
  OAI22_X1 U696 ( .A1(n641), .A2(n688), .B1(n640), .B2(n686), .ZN(n642) );
  AOI21_X1 U697 ( .B1(n692), .B2(n643), .A(n642), .ZN(n644) );
  INV_X1 U698 ( .A(n644), .ZN(n705) );
  HA_X1 U699 ( .A(n645), .B(n648), .CO(n637), .S(n650) );
  AOI21_X1 U700 ( .B1(n684), .B2(n646), .A(n683), .ZN(n647) );
  OAI22_X1 U701 ( .A1(n648), .A2(n688), .B1(n647), .B2(n686), .ZN(n649) );
  AOI21_X1 U702 ( .B1(n692), .B2(n650), .A(n649), .ZN(n651) );
  INV_X1 U703 ( .A(n651), .ZN(n708) );
  HA_X1 U704 ( .A(n652), .B(n656), .CO(n645), .S(n658) );
  INV_X1 U705 ( .A(n653), .ZN(n654) );
  AOI21_X1 U706 ( .B1(n684), .B2(n654), .A(n683), .ZN(n655) );
  OAI22_X1 U707 ( .A1(n656), .A2(n688), .B1(n655), .B2(n686), .ZN(n657) );
  AOI21_X1 U708 ( .B1(n692), .B2(n658), .A(n657), .ZN(n659) );
  INV_X1 U709 ( .A(n659), .ZN(n711) );
  NOR3_X1 U710 ( .A1(n661), .A2(n660), .A3(syn_prn[7]), .ZN(n662) );
  NOR2_X1 U711 ( .A1(n662), .A2(n684), .ZN(n665) );
  OAI21_X1 U712 ( .B1(i_syn_mode_sel), .B2(n663), .A(i_spike_en), .ZN(n664) );
  OAI22_X1 U713 ( .A1(n669), .A2(n688), .B1(n665), .B2(n664), .ZN(n666) );
  AOI21_X1 U714 ( .B1(n692), .B2(n667), .A(n666), .ZN(n668) );
  INV_X1 U715 ( .A(n668), .ZN(n716) );
  HA_X1 U716 ( .A(n669), .B(n673), .CO(n652), .S(n675) );
  INV_X1 U717 ( .A(n670), .ZN(n671) );
  AOI21_X1 U718 ( .B1(n684), .B2(n671), .A(n683), .ZN(n672) );
  OAI22_X1 U719 ( .A1(n673), .A2(n688), .B1(n672), .B2(n686), .ZN(n674) );
  AOI21_X1 U720 ( .B1(n692), .B2(n675), .A(n674), .ZN(n676) );
  INV_X1 U721 ( .A(n676), .ZN(n713) );
  HA_X1 U722 ( .A(n678), .B(n677), .CO(n682), .S(n628) );
  OAI21_X1 U723 ( .B1(i_leak_mode_sel), .B2(n680), .A(n679), .ZN(n681) );
  INV_X1 U724 ( .A(n681), .ZN(n689) );
  XOR2_X1 U725 ( .A(n682), .B(n689), .Z(n691) );
  AOI21_X1 U726 ( .B1(n685), .B2(n684), .A(n683), .ZN(n687) );
  OAI22_X1 U727 ( .A1(n689), .A2(n688), .B1(n687), .B2(n686), .ZN(n690) );
  AOI21_X1 U728 ( .B1(n692), .B2(n691), .A(n690), .ZN(n693) );
  INV_X1 U729 ( .A(n693), .ZN(n694) );
  XOR2_X1 U730 ( .A(n694), .B(V_net[7]), .Z(n695) );
  XOR2_X1 U731 ( .A(n696), .B(n695), .Z(n697) );
  NOR2_X1 U732 ( .A1(i_leak_en), .A2(i_spike_en), .ZN(n717) );
  MUX2_X1 U733 ( .A(n697), .B(i_V[7]), .S(n717), .Z(\INTEGRATOR/o_V_net [7])
         );
  FA_X1 U734 ( .A(n699), .B(V_net[6]), .CI(n698), .CO(n696), .S(n700) );
  MUX2_X1 U735 ( .A(n700), .B(i_V[6]), .S(n717), .Z(\INTEGRATOR/o_V_net [6])
         );
  FA_X1 U736 ( .A(n702), .B(V_net[5]), .CI(n701), .CO(n698), .S(n703) );
  MUX2_X1 U737 ( .A(n703), .B(i_V[5]), .S(n717), .Z(\INTEGRATOR/o_V_net [5])
         );
  FA_X1 U738 ( .A(n705), .B(V_net[4]), .CI(n704), .CO(n701), .S(n706) );
  MUX2_X1 U739 ( .A(n706), .B(i_V[4]), .S(n717), .Z(\INTEGRATOR/o_V_net [4])
         );
  FA_X1 U740 ( .A(n708), .B(V_net[3]), .CI(n707), .CO(n704), .S(n709) );
  MUX2_X1 U741 ( .A(n709), .B(i_V[3]), .S(n717), .Z(\INTEGRATOR/o_V_net [3])
         );
  FA_X1 U742 ( .A(n711), .B(V_net[2]), .CI(n710), .CO(n707), .S(n712) );
  MUX2_X1 U743 ( .A(n712), .B(i_V[2]), .S(n717), .Z(\INTEGRATOR/o_V_net [2])
         );
  FA_X1 U744 ( .A(n714), .B(V_net[1]), .CI(n713), .CO(n710), .S(n715) );
  MUX2_X1 U745 ( .A(n715), .B(i_V[1]), .S(n717), .Z(\INTEGRATOR/o_V_net [1])
         );
  HA_X1 U746 ( .A(n716), .B(V_net[0]), .CO(n714), .S(n718) );
  MUX2_X1 U747 ( .A(n718), .B(i_V[0]), .S(n717), .Z(\INTEGRATOR/o_V_net [0])
         );
  AOI22_X1 U748 ( .A1(leak_prn[6]), .A2(n756), .B1(leak_prn[7]), .B2(n757), 
        .ZN(n719) );
  NAND2_X1 U749 ( .A1(n729), .A2(i_Seed_Data[7]), .ZN(n738) );
  NAND2_X1 U750 ( .A1(n719), .A2(n738), .ZN(n286) );
  AOI22_X1 U751 ( .A1(leak_prn[4]), .A2(leak_prn[3]), .B1(n774), .B2(n761), 
        .ZN(n720) );
  XNOR2_X1 U752 ( .A(leak_prn[5]), .B(n720), .ZN(n722) );
  NAND2_X1 U753 ( .A1(leak_prn[7]), .A2(n722), .ZN(n721) );
  OAI211_X1 U754 ( .C1(leak_prn[7]), .C2(n722), .A(n753), .B(n721), .ZN(n723)
         );
  OAI211_X1 U755 ( .C1(i_lfsr_en), .C2(n777), .A(n744), .B(n723), .ZN(n285) );
  AOI22_X1 U756 ( .A1(leak_prn[1]), .A2(n757), .B1(leak_prn[0]), .B2(n753), 
        .ZN(n724) );
  NAND2_X1 U757 ( .A1(n729), .A2(i_Seed_Data[1]), .ZN(n745) );
  NAND2_X1 U758 ( .A1(n724), .A2(n745), .ZN(n284) );
  AOI22_X1 U759 ( .A1(leak_prn[2]), .A2(n757), .B1(leak_prn[1]), .B2(n753), 
        .ZN(n725) );
  NAND2_X1 U760 ( .A1(n729), .A2(i_Seed_Data[2]), .ZN(n747) );
  NAND2_X1 U761 ( .A1(n725), .A2(n747), .ZN(n283) );
  AOI22_X1 U762 ( .A1(leak_prn[2]), .A2(n756), .B1(leak_prn[3]), .B2(n757), 
        .ZN(n726) );
  NAND2_X1 U763 ( .A1(n729), .A2(i_Seed_Data[3]), .ZN(n749) );
  NAND2_X1 U764 ( .A1(n726), .A2(n749), .ZN(n282) );
  AOI22_X1 U765 ( .A1(leak_prn[4]), .A2(n757), .B1(leak_prn[3]), .B2(n753), 
        .ZN(n727) );
  NAND2_X1 U766 ( .A1(n729), .A2(i_Seed_Data[4]), .ZN(n751) );
  NAND2_X1 U767 ( .A1(n727), .A2(n751), .ZN(n281) );
  AOI22_X1 U768 ( .A1(leak_prn[5]), .A2(n757), .B1(leak_prn[4]), .B2(n753), 
        .ZN(n728) );
  NAND2_X1 U769 ( .A1(n729), .A2(i_Seed_Data[5]), .ZN(n754) );
  NAND2_X1 U770 ( .A1(n728), .A2(n754), .ZN(n280) );
  AOI22_X1 U771 ( .A1(leak_prn[6]), .A2(n757), .B1(leak_prn[5]), .B2(n753), 
        .ZN(n730) );
  NAND2_X1 U772 ( .A1(n729), .A2(i_Seed_Data[6]), .ZN(n758) );
  NAND2_X1 U773 ( .A1(n730), .A2(n758), .ZN(n279) );
  AOI22_X1 U774 ( .A1(reset_prn[6]), .A2(n756), .B1(reset_prn[7]), .B2(n757), 
        .ZN(n731) );
  NAND2_X1 U775 ( .A1(n731), .A2(n738), .ZN(n278) );
  AOI22_X1 U776 ( .A1(reset_prn[1]), .A2(n757), .B1(reset_prn[0]), .B2(n753), 
        .ZN(n732) );
  NAND2_X1 U777 ( .A1(n732), .A2(n745), .ZN(n276) );
  AOI22_X1 U778 ( .A1(reset_prn[1]), .A2(n756), .B1(reset_prn[2]), .B2(n757), 
        .ZN(n733) );
  NAND2_X1 U779 ( .A1(n733), .A2(n747), .ZN(n275) );
  AOI22_X1 U780 ( .A1(reset_prn[2]), .A2(n756), .B1(reset_prn[3]), .B2(n757), 
        .ZN(n734) );
  NAND2_X1 U781 ( .A1(n734), .A2(n749), .ZN(n274) );
  AOI22_X1 U782 ( .A1(reset_prn[4]), .A2(n757), .B1(n753), .B2(reset_prn[3]), 
        .ZN(n735) );
  NAND2_X1 U783 ( .A1(n735), .A2(n751), .ZN(n273) );
  AOI22_X1 U784 ( .A1(reset_prn[4]), .A2(n756), .B1(reset_prn[5]), .B2(n757), 
        .ZN(n736) );
  NAND2_X1 U785 ( .A1(n736), .A2(n754), .ZN(n272) );
  AOI22_X1 U786 ( .A1(reset_prn[6]), .A2(n757), .B1(n753), .B2(reset_prn[5]), 
        .ZN(n737) );
  NAND2_X1 U787 ( .A1(n737), .A2(n758), .ZN(n271) );
  AOI22_X1 U788 ( .A1(syn_prn[6]), .A2(n756), .B1(syn_prn[7]), .B2(n757), .ZN(
        n739) );
  NAND2_X1 U789 ( .A1(n739), .A2(n738), .ZN(n270) );
  AOI22_X1 U790 ( .A1(syn_prn[4]), .A2(syn_prn[3]), .B1(n776), .B2(n762), .ZN(
        n740) );
  XNOR2_X1 U791 ( .A(syn_prn[5]), .B(n740), .ZN(n742) );
  NAND2_X1 U792 ( .A1(syn_prn[7]), .A2(n742), .ZN(n741) );
  OAI211_X1 U793 ( .C1(syn_prn[7]), .C2(n742), .A(n753), .B(n741), .ZN(n743)
         );
  OAI211_X1 U794 ( .C1(i_lfsr_en), .C2(n778), .A(n744), .B(n743), .ZN(n269) );
  AOI22_X1 U795 ( .A1(syn_prn[1]), .A2(n757), .B1(syn_prn[0]), .B2(n756), .ZN(
        n746) );
  NAND2_X1 U796 ( .A1(n746), .A2(n745), .ZN(n268) );
  AOI22_X1 U797 ( .A1(syn_prn[2]), .A2(n757), .B1(syn_prn[1]), .B2(n756), .ZN(
        n748) );
  NAND2_X1 U798 ( .A1(n748), .A2(n747), .ZN(n267) );
  AOI22_X1 U799 ( .A1(syn_prn[3]), .A2(n757), .B1(syn_prn[2]), .B2(n753), .ZN(
        n750) );
  NAND2_X1 U800 ( .A1(n750), .A2(n749), .ZN(n266) );
  AOI22_X1 U801 ( .A1(syn_prn[4]), .A2(n757), .B1(syn_prn[3]), .B2(n753), .ZN(
        n752) );
  NAND2_X1 U802 ( .A1(n752), .A2(n751), .ZN(n265) );
  AOI22_X1 U803 ( .A1(syn_prn[5]), .A2(n757), .B1(syn_prn[4]), .B2(n753), .ZN(
        n755) );
  NAND2_X1 U804 ( .A1(n755), .A2(n754), .ZN(n264) );
  AOI22_X1 U805 ( .A1(syn_prn[6]), .A2(n757), .B1(syn_prn[5]), .B2(n756), .ZN(
        n759) );
  NAND2_X1 U806 ( .A1(n759), .A2(n758), .ZN(n263) );
endmodule

