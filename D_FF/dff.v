module dff(
input d,rst,clk,
output reg q);


always @(posedge clk)
begin
	if(rst)
		q<=1'b0;
	else 
		q<=d;
end
endmodule
