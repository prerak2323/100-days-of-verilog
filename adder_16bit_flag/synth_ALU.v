/* Generated by Yosys 0.45+106 (git sha1 982fade0d, g++ 11.4.0-1ubuntu1~22.04 -fPIC -O3) */

module ALU(x, y, sum, sign, zero, carry, parity, overflow);
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
  output carry;
  wire carry;
  output overflow;
  wire overflow;
  output parity;
  wire parity;
  output sign;
  wire sign;
  output [15:0] sum;
  wire [15:0] sum;
  input [15:0] x;
  wire [15:0] x;
  input [15:0] y;
  wire [15:0] y;
  output zero;
  wire zero;
  AND2_X1 _080_ (
    .A1(x[15]),
    .A2(y[15]),
    .ZN(_033_)
  );
  NOR2_X1 _081_ (
    .A1(x[15]),
    .A2(y[15]),
    .ZN(_034_)
  );
  NAND2_X1 _082_ (
    .A1(x[14]),
    .A2(y[14]),
    .ZN(_035_)
  );
  NOR2_X1 _083_ (
    .A1(x[14]),
    .A2(y[14]),
    .ZN(_036_)
  );
  XOR2_X1 _084_ (
    .A(x[14]),
    .B(y[14]),
    .Z(_037_)
  );
  AND2_X1 _085_ (
    .A1(x[13]),
    .A2(y[13]),
    .ZN(_038_)
  );
  OR2_X1 _086_ (
    .A1(x[13]),
    .A2(y[13]),
    .ZN(_039_)
  );
  NAND2_X1 _087_ (
    .A1(x[12]),
    .A2(y[12]),
    .ZN(_040_)
  );
  NOR2_X1 _088_ (
    .A1(x[12]),
    .A2(y[12]),
    .ZN(_041_)
  );
  XOR2_X1 _089_ (
    .A(x[12]),
    .B(y[12]),
    .Z(_042_)
  );
  AND2_X1 _090_ (
    .A1(x[11]),
    .A2(y[11]),
    .ZN(_043_)
  );
  OR2_X1 _091_ (
    .A1(x[11]),
    .A2(y[11]),
    .ZN(_044_)
  );
  NAND2_X1 _092_ (
    .A1(x[10]),
    .A2(y[10]),
    .ZN(_045_)
  );
  NOR2_X1 _093_ (
    .A1(x[10]),
    .A2(y[10]),
    .ZN(_046_)
  );
  XOR2_X1 _094_ (
    .A(x[10]),
    .B(y[10]),
    .Z(_047_)
  );
  AND2_X1 _095_ (
    .A1(x[9]),
    .A2(y[9]),
    .ZN(_048_)
  );
  NAND2_X1 _096_ (
    .A1(x[8]),
    .A2(y[8]),
    .ZN(_049_)
  );
  NOR2_X1 _097_ (
    .A1(x[8]),
    .A2(y[8]),
    .ZN(_050_)
  );
  XOR2_X1 _098_ (
    .A(x[8]),
    .B(y[8]),
    .Z(_051_)
  );
  AND2_X1 _099_ (
    .A1(x[7]),
    .A2(y[7]),
    .ZN(_052_)
  );
  OR2_X1 _100_ (
    .A1(x[7]),
    .A2(y[7]),
    .ZN(_053_)
  );
  NAND2_X1 _101_ (
    .A1(x[6]),
    .A2(y[6]),
    .ZN(_054_)
  );
  XNOR2_X1 _102_ (
    .A(x[6]),
    .B(y[6]),
    .ZN(_055_)
  );
  NAND2_X1 _103_ (
    .A1(x[5]),
    .A2(y[5]),
    .ZN(_056_)
  );
  INV_X1 _104_ (
    .A(_056_),
    .ZN(_057_)
  );
  NAND2_X1 _105_ (
    .A1(x[4]),
    .A2(y[4]),
    .ZN(_058_)
  );
  AND2_X1 _106_ (
    .A1(x[3]),
    .A2(y[3]),
    .ZN(_059_)
  );
  NAND2_X1 _107_ (
    .A1(x[2]),
    .A2(y[2]),
    .ZN(_060_)
  );
  AND2_X1 _108_ (
    .A1(x[1]),
    .A2(y[1]),
    .ZN(_061_)
  );
  AND2_X1 _109_ (
    .A1(x[0]),
    .A2(y[0]),
    .ZN(_062_)
  );
  XOR2_X1 _110_ (
    .A(x[1]),
    .B(y[1]),
    .Z(_063_)
  );
  AOI21_X1 _111_ (
    .A(_061_),
    .B1(_062_),
    .B2(_063_),
    .ZN(_064_)
  );
  NOR2_X1 _112_ (
    .A1(x[2]),
    .A2(y[2]),
    .ZN(_065_)
  );
  XOR2_X1 _113_ (
    .A(x[2]),
    .B(y[2]),
    .Z(_066_)
  );
  OAI21_X1 _114_ (
    .A(_060_),
    .B1(_064_),
    .B2(_065_),
    .ZN(_067_)
  );
  XOR2_X1 _115_ (
    .A(x[3]),
    .B(y[3]),
    .Z(_068_)
  );
  AOI21_X1 _116_ (
    .A(_059_),
    .B1(_067_),
    .B2(_068_),
    .ZN(_069_)
  );
  NOR2_X1 _117_ (
    .A1(x[4]),
    .A2(y[4]),
    .ZN(_070_)
  );
  XOR2_X1 _118_ (
    .A(x[4]),
    .B(y[4]),
    .Z(_071_)
  );
  OAI21_X1 _119_ (
    .A(_058_),
    .B1(_069_),
    .B2(_070_),
    .ZN(_072_)
  );
  XOR2_X1 _120_ (
    .A(x[5]),
    .B(y[5]),
    .Z(_073_)
  );
  AOI21_X1 _121_ (
    .A(_057_),
    .B1(_072_),
    .B2(_073_),
    .ZN(_074_)
  );
  OAI21_X1 _122_ (
    .A(_054_),
    .B1(_055_),
    .B2(_074_),
    .ZN(_075_)
  );
  OAI21_X1 _123_ (
    .A(_053_),
    .B1(_075_),
    .B2(_052_),
    .ZN(_076_)
  );
  OAI21_X1 _124_ (
    .A(_049_),
    .B1(_050_),
    .B2(_076_),
    .ZN(_077_)
  );
  OR2_X1 _125_ (
    .A1(x[9]),
    .A2(y[9]),
    .ZN(_078_)
  );
  XNOR2_X1 _126_ (
    .A(x[9]),
    .B(y[9]),
    .ZN(_079_)
  );
  AOI21_X1 _127_ (
    .A(_048_),
    .B1(_077_),
    .B2(_078_),
    .ZN(_000_)
  );
  OAI21_X1 _128_ (
    .A(_045_),
    .B1(_046_),
    .B2(_000_),
    .ZN(_001_)
  );
  OAI21_X1 _129_ (
    .A(_044_),
    .B1(_001_),
    .B2(_043_),
    .ZN(_002_)
  );
  OAI21_X1 _130_ (
    .A(_040_),
    .B1(_041_),
    .B2(_002_),
    .ZN(_003_)
  );
  OAI21_X1 _131_ (
    .A(_039_),
    .B1(_003_),
    .B2(_038_),
    .ZN(_004_)
  );
  OAI21_X1 _132_ (
    .A(_035_),
    .B1(_036_),
    .B2(_004_),
    .ZN(_005_)
  );
  NOR2_X1 _133_ (
    .A1(_033_),
    .A2(_005_),
    .ZN(_006_)
  );
  NOR2_X1 _134_ (
    .A1(_034_),
    .A2(_006_),
    .ZN(carry)
  );
  NOR2_X1 _135_ (
    .A1(_033_),
    .A2(_034_),
    .ZN(_007_)
  );
  XNOR2_X1 _136_ (
    .A(_005_),
    .B(_007_),
    .ZN(_008_)
  );
  INV_X1 _137_ (
    .A(_008_),
    .ZN(sign)
  );
  XNOR2_X1 _138_ (
    .A(_037_),
    .B(_004_),
    .ZN(sum[14])
  );
  XOR2_X1 _139_ (
    .A(x[13]),
    .B(y[13]),
    .Z(_009_)
  );
  XNOR2_X1 _140_ (
    .A(_003_),
    .B(_009_),
    .ZN(_010_)
  );
  INV_X1 _141_ (
    .A(_010_),
    .ZN(sum[13])
  );
  XNOR2_X1 _142_ (
    .A(_042_),
    .B(_002_),
    .ZN(sum[12])
  );
  XNOR2_X1 _143_ (
    .A(x[11]),
    .B(y[11]),
    .ZN(_011_)
  );
  XNOR2_X1 _144_ (
    .A(_001_),
    .B(_011_),
    .ZN(sum[11])
  );
  XNOR2_X1 _145_ (
    .A(_047_),
    .B(_000_),
    .ZN(sum[10])
  );
  XNOR2_X1 _146_ (
    .A(_077_),
    .B(_079_),
    .ZN(sum[9])
  );
  XNOR2_X1 _147_ (
    .A(_051_),
    .B(_076_),
    .ZN(sum[8])
  );
  XNOR2_X1 _148_ (
    .A(x[7]),
    .B(y[7]),
    .ZN(_012_)
  );
  XNOR2_X1 _149_ (
    .A(_075_),
    .B(_012_),
    .ZN(sum[7])
  );
  XOR2_X1 _150_ (
    .A(_055_),
    .B(_074_),
    .Z(sum[6])
  );
  XOR2_X1 _151_ (
    .A(_072_),
    .B(_073_),
    .Z(sum[5])
  );
  XNOR2_X1 _152_ (
    .A(_069_),
    .B(_071_),
    .ZN(sum[4])
  );
  XOR2_X1 _153_ (
    .A(_067_),
    .B(_068_),
    .Z(sum[3])
  );
  XNOR2_X1 _154_ (
    .A(_064_),
    .B(_066_),
    .ZN(sum[2])
  );
  XOR2_X1 _155_ (
    .A(_062_),
    .B(_063_),
    .Z(sum[1])
  );
  XOR2_X1 _156_ (
    .A(x[0]),
    .B(y[0]),
    .Z(sum[0])
  );
  MUX2_X1 _157_ (
    .A(_033_),
    .B(_034_),
    .S(_005_),
    .Z(overflow)
  );
  XNOR2_X1 _158_ (
    .A(_008_),
    .B(sum[14]),
    .ZN(_013_)
  );
  NOR2_X1 _159_ (
    .A1(sum[13]),
    .A2(sum[12]),
    .ZN(_014_)
  );
  XOR2_X1 _160_ (
    .A(_010_),
    .B(sum[12]),
    .Z(_015_)
  );
  XOR2_X1 _161_ (
    .A(sum[11]),
    .B(sum[10]),
    .Z(_016_)
  );
  XOR2_X1 _162_ (
    .A(sum[5]),
    .B(sum[4]),
    .Z(_017_)
  );
  NOR2_X1 _163_ (
    .A1(sum[1]),
    .A2(sum[0]),
    .ZN(_018_)
  );
  AOI21_X1 _164_ (
    .A(_018_),
    .B1(sum[0]),
    .B2(_063_),
    .ZN(_019_)
  );
  XOR2_X1 _165_ (
    .A(sum[3]),
    .B(sum[2]),
    .Z(_020_)
  );
  XNOR2_X1 _166_ (
    .A(_019_),
    .B(_020_),
    .ZN(_021_)
  );
  XNOR2_X1 _167_ (
    .A(_017_),
    .B(_021_),
    .ZN(_022_)
  );
  NOR2_X1 _168_ (
    .A1(sum[7]),
    .A2(sum[6]),
    .ZN(_023_)
  );
  XNOR2_X1 _169_ (
    .A(sum[7]),
    .B(sum[6]),
    .ZN(_024_)
  );
  XOR2_X1 _170_ (
    .A(sum[9]),
    .B(sum[8]),
    .Z(_025_)
  );
  XNOR2_X1 _171_ (
    .A(_024_),
    .B(_025_),
    .ZN(_026_)
  );
  XNOR2_X1 _172_ (
    .A(_022_),
    .B(_026_),
    .ZN(_027_)
  );
  XNOR2_X1 _173_ (
    .A(_016_),
    .B(_027_),
    .ZN(_028_)
  );
  XNOR2_X1 _174_ (
    .A(_015_),
    .B(_028_),
    .ZN(_029_)
  );
  XNOR2_X1 _175_ (
    .A(_013_),
    .B(_029_),
    .ZN(parity)
  );
  NOR4_X1 _176_ (
    .A1(sum[5]),
    .A2(sum[4]),
    .A3(sum[3]),
    .A4(sum[2]),
    .ZN(_030_)
  );
  OR4_X1 _177_ (
    .A1(sum[11]),
    .A2(sum[10]),
    .A3(sum[9]),
    .A4(sum[8]),
    .ZN(_031_)
  );
  NAND4_X1 _178_ (
    .A1(_014_),
    .A2(_018_),
    .A3(_023_),
    .A4(_030_),
    .ZN(_032_)
  );
  NOR4_X1 _179_ (
    .A1(sign),
    .A2(sum[14]),
    .A3(_031_),
    .A4(_032_),
    .ZN(zero)
  );
  assign sum[15] = sign;
endmodule
