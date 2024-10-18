module dualportram(
    input [7:0] data_in,
    input clk,
    input port_A_enb, port_B_enb,
    output [7:0] data_out_A, data_out_B,
    input [4:0] addr,
    input wr_en
);

    reg [7:0] RAM [0:31];  // Memory array from address 0 to 31

    // Write operation: Write to RAM based on enable and write signals
    always @(posedge clk) begin
        if (wr_en) begin
            if (port_A_enb) 
                RAM[addr] <= data_in;  // Write to address from Port A
            else if (port_B_enb) 
                RAM[addr] <= data_in;  // Write to address from Port B
        end
    end

    // Read operations
    assign data_out_A = (port_A_enb) ? RAM[addr] : 8'bz;  // Read from Port A
    assign data_out_B = (port_B_enb) ? RAM[addr] : 8'bz;  // Read from Port B

endmodule

