module bkadder_tb;


reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;
integer i;
bkadder check(a,b,cin,s,cout);

initial begin
	$monitor("%b + %b + %b = %b %b",a,b,cin,cout,s);
	for(i=0;i<10;i=i+1)begin
	#5	a=$random; b=$random; cin=$random; 
	end
	#1000 $finish;
end
endmodule
