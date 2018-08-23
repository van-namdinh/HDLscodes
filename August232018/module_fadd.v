/*
 * Project name   :
 * File name      : module_fadd.v
 * Created date   : Th08 23 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 23 2018 13:59
 * Desc           :
 */

module top_module (
    input [31:0]    a,
    input [31:0]    b,
    output  [31:0]  sum
);

endmodule 

module add1 (input a, input b, input cin, output sum, output cout);
// Full adder here
assign sum = cin ^ a ^ b;
assign cout = a*cin+b*cin+a*b;
endmodule 

