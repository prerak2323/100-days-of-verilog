module freq_div(out,clk,rst);

input clk,rst;
output reg out;
reg [1:0]counter;
parameter odd_no=3;

always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
		counter<=0;
		out<=0;
	end
	else
		
		if(counter==odd_no-1)
		begin
			counter<=0;
			out<=~out;
		end
		else 
			counter<=counter+1;
end
endmodule
