/*
 * Project name   :
 * File name      : dff_basic.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 09:17
 * Desc           :
 */

// Verilog code for D flip flop
// Verilog code for rising edge D flip flop
module RisingEdge_DFlipFlop(
    input   D,      // Data input
    input   clk,    // Clock input
    output reg Q
    );      // output Q
//    input D, clk;
//    output Q;
//    reg     Q;
    always @(posedge clk)
        begin
            Q <= D;
        end
endmodule
