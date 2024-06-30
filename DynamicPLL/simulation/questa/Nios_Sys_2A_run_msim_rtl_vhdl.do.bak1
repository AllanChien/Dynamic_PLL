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


vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlog "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_normal_sim/PLL_normal.vho"                                                     
vcom "C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_MS_sim/PLL_MS.vho"                                                             

vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL.vho}
vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig.vho}
vlib PLL
vmap PLL PLL
vlog -vlog01compat -work PLL +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL/PLL_0002.v}
vlib PLL_Reconfig
vmap PLL_Reconfig PLL_Reconfig
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig/altera_pll_reconfig_top.v}
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig/altera_pll_reconfig_core.v}
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_Reconfig/altera_std_synchronizer.v}
vlib PLL_normal
vmap PLL_normal PLL_normal
vlog -vlog01compat -work PLL_normal +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_normal {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_normal/PLL_normal_0002.v}
vlib PLL_MS
vmap PLL_MS PLL_MS
vlog -vlog01compat -work PLL_MS +incdir+C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_MS {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/PLL_MS/PLL_MS_0002.v}
vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/pll_control.vhd}
vlib Nios_System_4A
vmap Nios_System_4A Nios_System_4A
vcom -93 -work Nios_System_4A {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/Nios_System_4A/synthesis/Nios_System_4A.vhd}
vcom -93 -work work {C:/UNI/Y4S1/P4P/p4p-2024-group57/Implementation_Test/QuartusProject/DynamicPLL/ConstLow.vhd}

