module cs_adder(a,b,CIN,S,COUT);

input [3:0]a,b;
input CIN;
output [3:0]S;
wire [7:0]s,c;
output COUT;



parameter cin1=1'b0;
parameter cin2=1'b1;

full_adder FA0(s[0],c[0],cin1,a[0],b[0]);
full_adder FA1(s[1],c[1],c[0],a[1],b[1]);
full_adder FA2(s[2],c[2],c[1],a[2],b[2]);
full_adder FA3(s[3],c[3],c[2],a[3],b[3]);


full_adder FA4(s[4],c[4],cin2,a[0],b[0]);
full_adder FA5(s[5],c[5],c[4],a[1],b[1]);
full_adder FA6(s[6],c[6],c[5],a[2],b[2]);
full_adder FA7(s[7],c[7],c[6],a[3],b[3]);

mux2x1 m0(S[0],CIN,s[0],s[4]);
mux2x1 m1(S[1],CIN,s[1],s[5]);
mux2x1 m2(S[2],CIN,s[2],s[6]);
mux2x1 m3(S[3],CIN,s[3],s[7]);
mux2x1 m4(COUT,CIN,c[3],c[7]);

endmodule
