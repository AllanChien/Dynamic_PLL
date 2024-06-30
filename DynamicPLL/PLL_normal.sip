set_global_assignment -entity "PLL_normal" -library "lib_PLL_normal" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_normal" -library "lib_PLL_normal" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "PLL_normal" -library "lib_PLL_normal" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_normal" -name SPD_FILE [file join $::quartus(sip_path) "PLL_normal.spd"]

set_global_assignment -library "lib_PLL_normal" -name MISC_FILE [file join $::quartus(sip_path) "PLL_normal_sim/PLL_normal.vho"]
