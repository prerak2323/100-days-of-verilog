module file(rd_data1,rd_data2,src_add1,src_add2,wr_data_in,wr_data_add,write,clk);

output [31:0]rd_data1,rd_data2;
input [4:0]src_add1,src_add2;
input write,clk;
input [32:0]wr_data_in;
input [4:0]wr_data_add;
reg [31:0]mem[31:0];

assign rd_data1 = mem[src_add1];
assign rd_data2 = mem[src_add2];

always @(posedge clk)
begin
	if(write) mem[wr_data_add]=wr_data_in;
end
endmodule
