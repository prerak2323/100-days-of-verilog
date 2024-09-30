module tb;

    reg [7:0] data_in;
    reg start;
    wire done;
    reg clk;
    wire [7:0] Q;

    // Named instantiation of the divider module
    divider check(
        .data_in(data_in),
        .Q(Q),
        .done(done),
        .start(start),
        .clk(clk)
    );

    // Clock generation
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $dumpfile("res.vcd"); 
        $dumpvars(0, tb); // dumping all signals at level 0
        
        // Wait for 10 time units, then start the process
        #10 start = 1'b1; // Start signal to initiate the division
         // Lower the start signal after one clock cycle
        data_in = 8'd50; // Load first value (numerator)
        
        // Wait for some time, then provide the second value
        #10 data_in = 8'd2; // Load second value (denominator)

        // Wait for the division process to finish
        #1000 $finish;
    end

endmodule

