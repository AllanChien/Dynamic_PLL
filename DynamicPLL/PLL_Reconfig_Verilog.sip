set_global_assignment -entity "PLL_Reconfig_Verilog" -library "lib_PLL_Reconfig_Verilog" -name IP_TOOL_NAME "altera_pll_reconfig"
set_global_assignment -entity "PLL_Reconfig_Verilog" -library "lib_PLL_Reconfig_Verilog" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "PLL_Reconfig_Verilog" -library "lib_PLL_Reconfig_Verilog" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_Reconfig_Verilog" -name SPD_FILE [file join $::quartus(sip_path) "PLL_Reconfig_Verilog.spd"]

set_global_assignment -library "lib_PLL_Reconfig_Verilog" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_Verilog_sim/PLL_Reconfig_Verilog.v"]
set_global_assignment -library "lib_PLL_Reconfig_Verilog" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_top.v"]
set_global_assignment -library "lib_PLL_Reconfig_Verilog" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_pll_reconfig_core.v"]
set_global_assignment -library "lib_PLL_Reconfig_Verilog" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Reconfig_Verilog_sim/altera_pll_reconfig/altera_std_synchronizer.v"]
