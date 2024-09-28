module cs_adder(A,B,CIN,S,COUT);

input [7:0]A,B;
input CIN;
output [7:0]S;
output COUT;

wire c0,c1;
wire p0,p1,p2,p3,P;

adder4bit A0({S[3],S[2],S[1],S[0]},c0,{A[3],A[2],A[1],A[0]},{B[3],B[2],B[1],B[0]},CIN);

adder4bit A1({S[4],S[5],S[6],S[7]},c1,{A[4],A[5],A[6],A[7]},{B[4],B[5],B[6],B[7]},c0);

assign p0 = A[4] & B[4];
assign p1 = A[5] & B[5];
assign p2 = A[6] & B[6];
assign p3 = A[7] & B[7];

assign p= p0&p1&p2&p3;

assign COUT = P | c1;
endmodule
