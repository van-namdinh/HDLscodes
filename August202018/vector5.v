/*
 * Project name   :
 * File name      : vector5.v
 * Created date   : Th08 20 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 20 2018 17:25
 * Desc           :
 */

//`default_nettype none

module top_module(input wire a, input wire b, output wire out);
mod_a instance1(a,b,out);
//mod_a instance2(.out(out), .in1(a), .in2(b));
endmodule
