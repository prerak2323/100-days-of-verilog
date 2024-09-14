module counter_tb;

  reg clk, rst;
  wire [31:0]count;

  // Instantiate the simple_counter module
  simple_counter sc (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Generate the clock signal with a period of 10 time units
  initial clk = 1'b0;
  always #5 clk = ~clk;

  // Apply reset and release it after some time
  initial begin
    $dumpfile("counter_result.vcd");
    $dumpvars(0, counter_tb);
    
    // Apply reset
    rst = 1'b1;
    #10;
    rst = 1'b0;

    // Finish simulation after 500 time units
    #500;
    $finish;
  end

endmodule

