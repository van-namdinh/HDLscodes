/*
 * Project name   :
 * File name      : vector2.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 16:53
 * Desc           :
 */
`default_nettype none
module top_module(
    input   wire [31:0]  in,
    output  wire [31:0]  out
);
/*
    wire [7:0] byte1;
    wire [7:0] byte2;
    wire [7:0] byte3;
    wire [7:0] byte4;
  */  
//    assign byte1 = in[31:24];
    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8]  = in[23:16];
    assign out[7:0]   = in[31:24];
    endmodule

