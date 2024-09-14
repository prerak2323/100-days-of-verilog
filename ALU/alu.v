module alu(f,a,b,op);

// A SYMPLE 4 FUNCTION ALU
//7 bit , add,sub,mul,devide
input [7:0]a,b;
input [1:0]op;

output reg [7:0]f;

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;

always @(*) 
begin
	case(op)
		s0: f=a+b;
		s1: f=a-b;
		s2: f=a*b;
		s3: f=a/b;
	endcase
end 
endmodule
