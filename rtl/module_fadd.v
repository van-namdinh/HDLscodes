/*
 * Project name   :
 * File name      : module_fadd.v
 * Created date   : Th08 27 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 27 2018 15:54
 * Desc           :
 */

module add1 (input a, input b, input cin, output sum, output cout);
    assign  sum  = a ^ b ^ cin;
    assign  cout = a&b|a&cin|b&cin;
    endmodule

module top_module(
    input   [31:0]  a, b,
    output  [31:0]  sum
);
//main top module 
    wire                wo1,wo2,wo3,wo4,wo5,wo6,wo7,wo8,wo9,wo10,wo11,wo12,wo13,wo14,wo15,coutadd1;
    wire                wo16,wo22,wo33,wo44,wo55,wo66,wo77,wo88,wo99,wo100,wo111,wo122,wo133,wo144,wo155,coutadd2;
    wire    [15:0]      cin, cout, sumadd161, sumadd162;
    wire                cout1, cout2;

    add1 ins1 (a[0], b[0], 1'b0, sumadd161[0], wo1);
    add1 ins2 (a[1], b[1], wo1, sumadd161[1], wo2); 
    add1 ins3 (a[2], b[2], wo2, sumadd161[2], wo3); 
    add1 ins4 (a[3], b[3], wo3, sumadd161[3], wo4); 
    add1 ins5 (a[4], b[4], wo4, sumadd161[4], wo5); 
    add1 ins6 (a[5], b[5], wo5, sumadd161[5], wo6); 
    add1 ins7 (a[6], b[6], wo6, sumadd161[6], wo7); 
    add1 ins8 (a[7], b[7], wo7, sumadd161[7], wo8); 
    add1 ins9 (a[8], b[8], wo8, sumadd161[8], wo9); 
    add1 ins10 (a[9], b[9], wo9, sumadd161[9], wo10); 
    add1 ins11 (a[10], b[10], wo10, sumadd161[10], wo11); 
    add1 ins12 (a[11], b[11], wo11, sumadd161[11], wo12); 
    add1 ins13 (a[12], b[12], wo12, sumadd161[12], wo13); 
    add1 ins14 (a[13], b[13], wo13, sumadd161[13], wo14); 
    add1 ins15 (a[14], b[14], wo14, sumadd161[14], wo15); 
    add1 ins16 (a[15], b[15], wo15, sumadd161[15], coutadd1); 
    
//    add16 add2 (a[31:16], b[31:16],coutadd1,sumadd162,cout);
    add1 ins17 (a[16], b[16], coutadd1, sumadd162[0], wo16);
    add1 ins18 (a[17], b[17], wo16, sumadd162[1], wo22); 
    add1 ins19 (a[18], b[18], wo22, sumadd162[2], wo33); 
    add1 ins20 (a[19], b[19], wo33, sumadd162[3], wo44); 
    add1 ins21 (a[20], b[20], wo44, sumadd162[4], wo55); 
    add1 ins22 (a[21], b[21], wo55, sumadd162[5], wo66); 
    add1 ins23 (a[22], b[22], wo66, sumadd162[6], wo77); 
    add1 ins24 (a[23], b[23], wo77, sumadd162[7], wo88); 
    add1 ins25 (a[24], b[24], wo88, sumadd162[8], wo99); 
    add1 ins26 (a[25], b[25], wo99, sumadd162[9], wo100); 
    add1 ins27 (a[26], b[26], wo100, sumadd162[10], wo111); 
    add1 ins28 (a[27], b[27], wo111, sumadd162[11], wo122); 
    add1 ins29 (a[28], b[28], wo122, sumadd162[12], wo133); 
    add1 ins30 (a[29], b[29], wo133, sumadd162[13], wo144); 
    add1 ins31 (a[30], b[30], wo144, sumadd162[14], wo155); 
    add1 ins32 (a[31], b[31], wo155, sumadd162[15], coutadd2); 
    
    add16 insmod1(a[15:0],b[15:0],1'b0, sumadd161,cout1);
    add16 insmod2(a[31:16],b[31:16], cout1,sumadd162,cout2);
    assign sum = {sumadd162, sumadd161};
endmodule

