/*
 * Project name   :
 * File name      : gates100.v
 * Created date   : Th08 18 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 18 2018 13:53
 * Desc           :
 */

module top_module(
    input   [99:0] in,
    output  [99:0] out_and,
    output  [99:0] out_or,
    output  [99:0] out_xor
);
    assign out_and = &(in);
    assign out_or = |(in);
    assign out_xor = ^(in);
    endmodule
