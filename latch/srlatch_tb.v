module srlatch_tb;

reg d, rst, clk;
wire q, qbar;

dff dd(.q(q), .qbar(qbar), .clk(clk), .rst(rst), .d(d));

initial clk = 1'b0;   // Initialize the clock

always #5 clk = ~clk; // Toggle clock every 5 time units

initial 
begin
    // Initialize all inputs before starting the simulation
    rst = 0;
    d = 0;

    $monitor($time, " q= %b qbar= %b d= %b rst= %b", q, qbar, d, rst);

    #10 rst = 1;  // Assert reset
    #10 rst = 0;  // Deassert reset
    d = 1;        // Change d input

    #200 $finish; // End simulation
end

endmodule

