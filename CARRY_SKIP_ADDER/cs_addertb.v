module cs_addertb;

reg [7:0]A,B;
reg CIN;
wire COUT;
wire [7:0]S;
cs_adder asa(A,B,CIN,S,COUT);


initial
begin
$monitor("%d + %d = %d %d",A,B,COUT,S);
#5 A=5; B=4; CIN=0;
end

endmodule
