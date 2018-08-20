/*
 * Project name   :
 * File name      : vector5v2.v
 * Created date   : Th08 20 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 20 2018 18:34
 * Desc           :
 */

module top_module(input a, input b, output out);
    mod_a inst(.in1(a),.in2(b),.out(out));
//    mod_a inst(a,b,out);
    endmodule

