/*
 * Project name   :
 * File name      : 7468.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 15:50
 * Desc           :
 */

module top_module(
    input   p1a,p2a,p2b,p2c,p2d,p1c,p1b,p1f,p1e,p1d,
    output  p1y,p2y);

    wire p2abwire, p2cdwire,p1abcwire,p1defwire;
    assign p2abwire = p2a & p2b;
    assign p2cdwire = p2c & p2d;
    assign p2y = p2abwire | p2cdwire;
    assign p1abcwire = p1a & p1b & p1c;
    assign p1defwire = p1d & p1e & p1f;
    assign p1y = p1abcwire | p1defwire;
    endmodule    
