/*
 * Project name   :
 * File name      : addtest.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 18:18
 * Desc           :
 */

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cin, cout;
    assign cin = 0;
    assign cout = 0;
    wire [15:0] sum1;
    assign sum1 = a[15:0] + b[15:0]+cin;
    wire [15:0] sum2;
    assign sum2 = a[31:16] + b[31:16]+cin;
    wire out;
    add16 ins1 (a[15:0], b[15:0], cin,cout, sum1);
    add16 ins2 (a[31:16], b[31:16], cin, cout, sum2);
    assign sum = {sum1,sum2};
    endmodule
/*
module add16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
*/
