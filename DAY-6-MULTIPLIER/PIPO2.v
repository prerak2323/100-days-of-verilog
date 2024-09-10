// PIPO2 Module
module PIPO2(dout, din, ld, clr, clk);
    input [15:0] din;
    input clk, ld, clr;
    output reg [15:0] dout;

    always @(posedge clk) begin
        if (clr) dout <= 16'b0;
        else if (ld) dout <= din;
    end
endmodule