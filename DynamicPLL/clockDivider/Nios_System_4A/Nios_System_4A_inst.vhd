	component Nios_System_4A is
		port (
			button_pio_external_connection_export : in  std_logic_vector(2 downto 0) := (others => 'X'); -- export
			clocks_ref_clk_clk                    : in  std_logic                    := 'X';             -- clk
			clocks_ref_reset_reset                : in  std_logic                    := 'X';             -- reset
			clocks_sdram_clk_clk                  : out std_logic;                                       -- clk
			led_pio_external_connection_export    : out std_logic_vector(9 downto 0);                    -- export
			seg1_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    -- export
			seg2_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    -- export
			seg3_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    -- export
			seg4_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    -- export
			switch_pio_external_connection_export : in  std_logic_vector(9 downto 0) := (others => 'X')  -- export
		);
	end component Nios_System_4A;

	u0 : component Nios_System_4A
		port map (
			button_pio_external_connection_export => CONNECTED_TO_button_pio_external_connection_export, -- button_pio_external_connection.export
			clocks_ref_clk_clk                    => CONNECTED_TO_clocks_ref_clk_clk,                    --                 clocks_ref_clk.clk
			clocks_ref_reset_reset                => CONNECTED_TO_clocks_ref_reset_reset,                --               clocks_ref_reset.reset
			clocks_sdram_clk_clk                  => CONNECTED_TO_clocks_sdram_clk_clk,                  --               clocks_sdram_clk.clk
			led_pio_external_connection_export    => CONNECTED_TO_led_pio_external_connection_export,    --    led_pio_external_connection.export
			seg1_pio_external_connection_export   => CONNECTED_TO_seg1_pio_external_connection_export,   --   seg1_pio_external_connection.export
			seg2_pio_external_connection_export   => CONNECTED_TO_seg2_pio_external_connection_export,   --   seg2_pio_external_connection.export
			seg3_pio_external_connection_export   => CONNECTED_TO_seg3_pio_external_connection_export,   --   seg3_pio_external_connection.export
			seg4_pio_external_connection_export   => CONNECTED_TO_seg4_pio_external_connection_export,   --   seg4_pio_external_connection.export
			switch_pio_external_connection_export => CONNECTED_TO_switch_pio_external_connection_export  -- switch_pio_external_connection.export
		);

