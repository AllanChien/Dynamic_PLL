library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity tb_PLL is
end tb_PLL;

architecture Behavioral of tb_PLL is
    signal clk              : std_logic := '0';

    -- PLL
    signal reset_p          : std_logic := '0';
    signal pll_outclk_0      : std_logic;
    -- signal pll_outclk_1     : std_logic;
    signal pll_locked        : std_logic := '1';

    signal reconfig_to_pll   : std_logic_vector(63 downto 0);
    signal reconfig_from_pll : std_logic_vector(63 downto 0);

    constant clk_period : time := 20 ns;

begin
    
        -- Instantiate the PLL component
    

    pll_inst : entity work.PLL
        port map (
            refclk            => clk,
            rst               => reset_p,
            outclk_0          => pll_outclk_0,
            -- outclk_1          => pll_outclk_1,
            locked            => pll_locked,
            reconfig_to_pll   => reconfig_to_pll,
            reconfig_from_pll => reconfig_from_pll
        );

    -- pll_inst : entity work.PLL_normal
    --     port map (
    --         refclk            => clk,
    --         rst               => reset_p,
    --         outclk_0          => pll_outclk_0,
    --         locked            => pll_locked
            
    --     );

        
    

    -- Stimulus process
    stimulus: process
    begin
        -- Apply reset
        reset_p <= '1';
        wait for 100 ns;  -- Hold reset for 100 ns
        reset_p <= '0';
       
        
        -- -- Wait for PLL to lock and observe the outputs
        -- wait for 200 ns;

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
