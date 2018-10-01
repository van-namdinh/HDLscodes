/*
 * Project name   :
 * File name      : dff8r_vndv1.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 11:27
 * Desc           :
 */

module top_module(
    input clk,
    input reset,        //synchronous reset
    input   [7:0] d,
    output reg  [7:0] q
);
    always @(posedge reset or posedge clk)
    begin
        if(reset)
        begin
            if (clk)
                q =0;
        end
        else 
            q = d;
    end
endmodule 
