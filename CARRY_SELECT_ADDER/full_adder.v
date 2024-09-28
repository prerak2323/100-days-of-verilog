module full_adder(sum,carry,cin,in0,in1);
input in0,in1,cin;
output carry;
output sum;

assign {carry,sum} = in0+in1+cin;

endmodule
