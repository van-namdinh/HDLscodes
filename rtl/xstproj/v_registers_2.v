/*
 * Project name   :
 * File name      : v_register_2.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 14:58
 * Desc           :
 */

//
// Flip-Flop with Negative-Edge clock and Asynchronous Reset
//
module v_registers_2 (C, D, CLR, Q);
    input   C, D, CLR;
    output  Q;
    reg     Q;

    always @ (negedge C or posedge CLR)
    begin
        if(CLR)
            Q <= 1'b0;
        else
            Q <= D;
    end 
    endmodule
