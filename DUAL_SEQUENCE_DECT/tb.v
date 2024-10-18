module dsd_tb;  // Testbench module

    // Inputs to the DUT (Device Under Test)
    reg clk;   // Clock
    reg in;    // Input signal

    // Output from the DUT
    wire op;   // Output signal

    // Instantiate the module under test (dsd)
    dsd uut (
        .clk(clk),
        .in(in),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        in = 0;

        // Monitor output to observe changes
        $monitor("Time: %0t | in: %b | op: %b | state: %b", $time, in, op, uut.state);

        // Apply test cases
        #10 in = 0; // State transition from s0 to s2
        #10 in = 1; // State transition from s2 to s4
        #10 in = 0; // State transition from s4 to s3
        #10 in = 1; // State transition from s3 to s4, op should be 1
        #10 in = 1; // State transition from s4 to s5
        #10 in = 0; // State transition from s5 to s3
        #10 in = 1; // State transition from s3 to s4, op should be 1 again
        #10 in = 0; // State transition from s4 to s3
        #10 in = 0; // State transition from s3 to s2
        #10 in = 1; // State transition from s2 to s4
        #10 in = 1; // State transition from s4 to s5
        #10 in = 1; // State transition from s5 to s1
        #10 in = 0; // State transition from s1 to s3
        #10 in = 1; // State transition from s3 to s4, op should be 1
        #10 in = 0; // State transition from s4 to s3

        #50 $finish;  // End simulation after running the cases
    end

endmodule

