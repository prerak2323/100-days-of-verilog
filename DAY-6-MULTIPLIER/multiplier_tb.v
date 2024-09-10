`timescale 1ns / 1ps

module multiplier_tb;
    // Inputs
    reg CLK, START;
    reg [15:0] DATA_IN;
    
    // Outputs
    wire DONE;
    
    // Internal Wires
    wire [15:0] y;  // Product register output
    
    // Instantiate the Unit Under Test (UUT)
    mulriplier mal (
        .ZF(ZF),
        .LDA(LDA),
        .LDB(LDB),
        .LDP(LDP),
        .CLRP(CLRP),
        .DECB(DECB),
        .DATA_IN(DATA_IN),
        .CLK(CLK),
        .START(START)
    );
    CONTROLLER cc(LDA, LDB, LDP, CLRP, DECB, DONE, CLK, ZF, START);
    // Monitor the product register's output
    assign y = mal.y;  // `y` is the product output
    
    initial
        begin
        CLK=1'b0;
        #3 START = 1'b1;
        #500 $finish;
        end
always #5 CLK=~CLK;
initial
    begin
    #17 DATA_IN=2;
    #10 DATA_IN=3;
    end
endmodule
