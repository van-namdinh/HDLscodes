/*
 * Project name   :
 * File name      : dff_asynch.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 09:34
 * Desc           :
 */

// verilog code for DFF
// Verilog code for Rising ege DFF with Asynchronous Reset high
module RisingEdge_DFF_Asyn(
    input   D,      // Data input
    input   clk,    // Clock input
    input   async_reset,     // asynchronous reset high level
    output  reg     Q);     // output Q
    always  @(posedge clk or posedge async_reset)
    begin
        if(async_reset==1'b1)
            Q <= 1'b0;
        else
            Q <= D;
    end
    endmodule
