# Read the necessary Verilog files
read_verilog HalfAdder.v
read_verilog FullAdder.v
read_verilog csa4.v
read_verilog csa8.v
read_verilog vedic2x2.v
read_verilog vedic4x4.v
read_verilog vedic8x8.v

# Set the top module (replace async_fifo with the actual top module name)
hierarchy -top vedic8x8
#hierarchy -top cdc
# Perform generic optimizations
proc
clean

opt

share -aggressive

# Apply technology mapping
techmap
dfflibmap -liberty sky130.lib

# Use ABC tool for logic optimization with Liberty file
abc -liberty sky130.lib

# Clean up the design
clean

# Print statistics about the current design state
stat -liberty sky130.lib

# Generate SVG visualization for the specified top module
show -format svg -prefix async_fifo_synthesized_opt vedic8x8  # Specify top module here

# Write the final Verilog netlist without attributes, expressions, hexadecimal, or decimal
write_verilog -noattr -noexpr -nohex -nodec netlist_final_opt.v



