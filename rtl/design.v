/*
 * Project name   :
 * File name      : design.v
 * Created date   : Th11 20 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th11 20 2018 14:30
 * Desc           :
 */

`timescale 1 ns / 100 ps

module design (
    output bit q, 
    input bit d, 
    input clk);

//    timeunit 1ns;
//    timeprecision 10ps;
    always @ (posedge clk)
        q = d;
    endmodule
