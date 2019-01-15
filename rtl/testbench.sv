/*
 * Project name   :
 * File name      : testbench.sv
 * Created date   : Th11 20 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th11 20 2018 14:32
 * Desc           :
 */

module testbench;
    timeunit 1 ns;
    timeprecision 10ps;
    bit d = 1, clk = 0;
    wire q;
    initial 
        for (int cycles = 0; cycles < 100; cycles++)
            #100 clk = !clk;
        design dut (q,d,clk)
        endmodule
