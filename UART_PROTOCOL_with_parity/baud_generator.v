module baud_generator(clk, rst, count, tx_enb);

input clk, rst;
output reg tx_enb;
input reg [7:0]count;
reg [7:0]check;


always @(posedge clk or posedge rst)
begin
	if(rst)
		begin
		check <= 0;
		tx_enb<=0;
		end
	else 
		begin
			if(check>0)
				begin
				check<=check-1;
				tx_enb<=0;
				end
			else	begin
				tx_enb<=1;
				check<=count;
				end
		end
end

endmodule
