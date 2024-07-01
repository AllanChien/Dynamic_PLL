set_global_assignment -entity "PLL_Reconfig" -library "lib_PLL_Reconfig" -name IP_TOOL_NAME "altera_pll_reconfig"
set_global_assignment -entity "PLL_Reconfig" -library "lib_PLL_Reconfig" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "PLL_Reconfig" -library "lib_PLL_Reconfig" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_Reconfig" -name SPD_FILE [file join $::quartus(sip_path) "PLL_Reconfig.spd"]

set_global_assignment -library "lib_PLL_Reconfig" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_sim/PLL_Reconfig.vhd"]
set_global_assignment -library "lib_PLL_Reconfig" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"]
set_global_assignment -library "lib_PLL_Reconfig" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_sim/altera_pll_reconfig/altera_pll_reconfig_core.v"]
set_global_assignment -library "lib_PLL_Reconfig" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_sim/altera_pll_reconfig/altera_std_synchronizer.v"]
