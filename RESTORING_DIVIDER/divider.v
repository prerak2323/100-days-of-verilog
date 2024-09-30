module divider(
    input signed [7:0] data_in,
    output [7:0] Q,
    output done,
    input start, clk
);

    // Declaring internal signals
    wire signed [7:0] W, X, Z;
    wire FLAG;
    wire signed [7:0] Bus;
    wire ldA, ldB, clrQ, incQ;
    wire sel3; // Added missing 'sel3' wire

    // Instantiating PIPO registers
    PIPO A1(Bus, ldA, clk, W); // W stores the result from A1
    PIPO B1(Bus, ldB, clk, X); // X stores the result from B1

    // Instantiating shift register
    shiftreg QQ(clrQ, incQ, clk, Q);

    // Instantiating subtractor
    SUB SSB(Z, FLAG, W, X); // Z is the result, FLAG signals the condition

    // Instantiating multiplexer
    MUX m3(Bus, sel3, data_in, Z); // MUX chooses between data_in and Z

    // Instantiating controller
    controller cot(start, FLAG, clk, ldA, sel3, ldB, clrQ, incQ, done);

endmodule

