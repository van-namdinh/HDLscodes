/*
 * Project name   :
 * File name      : dff_tb.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 09:38
 * Desc           :
 */

module tb_DFF();
    reg     D;
    reg     clk;
    reg     reset;
    wire    Q;

    RisingEdge_DFlipFlop_SyncReset dut(D,clk,reset,Q);
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        reset = 1;
        D <= 0;
        #100;
        reset = 0;
        D <= 1;
        #100;
        D <= 0;
        #100;
        D <= 1;
        #100;
        D <= 0;
        #100;
        D <= 1;
        #100;
        reset = 1;
        D <= 0;
        #100;
        reset = 0;
        D <= 1;
        #100;
        D <= 0;
        #100;
        D <= 1;
        #100;
        D <= 0;
        #100;
        D <= 1;
    end
    endmodule
