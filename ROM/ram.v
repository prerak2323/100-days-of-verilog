module ram(dout,din,addr,wr,cs,clk);
input wr,cs,clk;
input [9:0]addr;
input [7:0]din;
output [7:0]dout;

reg [7:0]mem[1023:0];

always @(posedge clk)
begin
	if(cs && wr) mem[addr]<=din;
end
assign dout = mem[addr];
endmodule
