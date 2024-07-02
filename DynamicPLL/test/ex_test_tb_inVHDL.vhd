-- synopsys translate_off
`timescale 1 ps / 1 ps
-- synopsys translate_on

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Test_tb is
end Test_tb;

architecture Behavioral of Test_tb is
    signal refclk_p       : std_logic := '0';
    signal reset_p        : std_logic := '1';
    signal reset_SM_p     : std_logic := '1';
    signal mgmt_reset_p   : std_logic := '1';
    signal C0_p           : std_logic;
    signal C1_p           : std_logic;
    signal locked_p       : std_logic;
    
    component Test
        port (
            refclk      : in std_logic;
            reset       : in std_logic;
            reset_SM    : in std_logic;
            mgmt_reset  : in std_logic;
            C0          : out std_logic;
            C1          : out std_logic;
            locked      : out std_logic
        );
    end component;
    
begin
    DUT: Test
        port map (
            refclk      => refclk_p,
            reset       => reset_p,
            reset_SM    => reset_SM_p,
            mgmt_reset  => mgmt_reset_p,
            C0          => C0_p,
            C1          => C1_p,
            locked      => locked_p
        );

    process
    begin
        -- Initial values
        refclk_p <= '0';
        reset_p <= '1';
        reset_SM_p <= '1';
        mgmt_reset_p <= '1';
        
        wait for 2500 ns;
        
        reset_p <= '0';
        wait for 40 ns;
        
        reset_p <= '1';
        wait for 40 ns;
    end process;
    
    refclk_process: process
    begin
        while true loop
            refclk_p <= not refclk_p;
            wait for 10 ns;
        end loop;
    end process;

end Behavioral;
