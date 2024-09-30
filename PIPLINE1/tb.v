module tb;

reg [7:0]a,b,c,d;
wire [7:0]F;
reg clk;
pipe checkz(a,b,c,d,clk,F);

initial clk=1'b0;

always #5 clk=~clk;
initial begin
	#10 a=10; b=12; c=6; d=3; // f=75
	#20 a=10; b=10; c=5; d=3; //f=66
	$dumpfile("res.vcd"); $dumpvars;
	#1000 $finish;
	end
endmodule
