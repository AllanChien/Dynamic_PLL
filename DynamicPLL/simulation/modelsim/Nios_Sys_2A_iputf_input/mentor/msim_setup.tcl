

vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlog "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vcom "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 
