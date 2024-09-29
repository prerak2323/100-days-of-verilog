module carry_save_adder(S,COUT,A,B,C);

input [3:0]A,B,C;
output [4:0]S;
output COUT;
wire [3:0]s,c;
wire [2:0]cint;


parameter c0=1'b0;
parameter s0=1'b0;
fulladder fa0(s[0],c[0],A[0],B[0],C[0]);
fulladder fa1(s[1],c[1],A[1],B[1],C[1]);
fulladder fa2(s[2],c[2],A[2],B[2],C[2]);
fulladder fa3(s[3],c[3],A[3],B[3],C[3]);

assign S[0]=s[0];

fulladder fa4(S[1],cint[0],s[1],c[0],c0);
fulladder fa5(S[2],cint[1],s[2],c[1],cint[0]);
fulladder fa7(S[3],cint[2],s[3],c[2],cint[1]);
fulladder fa8(S[4],COUT,s0,c[3],cint[2]);
endmodule
