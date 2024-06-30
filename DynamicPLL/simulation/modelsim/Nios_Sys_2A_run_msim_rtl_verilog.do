transcript on
if ![file isdirectory Nios_Sys_2A_iputf_libs] {
	file mkdir Nios_Sys_2A_iputf_libs
}

if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib vhdl_libs/cyclonev
vmap cyclonev ./vhdl_libs/cyclonev
vlog -vlog01compat -work cyclonev {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vcom -93 -work cyclonev {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cyclonev_atoms.vhd}
vcom -93 -work cyclonev {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cyclonev_components.vhd}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/20.1/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib Nios_Sys_2A_iputf_libs/PLL_Reconfig
vmap PLL_Reconfig ./Nios_Sys_2A_iputf_libs/PLL_Reconfig
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_normal_sim/PLL_normal.vho"                                                     
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_MS_sim/PLL_MS.vho"                                                             
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_MS_Verilog_sim/PLL_MS_Verilog.vo"                                              

vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/pll_control.vhd}
vlib Nios_System_4A
vmap Nios_System_4A Nios_System_4A
vcom -93 -work Nios_System_4A {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/Nios_System_4A/synthesis/Nios_System_4A.vhd}
vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/ConstLow.vhd}

