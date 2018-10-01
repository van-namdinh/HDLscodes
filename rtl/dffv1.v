/*
 * Project name   :
 * File name      : dffv1.v
 * Created date   : Th10 01 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 01 2018 11:04
 * Desc           :
 */

module top_module(
    input   clk,    //clocks are used in sequential circuits
    input   d,
    output  reg     q);

    // Use a clocked always block
    // copy d to q at every positive edge of clk
    // clocked always blocks should use non-blocking assignments
        always @(posedge clk)
        begin
            q <= d;
        end
    endmodule    
