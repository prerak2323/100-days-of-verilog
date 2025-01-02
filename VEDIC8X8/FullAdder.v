module FullAdder (
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    wire ha1_sum, ha1_carry, ha2_carry;

    // First Half Adder
    HalfAdder HA1 (
        .a(a),
        .b(b),
        .sum(ha1_sum),
        .carry(ha1_carry)
    );

    // Second Half Adder
    HalfAdder HA2 (
        .a(ha1_sum),
        .b(cin),
        .sum(sum),
        .carry(ha2_carry)
    );

    // Carry-out
    assign carry = ha1_carry | ha2_carry;

endmodule


