/*
 * Project name   :
 * File name      : vector0.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 16:17
 * Desc           :
 */

module top_module(
    input   wire [2:0] vec,
    output  wire [2:0] outv,
    output  o2,o1,o0
    );
    assign outv = vec;
    assign o2   = vec[2];
    assign o1   = vec[1];
    assign o0   = vec[0];
    endmodule

