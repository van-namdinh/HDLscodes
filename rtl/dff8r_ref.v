// Design
// D flip-flop
module top_module (clk, reset,
  d, q, qb);
  input      clk;
  input      reset;
  input [7:0]      d;
  output reg [7:0]    q;
  //output     qb;

  //reg        q;

  //assign qb = ~q;

  always @(posedge clk)
  begin
    if (reset) begin
      // Asynchronous reset when reset goes high
      q <= 8'b00000000;
    end else begin
      // Assign D to Q on positive clock edge
      q <= d;
    end
  end
endmodule