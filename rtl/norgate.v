/*
 * Project name   :
 * File name      : norgate.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 14:51
 * Desc           :
 */

module top_module(
    input   a,
    input   b,
    output  out);
    
    assign out = ~(a | b);
endmodule
