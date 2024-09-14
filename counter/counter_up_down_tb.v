module counter_up_down_tb;

reg [7:0] din;  // 8-bit data input
reg clr, ld, mode, clk;  // control signals
wire [7:0] count;  // 8-bit output count

// Instantiate the counter module
counter_up_down cntr (
    .din(din), 
    .clr(clr), 
    .ld(ld), 
    .mode(mode), 
    .count(count), 
    .clk(clk)
);

// Clock generation: toggle every 5 time units
initial clk = 1'b0;
always #5 clk = ~clk;

// Testbench to simulate the counter operation
initial
begin
	$monitor($time," count= %d",count);
    // Initial setup: clear the counter, load disabled, count in up mode
    ld = 0; din = 8'd0; mode = 0; clr = 1;  // Activate reset/clear
    #10 clr = 0;  // Deactivate clear after 10 time units

    // Load a value into the counter and count up
    #10 ld = 1; din = 8'd10;  // Load 10 into the counter
    #10 ld = 0;  // Disable load to start counting

    // Switch to down-counter mode
    #50 mode = 1;  // Switch to down-counting after 50 time units
    
    // Finish the simulation after some time
    #300 $finish;
end

endmodule

