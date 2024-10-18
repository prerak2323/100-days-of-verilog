module tb;  // Testbench module

    // Testbench signals
    reg [7:0] data_in;
    reg clk;
    reg port_A_enb, port_B_enb;
    reg [4:0] addr;
    reg wr_en;
    wire [7:0] data_out_A, data_out_B;

    // Instantiate the DUT (Device Under Test)
    dualportram uut (
        .data_in(data_in),
        .clk(clk),
        .port_A_enb(port_A_enb),
        .port_B_enb(port_B_enb),
        .data_out_A(data_out_A),
        .data_out_B(data_out_B),
        .addr(addr),
        .wr_en(wr_en)
    );

    // Clock generation (10 time unit period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize inputs
        data_in = 8'b0;
        port_A_enb = 0;
        port_B_enb = 0;
        addr = 5'b0;
        wr_en = 0;

        // Apply stimulus
        #10;  // Wait for 10 time units

        // Write data '10101010' to address 5 using port A
        data_in = 8'b10101010;
        addr = 5'b00101;
        port_A_enb = 1;
        wr_en = 1;  // Enable write
        #10;  // Wait for one clock cycle

        // Disable write
        wr_en = 0;
        port_A_enb = 0;
        #10;

        // Read data from address 5 using port A
        port_A_enb = 1;
        wr_en = 0;  // Read mode
        #10;

        // Read data from address 5 using port B
        port_A_enb = 0;
        port_B_enb = 1;
        #10;

        // Write different data to the same address using port B
        data_in = 8'b11001100;
        wr_en = 1;
        #10;

        // Read back the data using port A
        port_B_enb = 0;
        port_A_enb = 1;
        wr_en = 0;
        #10;

        // Finish simulation
        $finish;
    end

    // Monitor output changes
    initial begin
        $monitor("Time: %0t | addr: %b | data_in: %b | data_out_A: %b | data_out_B: %b | wr_en: %b", 
                  $time, addr, data_in, data_out_A, data_out_B, wr_en);
    end

endmodule

