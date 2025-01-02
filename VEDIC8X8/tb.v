module tb_vedic8x8;

    reg [7:0] a, b;
    wire [15:0] prod;
    wire overflow;

    // Instantiate the Vedic 8x8 multiplier
    vedic8x8 uut (
        .a(a),
        .b(b),
        .prod(prod),
        .overflow(overflow)
    );

    initial begin
        // Initialize inputs
        a = 8'b00000000;
        b = 8'b00000000;

        // Monitor outputs
        $monitor("Time = %0t: a = %d, b = %d, prod = %d, overflow = %b", $time, a, b, prod, overflow);

        // Apply test vectors
        #10 a = 8'b00000001; b = 8'b00000001;
        #10 a = 8'b00000010; b = 8'b00000011;
        #10 a = 8'b00000100; b = 8'b00000110;
        #10 a = 8'b00001001; b = 8'b00000101;
        #10 a = 8'b11111111; b = 8'b11111111;

        // End simulation
        #10 $finish;
    end

endmodule

