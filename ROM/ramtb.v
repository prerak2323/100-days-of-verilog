module ramtb;


reg [7:0]din;
reg [9:0]addr;
reg wr,cs;
reg clk;
wire [7:0]dout;
integer i;
ram rr(dout,din,addr,wr,cs,clk);

initial clk=1'b0;

always #5 clk = ~clk;

initial
begin
$monitor($time, " in : %d | out : %d",din,dout);
	cs=1; wr=1;
	for(i=0; i<1024; i=i+1)
	begin
		addr=i;
		din=$random;
		#2;
	end
	
	wr=0;
	for(i=0; i<1024; i=i+1)
	begin
		addr=i;
		#2;
	end
	#1500 $finish;
end
endmodule
