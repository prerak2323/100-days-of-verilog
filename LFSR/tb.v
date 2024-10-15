module tb;

// Declare variables for the testbench
reg clk, rst;        // Clock and reset signals
wire [3:0] op;       // 4-bit output from the LFSR

// Instantiate the LFSR module
lfsr uut (
    .clk(clk),
    .rst(rst),
    .op(op)
);

// Clock generation
initial begin
    clk = 0;  // Initialize clock
    forever #5 clk = ~clk;  // Toggle clock every 5 time units (clock period of 10 units)
end

// Initial block to apply test cases
initial begin
    // Monitor the changes in outputs
    $monitor("Time = %0t | Reset = %b | Output = %b", $time, rst, op);

    // Apply reset initially
    rst = 1;
    #10;

    // Deassert reset and let LFSR run
    rst = 0;
    #100;  // Let the system run for 100 time units

    // Apply reset again and check the output
    rst = 1;
    #10;
    
    // Deassert reset again
    rst = 0;
    #50;

    // Stop the simulation
    $finish;
end

endmodule

