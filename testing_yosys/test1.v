

module test1
(
  input [3:0] x,
  input [3:0] y,
  input s,
  input clk,
  output [3:0] r
);

  wire new_clk;
  reg new_enable;
  reg [3:0] r;
  assign new_clk = (new_enable & clk);

  always @(clk) begin
    new_enable <= s;
  end


  always @(posedge new_clk) r <= x + y;


endmodule

