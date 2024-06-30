library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_PLL_n is
end tb_PLL_n;

architecture Behavioral of tb_PLL_n is
    signal clk              : std_logic := '0';
    signal reset_p          : std_logic := '1';
    signal pll_outclk_0     : std_logic;
    signal pll_locked       : std_logic;

    constant clk_period : time := 20 ns;

begin
    -- Instantiate the PLL component
    pll_inst : entity work.PLL_normal
        port map (
            refclk   => clk,
            rst      => reset_p,
            outclk_0 => pll_outclk_0,
            locked   => pll_locked
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Apply reset
        reset_p <= '1';
        wait for 100 ns;  -- Hold reset for 100 ns
        reset_p <= '0';
        
        -- Wait for PLL to lock and observe the outputs
        wait for 2000 ns;
        
        -- End the simulation after a sufficient time
        wait;
    end process;

    -- Clock process
    clk_process: process
    begin
        while True loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

end Behavioral;
