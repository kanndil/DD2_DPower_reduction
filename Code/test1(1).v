module test1(input [3:0] x, y, input s, input clk, output [3:0] r);
	reg [3:0] r;
	always @(posedge clk)
		if(s) r <= x + y;
endmodule
