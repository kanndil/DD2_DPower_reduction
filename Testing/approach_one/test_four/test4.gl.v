/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module test4(x, y, clk, s1, r);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  input clk;
  output [7:0] r;
  input s1;
  input [7:0] x;
  input [7:0] y;
  sky130_fd_sc_hd__clkinv_1 _121_ (
    .A(r[0]),
    .Y(_060_)
  );
  sky130_fd_sc_hd__clkinv_1 _122_ (
    .A(s1),
    .Y(_061_)
  );
  sky130_fd_sc_hd__nand3_1 _123_ (
    .A(s1),
    .B(y[0]),
    .C(x[0]),
    .Y(_062_)
  );
  sky130_fd_sc_hd__o21ai_0 _124_ (
    .A1(_060_),
    .A2(s1),
    .B1(_062_),
    .Y(_000_)
  );
  sky130_fd_sc_hd__and2_0 _125_ (
    .A(y[0]),
    .B(x[1]),
    .X(_063_)
  );
  sky130_fd_sc_hd__a21oi_1 _126_ (
    .A1(y[1]),
    .A2(x[0]),
    .B1(_063_),
    .Y(_064_)
  );
  sky130_fd_sc_hd__nand4_1 _127_ (
    .A(y[0]),
    .B(x[1]),
    .C(y[1]),
    .D(x[0]),
    .Y(_065_)
  );
  sky130_fd_sc_hd__nand2_1 _128_ (
    .A(s1),
    .B(_065_),
    .Y(_066_)
  );
  sky130_fd_sc_hd__o2bb2ai_1 _129_ (
    .A1_N(_061_),
    .A2_N(r[1]),
    .B1(_064_),
    .B2(_066_),
    .Y(_001_)
  );
  sky130_fd_sc_hd__nand2_1 _130_ (
    .A(y[1]),
    .B(x[2]),
    .Y(_067_)
  );
  sky130_fd_sc_hd__and4_1 _131_ (
    .A(y[0]),
    .B(x[1]),
    .C(y[1]),
    .D(x[2]),
    .X(_068_)
  );
  sky130_fd_sc_hd__a22oi_1 _132_ (
    .A1(x[1]),
    .A2(y[1]),
    .B1(x[2]),
    .B2(y[0]),
    .Y(_069_)
  );
  sky130_fd_sc_hd__or3_1 _133_ (
    .A(_065_),
    .B(_068_),
    .C(_069_),
    .X(_070_)
  );
  sky130_fd_sc_hd__o21ai_0 _134_ (
    .A1(_068_),
    .A2(_069_),
    .B1(_065_),
    .Y(_071_)
  );
  sky130_fd_sc_hd__nand4_1 _135_ (
    .A(x[0]),
    .B(y[2]),
    .C(_070_),
    .D(_071_),
    .Y(_072_)
  );
  sky130_fd_sc_hd__a22oi_1 _136_ (
    .A1(x[0]),
    .A2(y[2]),
    .B1(_070_),
    .B2(_071_),
    .Y(_073_)
  );
  sky130_fd_sc_hd__nor2_1 _137_ (
    .A(_061_),
    .B(_073_),
    .Y(_074_)
  );
  sky130_fd_sc_hd__a22o_1 _138_ (
    .A1(_061_),
    .A2(r[2]),
    .B1(_072_),
    .B2(_074_),
    .X(_002_)
  );
  sky130_fd_sc_hd__nand2_1 _139_ (
    .A(_070_),
    .B(_072_),
    .Y(_075_)
  );
  sky130_fd_sc_hd__nand2_1 _140_ (
    .A(x[1]),
    .B(y[2]),
    .Y(_076_)
  );
  sky130_fd_sc_hd__and2_0 _141_ (
    .A(y[3]),
    .B(x[3]),
    .X(_077_)
  );
  sky130_fd_sc_hd__and4_1 _142_ (
    .A(y[0]),
    .B(x[0]),
    .C(y[3]),
    .D(x[3]),
    .X(_078_)
  );
  sky130_fd_sc_hd__nand4_1 _143_ (
    .A(y[0]),
    .B(x[0]),
    .C(y[3]),
    .D(x[3]),
    .Y(_079_)
  );
  sky130_fd_sc_hd__a22oi_1 _144_ (
    .A1(x[0]),
    .A2(y[3]),
    .B1(x[3]),
    .B2(y[0]),
    .Y(_080_)
  );
  sky130_fd_sc_hd__o22a_1 _145_ (
    .A1(_063_),
    .A2(_067_),
    .B1(_078_),
    .B2(_080_),
    .X(_081_)
  );
  sky130_fd_sc_hd__nor4_1 _146_ (
    .A(_063_),
    .B(_067_),
    .C(_078_),
    .D(_080_),
    .Y(_082_)
  );
  sky130_fd_sc_hd__nor3_1 _147_ (
    .A(_076_),
    .B(_081_),
    .C(_082_),
    .Y(_083_)
  );
  sky130_fd_sc_hd__o21ai_0 _148_ (
    .A1(_081_),
    .A2(_082_),
    .B1(_076_),
    .Y(_084_)
  );
  sky130_fd_sc_hd__nand2b_1 _149_ (
    .A_N(_083_),
    .B(_084_),
    .Y(_085_)
  );
  sky130_fd_sc_hd__a21oi_1 _150_ (
    .A1(_070_),
    .A2(_072_),
    .B1(_085_),
    .Y(_086_)
  );
  sky130_fd_sc_hd__xor2_1 _151_ (
    .A(_075_),
    .B(_085_),
    .X(_087_)
  );
  sky130_fd_sc_hd__nor2_1 _152_ (
    .A(s1),
    .B(r[3]),
    .Y(_088_)
  );
  sky130_fd_sc_hd__a21oi_1 _153_ (
    .A1(s1),
    .A2(_087_),
    .B1(_088_),
    .Y(_003_)
  );
  sky130_fd_sc_hd__o21ai_0 _154_ (
    .A1(_078_),
    .A2(_080_),
    .B1(_068_),
    .Y(_089_)
  );
  sky130_fd_sc_hd__o31ai_1 _155_ (
    .A1(_076_),
    .A2(_081_),
    .A3(_082_),
    .B1(_089_),
    .Y(_090_)
  );
  sky130_fd_sc_hd__and2_0 _156_ (
    .A(x[2]),
    .B(y[4]),
    .X(_091_)
  );
  sky130_fd_sc_hd__and4_1 _157_ (
    .A(x[0]),
    .B(x[2]),
    .C(y[2]),
    .D(y[4]),
    .X(_092_)
  );
  sky130_fd_sc_hd__a22oi_1 _158_ (
    .A1(x[2]),
    .A2(y[2]),
    .B1(y[4]),
    .B2(x[0]),
    .Y(_093_)
  );
  sky130_fd_sc_hd__nor2_1 _159_ (
    .A(_092_),
    .B(_093_),
    .Y(_094_)
  );
  sky130_fd_sc_hd__nand2_1 _160_ (
    .A(y[1]),
    .B(x[3]),
    .Y(_095_)
  );
  sky130_fd_sc_hd__nand2_1 _161_ (
    .A(y[0]),
    .B(x[4]),
    .Y(_096_)
  );
  sky130_fd_sc_hd__nand2_1 _162_ (
    .A(x[1]),
    .B(y[3]),
    .Y(_097_)
  );
  sky130_fd_sc_hd__nand2_1 _163_ (
    .A(y[3]),
    .B(x[4]),
    .Y(_098_)
  );
  sky130_fd_sc_hd__xnor3_1 _164_ (
    .A(_095_),
    .B(_096_),
    .C(_097_),
    .X(_099_)
  );
  sky130_fd_sc_hd__a21oi_1 _165_ (
    .A1(_067_),
    .A2(_079_),
    .B1(_080_),
    .Y(_100_)
  );
  sky130_fd_sc_hd__xor3_1 _166_ (
    .A(_094_),
    .B(_099_),
    .C(_100_),
    .X(_101_)
  );
  sky130_fd_sc_hd__nand2_1 _167_ (
    .A(_090_),
    .B(_101_),
    .Y(_102_)
  );
  sky130_fd_sc_hd__xor2_1 _168_ (
    .A(_090_),
    .B(_101_),
    .X(_103_)
  );
  sky130_fd_sc_hd__nand3b_1 _169_ (
    .A_N(_085_),
    .B(_103_),
    .C(_075_),
    .Y(_104_)
  );
  sky130_fd_sc_hd__nor2_1 _170_ (
    .A(_086_),
    .B(_103_),
    .Y(_105_)
  );
  sky130_fd_sc_hd__nor2_1 _171_ (
    .A(_061_),
    .B(_105_),
    .Y(_106_)
  );
  sky130_fd_sc_hd__a22o_1 _172_ (
    .A1(_061_),
    .A2(r[4]),
    .B1(_104_),
    .B2(_106_),
    .X(_004_)
  );
  sky130_fd_sc_hd__maj3_1 _173_ (
    .A(_094_),
    .B(_099_),
    .C(_100_),
    .X(_107_)
  );
  sky130_fd_sc_hd__nand2_1 _174_ (
    .A(x[0]),
    .B(y[5]),
    .Y(_108_)
  );
  sky130_fd_sc_hd__nand2_1 _175_ (
    .A(x[1]),
    .B(y[4]),
    .Y(_109_)
  );
  sky130_fd_sc_hd__nand2_1 _176_ (
    .A(y[2]),
    .B(x[3]),
    .Y(_110_)
  );
  sky130_fd_sc_hd__nand2_1 _177_ (
    .A(x[3]),
    .B(y[4]),
    .Y(_111_)
  );
  sky130_fd_sc_hd__xor3_1 _178_ (
    .A(_108_),
    .B(_109_),
    .C(_110_),
    .X(_112_)
  );
  sky130_fd_sc_hd__maj3_1 _179_ (
    .A(_095_),
    .B(_096_),
    .C(_097_),
    .X(_113_)
  );
  sky130_fd_sc_hd__and2_0 _180_ (
    .A(y[1]),
    .B(x[4]),
    .X(_114_)
  );
  sky130_fd_sc_hd__and2_0 _181_ (
    .A(y[0]),
    .B(x[5]),
    .X(_115_)
  );
  sky130_fd_sc_hd__and2_0 _182_ (
    .A(x[2]),
    .B(y[3]),
    .X(_116_)
  );
  sky130_fd_sc_hd__xnor3_1 _183_ (
    .A(_114_),
    .B(_115_),
    .C(_116_),
    .X(_117_)
  );
  sky130_fd_sc_hd__xnor3_1 _184_ (
    .A(_112_),
    .B(_113_),
    .C(_117_),
    .X(_118_)
  );
  sky130_fd_sc_hd__xnor2_1 _185_ (
    .A(_107_),
    .B(_118_),
    .Y(_119_)
  );
  sky130_fd_sc_hd__xnor2_1 _186_ (
    .A(_092_),
    .B(_119_),
    .Y(_120_)
  );
  sky130_fd_sc_hd__nand3_1 _187_ (
    .A(_090_),
    .B(_101_),
    .C(_120_),
    .Y(_008_)
  );
  sky130_fd_sc_hd__xnor3_1 _188_ (
    .A(_092_),
    .B(_102_),
    .C(_119_),
    .X(_009_)
  );
  sky130_fd_sc_hd__lpflow_inputiso1p_1 _189_ (
    .A(_104_),
    .SLEEP(_009_),
    .X(_010_)
  );
  sky130_fd_sc_hd__nand2_1 _190_ (
    .A(_104_),
    .B(_009_),
    .Y(_011_)
  );
  sky130_fd_sc_hd__nand2_1 _191_ (
    .A(_010_),
    .B(_011_),
    .Y(_012_)
  );
  sky130_fd_sc_hd__nor2_1 _192_ (
    .A(s1),
    .B(r[5]),
    .Y(_013_)
  );
  sky130_fd_sc_hd__a21oi_1 _193_ (
    .A1(s1),
    .A2(_012_),
    .B1(_013_),
    .Y(_005_)
  );
  sky130_fd_sc_hd__maj3_1 _194_ (
    .A(_092_),
    .B(_107_),
    .C(_118_),
    .X(_014_)
  );
  sky130_fd_sc_hd__nand2_1 _195_ (
    .A(x[0]),
    .B(y[6]),
    .Y(_015_)
  );
  sky130_fd_sc_hd__maj3_1 _196_ (
    .A(_108_),
    .B(_109_),
    .C(_110_),
    .X(_016_)
  );
  sky130_fd_sc_hd__nor2_1 _197_ (
    .A(_015_),
    .B(_016_),
    .Y(_017_)
  );
  sky130_fd_sc_hd__xnor2_1 _198_ (
    .A(_015_),
    .B(_016_),
    .Y(_018_)
  );
  sky130_fd_sc_hd__maj3_1 _199_ (
    .A(_112_),
    .B(_113_),
    .C(_117_),
    .X(_019_)
  );
  sky130_fd_sc_hd__and2_0 _200_ (
    .A(x[1]),
    .B(y[5]),
    .X(_020_)
  );
  sky130_fd_sc_hd__and2_0 _201_ (
    .A(y[2]),
    .B(x[4]),
    .X(_021_)
  );
  sky130_fd_sc_hd__xor3_1 _202_ (
    .A(_091_),
    .B(_020_),
    .C(_021_),
    .X(_022_)
  );
  sky130_fd_sc_hd__maj3_1 _203_ (
    .A(_114_),
    .B(_115_),
    .C(_116_),
    .X(_023_)
  );
  sky130_fd_sc_hd__and2_0 _204_ (
    .A(y[1]),
    .B(x[5]),
    .X(_024_)
  );
  sky130_fd_sc_hd__and2_0 _205_ (
    .A(y[0]),
    .B(x[6]),
    .X(_025_)
  );
  sky130_fd_sc_hd__xor3_1 _206_ (
    .A(_077_),
    .B(_024_),
    .C(_025_),
    .X(_026_)
  );
  sky130_fd_sc_hd__xor3_1 _207_ (
    .A(_022_),
    .B(_023_),
    .C(_026_),
    .X(_027_)
  );
  sky130_fd_sc_hd__clkinv_1 _208_ (
    .A(_027_),
    .Y(_028_)
  );
  sky130_fd_sc_hd__xor3_1 _209_ (
    .A(_018_),
    .B(_019_),
    .C(_027_),
    .X(_029_)
  );
  sky130_fd_sc_hd__nand2_1 _210_ (
    .A(_014_),
    .B(_029_),
    .Y(_030_)
  );
  sky130_fd_sc_hd__xnor2_1 _211_ (
    .A(_014_),
    .B(_029_),
    .Y(_031_)
  );
  sky130_fd_sc_hd__xnor2_1 _212_ (
    .A(_008_),
    .B(_031_),
    .Y(_032_)
  );
  sky130_fd_sc_hd__xnor2_1 _213_ (
    .A(_010_),
    .B(_032_),
    .Y(_033_)
  );
  sky130_fd_sc_hd__nor2_1 _214_ (
    .A(s1),
    .B(r[6]),
    .Y(_034_)
  );
  sky130_fd_sc_hd__a21oi_1 _215_ (
    .A1(s1),
    .A2(_033_),
    .B1(_034_),
    .Y(_006_)
  );
  sky130_fd_sc_hd__maj3_1 _216_ (
    .A(_008_),
    .B(_010_),
    .C(_031_),
    .X(_035_)
  );
  sky130_fd_sc_hd__maj3_1 _217_ (
    .A(_018_),
    .B(_019_),
    .C(_028_),
    .X(_036_)
  );
  sky130_fd_sc_hd__maj3_1 _218_ (
    .A(_077_),
    .B(_024_),
    .C(_025_),
    .X(_037_)
  );
  sky130_fd_sc_hd__nand2_1 _219_ (
    .A(y[1]),
    .B(x[6]),
    .Y(_038_)
  );
  sky130_fd_sc_hd__nand2_1 _220_ (
    .A(y[0]),
    .B(x[7]),
    .Y(_039_)
  );
  sky130_fd_sc_hd__xnor2_1 _221_ (
    .A(_098_),
    .B(_039_),
    .Y(_040_)
  );
  sky130_fd_sc_hd__xnor2_1 _222_ (
    .A(_038_),
    .B(_040_),
    .Y(_041_)
  );
  sky130_fd_sc_hd__xnor2_1 _223_ (
    .A(_037_),
    .B(_041_),
    .Y(_042_)
  );
  sky130_fd_sc_hd__maj3_1 _224_ (
    .A(_022_),
    .B(_023_),
    .C(_026_),
    .X(_043_)
  );
  sky130_fd_sc_hd__nand2_1 _225_ (
    .A(x[2]),
    .B(y[5]),
    .Y(_044_)
  );
  sky130_fd_sc_hd__nand2_1 _226_ (
    .A(x[0]),
    .B(y[7]),
    .Y(_045_)
  );
  sky130_fd_sc_hd__nand2_1 _227_ (
    .A(x[1]),
    .B(y[6]),
    .Y(_046_)
  );
  sky130_fd_sc_hd__xnor2_1 _228_ (
    .A(_045_),
    .B(_046_),
    .Y(_047_)
  );
  sky130_fd_sc_hd__nand2_1 _229_ (
    .A(y[2]),
    .B(x[5]),
    .Y(_048_)
  );
  sky130_fd_sc_hd__xnor2_1 _230_ (
    .A(_111_),
    .B(_048_),
    .Y(_049_)
  );
  sky130_fd_sc_hd__xnor2_1 _231_ (
    .A(_047_),
    .B(_049_),
    .Y(_050_)
  );
  sky130_fd_sc_hd__xnor2_1 _232_ (
    .A(_044_),
    .B(_050_),
    .Y(_051_)
  );
  sky130_fd_sc_hd__maj3_1 _233_ (
    .A(_091_),
    .B(_020_),
    .C(_021_),
    .X(_052_)
  );
  sky130_fd_sc_hd__xnor2_1 _234_ (
    .A(_042_),
    .B(_051_),
    .Y(_053_)
  );
  sky130_fd_sc_hd__xnor2_1 _235_ (
    .A(_043_),
    .B(_052_),
    .Y(_054_)
  );
  sky130_fd_sc_hd__xnor2_1 _236_ (
    .A(_053_),
    .B(_054_),
    .Y(_055_)
  );
  sky130_fd_sc_hd__xor2_1 _237_ (
    .A(_017_),
    .B(_030_),
    .X(_056_)
  );
  sky130_fd_sc_hd__xnor3_1 _238_ (
    .A(_036_),
    .B(_055_),
    .C(_056_),
    .X(_057_)
  );
  sky130_fd_sc_hd__xnor2_1 _239_ (
    .A(_035_),
    .B(_057_),
    .Y(_058_)
  );
  sky130_fd_sc_hd__nor2_1 _240_ (
    .A(s1),
    .B(r[7]),
    .Y(_059_)
  );
  sky130_fd_sc_hd__a21oi_1 _241_ (
    .A1(s1),
    .A2(_058_),
    .B1(_059_),
    .Y(_007_)
  );
  sky130_fd_sc_hd__dfxtp_1 _242_ (
    .CLK(clk),
    .D(_003_),
    .Q(r[3])
  );
  sky130_fd_sc_hd__dfxtp_1 _243_ (
    .CLK(clk),
    .D(_004_),
    .Q(r[4])
  );
  sky130_fd_sc_hd__dfxtp_1 _244_ (
    .CLK(clk),
    .D(_005_),
    .Q(r[5])
  );
  sky130_fd_sc_hd__dfxtp_1 _245_ (
    .CLK(clk),
    .D(_006_),
    .Q(r[6])
  );
  sky130_fd_sc_hd__dfxtp_1 _246_ (
    .CLK(clk),
    .D(_007_),
    .Q(r[7])
  );
  sky130_fd_sc_hd__dfxtp_1 _247_ (
    .CLK(clk),
    .D(_000_),
    .Q(r[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _248_ (
    .CLK(clk),
    .D(_001_),
    .Q(r[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _249_ (
    .CLK(clk),
    .D(_002_),
    .Q(r[2])
  );
endmodule
