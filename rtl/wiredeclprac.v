/*
 * Project name   :
 * File name      : wiredeclprac.v
 * Created date   : Th08 17 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 17 2018 15:22
 * Desc           :
 */

module top_module(
    input   a,b,c,d,
    output  out, out_n
);

wire wireand1,wireand2,wireor;
assign  wireand1 = a & b;
assign  wireand2 = c & d;
assign  wireor      = wireand1 | wireand2;
assign  out         = wireor;
assign  out_n       = ~wireor;
endmodule
