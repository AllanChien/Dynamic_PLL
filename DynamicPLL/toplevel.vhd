library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity TopLevel is
	port (
		CLOCK_50      : in    std_logic;
		CLOCK2_50     : in    std_logic;
		CLOCK3_50     : in    std_logic;

		FPGA_I2C_SCLK : out   std_logic;
		FPGA_I2C_SDAT : inout std_logic;
		AUD_ADCDAT    : in    std_logic;
		AUD_ADCLRCK   : inout std_logic;
		AUD_BCLK      : inout std_logic;
		AUD_DACDAT    : out   std_logic;
		AUD_DACLRCK   : inout std_logic;
		AUD_XCK       : out   std_logic;

		KEY           : in    std_logic_vector(3 downto 0);
		SW            : in    std_logic_vector(9 downto 0);
		LEDR          : out   std_logic_vector(9 downto 0);
		HEX0          : out   std_logic_vector(6 downto 0);
		HEX1          : out   std_logic_vector(6 downto 0);
		HEX2          : out   std_logic_vector(6 downto 0);
		HEX3          : out   std_logic_vector(6 downto 0);
		HEX4          : out   std_logic_vector(6 downto 0);
		HEX5          : out   std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of TopLevel is

	signal clock : std_logic;

	
	component Nios_System_4A is 
	port (
			button_pio_external_connection_export : in  std_logic_vector(3 downto 0) := (others => '0'); -- button_pio_external_connection.export
			clocks_ref_clk_clk                    : in  std_logic                    := '0';             --                 clocks_ref_clk.clk
			clocks_ref_reset_reset                : in  std_logic                    := '0';             --               clocks_ref_reset.reset
			clocks_sdram_clk_clk                  : out std_logic;                                       --               clocks_sdram_clk.clk
			led_pio_external_connection_export    : out std_logic_vector(9 downto 0);                    --    led_pio_external_connection.export
			seg1_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    --   seg1_pio_external_connection.export
			seg2_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    --   seg2_pio_external_connection.export
			seg3_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    --   seg3_pio_external_connection.export
			seg4_pio_external_connection_export   : out std_logic_vector(6 downto 0);                    --   seg4_pio_external_connection.export
			switch_pio_external_connection_export : in  std_logic_vector(9 downto 0) := (others => '0')  -- switch_pio_external_connection.export
		);
	end component Nios_System_4A;
	
	
	
	component clk_divider is
	Port (
        clk_in : in STD_LOGIC;
        clk_out : out STD_LOGIC
    );
	end component clk_divider;

begin

	clock <= CLOCK_50;
	
	nios : component Nios_System_4A
		port map(
			clocks_ref_clk_clk => CLOCK_50,
			led_pio_external_connection_export => LEDR,
			seg1_pio_external_connection_export  => HEX0,
			seg2_pio_external_connection_export  => HEX1,
			seg3_pio_external_connection_export  => HEX2,
			seg4_pio_external_connection_export  => HEX3,
			switch_pio_external_connection_export => SW,
			button_pio_external_connection_export => KEY

		);

	

end architecture;
