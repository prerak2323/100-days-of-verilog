module csa8 (
    input  [7:0] a,
    input  [7:0] b,
    input  cin,
    output [7:0] sum,
    output cout
);
    wire [7:0] sum0, sum1;
    wire [7:0] carry0, carry1;
    wire [7:0] carry;   // Intermediate carry

    // First bit: Generate sums and carries for both carry-in scenarios
    HalfAdder HA0_0 (
        .a(a[0]),
        .b(b[0]),
        .sum(sum0[0]),
        .carry(carry0[0])
    );

    FullAdder FA1_0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b1),
        .sum(sum1[0]),
        .carry(carry1[0])
    );

    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_csa
            FullAdder FA0 (
                .a(a[i]),
                .b(b[i]),
                .cin(1'b0),
                .sum(sum0[i]),
                .carry(carry0[i])
            );

            FullAdder FA1 (
                .a(a[i]),
                .b(b[i]),
                .cin(1'b1),
                .sum(sum1[i]),
                .carry(carry1[i])
            );
        end
    endgenerate

    // Select the correct sums and carries based on the carry-in
    assign sum[0] = cin ? sum1[0] : sum0[0];
    assign carry[0] = cin ? carry1[0] : carry0[0];

    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_select
            assign sum[i] = carry[i-1] ? sum1[i] : sum0[i];
            assign carry[i] = carry[i-1] ? carry1[i] : carry0[i];
        end
    endgenerate

    // Final carry-out
    assign cout = carry[7];

endmodule

