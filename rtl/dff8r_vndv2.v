/*
 * Project name   :
 * File name      : dff8r_vndv2.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 15:08
 * Desc           :
 */

module top_module(
    input   clk,
    input   reset,
    input [7:0]     d,
    output  reg [7:0]   q
);
    always @(posedge clk)
    begin
        if(reset)
                q <= 8'b00000000;
        else
            q <= d;
    end
endmodule
