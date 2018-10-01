/*
 * Project name   :
 * File name      : dff8ar_vndv1.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 15:58
 * Desc           :
 */

module top_module(
    input               clk,
    input               areset,     //active high asynchronous reset
    input   [7:0]       d,
    output reg [7:0]    q
);

always @(posedge clk or posedge areset)
begin
    if(areset)
        q <= 8'b00000000;
    else
        q <= d;
end
endmodule
