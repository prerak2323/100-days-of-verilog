module dff(q,clk,rst);
input clk,rst;
output reg q;
always @(posedge clk)
begin
	if(rst)
		q<=0;
	else    q<=~q;
end
endmodule

