module counter_up_down(din,clr,ld,clk,mode,count);

input [7:0]din;
input clk,clr,ld,mode;
// mode =0 up counter mode=1 down counter

output reg [7:0]count;

always @(posedge clk)
begin
	if(ld)		count<=din;
	else if(clr)	count<=0;
	else if(mode)	count<=count-1;
	else 		count<=count+1;
end
endmodule


