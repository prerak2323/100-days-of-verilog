module PIPO(output reg [15:0]dout,
	    input [15:0]din,
	    input clk,ld);
	    
always @(posedge clk)
if(ld) dout<=din;

endmodule
