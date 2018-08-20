// allocator: assigns output port to input port based on type
// of input phit and current field of routing header
// once assigned, holds a port for the duration of a packet
// (as long as payload phits are on input).
// uses fixed priority arbitration (r0 is highest).
module alloc(clk, thisPort, r0, r1, r2, r3, select, shift);
	input clk;                  // chip clock
	input [1:0] thisPort;       // identifies this output port
	input [3:0] r0,r1,r2,r3;    // top four bits of each input phit
	output [3:0] select;        // radial select to multiplexer
	output shift;               // directs shifter to discard upper two bits
	wire [3:0] grant, select, head, payload, match, request, hold;
	wire [2:0] pass;
	reg [3:0] last;
	wire avail;

	assign head = {r3[3:2]==3,r2[3:2]==3,r1[3:2]==3,r0[3:2]==3};
	assign payload = {r3[3:2]==2,r2[3:2]==2,r1[3:2]==2,r0[3:2]==2};
	assign match = {r3[1:0]==thisPort,r2[1:0]==thisPort,r1[1:0]==thisPort,r0[1:0]==thisPort};
	assign request = head&match;
	assign pass ={pass[1:0],avail}& ~request[2:0];
	assign grant = request&{pass,avail};
	assign hold = last&payload;
	assign select = grant|hold;
	assign avail = ~(|hold);
	assign shift = |grant;
	
always @(posedge clk) last = select;
 
endmodule
