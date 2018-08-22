/*
 * Project name   :
 * File name      : module_shift.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 16:41
 * Desc           :
 */

module top_module(
    input   clk,
    input   d,
    output  q
);
    //instance my_dff two inputs and out output (D-FlipFlop)
    wire w12, w23;
    my_dff ins1(.clk(clk), .d(d), .q(w12));
    my_dff ins2(.clk(clk), .d(w12), .q(w23));
    my_dff ins3(.clk(clk), .d(w23), .q(q));
    endmodule
