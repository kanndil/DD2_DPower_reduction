module test2(input d1, d2, input clk, ld1, ld2, output reg q1, q2);
    always @(posedge clk)
    begin
        begin
            if(ld1)
                q1<=d1;
        end


    end
        always @(posedge clk)
    begin

        begin
            if(ld2)
                q2<=d2;
        end

    end
            
endmodule
