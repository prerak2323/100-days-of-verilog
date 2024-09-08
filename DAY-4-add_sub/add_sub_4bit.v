module add_sub_4bit(A,B,A_S,COUT,SUM);
input [3:0]A;
input [3:0]B;
input A_S; //A_S = 1 THEN SUBTRACTION O/W ADDITION 
output COUT;
output [3:0]SUM;
wire w0,w1,w2,w3;

assign Q0=(B[0] ^ A_S);
assign Q1=(B[1] ^ A_S);
assign Q2=(B[2] ^ A_S);
assign Q3=(B[3] ^ A_S);


fulladder FA0(.x(A[0]), .y(Q0), .cin(A_S), .Cout(C0), .Sum(SUM[0]));
fulladder FA1(.x(A[1]), .y(Q1), .cin(C0), .Cout(C1), .Sum(SUM[1]));
fulladder FA2(.x(A[2]), .y(Q2), .cin(C1), .Cout(C2), .Sum(SUM[2]));
fulladder FA3(.x(A[3]), .y(Q3), .cin(C2), .Cout(COUT), .Sum(SUM[3]));


endmodule