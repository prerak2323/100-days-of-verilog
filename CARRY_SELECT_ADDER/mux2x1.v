module mux2x1(out,sel,in0,in1);
input sel;
input in0,in1;
output out;

assign out = sel?in1:in0;
endmodule
