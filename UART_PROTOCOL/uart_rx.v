module uart_rx(clk, rst, count, data_byte, serial_in, rx_active, rx_done);
input clk, rst;
input [7:0]count;
output reg [7:0]data_byte;
input reg serial_in;
output reg rx_active, rx_done;


baud_generator baud_rate(clk, rst, count, tx_enb);

reg [2:0]state;
localparam ideal =2'b00;
localparam start =2'b01;
localparam data  =2'b10;
localparam stop  =2'b11;

reg [4:0]bit_index;

always @(posedge clk or posedge rst)
begin
	if(rst)
		begin
			bit_index    <=0;
			state        <=ideal;
			rx_active    <=1'b0;
			rx_done      <=1'b0;
		end
	else
		begin
			case(state)
				ideal : begin
					rx_active   <=1'b0;
			                rx_done     <=1'b0;
			                data_byte<=1;
					if(!serial_in)
						state <=start;
					else
						state <=ideal;
				 	end
				
				start : begin
					data_byte<=0;
					rx_active   <=1'b1;
					if(tx_enb)
						state <=data;
					else
						state <=start;
					end
				data : begin
				       data_byte[bit_index]<=serial_in;
				       if(tx_enb)
						if(bit_index<7)
							begin
								bit_index <=bit_index+1;
								state     <=data;
							end
						else 
							begin
								bit_index<=0;
								state<=stop;
							end	
					else state<=data;
					end
				stop : begin
				       rx_active<=1'b0;
			               rx_done<=1'b1;
				       if(tx_enb)
				              state<=ideal;
				       else state<=stop;
				       end
			default : state<=ideal;
			endcase
		end
end

endmodule
