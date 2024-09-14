

module compa(a,b,gt,eq,lt);
// n bit comparator
input [15:0]a,b;
output reg gt,eq,lt;
always @(*)
begin
	gt=0; 
	lt=0;
	eq=0;
	if(a>b) gt=1;
	else if(a<b) lt=1;
	else eq=1;
end
endmodule





module comparator;
reg [15:0]a,b;
wire gt,eq,lt;

compa cc(.a(a),.b(b),.gt(gt),.lt(lt),.eq(eq));


initial 
begin
	$monitor($time," gt= %b lt= %b eq= %b",gt,lt,eq);
	a=10; b=5;
#10	a=10; b=10;
#10	a=5; b=10;
#50 $finish; 
end
endmodule




