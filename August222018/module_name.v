/*
 * Project name   :
 * File name      : module_name.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 16:34
 * Desc           :
 */

module top_module(
    input   a,b,c,d,
    output  out1, out2
);
    mod_a inst(.in1(a), .in2(b), .in3(c), .in4(d), .out1(out1), .out2(out2));
    endmodule
