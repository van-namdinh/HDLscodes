/*
 * Project name   :
 * File name      : vector3.v
 * Created date   : Th08 18 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 18 2018 14:20
 * Desc           :
 */

/*examples
{3'b111, 3'b000} => 6'b111000
{1'b1, 1'b0, 3'b101} => 5b10101
{4'ha,4'd10} => 8'b10101010 //4'ha and 4'd10 are both 4'b1010 in binary

input [15:0] in;
output [23:0] out;
assign {out[7:0], out[15:8]} = in ;     //Swap two bytes. Right side and left side are both 16-bit vectors.
assign out[15:0] = {in[7:0], in[15:8]; //This is the same thing
assign out = {in[7:0], in[15:8]}; // This is different. The 16-bit vector on the right is extended to are zero 
*/
module top_module(
    input   [4:0] a,
    input   [4:0] b,
    input   [4:0] c,
    input   [4:0] d,
    input   [4:0] e,
    input   [4:0] f,

    output  [7:0] w,
    output  [7:0] x,
    output  [7:0] y,
    output  [7:0] z
);
    assign w[7:0] = {a[4:0], b[4:2]};
    assign x[7:0] = {b[1:0], c[4:0],d[4]};
    assign y[7:0] = {d[3:0], e[4:1]};
    assign z[7:0] = {e[0], f[4:0],2'b11};
    endmodule

