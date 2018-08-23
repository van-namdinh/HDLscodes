/*
 * Project name   :
 * File name      : wiredecl.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 15:16
 * Desc           :
 */

module top_module(
    input   in,
    output  out);
    
    wire not_in;
    assign out = ~(not_in);
    assign not_in = ~(in);
endmodule  
