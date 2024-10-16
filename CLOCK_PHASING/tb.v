`timescale 1ns/1ps

module tb;

reg clk;
reg rst;
wire clk_0,clk_90,clk_180,clk_270;

clk_phasing test(clk_0,clk_90,clk_180,clk_270,clk,rst);

initial 
begin
	clk=0;
	forever #1 clk=~clk;
end
initial
begin
	rst=1;
	#5 rst=0;
	$dumpfile("res.vcd"); $dumpvars;
	#50 $finish;
end
endmodule
    

