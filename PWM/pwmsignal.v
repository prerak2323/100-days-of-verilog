module pwmsignal(
input clk,rst,
output reg dout);
reg [3:0]count;
reg [3:0]ton;
reg ncyc;
parameter TP=5;
always @(posedge clk)
begin
	if(rst)
	begin
		count<=0;
		ton<=1;
		ncyc<=0;
	end
	else
	begin
		if(count<=ton)
		begin
			count<=count+1;
			dout<=1'b1;
			ncyc<=1'b0;
		end
		else if(count<TP)
		begin
			count<=count+1;
			dout<=1'b0;
			ncyc<=1'b0;
		end
		else 
		begin
		count<=0;
		ncyc<=1'b1;
		end
	end
end

always @(posedge clk)
begin
	if(ncyc)
		if(ton<TP)
			ton<=ton+1;
		else
			ton<=0;
end
endmodule
