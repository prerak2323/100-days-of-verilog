module test;

reg [15:0]data_in;
reg clk,start;
wire done;

data_path DP(lt,gt,eq,ldA,ldB,sel1,sel2,sel_load,clk,data_in);
controller CON(ldA,ldB,sel1,sel2,sel_load,done,lt,gt,eq,clk,start);

initial
	begin
		clk=1'b0;
		#3 start = 1'b1;
		#1000 $finish;
	end
	
always #5 clk=~clk; 
initial
	begin
	#12 data_in = 143;
	#10 data_in = 78;
	end
	
initial
	begin
	$monitor($time, " %d-GCD %b-done",DP.Aout,done);
	$dumpfile("gcd.vcd");
	$dumpvars(0,test);
	end

endmodule

