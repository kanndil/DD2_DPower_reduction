module test
(
  input x,
  input s,
  input clk,
  output reg r
);
  always @(posedge clk)
  if(s) r <= x ;


endmodule
