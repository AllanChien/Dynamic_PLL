library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Test is
    port (
        refclk      : in  std_logic;
        reset       : in  std_logic;
        reset_SM    : in  std_logic;
        mgmt_reset  : in  std_logic;
        C0          : out std_logic;
        C1          : out std_logic;
        locked      : out std_logic
    );
end entity Test;

architecture Behavioral of Test is

    signal mgmt_reset_wire       : std_logic;
    signal mgmt_read_wire        : std_logic;
    signal mgmt_write_wire       : std_logic;
    signal mgmt_address_wire     : std_logic_vector(5 downto 0);
    signal mgmt_writedata_wire   : std_logic_vector(31 downto 0);
    signal reconfig_from_pll_wire: std_logic_vector(63 downto 0);
    signal rst_wire              : std_logic;
    signal reconfig_to_pll_wire  : std_logic_vector(63 downto 0);
    signal reset_SM_wire         : std_logic;
    signal mgmt_readdata_wire    : std_logic_vector(31 downto 0);
    signal locked_wire           : std_logic;

begin

    b2v_inst: entity work.PLL_RECONFIG_AN
        port map (
            mgmt_clk        => refclk,
            mgmt_reset      => mgmt_reset_wire,
            mgmt_read       => mgmt_read_wire,
            mgmt_write      => mgmt_write_wire,
            mgmt_address    => mgmt_address_wire,
            mgmt_writedata  => mgmt_writedata_wire,
            reconfig_from_pll => reconfig_from_pll_wire,
            mgmt_readdata   => mgmt_readdata_wire,
            reconfig_to_pll => reconfig_to_pll_wire
        );

    b2v_inst1: entity work.PLL_AN
        port map (
            refclk          => refclk,
            rst             => rst_wire,
            reconfig_to_pll => reconfig_to_pll_wire,
            outclk_0        => C0,
            outclk_1        => C1,
            locked          => locked_wire,
            reconfig_from_pll => reconfig_from_pll_wire
        );

    b2v_inst3: entity work.Example_SM
        port map (
            clk             => refclk,
            reset           => reset_SM_wire,
            mgmt_readdata   => mgmt_readdata_wire,
            mgmt_read       => mgmt_read_wire,
            mgmt_write      => mgmt_write_wire,
            mgmt_address    => mgmt_address_wire,
            mgmt_writedata  => mgmt_writedata_wire
        );

    reset_SM_wire <= not reset_SM;
    rst_wire <= not reset;
    locked <= not locked_wire;
    mgmt_reset_wire <= not mgmt_reset;

end architecture Behavioral;
