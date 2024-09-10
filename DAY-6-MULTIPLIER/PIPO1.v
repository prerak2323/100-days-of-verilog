// PIPO1 (Parallel In, Parallel Out) Module
module PIPO1(dout, din, ld, clk);
    input [15:0] din;
    input clk, ld;
    output reg [15:0] dout;

    always @(posedge clk) begin
        if (ld) dout <= din;
    end
endmodule