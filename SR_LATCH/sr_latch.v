module sr_latch(
input rst,s,r,
output reg q);


always @(*)
begin
	if(rst)
		q<=1'b0;
	else
	begin
	case({s,r})
		2'b00: q<=q;
		2'b01: q<=1'b0;
		2'b10: q<=1'b1;
		2'b11: q<=1'bz;
		default : q<=1'bz;
	endcase
	end
end
endmodule
