/*
 * Project name   :
 * File name      : notgate.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 14:28
 * Desc           :
 */

module top_module(
    input in,
    output out);
assign out = ~in;
endmodule
