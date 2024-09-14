module ring_counter(clk,ld,count);
input clk,ld;
output reg [7:0]count;

always @(posedge clk)
begin
	if(ld) count<=8'b1000_0000;
	else	begin
		count<=count<<1;
		count[0]<=count[7];
		end
end
endmodule

//alternatively it can also be done as count={count[6:0],count[7]}


