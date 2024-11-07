module fifo_memory(
    input wclk_en,
    input full,
    input wclk,
    input [7:0] data_in,
    input [3:0] raddr,
    input [3:0] waddr,
    output [7:0]data_out
);

    reg [7:0]fifo[0:15];

    always @(posedge wclk) 
    begin
        if (wclk_en && !full) 
            fifo[waddr] <= data_in; 
    end

assign data_out=fifo[raddr];

endmodule

