

vhdlan -xlrm "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                   
vlogan +v2k  "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig
vlogan +v2k  "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig
vlogan +v2k  "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig
vhdlan -xlrm "C:/UNI/Y4S1/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                 
