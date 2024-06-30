
module Nios_System_4A (
	button_pio_external_connection_export,
	clocks_ref_clk_clk,
	clocks_ref_reset_reset,
	clocks_sdram_clk_clk,
	led_pio_external_connection_export,
	seg1_pio_external_connection_export,
	seg2_pio_external_connection_export,
	seg3_pio_external_connection_export,
	seg4_pio_external_connection_export,
	switch_pio_external_connection_export);	

	input	[2:0]	button_pio_external_connection_export;
	input		clocks_ref_clk_clk;
	input		clocks_ref_reset_reset;
	output		clocks_sdram_clk_clk;
	output	[9:0]	led_pio_external_connection_export;
	output	[6:0]	seg1_pio_external_connection_export;
	output	[6:0]	seg2_pio_external_connection_export;
	output	[6:0]	seg3_pio_external_connection_export;
	output	[6:0]	seg4_pio_external_connection_export;
	input	[9:0]	switch_pio_external_connection_export;
endmodule
