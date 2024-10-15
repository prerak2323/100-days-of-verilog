module tb;

// Declare inputs and outputs to the DUT
reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg write, clk1, clk2;
wire [15:0] zout;

// Instantiate the DUT (Device Under Test)
pipe4stage dut (
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .func(func),
    .addr(addr),
    .write(write),
    .clk1(clk1),
    .clk2(clk2),
    .zout(zout)
);

// Clock generation for clk1 and clk2
always #5 clk1 = ~clk1;  // Generate clk1 every 10 time units
always #7 clk2 = ~clk2;  // Generate clk2 every 14 time units

// Initialize and test various operations
initial begin
    // Initialize signals
    clk1 = 0;
    clk2 = 0;
    write = 0;
    
    // Initialize reg_bank (assume random initialization in pipeline or external stimulus)

    // Test 1: Add operation
    #10;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 to register 2
    rd = 4'd3;       // Write result to register 3
    func = 4'd0;     // Add operation (func = 0)
    addr = 8'd10;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 2: Subtract operation
    #20;
    rs1 = 4'd3;      // Set rs1 to register 3
    rs2 = 4'd1;      // Set rs2 to register 1
    rd = 4'd4;       // Write result to register 4
    func = 4'd1;     // Subtract operation (func = 1)
    addr = 8'd20;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 3: Multiply operation
    #20;
    rs1 = 4'd4;      // Set rs1 to register 4
    rs2 = 4'd2;      // Set rs2 to register 2
    rd = 4'd5;       // Write result to register 5
    func = 4'd2;     // Multiply operation (func = 2)
    addr = 8'd30;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 4: AND operation
    #20;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 to register 2
    rd = 4'd6;       // Write result to register 6
    func = 4'd5;     // AND operation (func = 5)
    addr = 8'd40;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 5: OR operation
    #20;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 to register 2
    rd = 4'd7;       // Write result to register 7
    func = 4'd6;     // OR operation (func = 6)
    addr = 8'd50;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 6: XOR operation
    #20;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 to register 2
    rd = 4'd8;       // Write result to register 8
    func = 4'd7;     // XOR operation (func = 7)
    addr = 8'd60;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 7: NOT operation on rs1
    #20;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 (dummy value, unused)
    rd = 4'd9;       // Write result to register 9
    func = 4'd8;     // NOT operation (func = 8)
    addr = 8'd70;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Test 8: Shift left operation
    #20;
    rs1 = 4'd1;      // Set rs1 to register 1
    rs2 = 4'd2;      // Set rs2 (dummy value, unused)
    rd = 4'd10;      // Write result to register 10
    func = 4'd11;    // Shift left operation (func = 11)
    addr = 8'd80;    // Memory address for later writing
    write = 1'b1;    // Enable writing to memory after pipeline
    #50;             // Wait for pipeline to process the stages

    // Finish simulation
    #100;
    $finish;
end

// Monitor changes in signals
initial begin
    $monitor("Time = %t, rs1 = %d, rs2 = %d, rd = %d, func = %d, zout = %d", $time, rs1, rs2, rd, func, zout);
end

endmodule

