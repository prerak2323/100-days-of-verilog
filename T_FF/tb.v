module tb_tff;

  // Inputs
  reg t;
  reg clk;
  reg rst;

  // Outputs
  wire q;

  // Instantiate the T flip-flop module
  tff uut (
    .t(t), 
    .clk(clk), 
    .rst(rst), 
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
    rst = 1; t = 0;

    // Apply reset and initialize
    #10 rst = 0;  // Remove reset after 10 time units

    // Test the T flip-flop behavior
    #10 t = 1; // Toggle: q should change state
    #10 t = 0; // No toggle: q should remain the same
    #10 t = 1; // Toggle: q should change state
    #10 t = 1; // Toggle again: q should change state again
    #10 t = 0; // No toggle: q should remain the same
    #10 t = 1; // Toggle: q should change state

    // Test reset behavior
    #10 rst = 1; // q should reset to 0
    #10 rst = 0; // Remove reset, q should now toggle again based on t input
    #10 t = 1;  // q should toggle
    
    // Complete test
    #20 $finish;
  end

  // Monitor the outputs
  initial begin
    $monitor("Time = %0t, rst = %b, t = %b, q = %b", $time, rst, t, q);
  end

endmodule

