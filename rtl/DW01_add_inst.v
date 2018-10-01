/*
 * Project name   :
 * File name      : DW01_add_inst.v
 * Created date   : Th09 19 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 19 2018 18:54
 * Desc           :
 */

module DW01_add_inst( inst_A, inst_B, inst_CI, SUM_inst, C0_inst);
    parameter   width = 8;

    input   [width-1:0]     inst_A;
    input   [width-1:0]     inst_B;
    input   inst_CI;
    output  [width-1:0]     SUM_inst;
    output  C0_inst;

    //Instance of DW01_add
    DW01_add #(width)
        U1 (.A(inst_A), .B(inst_B), .CI(inst_CI), .SUM(SUM_inst), .C0(C0_inst));
endmodule
