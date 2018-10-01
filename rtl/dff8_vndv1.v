/*
 * Project name   :
 * File name      : dff8_vndv1.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 11:21
 * Desc           :
 */

module top_module(
    input   clk,
    input   [7:0]   d,
    output reg [7:0] q
);
    always @(posedge clk)
    begin
    q = d;
    end
endmodule
