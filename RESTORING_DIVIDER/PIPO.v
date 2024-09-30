module PIPO(
input [7:0]din,
input ld,
input clk,
output reg [7:0]dout);


always @(posedge clk)begin
	if(ld) dout<=din;

end
endmodule
