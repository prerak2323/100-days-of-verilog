module controller(ldA, ldB, sel1, sel2, sel_load, done, lt, gt, eq, clk, start);
    input clk, lt, gt, eq, start;
    output reg ldA, ldB, done, sel_load, sel1, sel2;

    reg [2:0] state;
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;

    // Sequential state transition logic
    always @(posedge clk)
    begin
        case (state)
            s0: if (start) state <= s1;
            s1: state <= s2;
            s2: if (lt) state <= s3;
                else if (gt) state <= s4;
                else if (eq) state <= s5;
            s3: if (lt) state <= s3;
                else if (gt) state <= s4;
                else if (eq) state <= s5;
            s4: if (lt) state <= s3;
                else if (gt) state <= s4;
                else if (eq) state <= s5;
            s5: state <= s5;
            default: state <= s0;
        endcase
    end

    // Combinational control signal logic
    always @(state)
    begin
        case (state)
            s0: begin  
                sel_load = 1;
                ldA = 1; 
                ldB = 0; 
                done = 0; 
            end

            s1: begin  
                sel_load = 1; 
		ldA = 0;
                ldB = 1; 
            end

            s2: if (lt) begin 
                    sel1 = 0; 
                    sel2=1;
                    sel_load = 0; 
                    ldA=0; ldB = 1; 
                end
                else if (gt) begin 
                    sel1 = 1; 
                    sel2 = 0; 
                    sel_load = 0;
                    ldB=0; ldA=1; 
                end
                else if (eq)  
                    done = 1; 
                      

            s3:if (lt) begin 
                    sel1 = 0; 
                    sel2=1;
                    sel_load = 0; 
                    ldA=0; ldB = 1; 
                end
                else if (gt) begin 
                    sel1 = 1; 
                    sel2 = 0; 
                    sel_load = 0;
                    ldB=0; ldA = 1; 
                end
                else if (eq)  
                    done = 1; 
                
            s4: if (lt) begin 
                    sel1 = 0; 
                    sel2=1;
                    sel_load = 0; 
                    ldA=0; ldB = 1; 
                end
                else if (gt) begin 
                    sel1 = 1; 
                    sel2 = 0; 
                    sel_load = 0;
                    ldB=0; ldA = 1; 
                end
                else if (eq)  
                    done = 1; 
       
                
            s5: begin 
                done=1;
                ldA=0;
                ldB=0; 
            end

            default: begin 
                ldA = 0; 
                ldB = 0; 
            end
        endcase
    end
endmodule

