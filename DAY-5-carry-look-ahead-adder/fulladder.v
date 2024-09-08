`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2024 22:24:01
// Design Name: 
// Module Name: fulladder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Full adder using two half adders
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fulladder(x, y, cin, Cout, Sum);
    input x, y, cin;
    output Cout, Sum;
    wire w1, w2, w3;

    // First half adder
    half_adder HA1(.x(x), .y(y), .sum(w1), .cout(w2));

    // Second half adder
    half_adder HA2(.x(w1), .y(cin), .sum(Sum), .cout(w3));

    // Final carry output
    or g1(Cout, w2, w3);
endmodule
