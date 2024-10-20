module tb_dff;

  // Inputs
  reg d;
  reg rst;
  reg clk;

  // Outputs
  wire q;

  // Instantiate the D flip-flop module
  dff uut (
    .d(d), 
    .rst(rst), 
    .clk(clk),
    .q(q)
  );

  // Clock generation (50% duty cycle)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period of 10 time units
  end

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst = 1; d = 0;

    // Apply reset
    #10 rst = 0;

    // Test different values of d
    #10 d = 1; // On positive clock edge, q should become 1
    #10 d = 0; // On positive clock edge, q should become 0
    #10 d = 1; // On positive clock edge, q should become 1
    #10 d = 1; // q should remain 1 as d stays 1
    #10 d = 0; // q should become 0

    // Test reset condition
    #10 rst = 1; // q should reset to 0
    #10 rst = 0; // Coming out of reset, now d should control q again
    #10 d = 1;  // q should follow d again

    // Complete the test
    #20 $finish;
  end

  // Monitor the outputs
  initial begin
    $monitor("Time = %0t, rst = %b, d = %b, q = %b", $time, rst, d, q);
  end

endmodule

