/*
 * Project name   :
 * File name      : DW01_add_oper.v
 * Created date   : Th09 19 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 19 2018 18:59
 * Desc           :
 */

module DW01_add_oper(in1,in2,sum);
    parameter wordlength =8;

    input   [wordlength-1:0]    in1, in2;
    output  [wordlength-1:0]    sum;

    assign sum = in1 + in2;
endmodule    
