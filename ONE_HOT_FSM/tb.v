module tb;

  // Testbench signals
  reg clk;                 // Clock signal
  wire [2:0] out;          // Output from the FSM

  // Instantiate the FSM module
  ohfsm uut (
    .out(out),
    .clk(clk)
  );

  // Clock generation: toggle every 5 time units
  always #5 clk = ~clk;

  // Testbench procedure
  initial begin
    // Initialize inputs
    clk = 0;

    // Monitor output and states
    $monitor("Time = %0t, clk = %b, out = %b", $time, clk, out);
    
    // Run the simulation for a certain time to observe FSM behavior
    #100 $finish;  // Stop the simulation after 100 time units
  end

endmodule

