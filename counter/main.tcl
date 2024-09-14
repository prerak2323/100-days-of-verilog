# Read the Verilog file (replace 'top.v' with your Verilog file)
read_verilog counter_up_down.v

# Elaborate the design hierarchy (specify 'top' module as the top level)
hierarchy -check -top counter_up_down

# Translate Verilog processes (like always blocks) into netlists
proc

# Perform generic technology mapping (maps internal logic to basic cells)
techmap

# Mapping flip-flops (for processes like 'always @ (posedge clk)')
# Using the provided NangateOpenCellLibrary for standard cell mapping
dfflibmap -liberty ../../NangateOpenCellLibrary_typical.lib

# Mapping the combinational logic to the specified cell library
abc -liberty ../../NangateOpenCellLibrary_typical.lib

# Clean up unused cells and wires to optimize the design
clean

# Write the synthesized Verilog netlist (without attributes)
write_verilog -noattr synth_counter_up_down.v

select -module counter_up_down

# (Optional) Generate the graphical representation of the netlist
# Choose desired output format: PNG, SVG, etc.
show -format png -prefix synth__counter_up_down

