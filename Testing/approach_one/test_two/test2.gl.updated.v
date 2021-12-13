

module test2
(
  d1,
  d2,
  clk,
  ld1,
  ld2,
  q1,
  q2
);

  wire _0_;
  wire _1_;
  input clk;
  input d1;
  input d2;
  input ld1;
  input ld2;
  output q1;
  output q2;
  wire _clockgate_output_gclk_0;

  sky130_fd_sc_hd__dlclkp_1
  _clockgate_cell_0_
  (
    .GCLK(_clockgate_output_gclk_0),
    .GATE(ld1),
    .CLK(clk)
  );


  sky130_fd_sc_hd__dfxtp_1
  _4_
  (
    .CLK(_clockgate_output_gclk_0),
    .D(d1),
    .Q(q1)
  );

  wire _clockgate_output_gclk_1;

  sky130_fd_sc_hd__dlclkp_1
  _clockgate_cell_1_
  (
    .GCLK(_clockgate_output_gclk_1),
    .GATE(ld2),
    .CLK(clk)
  );


  sky130_fd_sc_hd__dfxtp_1
  _5_
  (
    .CLK(_clockgate_output_gclk_1),
    .D(d2),
    .Q(q2)
  );


endmodule

