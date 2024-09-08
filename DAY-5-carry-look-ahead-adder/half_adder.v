`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2024 22:19:35
// Design Name: 
// Module Name: half_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Simple half-adder design
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module half_adder(x, y, cout, sum);
    input x, y;
    output cout, sum;

    // Sum is XOR of x and y
    assign sum = x ^ y;
    
    // Carry is AND of x and y
    assign cout = x & y;
endmodule
