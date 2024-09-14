module ALU(x,y,sum,sign,zero,carry,parity,overflow);
input [15:0]x,y;
output [15:0]sum;
output sign,zero,carry,parity,overflow;

assign {carry,sum}=x+y;

assign sign= sum[15];
assign zero= ~|sum;
assign parity= ~(^sum); //even parity
assign overflow = (x[15]&y[15]& (~sum[15])) | (~x[15]& ~y[15]& sum[15]);
endmodule
