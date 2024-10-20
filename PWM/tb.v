module tb;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire dout;

  // Instantiate the PWM signal module
  pwmsignal uut (
    .clk(clk), 
    .rst(rst), 
    .dout(dout)
  );

  // Clock generation (50% duty cycle, 10 time units period)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle the clock every 5 time units
  end

  // Test procedure
  initial begin
    // Dump the waveform to a VCD file
    $dumpfile("res.vcd"); // Specify the name of the output VCD file
    $dumpvars; // Dump all variables in the current module
    

    
    // Initialize inputs
    rst = 1;

    // Hold reset active for 20 time units
    #20 rst = 0;

    // Run the test for some time (200 time units)
    #200;

    // Reset again to see the behavior after reset
    #20 rst = 1;
    #20 rst = 0;

    // Continue simulation for another 200 time units
    #1000;

    // End simulation
    $finish;
  end

endmodule

