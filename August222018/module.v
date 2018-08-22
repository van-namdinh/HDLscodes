/*
 * Project name   :
 * File name      : module.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 15:05
 * Desc           :
 */

module top_module(
    input   a, b,
    output  out
);

//    mod_a(input in1, input in2, output out);
    mod_a inst1( .in1(a), .in2(b), .out(out));
    endmodule


