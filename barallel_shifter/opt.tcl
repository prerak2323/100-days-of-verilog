# Read the Verilog files
read_verilog top.v
read_verilog mux8x1.v

# Elaborate the design hierarchy, ensuring 'top' is the top module
hierarchy -check -top top

# Translate Verilog processes to netlists
proc

flatten

# Clean up any unused cells and wires (optional, but good practice before techmap)
clean

opt

share -aggressive


# Perform technology mapping
techmap

# Map flip-flops using the specified Lib-erty file
dfflibmap -liberty ../../NangateOpenCellLibrary_typical.lib

# Map combinational logic using the ABC tool with the specified Liberty file
abc -liberty ../../NangateOpenCellLibrary_typical.lib

# Clean up unused cells and wires after mapping
clean

# Write the synthesized Verilog netlist to a file
write_verilog -noattr synth_opt.v

# Select the top module to generate the visual representation
select -module top

# Generate the graph as an SVG file
show -format svg -prefix synth_opt

# Optionally, report statistics (including area) after mapping
stat -liberty ../../NangateOpenCellLibrary_typical.lib




