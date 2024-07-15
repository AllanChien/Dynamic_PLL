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
vlib Nios_Sys_2A_iputf_libs/PLL_Reconfig_Verilog
vmap PLL_Reconfig_Verilog ./Nios_Sys_2A_iputf_libs/PLL_Reconfig_Verilog
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                                   
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"          -work PLL_Reconfig        
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v"         -work PLL_Reconfig        
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"          -work PLL_Reconfig        
vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                                 
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig_Verilog
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig_Verilog
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig_Verilog
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/PLL_Reconfig_Verilog.v"                                                   

vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig.vho}
vlib PLL_Reconfig
vmap PLL_Reconfig PLL_Reconfig
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig/altera_pll_reconfig_top.v}
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig/altera_pll_reconfig_core.v}
vlog -vlog01compat -work PLL_Reconfig +incdir+C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig/altera_std_synchronizer.v}
vlib PLL_Reconfig_Verilog
vmap PLL_Reconfig_Verilog PLL_Reconfig_Verilog
vlog -vlog01compat -work PLL_Reconfig_Verilog +incdir+C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog/altera_std_synchronizer.v}
vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/pll_control.vhd}
vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/ConstLow.vhd}

vcom -93 -work work {C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/test/testPllControl.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -L PLL_Reconfig -L PLL_Reconfig_Verilog -L PLL_Reconfig -L PLL_Reconfig_Verilog -voptargs="+acc"  tb_pll_control

add wave *
view structure
view signals
run 10000 ns
