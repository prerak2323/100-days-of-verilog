/*module ALU(x,y,sum,sign,zero,carry,parity,overflow);
input [15:0]x,y;
output [15:0]sum;
output sign,zero,carry,parity,overflow; */

module ALU_tb;

reg [15:0]x,y;
wire [15:0]sum;
wire sign,zero,carry,parity,overflow;


ALU a(.x(x),.y(y),.sum(sum),.sign(sign),.zero(zero),.carry(carry),
.parity(parity),.overflow(overflow));

initial 
begin
	$dumpfile("alu_result.vcd"); $dumpvars(0,ALU_tb);
	#5 x=5; y=5;
	#5 x=6; y=7;
	#5 x=15; y=8;
	#5 x=14; y=9;
	#5 x=13; y=10;
	#5 x=12; y=11;
end
endmodule
