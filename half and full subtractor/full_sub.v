`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 07:18:14
// Design Name: 
// Module Name: full_sub
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


module full_sub(a,b,bin,diff,bout);
    input a,b,bin;
    output bout,diff;
    wire w1,w2,w3;
    
half_sub HS1(.a(a),.b(b),.diff(w2),.bor(w1));
half_sub HS2(.a(w1),.b(w2),.diff(diff),.bor(w3));

or g0 (bout,w3,bin);
   
    
endmodule
