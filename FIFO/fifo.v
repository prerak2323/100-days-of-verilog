module fifo(dout, din, full, empty, rst, wr, rd, clk);
    input rst, wr, rd, clk;
    input [7:0] din;
    output reg [7:0] dout;
    output full, empty;

    reg [7:0] mem[255:0];  // Memory array
    reg [7:0] wptr, rptr;  // Write and read pointers

    // Write logic
    always @(posedge clk) begin
        if (rst) begin
            wptr <= 0;
        end else if (wr && !full) begin  // Write only if not full
            mem[wptr] <= din;
            wptr <= wptr + 1; 
            if (wptr == 8'b1111_1111) wptr <= 0;  // Wrap-around logic for wptr
        end
    end

    // Read logic
    always @(posedge clk) begin
        if (rst) begin
            rptr <= 0;
        end else if (rd && !empty) begin  // Read only if not empty
            dout <= mem[rptr];
            rptr <= rptr + 1;
            if (rptr == 8'b1111_1111) rptr <= 0;  // Wrap-around logic for rptr
        end
    end

    // Full condition: FIFO is full when write pointer is just behind the read pointer
    assign full = ((wptr + 1 == rptr) || (wptr == 8'b1111_1111 && rptr == 8'b0000_0000)) ? 1 : 0;

    // Empty condition: FIFO is empty when read and write pointers are the same
    assign empty = (wptr == rptr) ? 1 : 0;

endmodule

