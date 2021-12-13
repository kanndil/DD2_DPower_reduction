`include "primitives.v"
`include "sky130_fd_sc_hd.v"
`timescale 1ns/1ns


module test1(input [3:0] x, y, input s, input clk, output [3:0] r);
	reg [3:0] r;
	always @(posedge clk)
		if(s) r <= x + y;
endmodule
