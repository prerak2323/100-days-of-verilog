module test_bench;
    
reg [7:0]in;
reg [2:0]shift;
wire [7:0]out;

top tt(.IN(in),.SHIFT(shift),.OUT(out));

initial 
begin
	$monitor("INPUT = %b  |  SHIFT = %b  | OUT = %b",in,shift,out);
	#10 in=8'b00010001; shift=3'b001;
	#10 in=8'b00010001; shift=3'b010;
	#10 in=8'b00010001; shift=3'b011;
	#10 in=8'b00010001; shift=3'b100;
	#10 in=8'b00010001; shift=3'b101;
	#10 in=8'b00010001; shift=3'b110;
	#10 in=8'b00010001; shift=3'b100;
	#100 $finish;
end
endmodule
