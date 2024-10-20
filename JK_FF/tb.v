module tb_jk_ff;

  // Inputs
  reg j;
  reg k;
  reg clk;
  reg rst;

  // Outputs
  wire q;

  // Instantiate the JK flip-flop module
  jk_ff uut (
    .j(j), 
    .k(k), 
    .clk(clk), 
    .rst(rst), 
    .q(q)
  );

  // Clock generation (50% duty cycle)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period = 10 time units
  end

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst = 1; j = 0; k = 0;

    // Apply reset
    #10 rst = 0;

    // Test different combinations of J and K
    #10 j = 1; k = 0; // Set condition (q should become 1)
    #10 j = 0; k = 1; // Reset condition (q should become 0)
    #10 j = 0; k = 0; // Hold condition (q should retain its value)
    #10 j = 1; k = 0; // Set condition again (q should become 1)
    #10 j = 1; k = 1; // Toggle condition (q should toggle)
    #10 j = 1; k = 1; // Toggle again (q should toggle back)
    #10 j = 0; k = 1; // Reset condition (q should become 0)
    #10 j = 0; k = 0; // Hold condition (q should retain its value)

    // Apply reset
    #10 rst = 1; // q should reset to 0
    #10 rst = 0;

    // Complete test
    #20 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time = %0t, rst = %b, j = %b, k = %b, q = %b", $time, rst, j, k, q);
  end

endmodule

