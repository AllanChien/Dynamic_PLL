transcript on
if ![file isdirectory Nios_Sys_2A_iputf_libs] {
	file mkdir Nios_Sys_2A_iputf_libs
}

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


vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 

vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/pll_control.vhd}
vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/ConstLow.vhd}

vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/test/testPllControl.vhd}

vsim -suppress 10000 -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L PLL_Reconfig -voptargs="+acc"  tb_pll_control

add wave *
view structure
view signals
run 20000 ns
