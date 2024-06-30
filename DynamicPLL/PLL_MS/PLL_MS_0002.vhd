library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PLL_MS_0002 is
    port (
        refclk           : in  std_logic;
        rst              : in  std_logic;
        outclk_0         : out std_logic;
        locked           : out std_logic;
        reconfig_to_pll  : in  std_logic_vector(63 downto 0);
        reconfig_from_pll: out std_logic_vector(63 downto 0)
    );
end entity PLL_MS_0002;

architecture rtl of PLL_MS_0002 is

    component altera_pll is
        generic (
            fractional_vco_multiplier : string := "true";
            reference_clock_frequency : string := "50.0 MHz";
            pll_fractional_cout       : integer := 32;
            pll_dsm_out_sel           : string := "1st_order";
            operation_mode            : string := "direct";
            number_of_clocks          : integer := 1;
            output_clock_frequency0   : string := "100.000000 MHz";
            phase_shift0              : string := "0 ps";
            duty_cycle0               : integer := 50;
            pll_type                  : string := "Cyclone V";
            pll_subtype               : string := "Reconfigurable";
            m_cnt_hi_div              : integer := 4;
            m_cnt_lo_div              : integer := 4;
            n_cnt_hi_div              : integer := 256;
            n_cnt_lo_div              : integer := 256;
            m_cnt_bypass_en           : string := "false";
            n_cnt_bypass_en           : string := "true";
            m_cnt_odd_div_duty_en     : string := "false";
            c_cnt_hi_div0             : integer := 2;
            c_cnt_lo_div0             : integer := 2;
            c_cnt_prst0               : integer := 1;
            c_cnt_ph_mux_prst0        : integer := 0;
            c_cnt_in_src0             : string := "ph_mux_clk";
            c_cnt_bypass_en0          : string := "false";
            c_cnt_odd_div_duty_en0    : string := "false";
            pll_vco_div               : integer := 2;
            pll_cp_current            : integer := 20;
            pll_bwctrl                : integer := 4000;
            pll_output_clk_frequency  : string := "400.0 MHz";
            pll_fractional_division   : string := "1";
            mimic_fbclk_type          : string := "none";
            pll_fbclk_mux_1           : string := "glb";
            pll_fbclk_mux_2           : string := "m_cnt";
            pll_m_cnt_in_src          : string := "ph_mux_clk";
            pll_slf_rst               : string := "false"
        );
        port (
            refclk           : in  std_logic;
            rst              : in  std_logic;
            outclk           : out std_logic_vector(0 downto 0);
            locked           : out std_logic;
            reconfig_to_pll  : in  std_logic_vector(63 downto 0);
            reconfig_from_pll: out std_logic_vector(63 downto 0);
            fboutclk         : out std_logic;
            fbclk            : in  std_logic
        );
    end component;

begin

    altera_pll_i: altera_pll
        port map (
            refclk           => refclk,
            rst              => rst,
            outclk           => (outclk_0),
            locked           => locked,
            reconfig_to_pll  => reconfig_to_pll,
            reconfig_from_pll=> reconfig_from_pll,
            fboutclk         => open,
            fbclk            => '0'
        );

end architecture rtl;
