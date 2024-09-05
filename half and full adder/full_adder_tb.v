`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2024 22:50:35
// Design Name: 
// Module Name: fulladder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for full adder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fulladder_tb;

    // Inputs
    reg x;
    reg y;
    reg cin;

    // Outputs
    wire Cout;
    wire Sum;

    // Instantiate the Unit Under Test (UUT)
    fulladder uut (
        .x(x), 
        .y(y), 
        .cin(cin), 
        .Cout(Cout), 
        .Sum(Sum)
    );

    initial begin
        // Initialize inputs
        x = 0; y = 0; cin = 0;
        #10; // Wait 10 time units
        
        // Test case 1: x=0, y=0, cin=0
        x = 0; y = 0; cin = 0;
        #10;
        
        // Test case 2: x=0, y=0, cin=1
        x = 0; y = 0; cin = 1;
        #10;
        
        // Test case 3: x=0, y=1, cin=0
        x = 0; y = 1; cin = 0;
        #10;
        
        // Test case 4: x=0, y=1, cin=1
        x = 0; y = 1; cin = 1;
        #10;
        
        // Test case 5: x=1, y=0, cin=0
        x = 1; y = 0; cin = 0;
        #10;
        
        // Test case 6: x=1, y=0, cin=1
        x = 1; y = 0; cin = 1;
        #10;
        
        // Test case 7: x=1, y=1, cin=0
        x = 1; y = 1; cin = 0;
        #10;
        
        // Test case 8: x=1, y=1, cin=1
        x = 1; y = 1; cin = 1;
        #10;
        
        // End simulation
        $finish;
    end

    // Monitor the inputs and outputs
    initial begin
        $monitor("At time %t: x = %b, y = %b, cin = %b => Sum = %b, Cout = %b", $time, x, y, cin, Sum, Cout);
    end

endmodule
