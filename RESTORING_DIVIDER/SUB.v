module SUB(
    output reg signed [7:0] result, // Make result signed
    output reg flag,
    input signed [7:0] d1, d2
);

always @(*) begin
    result = d1 - d2;
    if (result < 0)
        flag = 1'b1;
    else
        flag = 1'b0;
end

endmodule

