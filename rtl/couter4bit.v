/*
 * Project name   :
 * File name      : couter4bit.v
 * Created date   : Th10 03 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th10 03 2018 16:34
 * Desc           :
 */
//STATUS: can compile but not working with tb_counter module
module couter4bit (
    input   clk,
    input   reset,
    output  reg [3:0]   out
);
always @(posedge clk)
begin
    if(!reset)
        out <= 0;
    else
        out <= out +1;
end
endmodule
