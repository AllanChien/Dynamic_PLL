

vcom       "C:/UNI/Y4S1/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlog -v2k5 "C:/UNI/Y4S1/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlog -v2k5 "C:/UNI/Y4S1/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlog -v2k5 "C:/UNI/Y4S1/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vcom       "C:/UNI/Y4S1/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 