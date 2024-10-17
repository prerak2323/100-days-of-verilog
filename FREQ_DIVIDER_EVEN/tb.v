module tb_freq_div();

    // Declare inputs as regs and outputs as wires
    reg clk, rst;
    wire div2, div4, div8, div16, div32;

    // Instantiate the design under test (DUT)
    freq_div dut (
        .clk(clk),
        .rst(rst),
        .div2(div2),
        .div4(div4),
        .div8(div8),
        .div16(div16),
        .div32(div32)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate clock with a period of 10 units (100 MHz)
    end

    // Test stimulus
    initial begin
        // Monitor signal values

        // Initial reset
        rst = 1; #15;  // Keep reset high for a few cycles
        rst = 0;       // Release reset
$dumpfile("res.vcd"); $dumpvars;
        // Run simulation for a certain time
        #500;          // Let the simulation run for 500 time units
        $finish;       // End the simulation
    end
endmodule

