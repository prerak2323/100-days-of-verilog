module filetb;


wire [31:0]rd_data1,rd_data2;
reg [4:0]src_add1,src_add2;
reg write,clk;
reg [32:0]wr_data_in;
reg [4:0]wr_data_add;

file ff(rd_data1,rd_data2,src_add1,src_add2,wr_data_in,wr_data_add,write,clk);
integer i=0;

initial clk=1'b0;

always #5 clk=~clk;
initial 
begin
$dumpfile("res.vcd"); $dumpvars;
	#2 write =1;
	for (i=0;i<32;i=i+1)
	begin
		wr_data_add=i;
		wr_data_in=$random;
		#10;
	end
		#2 write =0;
	for (i=0;i<32;i=i+1)
	begin
		src_add1=i;
		#10;
	end
	for (i=0;i<32;i=i+1)
	begin
		src_add2=i;
		#10;
	end
	#1000 $finish;
end
endmodule
