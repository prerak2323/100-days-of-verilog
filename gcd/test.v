module test;

reg [15:0] data_in;
reg clk, start;
wire done;


  gcd_top DP (ldA,ldB,sel1,sel2,sel_in,clk,data_in,gt,lt,eq);
  controller CON (clk,lt,gt,eq,start,ldA,ldB,sel1,sel2,sel_in,done);

initial 
    begin
        clk = 1'b0;
        #3 start = 1'b1;
        #1000 $finish;
    end
    
always #5 clk = ~clk; // Clock period = 10 //
    
initial 
    begin
        #4 data_in = 143;
        #10 data_in    = 78;
    end

initial 
        begin
            $monitor($time, "GCD = %d Status = %b",DP.Aout,done);
            $dumpfile ("gcd.vcd");
            $dumpvars(0,test);
        end    
        
endmodule

