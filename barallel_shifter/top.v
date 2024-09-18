module top(IN, SHIFT, OUT);
    input [7:0] IN;
    input [2:0] SHIFT;
    output [7:0] OUT;

    // Correct port connection syntax for each mux8x1 instantiation
    mux8x1 m0 (
        .IN({IN[7], IN[6], IN[5], IN[4], IN[3], IN[2], IN[1], IN[0]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[0])
    );

    mux8x1 m1 (
        .IN({IN[0], IN[7], IN[6], IN[5], IN[4], IN[3], IN[2], IN[1]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[1])
    );

    mux8x1 m2 (
        .IN({IN[1], IN[0], IN[7], IN[6], IN[5], IN[4], IN[3], IN[2]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[2])
    );

    mux8x1 m3 (
        .IN({IN[2], IN[1], IN[0], IN[7], IN[6], IN[5], IN[4], IN[3]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[3])
    );

    mux8x1 m4 (
        .IN({IN[3], IN[2], IN[1], IN[0], IN[7], IN[6], IN[5], IN[4]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[4])
    );

    mux8x1 m5 (
        .IN({IN[4], IN[3], IN[2], IN[1], IN[0], IN[7], IN[6], IN[5]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[5])
    );

    mux8x1 m6 (
        .IN({IN[5], IN[4], IN[3], IN[2], IN[1], IN[0], IN[7], IN[6]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[6])
    );

    mux8x1 m7 (
        .IN({IN[6], IN[5], IN[4], IN[3], IN[2], IN[1], IN[0], IN[7]}),
        .SHIFT(SHIFT), 
        .OUT(OUT[7])
    );

endmodule

