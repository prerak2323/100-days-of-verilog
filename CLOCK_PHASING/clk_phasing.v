`timescale 1ns/1ps

module clk_phasing(clk_0,clk_90,clk_180,clk_270,clk,rst);
input clk,rst;
output clk_0,clk_90,clk_180,clk_270;
reg [1:0]count;
reg div;

always @(posedge clk or posedge rst)
begin
	if(rst)
		count<=0;
	else 
		count<={~count[0],count[1]};
end

always @(posedge clk or posedge rst)
begin
	if(rst) div<=0;
	else div<=~div;
end
assign clk_0=count[1];
assign clk_90=count[1]^div;
assign clk_180=~count[1];
assign clk_270=~clk_90;
endmodule
