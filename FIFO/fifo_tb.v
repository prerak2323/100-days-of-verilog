module fifo_tb;

    // Testbench signals
    reg rst, wr, rd, clk;        // Control signals
    reg [7:0] din;               // Data input
    wire [7:0] dout;             // Data output from FIFO
    wire full, empty;            // Status signals from FIFO

    // Instantiate the FIFO module
    fifo uut (
        .dout(dout), 
        .din(din), 
        .full(full), 
        .empty(empty), 
        .rst(rst), 
        .wr(wr), 
        .rd(rd), 
        .clk(clk)
    );

    // Clock generation: 10ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile("fifo_test.vcd"); // Output the waveform file
        $dumpvars(0, fifo_tb);

        // Initialize signals
        #5 rst = 1;  // Assert reset
        wr = 0;
        rd = 0;
        din = 0;

        // Deassert reset
        #20 rst = 0;

        // Write to FIFO
        #10 wr = 1; din = 8'hAA;  // Write first data (0xAA)
        #10 din = 8'hBB;          // Write second data (0xBB)
        #10 din = 8'hCC;          // Write third data (0xCC)
        #10 din = 8'hDD;          // Write fourth data (0xDD)
        #10 wr = 0;               // Stop writing

        // Start reading from FIFO
        #20 rd = 1;
        #10 rd = 0;

        // Read remaining data
        #20 rd = 1;
        #30 rd = 0;

        // Finish simulation
        #100 $finish;
    end

endmodule

