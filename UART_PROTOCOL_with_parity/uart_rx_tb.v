`timescale 1ns / 1ps

module tb_uart_rx;

    // Declare testbench signals
    reg clk;
    reg rst;
    reg [7:0] count;
    reg serial_in;
    wire [7:0] data_byte;
    wire rx_active;
    wire rx_done;
    wire even_parity;

    // Instantiate the uart_rx module
    uart_rx uut (
        .clk(clk),
        .rst(rst),
        .count(count),
        .serial_in(serial_in),
        .rx_active(rx_active),
        .rx_done(rx_done),
        .data_byte(data_byte),
        .even_parity(even_parity)
    );

    // Generate clock signal (period = 10ns -> 100 MHz)
    always begin
        #5 clk = ~clk;  // Toggle every 5 ns
    end

    // Initial block to apply test vectors
    initial begin
    $dumpfile("resrx.vcd"); $dumpvars;
        // Initialize signals
        clk = 0;
        rst = 0;
        serial_in = 1;  // Start with idle state (high)
        count = 8'd50;  // Set baud rate count (this depends on your baud generator logic)

        // Apply reset
        $display("Applying reset...");
        rst = 1;
        #10;
        rst = 0;
        
        // Test 1: Simulate the reception of a start bit
        $display("Simulating reception of data...");
        // Start bit
        serial_in = 0;  // Start bit (low)
        #10;  // Wait for start bit to be captured
        
        // Data bits (e.g., sending 8'b10101010)
        serial_in = 1; #500;
        serial_in = 0; #500;
        serial_in = 1; #500;
        serial_in = 0; #500;
        serial_in = 1; #500;
        serial_in = 0; #500;
        serial_in = 1; #500;
        serial_in = 0; #500;
        serial_in = 0; #500;

        // Stop bit
        serial_in = 1;  // Stop bit (high)
        #500;

        
    #1000    $finish;
    end

    // Monitor signals for debugging
    

endmodule

