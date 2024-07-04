

vhdlan -xlrm "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                                   
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"          -work PLL_Reconfig        
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v"         -work PLL_Reconfig        
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"          -work PLL_Reconfig        
vhdlan -xlrm "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                                 
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig_Verilog
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig_Verilog
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig_Verilog
vlogan +v2k  "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/PLL_Reconfig_Verilog.v"                                                   
