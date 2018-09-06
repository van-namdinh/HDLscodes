/*
 * Project name   :
 * File name      : v_registers_3.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 15:02
 * Desc           :
 */

// Flip-Flop with Positive-Edge Clock and Synchronous Set
//
module v_registers_3 (C, D, S, Q);
    input   C, D, S;
    output  Q;
    reg     Q;

    always  @(posedge C)
    begin
        if(S)
            Q <= 1'b1;
        else
            Q <= D;
    end
    endmodule
