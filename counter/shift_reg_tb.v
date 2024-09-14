/* module shift_reg(clk,s_data,clr,out);

input clk,s_data,clr;
output reg out;
reg r0,r1,r2; */

module shift_reg_tb;

reg clk,s_data,clr;
wire out;

shift_reg sfr(.clk(clk),.s_data(s_data),.clr(clr),.out(out));

initial clk=1'b0;

always #5 clk=~clk;

initial 
begin
	$monitor($time, " SERIAL IN= %b |  OUT= %b",s_data,out);
	s_data=1'b0;
#10	s_data=1'b0;
#10	s_data=1'b0;
#10	s_data=1'b1;
#10	s_data=1'b0;
#10	s_data=1'b0;
#10	s_data=1'b0;
#10	s_data=1'b1;
#500 $finish;
end
endmodule
