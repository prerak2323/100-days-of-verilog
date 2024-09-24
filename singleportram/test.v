module tb_ram;

  // Inputs
  reg clk;
  reg wr;
  reg rd;
  reg cs;
  reg [9:0] addr;
  reg [7:0] data_in;  // Data to be written (input during write)

  // Bidirectional data line (input during write, output during read)
  wire [7:0] data;

  // Assign data to be driven only during write operations
  assign data = (wr && !rd) ? data_in : 8'bz;

  // Instantiate the RAM module
  ram spr (
    .clk(clk),
    .wr(wr),
    .rd(rd),
    .cs(cs),
    .addr(addr),
    .data(data)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;  // Toggle clock every 5 time units

  integer i;

  initial begin
    $display("Starting RAM test...");

    // Initialize signals
    cs = 0; wr = 0; rd = 0; addr = 0; data_in = 8'b0;

    // Enable the chip select (cs)
    #10 cs = 1;

    // Write data to every memory location
    for (i = 0; i < 1024; i = i + 1) begin
      addr = i;
      data_in = i[7:0];   // Write lower 8 bits of index to memory
      wr = 1; rd = 0;     // Enable write operation
      #10;                // Wait for 10 time units
    end

    wr = 0;  // Disable write after all writes are done

    // Read data from every memory location
    for (i = 0; i < 1024; i = i + 1) begin
      addr = i;
      wr = 0; rd = 1;  // Enable read operation
      #10;  // Wait for 10 time units

      // Check if the data read matches the data written
      if (data !== i[7:0])
        $display("Test Failed at address %d! Expected: %h, Got: %h", i, i[7:0], data);
      else
        $display("Address %d: Read %h successfully", i, data);
    end

    rd = 0;  // Disable read operation
    cs = 0;  // Disable chip select

    $display("RAM Test Completed!");
    $finish;  // End the simulation
  end

endmodule

