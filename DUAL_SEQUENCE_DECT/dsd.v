module dsd(op,in,clk);
input clk,in;
output op;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101; 
reg [2:0]state;
always @(posedge clk)
begin
	case(state)
		s0: if(in==1) state<=s1;
	 	    else state<=s2;
	 	s1: if(in==1) state<=s1;
	 	    else state<=s3;
	 	s2: if(in==1) state<=s4;
	 	    else state<=s2;
	 	s3: if(in==1) state<=s4;
	 	    else state<=s2;
	        s4: if(in==1) state<=s5;
	 	    else state<=s3;
	        s5: if(in==1) state<=s1;
	 	    else state<=s3;
	 	default: state<=s0;
	 	endcase
end

assign op=(state==s3 & in==1)?1:0;
endmodule
