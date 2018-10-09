/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 24 16:08:41 2018
/////////////////////////////////////////////////////////////


module threshold_reset_unit ( i_V_valid, i_V, i_thresh_prn, i_M, i_alpha, 
        i_beta, i_V_reset, i_kappa, i_gamma, o_V, o_spike );
  input [7:0] i_V;
  input [7:0] i_thresh_prn;
  input [7:0] i_M;
  input [7:0] i_alpha;
  input [7:0] i_beta;
  input [7:0] i_V_reset;
  input [1:0] i_gamma;
  output [7:0] o_V;
  input i_V_valid, i_kappa;
  output o_spike;
  wire   N8, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317;
  assign N8 = i_beta[0];

  NOR3_X2 U100 ( .A1(n182), .A2(i_gamma[1]), .A3(i_gamma[0]), .ZN(n309) );
  AND2_X1 U101 ( .A1(i_thresh_prn[6]), .A2(i_M[6]), .ZN(n289) );
  AND2_X1 U102 ( .A1(i_thresh_prn[5]), .A2(i_M[5]), .ZN(n271) );
  AND2_X1 U103 ( .A1(i_thresh_prn[4]), .A2(i_M[4]), .ZN(n253) );
  AND2_X1 U104 ( .A1(i_thresh_prn[3]), .A2(i_M[3]), .ZN(n237) );
  AND2_X1 U105 ( .A1(i_thresh_prn[2]), .A2(i_M[2]), .ZN(n220) );
  AND2_X1 U106 ( .A1(i_thresh_prn[1]), .A2(i_M[1]), .ZN(n204) );
  AND2_X1 U107 ( .A1(i_thresh_prn[0]), .A2(i_M[0]), .ZN(n191) );
  AND2_X1 U108 ( .A1(i_thresh_prn[7]), .A2(i_M[7]), .ZN(n290) );
  XOR2_X1 U109 ( .A(n290), .B(i_alpha[7]), .Z(n82) );
  XOR2_X1 U110 ( .A(n83), .B(n82), .Z(n287) );
  INV_X1 U111 ( .A(n287), .ZN(n108) );
  INV_X1 U112 ( .A(i_V[7]), .ZN(n165) );
  FA_X1 U113 ( .A(n289), .B(i_alpha[6]), .CI(n84), .CO(n83), .S(n269) );
  INV_X1 U114 ( .A(i_V[6]), .ZN(n282) );
  FA_X1 U115 ( .A(n271), .B(i_alpha[5]), .CI(n85), .CO(n84), .S(n251) );
  INV_X1 U116 ( .A(n251), .ZN(n103) );
  INV_X1 U117 ( .A(i_V[5]), .ZN(n265) );
  FA_X1 U118 ( .A(n253), .B(i_alpha[4]), .CI(n86), .CO(n85), .S(n235) );
  INV_X1 U119 ( .A(i_V[4]), .ZN(n88) );
  OR2_X1 U120 ( .A1(n235), .A2(n88), .ZN(n101) );
  FA_X1 U121 ( .A(n237), .B(i_alpha[3]), .CI(n87), .CO(n86), .S(n218) );
  INV_X1 U122 ( .A(n218), .ZN(n99) );
  NAND2_X1 U123 ( .A1(n235), .A2(n88), .ZN(n98) );
  INV_X1 U124 ( .A(i_V[3]), .ZN(n144) );
  FA_X1 U125 ( .A(n220), .B(i_alpha[2]), .CI(n89), .CO(n87), .S(n202) );
  INV_X1 U126 ( .A(i_V[2]), .ZN(n91) );
  OR2_X1 U127 ( .A1(n202), .A2(n91), .ZN(n96) );
  FA_X1 U128 ( .A(n204), .B(i_alpha[1]), .CI(n90), .CO(n89), .S(n190) );
  INV_X1 U129 ( .A(n190), .ZN(n94) );
  NAND2_X1 U130 ( .A1(n202), .A2(n91), .ZN(n93) );
  INV_X1 U131 ( .A(i_V[1]), .ZN(n134) );
  HA_X1 U132 ( .A(n191), .B(i_alpha[0]), .CO(n90), .S(n170) );
  INV_X1 U133 ( .A(i_V[0]), .ZN(n184) );
  OAI211_X1 U134 ( .C1(n190), .C2(n134), .A(n170), .B(n184), .ZN(n92) );
  OAI211_X1 U135 ( .C1(i_V[1]), .C2(n94), .A(n93), .B(n92), .ZN(n95) );
  OAI211_X1 U136 ( .C1(n218), .C2(n144), .A(n96), .B(n95), .ZN(n97) );
  OAI211_X1 U137 ( .C1(i_V[3]), .C2(n99), .A(n98), .B(n97), .ZN(n100) );
  OAI211_X1 U138 ( .C1(n251), .C2(n265), .A(n101), .B(n100), .ZN(n102) );
  OAI21_X1 U139 ( .B1(n103), .B2(i_V[5]), .A(n102), .ZN(n104) );
  OAI21_X1 U140 ( .B1(n269), .B2(n282), .A(n104), .ZN(n106) );
  NAND2_X1 U141 ( .A1(n269), .A2(n282), .ZN(n105) );
  OAI211_X1 U142 ( .C1(n287), .C2(n165), .A(n106), .B(n105), .ZN(n107) );
  OAI21_X1 U143 ( .B1(n108), .B2(i_V[7]), .A(n107), .ZN(n177) );
  INV_X1 U144 ( .A(n177), .ZN(n182) );
  INV_X1 U145 ( .A(i_V_valid), .ZN(n316) );
  NOR2_X1 U146 ( .A1(n182), .A2(n316), .ZN(o_spike) );
  INV_X1 U147 ( .A(i_beta[5]), .ZN(n109) );
  NOR2_X1 U148 ( .A1(i_beta[1]), .A2(N8), .ZN(n111) );
  INV_X1 U149 ( .A(n111), .ZN(n112) );
  NOR2_X1 U150 ( .A1(i_beta[2]), .A2(n112), .ZN(n117) );
  INV_X1 U151 ( .A(i_beta[3]), .ZN(n116) );
  NAND2_X1 U152 ( .A1(n117), .A2(n116), .ZN(n115) );
  NOR2_X1 U153 ( .A1(i_beta[4]), .A2(n115), .ZN(n118) );
  NAND2_X1 U154 ( .A1(n109), .A2(n118), .ZN(n121) );
  XOR2_X1 U155 ( .A(i_beta[6]), .B(n121), .Z(n280) );
  AOI21_X1 U156 ( .B1(i_beta[4]), .B2(n115), .A(n118), .ZN(n246) );
  AOI21_X1 U157 ( .B1(i_beta[2]), .B2(n112), .A(n117), .ZN(n213) );
  INV_X1 U158 ( .A(n204), .ZN(n127) );
  INV_X1 U159 ( .A(n191), .ZN(n110) );
  NOR2_X1 U160 ( .A1(N8), .A2(n110), .ZN(n128) );
  INV_X1 U161 ( .A(n128), .ZN(n126) );
  AOI21_X1 U162 ( .B1(N8), .B2(i_beta[1]), .A(n111), .ZN(n197) );
  AOI222_X1 U163 ( .A1(n127), .A2(n126), .B1(n127), .B2(n112), .C1(n126), .C2(
        n197), .ZN(n137) );
  INV_X1 U164 ( .A(n137), .ZN(n114) );
  INV_X1 U165 ( .A(n220), .ZN(n113) );
  AOI222_X1 U166 ( .A1(n213), .A2(n114), .B1(n213), .B2(n113), .C1(n114), .C2(
        n113), .ZN(n141) );
  OAI21_X1 U167 ( .B1(n117), .B2(n116), .A(n115), .ZN(n229) );
  INV_X1 U168 ( .A(n148), .ZN(n146) );
  INV_X1 U169 ( .A(n253), .ZN(n147) );
  AOI222_X1 U170 ( .A1(n246), .A2(n146), .B1(n246), .B2(n147), .C1(n146), .C2(
        n147), .ZN(n124) );
  XOR2_X1 U171 ( .A(i_beta[5]), .B(n118), .Z(n262) );
  INV_X1 U172 ( .A(n156), .ZN(n154) );
  INV_X1 U173 ( .A(n289), .ZN(n155) );
  AOI222_X1 U174 ( .A1(n280), .A2(n154), .B1(n280), .B2(n155), .C1(n154), .C2(
        n155), .ZN(n120) );
  NOR2_X1 U175 ( .A1(n290), .A2(n120), .ZN(n119) );
  AOI211_X1 U176 ( .C1(n290), .C2(n120), .A(i_kappa), .B(n119), .ZN(n123) );
  NOR2_X1 U177 ( .A1(i_beta[6]), .A2(n121), .ZN(n122) );
  XNOR2_X1 U178 ( .A(n122), .B(i_beta[7]), .ZN(n310) );
  XOR2_X1 U179 ( .A(n123), .B(n310), .Z(n164) );
  FA_X1 U180 ( .A(n271), .B(n124), .CI(n262), .CO(n156), .S(n125) );
  INV_X1 U181 ( .A(i_kappa), .ZN(n176) );
  AOI22_X1 U182 ( .A1(i_kappa), .A2(n262), .B1(n125), .B2(n176), .ZN(n153) );
  AOI221_X1 U183 ( .B1(n204), .B2(n128), .C1(n127), .C2(n126), .A(i_kappa), 
        .ZN(n129) );
  XOR2_X1 U184 ( .A(n129), .B(n197), .Z(n135) );
  NAND2_X1 U185 ( .A1(n191), .A2(n176), .ZN(n132) );
  INV_X1 U186 ( .A(N8), .ZN(n131) );
  INV_X1 U187 ( .A(n132), .ZN(n130) );
  OAI221_X1 U188 ( .B1(N8), .B2(n132), .C1(n131), .C2(n130), .A(i_V[0]), .ZN(
        n133) );
  AOI222_X1 U189 ( .A1(n135), .A2(n134), .B1(n135), .B2(n133), .C1(n134), .C2(
        n133), .ZN(n140) );
  NOR2_X1 U190 ( .A1(n220), .A2(n137), .ZN(n136) );
  AOI211_X1 U191 ( .C1(n220), .C2(n137), .A(i_kappa), .B(n136), .ZN(n138) );
  XNOR2_X1 U192 ( .A(n138), .B(n213), .ZN(n139) );
  AOI222_X1 U193 ( .A1(n140), .A2(i_V[2]), .B1(n140), .B2(n139), .C1(i_V[2]), 
        .C2(n139), .ZN(n145) );
  FA_X1 U194 ( .A(n237), .B(n141), .CI(n229), .CO(n148), .S(n142) );
  AOI22_X1 U195 ( .A1(i_kappa), .A2(n229), .B1(n142), .B2(n176), .ZN(n143) );
  AOI222_X1 U196 ( .A1(n145), .A2(n144), .B1(n145), .B2(n143), .C1(n144), .C2(
        n143), .ZN(n151) );
  AOI221_X1 U197 ( .B1(n253), .B2(n148), .C1(n147), .C2(n146), .A(i_kappa), 
        .ZN(n149) );
  XNOR2_X1 U198 ( .A(n149), .B(n246), .ZN(n150) );
  AOI222_X1 U199 ( .A1(n151), .A2(i_V[4]), .B1(n151), .B2(n150), .C1(i_V[4]), 
        .C2(n150), .ZN(n152) );
  AOI222_X1 U200 ( .A1(n153), .A2(n265), .B1(n153), .B2(n152), .C1(n265), .C2(
        n152), .ZN(n160) );
  AOI221_X1 U201 ( .B1(n289), .B2(n156), .C1(n155), .C2(n154), .A(i_kappa), 
        .ZN(n157) );
  XNOR2_X1 U202 ( .A(n157), .B(n280), .ZN(n158) );
  OAI21_X1 U203 ( .B1(n160), .B2(i_V[6]), .A(n158), .ZN(n162) );
  AND2_X1 U204 ( .A1(n165), .A2(n164), .ZN(n159) );
  AOI21_X1 U205 ( .B1(i_V[6]), .B2(n160), .A(n159), .ZN(n161) );
  NAND2_X1 U206 ( .A1(n162), .A2(n161), .ZN(n163) );
  OAI21_X1 U207 ( .B1(n165), .B2(n164), .A(n163), .ZN(n181) );
  INV_X1 U208 ( .A(i_gamma[1]), .ZN(n166) );
  NAND4_X1 U209 ( .A1(n181), .A2(n182), .A3(n166), .A4(n176), .ZN(n169) );
  INV_X1 U210 ( .A(i_gamma[0]), .ZN(n167) );
  NOR2_X1 U211 ( .A1(n169), .A2(n167), .ZN(n293) );
  NOR2_X1 U212 ( .A1(n167), .A2(i_gamma[1]), .ZN(n168) );
  AND2_X1 U213 ( .A1(n177), .A2(n168), .ZN(n286) );
  NOR2_X1 U214 ( .A1(n293), .A2(n286), .ZN(n301) );
  NOR2_X1 U215 ( .A1(n301), .A2(n184), .ZN(n189) );
  NOR2_X1 U216 ( .A1(n169), .A2(i_gamma[0]), .ZN(n295) );
  OR2_X1 U217 ( .A1(n295), .A2(n286), .ZN(n299) );
  NAND2_X1 U218 ( .A1(n170), .A2(n286), .ZN(n174) );
  NAND2_X1 U219 ( .A1(n171), .A2(n293), .ZN(n173) );
  NAND2_X1 U220 ( .A1(n295), .A2(i_V_reset[0]), .ZN(n172) );
  NAND3_X1 U221 ( .A1(n174), .A2(n173), .A3(n172), .ZN(n175) );
  XOR2_X1 U222 ( .A(n175), .B(n299), .Z(n188) );
  INV_X1 U223 ( .A(n181), .ZN(n179) );
  NOR2_X1 U224 ( .A1(n177), .A2(n176), .ZN(n180) );
  INV_X1 U225 ( .A(n180), .ZN(n178) );
  AOI22_X1 U226 ( .A1(n179), .A2(n182), .B1(i_gamma[1]), .B2(n178), .ZN(n313)
         );
  AND2_X1 U227 ( .A1(n181), .A2(n180), .ZN(n311) );
  AOI22_X1 U228 ( .A1(n311), .A2(N8), .B1(n309), .B2(i_V_reset[0]), .ZN(n183)
         );
  OAI21_X1 U229 ( .B1(n313), .B2(n184), .A(n183), .ZN(n185) );
  NOR2_X1 U230 ( .A1(n186), .A2(n185), .ZN(n187) );
  NOR2_X1 U231 ( .A1(n187), .A2(n316), .ZN(o_V[0]) );
  FA_X1 U232 ( .A(n189), .B(n299), .CI(n188), .CO(n212), .S(n186) );
  NOR2_X1 U233 ( .A1(n301), .A2(n134), .ZN(n211) );
  NAND2_X1 U234 ( .A1(n190), .A2(n286), .ZN(n195) );
  HA_X1 U235 ( .A(N8), .B(n191), .CO(n203), .S(n171) );
  NAND2_X1 U236 ( .A1(n192), .A2(n293), .ZN(n194) );
  NAND2_X1 U237 ( .A1(n295), .A2(i_V_reset[1]), .ZN(n193) );
  NAND3_X1 U238 ( .A1(n195), .A2(n194), .A3(n193), .ZN(n196) );
  XOR2_X1 U239 ( .A(n196), .B(n299), .Z(n210) );
  AOI22_X1 U240 ( .A1(n311), .A2(n197), .B1(n309), .B2(i_V_reset[1]), .ZN(n198) );
  OAI21_X1 U241 ( .B1(n313), .B2(n134), .A(n198), .ZN(n199) );
  NOR2_X1 U242 ( .A1(n200), .A2(n199), .ZN(n201) );
  NOR2_X1 U243 ( .A1(n201), .A2(n316), .ZN(o_V[1]) );
  NAND2_X1 U244 ( .A1(n202), .A2(n286), .ZN(n208) );
  FA_X1 U245 ( .A(i_beta[1]), .B(n204), .CI(n203), .CO(n219), .S(n192) );
  NAND2_X1 U246 ( .A1(n205), .A2(n293), .ZN(n207) );
  NAND2_X1 U247 ( .A1(n295), .A2(i_V_reset[2]), .ZN(n206) );
  NAND3_X1 U248 ( .A1(n208), .A2(n207), .A3(n206), .ZN(n209) );
  XOR2_X1 U249 ( .A(n209), .B(n299), .Z(n228) );
  NOR2_X1 U250 ( .A1(n301), .A2(n91), .ZN(n227) );
  FA_X1 U251 ( .A(n212), .B(n211), .CI(n210), .CO(n226), .S(n200) );
  AOI22_X1 U252 ( .A1(n311), .A2(n213), .B1(n309), .B2(i_V_reset[2]), .ZN(n214) );
  OAI21_X1 U253 ( .B1(n313), .B2(n91), .A(n214), .ZN(n215) );
  NOR2_X1 U254 ( .A1(n216), .A2(n215), .ZN(n217) );
  NOR2_X1 U255 ( .A1(n217), .A2(n316), .ZN(o_V[2]) );
  NAND2_X1 U256 ( .A1(n218), .A2(n286), .ZN(n224) );
  FA_X1 U257 ( .A(i_beta[2]), .B(n220), .CI(n219), .CO(n236), .S(n205) );
  NAND2_X1 U258 ( .A1(n221), .A2(n293), .ZN(n223) );
  NAND2_X1 U259 ( .A1(n295), .A2(i_V_reset[3]), .ZN(n222) );
  NAND3_X1 U260 ( .A1(n224), .A2(n223), .A3(n222), .ZN(n225) );
  XOR2_X1 U261 ( .A(n225), .B(n299), .Z(n245) );
  NOR2_X1 U262 ( .A1(n301), .A2(n144), .ZN(n244) );
  FA_X1 U263 ( .A(n228), .B(n227), .CI(n226), .CO(n243), .S(n216) );
  INV_X1 U264 ( .A(n229), .ZN(n230) );
  AOI22_X1 U265 ( .A1(n311), .A2(n230), .B1(n309), .B2(i_V_reset[3]), .ZN(n231) );
  OAI21_X1 U266 ( .B1(n313), .B2(n144), .A(n231), .ZN(n232) );
  NOR2_X1 U267 ( .A1(n233), .A2(n232), .ZN(n234) );
  NOR2_X1 U268 ( .A1(n234), .A2(n316), .ZN(o_V[3]) );
  NAND2_X1 U269 ( .A1(n235), .A2(n286), .ZN(n241) );
  FA_X1 U270 ( .A(i_beta[3]), .B(n237), .CI(n236), .CO(n252), .S(n221) );
  NAND2_X1 U271 ( .A1(n238), .A2(n293), .ZN(n240) );
  NAND2_X1 U272 ( .A1(n295), .A2(i_V_reset[4]), .ZN(n239) );
  NAND3_X1 U273 ( .A1(n241), .A2(n240), .A3(n239), .ZN(n242) );
  XOR2_X1 U274 ( .A(n242), .B(n299), .Z(n261) );
  NOR2_X1 U275 ( .A1(n301), .A2(n88), .ZN(n260) );
  FA_X1 U276 ( .A(n245), .B(n244), .CI(n243), .CO(n259), .S(n233) );
  AOI22_X1 U277 ( .A1(n311), .A2(n246), .B1(n309), .B2(i_V_reset[4]), .ZN(n247) );
  OAI21_X1 U278 ( .B1(n313), .B2(n88), .A(n247), .ZN(n248) );
  NOR2_X1 U279 ( .A1(n249), .A2(n248), .ZN(n250) );
  NOR2_X1 U280 ( .A1(n250), .A2(n316), .ZN(o_V[4]) );
  NAND2_X1 U281 ( .A1(n251), .A2(n286), .ZN(n257) );
  FA_X1 U282 ( .A(i_beta[4]), .B(n253), .CI(n252), .CO(n270), .S(n238) );
  NAND2_X1 U283 ( .A1(n254), .A2(n293), .ZN(n256) );
  NAND2_X1 U284 ( .A1(n295), .A2(i_V_reset[5]), .ZN(n255) );
  NAND3_X1 U285 ( .A1(n257), .A2(n256), .A3(n255), .ZN(n258) );
  XOR2_X1 U286 ( .A(n258), .B(n299), .Z(n279) );
  NOR2_X1 U287 ( .A1(n301), .A2(n265), .ZN(n278) );
  FA_X1 U288 ( .A(n261), .B(n260), .CI(n259), .CO(n277), .S(n249) );
  INV_X1 U289 ( .A(n262), .ZN(n263) );
  AOI22_X1 U290 ( .A1(n311), .A2(n263), .B1(n309), .B2(i_V_reset[5]), .ZN(n264) );
  OAI21_X1 U291 ( .B1(n313), .B2(n265), .A(n264), .ZN(n266) );
  NOR2_X1 U292 ( .A1(n267), .A2(n266), .ZN(n268) );
  NOR2_X1 U293 ( .A1(n268), .A2(n316), .ZN(o_V[5]) );
  NAND2_X1 U294 ( .A1(n269), .A2(n286), .ZN(n275) );
  FA_X1 U295 ( .A(i_beta[5]), .B(n271), .CI(n270), .CO(n288), .S(n254) );
  NAND2_X1 U296 ( .A1(n272), .A2(n293), .ZN(n274) );
  NAND2_X1 U297 ( .A1(n295), .A2(i_V_reset[6]), .ZN(n273) );
  NAND3_X1 U298 ( .A1(n275), .A2(n274), .A3(n273), .ZN(n276) );
  XOR2_X1 U299 ( .A(n276), .B(n299), .Z(n306) );
  NOR2_X1 U300 ( .A1(n301), .A2(n282), .ZN(n305) );
  FA_X1 U301 ( .A(n279), .B(n278), .CI(n277), .CO(n304), .S(n267) );
  AOI22_X1 U302 ( .A1(n311), .A2(n280), .B1(n309), .B2(i_V_reset[6]), .ZN(n281) );
  OAI21_X1 U303 ( .B1(n313), .B2(n282), .A(n281), .ZN(n283) );
  NOR2_X1 U304 ( .A1(n284), .A2(n283), .ZN(n285) );
  NOR2_X1 U305 ( .A1(n285), .A2(n316), .ZN(o_V[6]) );
  NAND2_X1 U306 ( .A1(n287), .A2(n286), .ZN(n298) );
  FA_X1 U307 ( .A(i_beta[6]), .B(n289), .CI(n288), .CO(n292), .S(n272) );
  XOR2_X1 U308 ( .A(i_beta[7]), .B(n290), .Z(n291) );
  XOR2_X1 U309 ( .A(n292), .B(n291), .Z(n294) );
  NAND2_X1 U310 ( .A1(n294), .A2(n293), .ZN(n297) );
  NAND2_X1 U311 ( .A1(n295), .A2(i_V_reset[7]), .ZN(n296) );
  NAND3_X1 U312 ( .A1(n298), .A2(n297), .A3(n296), .ZN(n300) );
  XOR2_X1 U313 ( .A(n300), .B(n299), .Z(n303) );
  NOR2_X1 U314 ( .A1(n301), .A2(n165), .ZN(n302) );
  XOR2_X1 U315 ( .A(n303), .B(n302), .Z(n308) );
  FA_X1 U316 ( .A(n306), .B(n305), .CI(n304), .CO(n307), .S(n284) );
  XOR2_X1 U317 ( .A(n308), .B(n307), .Z(n315) );
  AOI22_X1 U318 ( .A1(n311), .A2(n310), .B1(n309), .B2(i_V_reset[7]), .ZN(n312) );
  OAI21_X1 U319 ( .B1(n313), .B2(n165), .A(n312), .ZN(n314) );
  NOR2_X1 U320 ( .A1(n315), .A2(n314), .ZN(n317) );
  NOR2_X1 U321 ( .A1(n317), .A2(n316), .ZN(o_V[7]) );
endmodule

