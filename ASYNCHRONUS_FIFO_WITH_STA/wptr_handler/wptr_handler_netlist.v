/* Generated by Yosys 0.45+106 (git sha1 982fade0d, g++ 11.4.0-1ubuntu1~22.04 -fPIC -O3) */

module wptr_handler(waddr, wptr, g_rptr, full, wrst_n, wclk, w_en);
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
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  output full;
  wire full;
  input [4:0] g_rptr;
  wire [4:0] g_rptr;
  wire [4:0] g_wptr_next;
  wire [4:0] \gray_converter1.b ;
  wire [4:0] \gray_converter1.g ;
  input w_en;
  wire w_en;
  output [3:0] waddr;
  wire [3:0] waddr;
  wire [4:0] wbin;
  wire [4:0] wbin_next;
  input wclk;
  wire wclk;
  wire wfull;
  output [4:0] wptr;
  wire [4:0] wptr;
  input wrst_n;
  wire wrst_n;
  NAND2_X1 _24_ (
    .A1(w_en),
    .A2(_05_),
    .ZN(_06_)
  );
  NAND3_X1 _25_ (
    .A1(wbin[0]),
    .A2(w_en),
    .A3(_05_),
    .ZN(_07_)
  );
  AND4_X1 _26_ (
    .A1(wbin[1]),
    .A2(wbin[0]),
    .A3(w_en),
    .A4(_05_),
    .ZN(_08_)
  );
  AND3_X1 _27_ (
    .A1(wbin[2]),
    .A2(wbin[3]),
    .A3(_08_),
    .ZN(_09_)
  );
  XOR2_X1 _28_ (
    .A(wbin[4]),
    .B(_09_),
    .Z(\gray_converter1.b [4])
  );
  AOI21_X1 _29_ (
    .A(wbin[3]),
    .B1(_08_),
    .B2(wbin[2]),
    .ZN(_10_)
  );
  NOR2_X1 _30_ (
    .A1(_09_),
    .A2(_10_),
    .ZN(\gray_converter1.b [3])
  );
  XNOR2_X1 _31_ (
    .A(wbin[2]),
    .B(_08_),
    .ZN(_11_)
  );
  INV_X1 _32_ (
    .A(_11_),
    .ZN(\gray_converter1.b [2])
  );
  XOR2_X1 _33_ (
    .A(wbin[1]),
    .B(_07_),
    .Z(_12_)
  );
  INV_X1 _34_ (
    .A(_12_),
    .ZN(\gray_converter1.b [1])
  );
  XNOR2_X1 _35_ (
    .A(wbin[0]),
    .B(_06_),
    .ZN(\gray_converter1.b [0])
  );
  XNOR2_X1 _36_ (
    .A(wbin[4]),
    .B(_10_),
    .ZN(g_wptr_next[3])
  );
  XNOR2_X1 _37_ (
    .A(\gray_converter1.b [3]),
    .B(_11_),
    .ZN(g_wptr_next[2])
  );
  XOR2_X1 _38_ (
    .A(_11_),
    .B(_12_),
    .Z(g_wptr_next[1])
  );
  XNOR2_X1 _39_ (
    .A(_12_),
    .B(\gray_converter1.b [0]),
    .ZN(g_wptr_next[0])
  );
  XOR2_X1 _40_ (
    .A(g_rptr[2]),
    .B(g_wptr_next[2]),
    .Z(_13_)
  );
  XOR2_X1 _41_ (
    .A(g_rptr[0]),
    .B(g_wptr_next[0]),
    .Z(_14_)
  );
  XOR2_X1 _42_ (
    .A(g_rptr[3]),
    .B(g_wptr_next[3]),
    .Z(_15_)
  );
  XNOR2_X1 _43_ (
    .A(g_rptr[1]),
    .B(g_wptr_next[1]),
    .ZN(_16_)
  );
  NAND2_X1 _44_ (
    .A1(_15_),
    .A2(_16_),
    .ZN(_17_)
  );
  XNOR2_X1 _45_ (
    .A(g_rptr[4]),
    .B(\gray_converter1.b [4]),
    .ZN(_18_)
  );
  NOR4_X1 _46_ (
    .A1(_13_),
    .A2(_14_),
    .A3(_17_),
    .A4(_18_),
    .ZN(wfull)
  );
  DFFR_X1 _47_ (
    .CK(wclk),
    .D(wfull),
    .Q(full),
    .QN(_05_),
    .RN(wrst_n)
  );
  DFFR_X1 _48_ (
    .CK(wclk),
    .D(g_wptr_next[0]),
    .Q(wptr[0]),
    .QN(_22_),
    .RN(wrst_n)
  );
  DFFR_X1 _49_ (
    .CK(wclk),
    .D(g_wptr_next[1]),
    .Q(wptr[1]),
    .QN(_21_),
    .RN(wrst_n)
  );
  DFFR_X1 _50_ (
    .CK(wclk),
    .D(g_wptr_next[2]),
    .Q(wptr[2]),
    .QN(_20_),
    .RN(wrst_n)
  );
  DFFR_X1 _51_ (
    .CK(wclk),
    .D(g_wptr_next[3]),
    .Q(wptr[3]),
    .QN(_19_),
    .RN(wrst_n)
  );
  DFFR_X1 _52_ (
    .CK(wclk),
    .D(\gray_converter1.b [4]),
    .Q(wptr[4]),
    .QN(_23_),
    .RN(wrst_n)
  );
  DFFR_X1 _53_ (
    .CK(wclk),
    .D(\gray_converter1.b [0]),
    .Q(wbin[0]),
    .QN(_04_),
    .RN(wrst_n)
  );
  DFFR_X1 _54_ (
    .CK(wclk),
    .D(\gray_converter1.b [1]),
    .Q(wbin[1]),
    .QN(_03_),
    .RN(wrst_n)
  );
  DFFR_X1 _55_ (
    .CK(wclk),
    .D(\gray_converter1.b [2]),
    .Q(wbin[2]),
    .QN(_02_),
    .RN(wrst_n)
  );
  DFFR_X1 _56_ (
    .CK(wclk),
    .D(\gray_converter1.b [3]),
    .Q(wbin[3]),
    .QN(_01_),
    .RN(wrst_n)
  );
  DFFR_X1 _57_ (
    .CK(wclk),
    .D(\gray_converter1.b [4]),
    .Q(wbin[4]),
    .QN(_00_),
    .RN(wrst_n)
  );
  assign g_wptr_next[4] = \gray_converter1.b [4];
  assign \gray_converter1.g  = { \gray_converter1.b [4], g_wptr_next[3:0] };
  assign waddr = wbin[3:0];
  assign wbin_next = \gray_converter1.b ;
endmodule
