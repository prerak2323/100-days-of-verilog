# Read the Verilog file
read_verilog srlatch.v

# Check and set the top-level module
hierarchy -check -top srlatch

# Translate Verilog processes into netlists
proc

# Perform generic technology mapping
techmap

# Map flip-flops
dfflibmap -liberty ../../NangateOpenCellLibrary_typical.lib

# Map combinational logic
abc -liberty ../../NangateOpenCellLibrary_typical.lib

# Clean up unused cells and wires
clean

# Select the module
select -module srlatch

# Write the synthesized Verilog netlist
write_verilog -noattr synth_srlatch.v

# Generate the .dot file
show -format dot -prefix synth_srlatch

# In the terminal (outside Yosys), run dot to convert the .dot file to .svg
dot -Tsvg synth_srlatch.dot -o synth_srlatch.svg

