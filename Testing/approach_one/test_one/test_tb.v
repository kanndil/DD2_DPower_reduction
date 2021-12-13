
`define FUNCTIONAL
`define UNIT_DELAY #1
`include "src/primitives.v"
`include "src/sky130_fd_sc_hd.v"
`timescale 1ns/1ns

module test_tb;

	reg [3:0]  x;
	reg[3:0] y;
	reg  s;
	reg  clk;
	wire [3:0]  r;
	
 initial begin 
	clk = 0;
    forever  #(5) clk = ~clk;
         
 end



test1 uut( .x(x), .y(y), .s(s) ,  .clk(clk), .r(r));




initial begin
 		x = 4'b0000;
		y = 4'b0000;
		s = 1'b0;
		#100;
 		x = 4'b0100;
		y = 4'b0100;
		s = 1'b1;
		#100
 		x = 4'b0001;
		y = 4'b0010;
		s = 1'b1;
		
		#100 
 		x = 4'b0100;
		y = 4'b0100;
		s = 4'b1;
		
		#100 
 		x = 4'b0100;
		y = 4'b0001;
		s = 1'b1;


    end 
endmodule