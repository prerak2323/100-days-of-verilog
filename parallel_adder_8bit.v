//8 bit parallel adder 8 bit using operater assignments 
module parallel_adder_8bit(sum,cout,in1,in2,cin);
input [7:0]in1,in2;
input cin;
output [7:0]sum;
output cout;

assign #10 {cout,sum} = in1+in2+cin;
endmodule
