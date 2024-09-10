`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 11:53:23
// Design Name: 
// Module Name: multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 16-bit multiplier with controller, PIPO, counter, and adder.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mulriplier(ZF, LDA, LDB, LDP, CLRP, DECB, DATA_IN, CLK, START);
    input LDA, LDB, LDP, CLRP, DECB, CLK, START;
    input [15:0] DATA_IN;
    output ZF;
    
    wire [15:0] x, y, z, bout, bus;

    // Assign bus
    assign bus = DATA_IN;

    // Register A (PIPO1)
    PIPO1 A(x, bus, LDA, CLK);
    
    // Product Register (PIPO2)
    PIPO2 P(y, z, LDP, CLRP, CLK);
    
    // Counter B
    CNTR B(bout, bus, LDB, DECB, CLK);
    
    // Adder
    ADD AD(z, x, y);
    
    // Zero flag (ZF)
    ZF comp(bout, ZF);
    
    // Controller
//    CONTROLLER CON(LDA, LDB, LDP, CLRP, DECB, DONE, CLK, ZF, START);
endmodule