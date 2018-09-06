/*
 * Project name   :
 * File name      : ff_pos_clk.v
 * Created date   : Th09 06 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th09 06 2018 14:53
 * Desc           :
 */
//
// Flip-Flop with Positive-Edge Clock
//
module v_register_1 (C, D, Q);
    input   C, D;
    output  Q;
    reg     Q;

    always @ (posedge C)
    begin
        Q <= D;
    end
    endmodule
