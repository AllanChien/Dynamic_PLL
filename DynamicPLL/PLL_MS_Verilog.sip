set_global_assignment -entity "PLL_MS_Verilog" -library "lib_PLL_MS_Verilog" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_MS_Verilog" -library "lib_PLL_MS_Verilog" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "PLL_MS_Verilog" -library "lib_PLL_MS_Verilog" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_MS_Verilog" -name SPD_FILE [file join $::quartus(sip_path) "PLL_MS_Verilog.spd"]

set_global_assignment -library "lib_PLL_MS_Verilog" -name MISC_FILE [file join $::quartus(sip_path) "PLL_MS_Verilog_sim/PLL_MS_Verilog.vo"]
