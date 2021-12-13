// file: test_three_tb.v
// author: @adhammeligy
// Testbench for test3

`define FUNCTIONAL
`define UNIT_DELAY #1
`include "src/primitives.v"
`include "src/sky130_fd_sc_hd.v"
`timescale 1ns/1ns

module test_three_tb;
	// Declarations
	reg [3:0]  y;
	reg [3:0]  x;
	reg  s2;
	reg  s1;
	reg  clk;
	wire [3:0]  r;
	wire r2;

 initial begin 
	clk = 0;
    forever  #(5) clk = ~clk;
         
 end




	// Instantiation of Unit Under Test
	test3 uut (
		.y(y),
		.x(x),
		.s2(s2),
		.s1(s1),
		.clk(clk),
		.r(r),
		.r2(r2)
	);

	initial begin
		// Input Initialization
 		x = 4'b0000;
		y = 4'b0000;
		s1 = 1'b1;
		s2= 1'b1;
		
		#100;
 		x = 4'b0100;
		y = 4'b0010;
		s1 = 1'b1;
		s2= 1'b1;
		#100
 		x = 4'b0011;
		y = 4'b0010;
		s1 = 1'b1;
		s2= 1'b1;
		
		#100 
 		x = 4'b0100;
		y = 4'b0100;
		s1 = 1'b0;
		s2= 1'b0;
		
		#100 
 		x = 4'b0100;
		y = 4'b0001;
		s1 = 1'b1;
		s2= 1'b1;

		// Reset
		#100;
	end

endmodule