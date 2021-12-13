// file: test_two_tb.v
// author: @adhammeligy
// Testbench for test2

`define FUNCTIONAL
`define UNIT_DELAY #1
`include "src/primitives.v"
`include "src/sky130_fd_sc_hd.v"
`timescale 1ns/1ns

module test_two_tb;
	// Declarations
	reg  clk;
	reg  d1;
	reg  d2;
	reg  ld1;
	reg  ld2;
	wire  q1;
	wire  q2;

	// Instantiation of Unit Under Test
	test2 uut (
		.clk(clk),
		.d1(d1),
		.d2(d2),
		.ld1(ld1),
		.ld2(ld2),
		.q1(q1),
		.q2(q2)
	);
	
	
initial begin 
	clk = 0;
    forever  #(5) clk = ~clk;
         
 end




	initial begin
		// Input Initialization
		d1  = 1'b0;
		d2  = 1'b0;
		ld1 = 1'b1;
		ld2 = 1'b1;

		#100;


		d1  = 1'b1;
		d2  = 1'b1;
		ld1 = 1'b1;
		ld2 = 1'b0;

		#100;

		d1  = 1'b1;
		d2  = 1'b1;
		ld1 = 1'b0;
		ld2 = 1'b1;

		#100;
		
		d1  = 1'b0;
		d2  = 1'b0;
		ld1 = 1'b1;
		ld2 = 1'b1;

		#100;



		#100;
	end

endmodule