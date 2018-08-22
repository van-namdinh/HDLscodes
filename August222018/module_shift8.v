/*
 * Project name   :
 * File name      : module_shift8.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 17:08
 * Desc           :
 */

module top_module(
    input   clk,
    input   [7:0] d,
    input   [1:0] sel,
    output  reg [7:0] q
);

    wire [7:0] w12, w23, w3o;
//    wire [7:0] w23;
//    wire [7:0] w3o;
    my_dff8 ins1(.clk(clk), .d(d), .q(w12));
    my_dff8 ins2(.clk(clk), .d(w12), .q(w23));
    my_dff8 ins3(.clk(clk), .d(w23), .q(w3o));
    always @(d or w12 or w23 or w3o or sel) 
    begin
        case (sel)
            2'b00 :  q <= d;
            2'b01 :  q <= w12;
            2'b10 :  q <= w23;
            2'b11 :  q <= w3o;
        endcase
    end
    endmodule
