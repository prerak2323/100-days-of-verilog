module tb_sr_latch;
  // Inputs
  reg rst;
  reg s;
  reg r;

  // Outputs
  wire q;

  // Instantiate the SR latch module
  sr_latch uut (
    .rst(rst), 
    .s(s), 
    .r(r), 
    .q(q)
  );

  // Testbench procedure
  initial begin
    // Initialize inputs
    rst = 0;
    s = 0;
    r = 0;

    // Test reset condition
    #10 rst = 1;
    #10 rst = 0;

    // Test SR latch cases
    #10 s = 1; r = 0; // Set condition (q should be 1)
    #10 s = 0; r = 1; // Reset condition (q should be 0)
    #10 s = 0; r = 0; // Hold condition (q should retain its value)
    #10 s = 1; r = 0; // Set condition (q should be 1)
    #10 s = 1; r = 1; // Invalid condition (q should be 'z)
    #10 s = 0; r = 1; // Reset condition (q should be 0)
    #10 s = 1; r = 1; // Invalid condition again (q should be 'z)
    
    // Complete test
    #10 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time = %0t, rst = %b, s = %b, r = %b, q = %b", $time, rst, s, r, q);
  end
endmodule

