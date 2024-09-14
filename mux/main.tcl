# Read the Verilog files
read_verilog mux16x1.v
read_verilog mux_4x1.v

# Elaborate the design hierarchy
hierarchy -check -top mux16x1

# Translate Verilog processes
proc

# Perform technology mapping
techmap

# Map flip-flops using the specified Liberty file
dfflibmap -liberty ../../NangateOpenCellLibrary_typical.lib

# Map combinational logic
abc -liberty ../../NangateOpenCellLibrary_typical.lib

# Clean up unused cells and wires
clean

# Write the synthesized Verilog netlist
write_verilog -noattr synth_example.v

# Generate Graphviz representation (only one module should be selected for formats other than 'dot' or 'ps')
select -module mux16x1

show -format png -prefix synth_example
