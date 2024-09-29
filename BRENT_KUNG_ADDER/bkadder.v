module bkadder(a,b,cin,s,cout);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire [3:0]p,g;
wire p10,p32,p30,g10,g32,g30;


/*p[3:0] a[3:0] b[3:0] g[3:0] s[3:0] cout cin*/

assign p=a^b;
assign g=a&b;

assign p10=p[0]&p[1];
assign p32=p[3]&p[2];
assign p30=p32&p10;

assign g10=g[1] | (p[1]&g[0]);
assign g32=g[3] | (g[2]&p[3]);
assign g30=g32  | (p32&g10);

assign s[0]=p[0] ^ cin;
assign s[1]=p[1] ^ g[0];
assign s[2]=p[2] ^ g10;
assign s[3]=p[3] ^ g32;
assign cout=g32;
endmodule
