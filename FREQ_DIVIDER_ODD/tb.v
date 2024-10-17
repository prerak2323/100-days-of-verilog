module tb;

  // Testbench signals
  reg clk, rst;
  wire out;
  
  // Instantiate the frequency divider module
  freq_div uut (
    .out(out),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation: toggle every 5 time units
  always #5 clk = ~clk;

  // Test procedure
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    
    // Reset the design
    #10 rst = 0;  // De-assert reset after some delay
    #100 rst = 1; // Assert reset again to test reset functionality
    #10 rst = 0;  // De-assert reset
    $dumpfile("res.vcd"); $dumpvars;
    // Run simulation for some time
    #200 $finish;
  end
  
  // Display output on each clock edge for observation

endmodule

