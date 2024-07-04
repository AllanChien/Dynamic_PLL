

ncvhdl -v93 "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_sim/PLL.vho"                                                                                                                    
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"          -work PLL_Reconfig         -cdslib <<PLL_Reconfig>>        
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v"         -work PLL_Reconfig         -cdslib <<PLL_Reconfig>>        
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"          -work PLL_Reconfig         -cdslib <<PLL_Reconfig>>        
ncvhdl -v93 "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_sim/PLL_Reconfig.vhd"                                                                                                  
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"  -work PLL_Reconfig_Verilog -cdslib <<PLL_Reconfig_Verilog>>
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_core.v" -work PLL_Reconfig_Verilog -cdslib <<PLL_Reconfig_Verilog>>
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_std_synchronizer.v"  -work PLL_Reconfig_Verilog -cdslib <<PLL_Reconfig_Verilog>>
ncvlog      "C:/Y4S1/P4P/Dynamic_PLL/DynamicPLL/PLL_Reconfig_Verilog_sim/PLL_Reconfig_Verilog.v"                                                                                    
