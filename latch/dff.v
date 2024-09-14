module dff(q, qbar, clk, rst, d);

input rst, clk, d;
output reg q, qbar;

// Asynchronous reset D flip-flop behavior
always @(posedge clk or posedge rst)
begin
    if (rst) begin
        q <= 0;
        qbar <= 1;
    end else begin
        q <= d;
        qbar <= ~d;
    end
end

endmodule

