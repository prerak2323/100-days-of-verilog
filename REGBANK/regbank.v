module regbank(dsr1,dsr2,sr1,sr2,write,dr,din,clk);

input [3:0]sr1,sr2,dr;
input [8:0]din;
input clk,write;
output reg [8:0]dsr1,dsr2;
reg [8:0]r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;


always @(*)
begin
	case(sr1)
		0 : dsr1=r0;
		1 : dsr1=r1;
		2 : dsr1=r2;
		3 : dsr1=r3;
		4 : dsr1=r4;
		5 : dsr1=r5;
		6 : dsr1=r6;
		7 : dsr1=r7;
		8 : dsr1=r8;
		9 : dsr1=r9;
		default : dsr1 =r0;
		endcase
end


always @(*)
begin
	case(sr2)
		0 : dsr2=r0;
		1 : dsr2=r1;
		2 : dsr2=r2;
		3 : dsr2=r3;
		4 : dsr2=r4;
		5 : dsr2=r5;
		6 : dsr2=r6;
		7 : dsr2=r7;
		8 : dsr2=r8;
		9 : dsr2=r9;
		default : dsr2 =r0;
endcase
end

always @(posedge clk)
begin
	if(write) 
		begin
			case(dr)
				0:r0<=din;
				1:r1<=din;
				2:r2<=din;
				3:r3<=din;
				4:r4<=din;
				5:r5<=din;
				6:r6<=din;
				7:r7<=din;
				8:r8<=din;
				9:r9<=din;
default : r0<=din;
endcase				
		end	
end

endmodule

