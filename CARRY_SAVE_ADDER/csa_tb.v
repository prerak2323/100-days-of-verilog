module csa_tb;

reg [3:0]A,B,C1;
wire [4:0]S;
wire COUT;
integer i;
carry_save_adder check(S,COUT,A,B,C1);
initial begin
	$monitor("%d + %d +%d= %d %d",A,B,C1,S,COUT);
	for(i=0;i<10;i=i+1)begin
	#10 A=$random; B=$random; C1=$random;
	$dumpfile("res.vcd"); $dumpvars;
	end

	#2000 $finish;
end
endmodule
