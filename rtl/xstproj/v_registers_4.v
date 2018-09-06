/*
 * Project name   :
 * File name      : v_registers_4.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 15:04
 * Desc           :
 */

//
// Flip-Flop with Positive-Edge Clock and Clock Enable
// 

module v_registers_4 (C,D,CE,Q);
    input   C, D, CE;
    output  Q;
    reg     Q;

    always @(posedge C)
    begin
        if(CE)
            Q<=D;
    end
    endmodule
