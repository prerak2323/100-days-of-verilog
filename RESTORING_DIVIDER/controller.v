module controller(
input start,flag,clk,
output reg ldA,sel3,ldB,clrQ,incQ,
output reg done);
parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
reg [2:0]state;

always @(posedge clk) begin
	case(state)
		s0: if(start) state<=s1;
		s1: state<=s2;
		s2: if(flag) state<=s3;
		    else state<=s2;
	        s3:state<=s3;
	        default:state<=s0; 
	 endcase
                      end

always @(state)begin
	case(state)
		s0: begin ldA=1; sel3=0; ldB=0; clrQ=1; incQ=0; done=0;end
		s1: begin ldA=0; sel3=0; ldB=1; clrQ=0; end
		s2: begin ldA=1;ldB=0; incQ=1; sel3=1; end
		s3: begin incQ=0; done=1; end
 		default: begin ldA=1; sel3=0; ldB=0; clrQ=1; incQ=0; end
	endcase
                end
endmodule
