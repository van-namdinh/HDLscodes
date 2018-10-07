/*
 * Project name   :
 * File name      : couter4bit_tb.v
 * Created date   : Th10 03 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 03 2018 16:37
 * Desc           :
 */
//can compile but it has not working with module couter4bit.v yet
module tb_counter;
reg     clk;
reg     reset;
wire    [3:0]   out;

couter c0(.clk(clk)
            , .reset(reset)
            , .out(out)
            );

always  #5  clk = ~clk;

initial begin
    clk <= 0;
    reset <= 0;

    #20     reset <= 1;
    #80     reset <= 0;
    #50     reset <= 1;

    #20     $finish;
end
endmodule
