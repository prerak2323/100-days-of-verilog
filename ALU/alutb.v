module alutb;

/* alu(f,a,b,op);
input [7:0]a,b;
input [1:0]op;

output reg [7:0]f; */

reg [7:0]a,b;
reg [1:0]op;

wire [7:0]f;

alu cpu(.f(f),.a(a),.b(b),.op(op));

initial $monitor($time ," a= %b, b= %b, op= %b, f= %f",a,b,op,f);

initial 
begin
	op=2'b00; a=2; b=3;
#10	op=2'b01; a=14; b=2;
#10	op=2'b10; a=5; b=3;
#10	op=2'b11; a=4; b=2;
#50 $finish;
end
endmodule
