`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 16:14:47
// Design Name: 
// Module Name: look_ahead_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module look_ahead_adder(A,B,CIN,SUM,COUT);
input [3:0]A;
input [3:0]B;
input CIN;
output [3:0]SUM;
output COUT;

wire q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10;

assign q0=A[0] ^ B[0];  // p0
assign q1=A[0] & B[0]; //g0

assign q2=A[1] ^ B[1];  // p1
assign q3=A[1] & B[1]; //g1

assign q4=A[2] ^ B[2];  // p2
assign q5=A[2] & B[2]; //g2

assign q6=A[3] ^ B[3];  // p3
assign q7=A[3] & B[3]; //g3

assign q8=q1 | q0&CIN;  //c1
assign q9=q3 | q2&q8;  //c2
assign q10=q5 | q4&q9;  //c3
assign COUT=q7 | q6&q10;  //COUT


fulladder FA0(.x(A[0]), .y(B[0]), .cin(CIN), .Sum(SUM[0]));
fulladder FA1(.x(A[1]), .y(B[1]), .cin(q8), .Sum(SUM[1]));
fulladder FA2(.x(A[2]), .y(B[2]), .cin(q9), .Sum(SUM[2]));
fulladder FA3(.x(A[3]), .y(B[3]), .cin(q10), .Sum(SUM[3]));


endmodule
