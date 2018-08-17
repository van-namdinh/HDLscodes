/*
 * Project name   :
 * File name      : vector1.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 16:43
 * Desc           :
 */

`default_nettype none
module top_module(
    input   wire [15:0] in,
    output  wire [7:0]  out_hi,
    output  wire [7:0]  out_lo
);

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
    endmodule

