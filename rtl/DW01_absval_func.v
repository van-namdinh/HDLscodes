/*
 * Project name   :
 * File name      : DW01_absval_func.v
 * Created date   : Th09 19 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 19 2018 19:11
 * Desc           :
 */

module DW01_absval_func (func_A, ABSVAL_func);
    parameter func_A_width = 8;

    //Passes the width to the absolute value function
    parameter width = func_A_width;

    //Please add search_path = search_path + {synopsys_root + "/dw/sim_ver"}
    //to your .synopsys_dc.setup file (for synthesis) and add
    // +incdir+$SYNOPSYS/dw/sim_ver+ to your verilog simulator command line
    // (for simulation).
    `include "DW01_absval_function.inc"

    input   [func_A_width-1: 0] func_A;
    output  [func_A_width-1: 0] ABSVAL_func;
    assign ABSVAL_func = DW01_absval(func_A);
endmodule
