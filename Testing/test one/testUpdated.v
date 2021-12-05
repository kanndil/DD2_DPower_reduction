

module test1
(
  input x,
  input s,
  input clk,
  output reg r
);

  wire new_clk;
  reg new_enable;
  assign new_clk = (new_enable & clk);

  always @(clk or s) begin
    if(~clk) new_enable <= s; 
    else new_enable <= new_enable;
  end


  always @(posedge new_clk) r <= x;


endmodule

