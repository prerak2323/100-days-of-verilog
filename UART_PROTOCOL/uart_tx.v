module uart_tx(clk, rst, count, data_byte, tx_dv, serial_out, tx_active, tx_done);
input clk, rst, tx_dv;
input [7:0]count;
input reg [7:0]data_byte;
output reg serial_out;
output reg tx_active, tx_done;


baud_generator baud_rate(clk, rst, count, tx_enb);

reg [2:0]state;
localparam ideal =2'b00;
localparam start =2'b01;
localparam data  =2'b10;
localparam stop  =2'b11;

reg [4:0]bit_index;
reg [7:0]r_data_byte;
always @(posedge clk or posedge rst)
begin
	if(rst)
		begin
			bit_index    <=0;
			state        <=ideal;
			tx_active    <=1'b0;
			tx_done      <=1'b0;
		end
	else
		begin
			case(state)
				ideal : begin
					serial_out  <=1'b1;
					tx_active   <=1'b0;
			                tx_done     <=1'b0;
			                r_data_byte <=data_byte;
					if(tx_dv)
						state <=start;
					else
						state <=ideal;
				 	end
				
				start : begin
					serial_out  <=1'b0;
					tx_active   <=1'b1;
					if(tx_enb)
						state <=data;
					else
						state <=start;
					end
				data : begin
				       serial_out <=r_data_byte[bit_index];
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
				       serial_out<=1'b1;
				      tx_active<=1'b0;
			              tx_done<=1'b1;
				       if(tx_enb)
				              state<=ideal;
				       else state<=stop;
				       end
			default : state<=ideal;
			endcase
		end
end

endmodule
