`timescale 1ns/1ns



module test4(input [7:0] x, y, input clk, s1,  output reg [7:0] r);
    
    always @(posedge clk)
    begin
        begin
            if(s1)
                r<=x*y;
        end


    end


  
            
endmodule