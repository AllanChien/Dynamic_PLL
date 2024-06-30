set_global_assignment -entity "PLL_MS" -library "lib_PLL_MS" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_MS" -library "lib_PLL_MS" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "PLL_MS" -library "lib_PLL_MS" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_MS" -name SPD_FILE [file join $::quartus(sip_path) "PLL_MS.spd"]

set_global_assignment -library "lib_PLL_MS" -name MISC_FILE [file join $::quartus(sip_path) "PLL_MS_sim/PLL_MS.vho"]
