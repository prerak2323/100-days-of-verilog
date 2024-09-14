//4 bit shift register

module shift_reg(clk,s_data,clr,out);

input clk,s_data,clr;
output reg out;
reg r0,r1,r2;

always @(posedge clk)
begin
	if(clr)	begin r0=0; r1=0; r2=0; out=0; end
	else begin r0=s_data;
		   r1=r0;
	           r2=r1;
	           out=r2;
	     end
end
endmodule
