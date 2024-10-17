module freq_div(clk,rst,div2,div4,div8,div16,div32);
input clk,rst;
output reg div2,div4,div8,div16,div32;
reg [4:0]count;
always @(posedge clk)
begin
	if(rst)
		count<=0;
	else
	begin
		div2<=count[0];
		div4<=count[1];
		div8<=count[2];
		div16<=count[3];
		div32<=count[4];
		count<=count+1'b1;
	end
end
endmodule

