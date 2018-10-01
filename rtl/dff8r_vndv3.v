/*
 * Project name   :
 * File name      : dff8r_vndv3.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 15:41
 * Desc           :
 */

module top_module(
    input [7:0]         d,
    input               clk,
    input               reset,
    output reg [7:0]    q
);

always @(posedge clk)
begin
    if(reset)
        q <= 8'b00000000;
    else
        q <= d;
end
endmodule

