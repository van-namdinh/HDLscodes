// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for N-bit Adder 
// Testbench Verilog code for N-bit Adder 
module tb_N_bit_adder;
 // Inputs
 reg [31:0] input1;
 reg [31:0] input2;
 // Outputs
 wire [31:0] answer;

 // Instantiate the Unit Under Test (UUT)
 N_bit_adder uut (
  .input1(input1), 
  .input2(input2), 
  .answer(answer)
 );

 initial begin
  // Initialize Inputs
  input1 = 1209;
  input2 = 4565;
  #100;
  // Add stimulus here

  input1 = 12;
  input2 = 45;
  #100;
  input1 = 129;
  input2 = 455;
  #100;
  input1 = 209;
  input2 = 5465;
  #100;
 end
      
endmodule
