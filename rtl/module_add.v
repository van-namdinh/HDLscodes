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
   add16 add1 (a[15:0],b[15:0], 1'b0, sum1out, cout1);
   add16 add2 (a[31:16], b[31:16], cout1, sum2out, cout2);
   assign sum = {sum2out,sum1out};
   endmodule
