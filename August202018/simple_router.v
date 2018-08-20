/*
 * Project name   :
 * File name      : simple_router.v
 * Created date   : Th08 20 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 20 2018 14:59
 * Desc           :
 */

// simple four-input four output router with dropping flow control
module simple_router(clk, i0,i1,i2,i3,o0,o1,o2,o3);
    input   clk;              // chip clock
    input   [17:0]      i0,i1,i2,i3;    // input phits
    output  [17:0]      o0,o1,o2,o3;    // output phits

    reg [17:0]  r0, r1, r2, r3;         //outputs of input registers
    reg [17:0]  o0, o1, o2, o3;         // output registers
    wire    [17:0] s0, s1, s2, s3;      // output of shifters
    wire    [17:0] m0, m1, m2, m3;      // output of multiplexers
    wire    [3:0]   sel0, sel1, sel2, sel3;     //multiplexer control
    wire    shift0, shift1, shift2, shift3;     // shifter control

    // the four allocators 
    alloc a0(clk, 2'b00, r0[17:14], r1[17:14], r2[17:14], r3[17:14], sel0, shift0); 
    alloc a1(clk, 2'b01, r0[17:14], r1[17:14], r2[17:14], r3[17:14], sel1, shift1); 
    alloc a2(clk, 2'b10, r0[17:14], r1[17:14], r2[17:14], r3[17:14], sel2, shift2); 
    alloc a3(clk, 2'b11, r0[17:14], r1[17:14], r2[17:14], r3[17:14], sel3, shift3); 

    // multiplexers
    mux4_18 mx0(sel0, r0, r1, r2, r3, m0);
    mux4_18 mx1(sel1, r0, r1, r2, r3, m1);
    mux4_18 mx2(sel2, r0, r1, r2, r3, m2);
    mux4_18 mx3(sel3, r0, r1, r2, r3, m3);

    //shifters
    shiftp sh0(shift0, m0, s0);
    shiftp sh1(shift1, m1, s1);
    shiftp sh2(shift2, m2, s2);
    shiftp sh3(shift3, m3, s3);

    // flip flops
    always @(posedge clk)
    begin
        r0 = i0; r1 = i1; r2 = i2; r3 = i3;
        o0 = s0; o1 = s1; o2 = s2; o3 = s3;
    end
    endmodule
