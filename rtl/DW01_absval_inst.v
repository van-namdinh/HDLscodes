/*
 * Project name   :
 * File name      : DW01_absval_inst.v
 * Created date   : Th09 19 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 19 2018 19:08
 * Desc           :
 */

module DW01_absval_inst(inst_A, ABSVAL_inst);
    parameter width = 8;

    input   [width-1:0] inst_A;
    output  [width-1:0] ABSVAL_inst;

    //Instance of DW01_absval
    DW01_absval #(width)
        U1 ( .A(inst_A), .ABSVAL(ABSVAL_inst));
endmodule
