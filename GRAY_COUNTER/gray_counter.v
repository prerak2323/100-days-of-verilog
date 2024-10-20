module gray_counter(
  input clk, rst,
  output reg [3:0] out
);
  reg [3:0] count;

  always @(posedge clk) begin
    if (rst)
    begin
      out <= 4'b0000;
      count<=4'b0000;
    end  
    else begin
      count <= count + 1;  // Increment the counter
      // Generate Gray code from binary counter
      out <= {count[3], count[3] ^ count[2], count[2] ^ count[1], count[1] ^ count[0]};
    end
  end
endmodule

