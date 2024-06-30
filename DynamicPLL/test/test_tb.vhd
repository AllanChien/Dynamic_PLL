library ieee;
use ieee.std_logic_1164.all;

entity Test_tb is
end Test_tb;

architecture Behavioral of Test_tb is
    signal refclk_p      : std_logic := '0';
    signal reset_p       : std_logic := '1';
    signal reset_SM_p    : std_logic := '1';
    signal mgmt_reset_p  : std_logic := '1';
    signal C0_p          : std_logic;
    signal C1_p          : std_logic;
    signal locked_p      : std_logic;

    -- Clock period for the reference clock
    constant clk_period : time := 20 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    DUT: entity work.Test
        port map (
            refclk     => refclk_p,
            reset      => reset_p,
            reset_SM   => reset_SM_p,
            mgmt_reset => mgmt_reset_p,
            C0         => C0_p,
            C1         => C1_p,
            locked     => locked_p
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize Inputs
        refclk_p <= '0';
        reset_p <= '1';
        reset_SM_p <= '1';
        mgmt_reset_p <= '1';
        
        -- Wait for 2500 us
        wait for 2500 us;

        -- Apply reset
        reset_p <= '0';
        wait for 40 us;

        reset_p <= '1';
        wait for 40 us;

        wait;
    end process stimulus;

    -- Clock process
    clk_process: process
    begin
        while true loop
            refclk_p <= '0';
            wait for clk_period / 2;
            refclk_p <= '1';
            wait for clk_period / 2;
        end loop;
    end process clk_process;

end Behavioral;
