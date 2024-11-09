`timescale 1ns / 1ps

module tb;


reg [7:0]data_in;
wire [7:0]data_out;

reg r_en, w_en, wclk, rclk, wrst_n, rrst_n;
wire full, empty;


    async_fifo dut(
    wclk,
    rclk,
    r_en,
    w_en,
    rrst_n,
    wrst_n,
    data_in,
    full,
    empty,
    data_out
);

integer i=0;
integer seed=1;

always #5 wclk=~wclk;
always #10 rclk=~rclk;

initial 
begin
$dumpfile("res.vcd"); $dumpvars;
	wclk=0;
	rclk=0;
	wrst_n=1;
	rrst_n=1;
	w_en=0;
	r_en=0;
	data_in=0;
	
	#40 wrst_n=0; rrst_n=0;
	#40 wrst_n=1; rrst_n=1;
	
	
	
	r_en=0;
	w_en=1;
	for(i=0;i<20;i=i+1)
	begin
		data_in=$random(seed)%256;
		#10;
	end
	
	w_en=0;
	r_en=1;
	for(i=0;i<20;i=i+1)
	begin
		#20;
	end
	
	$finish;
end

endmodule
