/*
 * Project name   :
 * File name      : module_pos.v
 * Created date   : Th08 22 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 22 2018 16:07
 * Desc           :
 */

module top_module(
    input   a,b,c,d,
    output  out1, out2
);
//    mod_a inst(a,b,c,d,out1,out2);
    mod_a inst(out1, out2, a,b,c,d);
    endmodule
    
