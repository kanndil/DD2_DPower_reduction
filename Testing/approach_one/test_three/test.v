// file: test_two.v
// author: @adhammeligy

`timescale 1ns/1ns




module test3  (input [3:0] x, y, input s1,s2, input clk, output [3:0] r, output r2);
	reg [3:0] r;
	reg r2;
	always @(posedge clk)
		if(s1) r <= x + y;
		
		
	always @(posedge clk)
		if(s2) r2 <= x[0];
		
endmodule


