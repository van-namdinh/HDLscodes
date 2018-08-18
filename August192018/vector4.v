/*
 * Project name   :
 * File name      : vector4.v
 * Created date   : Th08 18 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 18 2018 15:18
 * Desc           :
 */

module top_module(
    input   [7:0] in,
    output  [31:0] out
);

    assign out = {{24{in[7]}}, in};
    endmodule
