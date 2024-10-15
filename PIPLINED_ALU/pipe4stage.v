module pipe4stage(
input [3:0] rs1, rs2, rd, func,
input [7:0] addr,
input write, clk1, clk2, // multi-phased clock
output [15:0] zout
);

reg [15:0] l12_A, l12_B, l23_Z, l34_Z;
reg [3:0] l12_rd, l12_func, l23_rd;
reg [7:0] l12_addr, l23_addr, l34_addr;
reg [15:0] reg_bank[0:15]; // 16-bit x16 registers
reg [15:0] mem[0:255];     // 16-bit x256 memory

initial begin
    reg_bank[0] = 2;
    reg_bank[1] = 2;
    reg_bank[2] = 2;
    reg_bank[3] = 2;
    reg_bank[4] = 2;
    reg_bank[5] = 2;
    reg_bank[6] = 2;
    reg_bank[7] = 2;
    reg_bank[8] = 2;
    reg_bank[9] = 2;
    reg_bank[10] = 2;
    reg_bank[11] = 2;
    reg_bank[12] = 2;
    reg_bank[13] = 2;
    reg_bank[14] = 2;
    reg_bank[15] = 2;
end

assign zout = l34_Z;



always @(posedge clk1) begin
    l12_A     <= #2 reg_bank[rs1];
    l12_B     <= #2 reg_bank[rs2];
    l12_rd    <= #2 rd;
    l12_func  <= #2 func;
    l12_addr  <= #2 addr;
end

always @(negedge clk2) begin
    case(l12_func)  // Use l12_func instead of func
        0  : l23_Z <= #2 l12_A + l12_B;
        1  : l23_Z <= #2 l12_A - l12_B;
        2  : l23_Z <= #2 l12_A * l12_B;
        3  : l23_Z <= #2 l12_A;
        4  : l23_Z <= #2 l12_B;
        5  : l23_Z <= #2 l12_A && l12_B;
        6  : l23_Z <= #2 l12_A || l12_B;
        7  : l23_Z <= #2 (l12_A && (!l12_B) || (!l12_A && l12_B));
        8  : l23_Z <= #2 !l12_A;
        9  : l23_Z <= #2 !l12_B;
        10 : l23_Z <= #2 l12_A >> 1;
        11 : l23_Z <= #2 l12_A << 1;
        default : l23_Z <= 16'hxxxx; // Default case for invalid func
    endcase
    l23_rd   <= #2 l12_rd;
    l23_addr <= #2 l12_addr;
end

always @(posedge clk1) begin
    reg_bank[l23_rd] <= #2 l23_Z;
    l34_addr         <= #2 l23_addr;
    l34_Z            <= l23_Z;
end

always @(negedge clk2) begin
    if (write) begin
        mem[l34_addr] <= #2 l34_Z; // Write to memory only if write is enabled
    end
end

endmodule

