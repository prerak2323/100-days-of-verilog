module SUB(out,data1,data2);
input [15:0]data1,data2;
output reg [15:0]out;

always @(*)
out<=data1-data2;

endmodule
