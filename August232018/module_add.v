/*
 * Project name   :
 * File name      : module_add.v
 * Created date   : Th08 23 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 23 2018 14:25
 * Desc           :
 */

module top_module (
   input    [31:0]  a,
   input    [31:0]  b, 
   output   [31:0]  sum
   );
   //main top module code here
   wire [15:0]      cout1,cout2,cin1,cin2;
   wire [15:0]      sum1out;
   wire [15:0]      sum2out;
//   add16 add1 (a[15:0],b[15:0], cin1, cout1, sum1out);
//   add16 add2 (a[31:16], b[31:16], cin2, cout2, sum2out);
   assign cin1 = 0;
   wire [15:0] a1in;
   wire [15:0] b1in;
   wire [15:0] a2in;
   wire [15:0] b2in;
   assign a1in = a[15:0];
   assign b1in = b[15:0];
   assign a2in = a[31:16];
   assign b2in = a[31:16];
   assign sum1out = a1in ^ b1in ^ cin1;
   assign cout1 = a1in*cin1+b1in*cin1+a1in*b1in;
   assign cin2 = cout1;
   assign sum2out = a2in ^ b2in ^ cin2;
   assign cout2 = a2in*cin2+b2in*cin2+a2in*b2in; 
   assign sum = {sum2out,sum1out};
   endmodule

   //add16 module
/*   
module add16 (
    input [15:0]    a,
    input [15:0]    b,
    input           cin,
    output          cout,
    output [15:0]   sum
);
    assign sum = a ^ b ^ cin;
    assign cout = a*cin+b*cin+a*b;
    endmodule
    */
