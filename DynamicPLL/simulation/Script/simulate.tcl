# ----------------------------------------
# Top-Level Simulation Script
# ----------------------------------------
# Set the output directory for simulation files
set QSYS_SIMDIR "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/simulation/moldesim"

# Source the generated IP simulation script
source $QSYS_SIMDIR/msim_setup.tcl

# Set any user-defined compilation options if needed
set USER_DEFINED_COMPILE_OPTIONS ""
set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""

# Call command to compile the Quartus EDA simulation library
dev_com

# Call command to compile the Quartus-generated IP simulation files
com

# Add commands to compile all design files and testbench files, including the top level
# Replace <design and testbench files> with the actual paths to your files
vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/your_design.v C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/test/TestPLL.v

# Set the top-level simulation or testbench module/entity name
set TOP_LEVEL_NAME tb_PLL

# Set any elaboration options if needed
set USER_DEFINED_ELAB_OPTIONS ""

# Call command to elaborate your design and testbench
elab

# Run the simulation
run -a

# Report success to the shell
exit -code 0
