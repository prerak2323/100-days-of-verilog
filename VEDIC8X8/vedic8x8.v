module vedic8x8(
    input [7:0] a,
    input [7:0] b,
    output [15:0] prod,
    output overflow
);

    wire [7:0] prodm2, prodm1, prodm0, prodm3, sums1, sums2;
    wire c1, c2;
    wire cnet = c1 | c2;
    wire ov1, ov2, ov3, ov4;

    vedic4x4 M0(
        .a(a[3:0]),
        .b(b[3:0]),
        .prod(prodm0),
        .overflow(ov1)
    );
    
    vedic4x4 M1(
        .a(a[3:0]),
        .b(b[7:4]),
        .prod(prodm1),
        .overflow(ov2)
    );
    
    vedic4x4 M2(
        .a(a[7:4]),
        .b(b[3:0]),
        .prod(prodm2),
        .overflow(ov3)
    );
    
    vedic4x4 M3(
        .a(a[7:4]),
        .b(b[7:4]),
        .prod(prodm3),
        .overflow(ov4)
    );
        
    csa8 stage1(
        .a(prodm1),
        .b(prodm2),
        .cin(1'b0),
        .sum(sums1),
        .cout(c1)
    );

    csa8 stage2(
        .a({4'b0, prodm0[7:4]}),
        .b(sums1),
        .cin(1'b0),
        .sum(sums2),
        .cout(c2)
    );
    
    csa8 stage3(
        .a({3'b0, cnet, sums2[7:4]}),
        .b(prodm3),
        .cin(1'b0),
        .sum(prod[15:8]),
        .cout(overflow)
    );
    
    assign prod[3:0] = prodm0[3:0];
    assign prod[7:4] = sums2[3:0];

endmodule

