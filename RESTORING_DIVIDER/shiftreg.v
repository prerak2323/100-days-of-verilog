module shiftreg(
input clr,inc,clk,
output reg [7:0]q
);

always @(posedge clk)begin
	if(clr) q<=0;
	else if(inc) q=q+1;
end
endmodule
