module regbanktb;

reg [3:0]sr1,sr2,dr;
reg [8:0]din;
reg clk,write;
wire [8:0]dsr1,dsr2;

regbank rb(dsr1,dsr2,sr1,sr2,write,dr,din,clk);
integer i;
initial clk=1'b0;

always #5 clk=~clk;

initial
begin
$dumpfile("res.vcd"); $dumpvars;
	write=1;
	for(i=0;i<10;i=i+1)
	begin
		dr=i;
		din=$random;
		#10;
	end
	write =0;
	for(i=0;i<10;i=i+1)
	begin
		sr1=i;
		#10;
	end
	for(i=0;i<10;i=i+1)
	begin
		sr2=i;
		#10;
	end
	#100 $finish;
end

endmodule
