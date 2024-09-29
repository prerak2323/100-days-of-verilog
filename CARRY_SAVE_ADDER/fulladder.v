module fulladder(sum,carry,a,b,c);
input a,b,c;
output sum,carry;
wire sum,carry;
assign {carry,sum}=a+b+c;

endmodule
