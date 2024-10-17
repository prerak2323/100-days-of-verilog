module ohfsm(out, clk);
input clk;
output reg [2:0] out;
reg [3:0] state;  // 4-bit register for one-hot states

// One-hot encoded state parameters
parameter s0 = 4'b0001, 
          s1 = 4'b0010, 
          s2 = 4'b0100, 
          s3 = 4'b1000;

always @(posedge clk) begin
    case (state)
        s0: begin
            state <= s1;  // Transition to next state
            out <= 0;     // Set output
        end
        s1: begin
            state <= s2;
            out <= 1;
        end
        s2: begin
            state <= s3;
            out <= 2;
        end
        s3: begin
            state <= s0;  // Loop back to the first state
            out <= 3;
        end
        default: begin
            state <= s0;  // Default to the initial state in case of error
            out <= 0;
        end
    endcase
end
endmodule
