module parallel_adder_8bit_tb;

/*input [7:0]in1,in2;
input cin;
output [7:0]sum;
output cout;
*/

reg [7:0]in1,in2;
reg cin;
wire [7:0]sum;
wire cout;

parallel_adder_8bit PA(.sum(sum),
		      .cout(cout),
		      .in1(in1),
		      .in2(in2),
		      .cin(cin));
		   
initial 
begin
	$dumpfile("parallel_adder_8bit_result.vcd"); $dumpvars(0,parallel_adder_8bit_tb);
	 in1=10; in2=5; cin=0;
	#11 in1=11; in2=6; cin=1;
	#11 in1=12; in2=7; cin=0;
	#11 in1=13; in2=8; cin=1;
	#11 in1=14; in2=9; cin=0;
	#11 in1=15; in2=10; cin=1;
end
initial # 1000 $finish;
endmodule
