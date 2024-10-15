module adder(A, B, CIN, SUM, COUT);
input A, B, CIN;
output SUM, COUT;

// Wires for intermediate calculations
wire notA, xor1, and1, and2;

// Invert A for use in mux4x1
assign notA = ~A;

// Implement the SUM using the mux4x1 (A XOR B XOR CIN)
mux4x1 S(SUM, B, CIN, A, notA, notA, A);

// Implement the CARRY using the mux4x1 (A AND B) OR (B AND CIN) OR (A AND CIN)
mux4x1 C(COUT, B, CIN, A, A, A, notA);

endmodule

