/*
 * Project name   :
 * File name      : v_registers_5.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 15:07
 * Desc           :
 */

//
// 4-bit Register with Positive-Edge Clock, Assynchronous Set and Clock Enable
//

module v_registers_5 (C, D, CE, PRE, Q);
    input   C, CE, PRE;
    input   [3:0]   D;
    output  [3:0]   Q;
    reg     [3:0]   Q;

    always @(posedge C or posedge PRE)
    begin
        if (PRE)
            Q <= 4'b1111;
        else
            if(CE)
                Q<=D;
        end
        endmodule
