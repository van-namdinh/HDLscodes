/*
 * Project name   :
 * File name      : module_faddv2.v
 * Created date   : Th08 28 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 28 2018 16:06
 * Desc           :
 */
//`define wordsize 32
module add1 (
    input a,b,cin,
    output sum, cout
);
    assign  sum = a^b^cin;
    assign  cout = a&b|a&cin|b&cin;
    endmodule

    module top_module(
        input [31:0]    a, b,
        output  [31:0]  sum
    );
    wire [31:0]     cout;
    assign  cout[0] = 1'b0;
    add1    inst0(.a(a[0]), .b(b[0]), .cin(cout[0]), .sum(sum[0]), .cout(cout[0]));
    add1    inst1[15:1](.a(a[15:1]),.b(b[15:1]),.cin(cout[15:1]), .sum(sum[15:1]), .cout(cout[15:1]));
    add16   inst16 (.a(a[31:16]),.b(b[31:16]),.sum(sum[31:16]),.cout(cout));
    assign  sum = {sum[31:16],sum[15:0]};
    endmodule
