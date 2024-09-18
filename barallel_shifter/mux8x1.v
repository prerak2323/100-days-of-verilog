module mux8x1(IN,SHIFT,OUT);
input [7:0]IN;
input [2:0]SHIFT;
output OUT;

assign OUT=IN[SHIFT];

endmodule
