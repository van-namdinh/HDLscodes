/*
 * Project name   :
 * File name      : gates4.v
 * Created date   : Th08 18 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 18 2018 13:44
 * Desc           :
 */

module top_module(
    input   [3:0] in,
    output  [3:0] out_and,
    output  [3:0] out_or,
    output  [3:0] out_xor
);
    assign out_and  = &(in);
    assign out_or   = |(in);
    assign out_xor  = ^(in);
    endmodule

