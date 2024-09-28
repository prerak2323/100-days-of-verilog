module cs_adder_tb;

reg [3:0]a,b;
reg CIN;
wire [3:0]S;
wire COUT;

cs_adder csa(a,b,CIN,S,COUT);


initial 
begin
$monitor($time,"A = %d + B =%d == %d | carry = %d",a,b,S,COUT);
#13 a=12;
#13 b=2;
#13 CIN=0;
end
endmodule
