module mux_4x1(in,sel,out);
input [3:0]in;
input [1:0]sel;
output out;
assign out=in[sel];
endmodule
