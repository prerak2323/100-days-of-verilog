module ring_counter_tb;

reg clk,ld;
wire [7:0]count;

ring_counter rc(.clk(clk),.ld(ld),.count(count));

initial clk=1'b0;

always #5 clk=~clk;

initial 
begin
	$monitor($time, " count= %b", count);
	ld=1; 
#10	ld=0;
#1000	$finish;
end
endmodule
