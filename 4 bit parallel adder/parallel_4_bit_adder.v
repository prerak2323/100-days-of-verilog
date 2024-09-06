`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 09:16:20
// Design Name: 
// Module Name: parallel_4_bit_adder
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


module parallel_4_bit_adder(A,B,CIN,COUT,SUM);

input [3:0]A;
input [3:0]B;
input CIN;
output COUT;
output [3:0]SUM; 
wire C0,C1,C2;   
    
fulladder FA0(.x(A[0]), .y(B[0]), .cin(CIN), .Cout(C0), .Sum(SUM[0]));
fulladder FA1(.x(A[1]), .y(B[1]), .cin(C0), .Cout(C1), .Sum(SUM[1]));
fulladder FA2(.x(A[2]), .y(B[2]), .cin(C1), .Cout(C2), .Sum(SUM[2]));
fulladder FA3(.x(A[3]), .y(B[3]), .cin(C2), .Cout(COUT), .Sum(SUM[3]));
endmodule
