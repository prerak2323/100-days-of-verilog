module ram(data,addr,clk,wr,rd,cs);
input clk,wr,rd,cs;
input [9:0]addr;
inout [7:0]data;

reg [7:0]dout;
reg [7:0]mem[1023:0];

assign data= (cs&&rd) ? dout : 8'bz;

always @(posedge clk)
begin
	if(!rd & wr && cs) mem[addr] = data;
	else if(!wr & rd && cs) dout = mem[addr];
end 
endmodule
