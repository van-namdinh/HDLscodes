/*
 * Project name   :
 * File name      : dff8p_vndv1.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 15:46
 * Desc           :
 */

module top_module(
    input               clk,
    input               reset,
    input [7:0]         d,
    output reg [7:0]    q
);

always @(negedge clk)
begin
    if(reset)
        q <= 8'b00110100;
    else
        q <= d;
end
endmodule
