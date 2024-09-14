module muxtb;

// Declare inputs as reg and output as wire
reg [15:0] IN;
reg [3:0] SEL;
wire OUT;

// Instantiate the mux16x1 module
mux16x1 m(.IN(IN), .SEL(SEL), .OUT(OUT));

initial 
begin
  // Create a VCD file for waveform analysis
  $dumpfile("sim_res.vcd"); 
  $dumpvars(0, muxtb); 

  // End simulation after 1000 time units
  #1000 $finish;
end

initial 
begin
  // Apply different inputs and selection signals
  #50 IN = 16'b0000_0000_0000_0001; SEL = 4'b0001;
  #50 IN = 16'b0000_0000_0000_0011; SEL = 4'b0010;
  #50 IN = 16'b0000_0000_0000_0101; SEL = 4'b0011;
  #50 IN = 16'b0000_0000_0000_1001; SEL = 4'b0100;
  #50 IN = 16'b0000_0000_0001_0001; SEL = 4'b0101;
  #50 IN = 16'b0000_0000_0010_0001; SEL = 4'b0110;
  #50 IN = 16'b0000_0000_0010_0001; SEL = 4'b0111;
  #50 IN = 16'b0000_0000_0100_0001; SEL = 4'b1000;
  #50 IN = 16'b0000_0000_1000_0001; SEL = 4'b1001;
end

endmodule

