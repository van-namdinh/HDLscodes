/*
 * Project name   :
 * File name      : xnorgate.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 15:03
 * Desc           :
 */

module top_module(
    input   a,b,
    output  out);
assign out = ~(a ^ b);
endmodule
