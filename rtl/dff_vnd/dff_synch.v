/*
 * Project name   :
 * File name      : dff_synch.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 09:29
 * Desc           :
 */

// Verilog code for D Flip Flop
// Verilog code for Rising edge DFF with synchronous Reset input
module RisingEdge_DFlipFlop_SyncReset(
    input   reg  D,      // Data input
    input   clk,    // clock input
    input   sync_reset,  // Synchronouse reset
    output  reg     Q);  // output Q
//    assign  D = clk;        // I examine when d = clk; can ignore it when we run with normal mode
    always @(posedge clk)
    begin
        if(sync_reset==1'b1)
            Q <= 1'b0;
        else
            Q <= D;
    end
    endmodule
