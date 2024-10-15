module adder_tb;

// Declare variables for inputs and outputs
reg A, B, CIN;
wire SUM, COUT;

// Instantiate the adder module
adder uut (
    .A(A),
    .B(B),
    .CIN(CIN),
    .SUM(SUM),
    .COUT(COUT)
);

// Initial block to apply test cases
initial begin
    // Monitor the changes in inputs and outputs
    $monitor("Time = %0t | A = %b | B = %b | CIN = %b || SUM = %b | COUT = %b", $time, A, B, CIN, SUM, COUT);

    // Test case 1: A=0, B=0, CIN=0
    A = 0; B = 0; CIN = 0;
    #10; // Wait 10 time units

    // Test case 2: A=0, B=0, CIN=1
    A = 0; B = 0; CIN = 1;
    #10; // Wait 10 time units

    // Test case 3: A=0, B=1, CIN=0
    A = 0; B = 1; CIN = 0;
    #10; // Wait 10 time units

    // Test case 4: A=0, B=1, CIN=1
    A = 0; B = 1; CIN = 1;
    #10; // Wait 10 time units

    // Test case 5: A=1, B=0, CIN=0
    A = 1; B = 0; CIN = 0;
    #10; // Wait 10 time units

    // Test case 6: A=1, B=0, CIN=1
    A = 1; B = 0; CIN = 1;
    #10; // Wait 10 time units

    // Test case 7: A=1, B=1, CIN=0
    A = 1; B = 1; CIN = 0;
    #10; // Wait 10 time units

    // Test case 8: A=1, B=1, CIN=1
    A = 1; B = 1; CIN = 1;
    #10; // Wait 10 time units

    // Finish simulation
    $finish;
end

endmodule

