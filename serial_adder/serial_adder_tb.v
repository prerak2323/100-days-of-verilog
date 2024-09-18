module serial_adder_tb;


reg a,b;
reg clk;
wire sum,carry;

serial_adder srla(.a(a),.b(b),.clk(clk),.sum(sum),.carry(carry));

initial clk=1'b0;

always #5 clk=~clk;

initial
begin
	$monitor($time, "sum= %b carry= %b",sum,carry);
	#5 a=0; b=1;
	#15 a=0; b=0;
	#25 a=1; b=0;
	#35 a=0; b=0;
	#45 a=0; b=0;
	
	#100 $finish;
end

endmodule
