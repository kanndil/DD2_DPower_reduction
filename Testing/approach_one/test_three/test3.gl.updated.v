// file: test_two.v
// author: @adhammeligy

`timescale 1ns/1ns



module test3
(
  x,
  y,
  s1,
  s2,
  clk,
  r,
  r2
);

  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  input clk;
  output [3:0] r;
  output r2;
  input s1;
  input s2;
  input [3:0] x;
  input [3:0] y;

  sky130_fd_sc_hd__nand2_1
  _20_
  (
    .A(y[0]),
    .B(x[0]),
    .Y(_05_)
  );


  sky130_fd_sc_hd__xnor2_1
  _21_
  (
    .A(y[0]),
    .B(x[0]),
    .Y(_06_)
  );


  sky130_fd_sc_hd__nor2_1
  _22_
  (
    .A(r[0]),
    .B(s1),
    .Y(_07_)
  );


  sky130_fd_sc_hd__nand2_1
  _24_
  (
    .A(y[1]),
    .B(x[1]),
    .Y(_08_)
  );


  sky130_fd_sc_hd__xnor2_1
  _25_
  (
    .A(y[1]),
    .B(x[1]),
    .Y(_09_)
  );


  sky130_fd_sc_hd__xnor2_1
  _26_
  (
    .A(_05_),
    .B(_09_),
    .Y(_10_)
  );


  sky130_fd_sc_hd__nor2_1
  _27_
  (
    .A(s1),
    .B(r[1]),
    .Y(_11_)
  );


  sky130_fd_sc_hd__o21ai_0
  _29_
  (
    .A1(_05_),
    .A2(_09_),
    .B1(_08_),
    .Y(_12_)
  );


  sky130_fd_sc_hd__xor2_1
  _30_
  (
    .A(y[2]),
    .B(x[2]),
    .X(_13_)
  );


  sky130_fd_sc_hd__xnor2_1
  _31_
  (
    .A(_12_),
    .B(_13_),
    .Y(_14_)
  );


  sky130_fd_sc_hd__nor2_1
  _32_
  (
    .A(s1),
    .B(r[2]),
    .Y(_15_)
  );


  sky130_fd_sc_hd__nor2_1
  _34_
  (
    .A(s1),
    .B(r[3]),
    .Y(_16_)
  );


  sky130_fd_sc_hd__maj3_1
  _35_
  (
    .A(y[2]),
    .B(x[2]),
    .C(_12_),
    .X(_17_)
  );


  sky130_fd_sc_hd__xor2_1
  _36_
  (
    .A(y[3]),
    .B(x[3]),
    .X(_18_)
  );


  sky130_fd_sc_hd__xnor2_1
  _37_
  (
    .A(_17_),
    .B(_18_),
    .Y(_19_)
  );

  wire _clockgate_output_gclk_0;

  sky130_fd_sc_hd__dlclkp_1
  _clockgate_cell_0_
  (
    .GCLK(_clockgate_output_gclk_0),
    .GATE(s2),
    .CLK(clk)
  );


  sky130_fd_sc_hd__dfxtp_1
  _40_
  (
    .CLK(_clockgate_output_gclk_0),
    .D(x[0]),
    .Q(r2)
  );

  wire _clockgate_output_gclk_1;

  sky130_fd_sc_hd__dlclkp_1
  _clockgate_cell_1_
  (
    .GCLK(_clockgate_output_gclk_1),
    .GATE(s1),
    .CLK(clk)
  );

  wire _inv_D_0;

  sky130_fd_sc_hd__inv_1
  _inv_D_0_
  (
    .Y(_inv_D_0),
    .A(_06_)
  );


  sky130_fd_sc_hd__dfxtp_1
  _41_
  (
    .CLK(_clockgate_output_gclk_1),
    .D(_inv_D_0),
    .Q(r[0])
  );

  wire _inv_D_1;

  sky130_fd_sc_hd__inv_1
  _inv_D_1_
  (
    .Y(_inv_D_1),
    .A(_10_)
  );


  sky130_fd_sc_hd__dfxtp_1
  _42_
  (
    .CLK(_clockgate_output_gclk_1),
    .D(_inv_D_1),
    .Q(r[1])
  );

  wire _inv_D_2;

  sky130_fd_sc_hd__inv_1
  _inv_D_2_
  (
    .Y(_inv_D_2),
    .A(_14_)
  );


  sky130_fd_sc_hd__dfxtp_1
  _43_
  (
    .CLK(_clockgate_output_gclk_1),
    .D(_inv_D_2),
    .Q(r[2])
  );

  wire _inv_D_3;

  sky130_fd_sc_hd__inv_1
  _inv_D_3_
  (
    .Y(_inv_D_3),
    .A(_19_)
  );


  sky130_fd_sc_hd__dfxtp_1
  _44_
  (
    .CLK(_clockgate_output_gclk_1),
    .D(_inv_D_3),
    .Q(r[3])
  );


endmodule
