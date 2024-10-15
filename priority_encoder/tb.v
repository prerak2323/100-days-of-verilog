module tb;

// Declare variables for inputs and outputs
reg D7, D6, D5, D4, D3, D2, D1, D0;
wire A2, A1, A0;

// Instantiate the PE module
PE uut (
    .D7(D7),
    .D6(D6),
    .D5(D5),
    .D4(D4),
    .D3(D3),
    .D2(D2),
    .D1(D1),
    .D0(D0),
    .A2(A2),
    .A1(A1),
    .A0(A0)
);

// Initial block to apply test cases
initial begin
    // Monitor the changes in inputs and outputs
    $monitor("Time = %0t | D7 = %b | D6 = %b | D5 = %b | D4 = %b | D3 = %b | D2 = %b | D1 = %b | D0 = %b || A2 = %b | A1 = %b | A0 = %b", 
              $time, D7, D6, D5, D4, D3, D2, D1, D0, A2, A1, A0);

    // Apply different test cases with a delay of 10 time units between them

    // Test case 1: D7=0, D6=0, D5=0, D4=0, D3=0, D2=0, D1=0, D0=0
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 2: D7=1, D6=0, D5=0, D4=0, D3=0, D2=0, D1=0, D0=0
    D7 = 1; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 3: D7=0, D6=1, D5=0, D4=0, D3=0, D2=0, D1=0, D0=0
    D7 = 0; D6 = 1; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 4: D7=0, D6=0, D5=1, D4=0, D3=0, D2=0, D1=0, D0=0
    D7 = 0; D6 = 0; D5 = 1; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 5: D7=0, D6=0, D5=0, D4=1, D3=0, D2=0, D1=0, D0=0
    D7 = 0; D6 = 0; D5 = 0; D4 = 1; D3 = 0; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 6: D7=0, D6=0, D5=0, D4=0, D3=1, D2=0, D1=0, D0=0
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 1; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 7: D7=0, D6=0, D5=0, D4=0, D3=0, D2=1, D1=0, D0=0
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 1; D1 = 0; D0 = 0;
    #10;

    // Test case 8: D7=0, D6=0, D5=0, D4=0, D3=0, D2=0, D1=1, D0=0
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 1; D0 = 0;
    #10;

    // Test case 9: D7=0, D6=0, D5=0, D4=0, D3=0, D2=0, D1=0, D0=1
    D7 = 0; D6 = 0; D5 = 0; D4 = 0; D3 = 0; D2 = 0; D1 = 0; D0 = 1;
    #10;

    // Test case 10: D7=1, D6=1, D5=0, D4=0, D3=1, D2=0, D1=0, D0=0
    D7 = 1; D6 = 1; D5 = 0; D4 = 0; D3 = 1; D2 = 0; D1 = 0; D0 = 0;
    #10;

    // Test case 11: D7=0, D6=0, D5=1, D4=0, D3=0, D2=1, D1=1, D0=1
    D7 = 0; D6 = 0; D5 = 1; D4 = 0; D3 = 0; D2 = 1; D1 = 1; D0 = 1;
    #10;

    // Finish the simulation
    $finish;
end

endmodule

