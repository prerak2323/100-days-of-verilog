`timescale 1ns / 1ps

module tb_uart_tx;

    // Declare testbench signals
    reg clk;
    reg rst;
    reg tx_dv;
    reg [7:0] count;
    reg [7:0] data_byte;
    wire serial_out;
    wire tx_active;
    wire tx_done;

    // Instantiate the uart_tx module
    uart_tx uut (
        .clk(clk),
        .rst(rst),
        .count(count),
        .data_byte(data_byte),
        .tx_dv(tx_dv),
        .serial_out(serial_out),
        .tx_active(tx_active),
        .tx_done(tx_done)
    );

    // Generate clock signal (period = 10ns -> 100 MHz)
    always begin
        #5 clk = ~clk;  // Toggle every 5 ns
    end

    // Initial block to apply test vectors
    initial begin
        // Initialize signals
        $dumpfile("res.vcd"); $dumpvars;
        clk = 0;
        rst = 0;
        tx_dv = 0;
        count = 8'd127;  // Set baud count value (this depends on your baud generator logic)
        data_byte = 8'b10101010;  // Example data to transmit
        
        // Apply reset
        $display("Applying reset...");
        rst = 1;
        #10;
        rst = 0;
        
        // Test 1: Start transmission with tx_dv signal
        $display("Starting transmission...");
        tx_dv = 1;  // Start transmission
      
        
        #1000000 $finish;
    end

  

endmodule

