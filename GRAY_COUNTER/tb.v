module tb_gray_counter;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [3:0] out;

  // Instantiate the Gray counter module
  gray_counter uut (
    .clk(clk), 
    .rst(rst), 
    .out(out)
  );

  // Clock generation (50% duty cycle)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period of 10 time units
  end

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst = 1;

    // Apply reset
    #10 rst = 0;  // Release reset after 10 time units
    
    // Complete the simulation
    #100 $finish;
  end

  // Monitor the output
  initial begin
    $monitor("Time = %0t, rst = %b, out = %b", $time, rst, out);
  end

endmodule

