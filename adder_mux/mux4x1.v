module mux4x1(out, b, a, in0, in1, in2, in3);
input in0, in1, in2, in3;
input a, b;
output reg out;

always @(*)
begin
	case({b,a})
		2'b00: out = in0;
		2'b01: out = in1;
		2'b10: out = in2;
		2'b11: out = in3;
	endcase
end
endmodule

