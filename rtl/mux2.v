/*
 * Project name   :
 * File name      : mux2.v
 * Created date   : Th08 27 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 27 2018 16:19
 * Desc           :
 */

module mux2 (input sel, a, b, output f);
    input sel, a, b;
    output  f;
    inv g1 (sel, selb);
    aoi g2 (selb, a, sel, b, fb);
    inv g3 (.a(fb), .f(f));
    endmodule
