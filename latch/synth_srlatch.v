/* Generated by Yosys 0.45+106 (git sha1 982fade0d, g++ 11.4.0-1ubuntu1~22.04 -fPIC -O3) */

module srlatch(s, r, enb, q, qbar);
  wire _0_;
  wire _1_;
  input enb;
  wire enb;
  output q;
  wire q;
  output qbar;
  wire qbar;
  input r;
  wire r;
  input s;
  wire s;
  INV_X1 _2_ (
    .A(r),
    .ZN(_1_)
  );
  INV_X1 _3_ (
    .A(_0_),
    .ZN(q)
  );
  NAND2_X1 _4_ (
    .A1(s),
    .A2(q),
    .ZN(qbar)
  );
  AOI21_X1 _5_ (
    .A(_1_),
    .B1(q),
    .B2(s),
    .ZN(_0_)
  );
endmodule
