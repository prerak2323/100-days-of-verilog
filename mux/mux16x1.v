module mux16x1(IN,SEL,OUT);
input [15:0]IN;
input [3:0]SEL;
output OUT;

wire [3:0]t;

mux_4x1 m1(.in(IN[3:0]),.sel(SEL[1:0]),.out(t[0]));
mux_4x1 m2(.in(IN[7:4]),.sel(SEL[1:0]),.out(t[1]));
mux_4x1 m3(.in(IN[11:8]),.sel(SEL[1:0]),.out(t[2]));
mux_4x1 m4(.in(IN[15:12]),.sel(SEL[1:0]),.out(t[3]));
mux_4x1 m5(.in(t),.sel(SEL[3:2]),.out(OUT));

endmodule
