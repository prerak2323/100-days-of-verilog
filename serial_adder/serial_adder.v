module serial_adder(a,b,clk,sum,carry);

input a,b;
input clk;
output reg sum,carry;
reg state;
parameter s0=1'b0, s1=1'b1;

initial begin
        state = s0;
    end

always @(posedge clk)
begin
	case(state)
		s0:  if({a,b}==2'b00) begin state<=s0; sum=0;  end
		     else if({a,b}==2'b01) begin state<=s0; sum=1;  end
		     else if({a,b}==2'b10) begin state<=s0; sum=1;  end
		     else if({a,b}==2'b11) begin state<=s1; sum=0; end
		
		s1:  if({a,b}==2'b00) begin state<=s0; sum=1; end
		     else if({a,b}==2'b01) begin state<=s1; sum=1; end
		     else if({a,b}==2'b10) begin state<=s1; sum=1; end
		     else if({a,b}==2'b11) begin state<=s1; sum=0; end
		default: state<=s0;
	endcase
end

always @(*)
begin
	case(state)
		s0: carry=0;
		s1: carry=1;
		default: carry=0;
	endcase
end

endmodule
