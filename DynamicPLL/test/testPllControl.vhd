library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- USE altera_mf.all;

entity tb_pll_control is
end tb_pll_control;

architecture Behavioral of tb_pll_control is
    signal clk              : std_logic := '0';

    --PLL Control
    signal reset_SM_p          : std_logic := '0';
    signal mgmt_waitrequest : std_logic := '0';
    signal mgmt_read        : std_logic;
    signal mgmt_write       : std_logic;
    signal mgmt_readdata    : std_logic_vector(31 downto 0);
    signal mgmt_address     : std_logic_vector(5 downto 0);
    signal mgmt_writedata   : std_logic_vector(31 downto 0);
    signal config_done      : std_logic;
    signal sw_in_p  : std_logic := '0';

    --Pll Reconfig
    signal reset_R_p          : std_logic;
    signal pll_reconfig_waitrequest : std_logic := '0';
    signal pll_reconfig_read        : std_logic;
    signal pll_reconfig_write       : std_logic;
    signal pll_reconfig_readdata    : std_logic_vector(31 downto 0);
    signal pll_reconfig_address     : std_logic_vector(5 downto 0);
    signal pll_reconfig_writedata   : std_logic_vector(31 downto 0);  -- testing with 1
    
    -- PLL
    signal reset_p          : std_logic := '0';
    signal pll_outclk_0      : std_logic;
    -- signal pll_outclk_1      : std_logic;
    signal pll_locked        : std_logic := '1';

    signal PLL_R_reconfig_to_pll   : std_logic_vector(63 downto 0);
    signal PLL_R_reconfig_from_pll : std_logic_vector(63 downto 0);

    signal reconfig_to_pll   : std_logic_vector(63 downto 0);
    signal reconfig_from_pll : std_logic_vector(63 downto 0);

    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    pll_control: entity work.pll_control
        port map (
            clk                => clk,
            reset            => reset_SM_p,
            mgmt_waitrequest   => mgmt_waitrequest,
            mgmt_read          => mgmt_read,
            mgmt_write         => mgmt_write,
            mgmt_readdata      => mgmt_readdata,
            mgmt_address       => mgmt_address,
            mgmt_writedata     => mgmt_writedata,
            sw_in => sw_in_p
            
        );

    pll_reconfig_inst : entity work.PLL_Reconfig
        port map (
            mgmt_clk          => clk,
            mgmt_reset        => reset_R_p,
            mgmt_waitrequest  => pll_reconfig_waitrequest,
            mgmt_read         => pll_reconfig_read,
            mgmt_write        => pll_reconfig_write,
            mgmt_readdata     => pll_reconfig_readdata,
            mgmt_address      => pll_reconfig_address,
            mgmt_writedata    => pll_reconfig_writedata,
            reconfig_to_pll   => PLL_R_reconfig_to_pll,
            reconfig_from_pll => PLL_R_reconfig_from_pll
        );

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

        pll_reconfig_read <= mgmt_read;
        mgmt_readdata <= pll_reconfig_readdata;
        pll_reconfig_write <= mgmt_write;
        pll_reconfig_address <= mgmt_address;
        pll_reconfig_writedata <= mgmt_writedata;
        reconfig_to_pll <= PLL_R_reconfig_to_pll;
        PLL_R_reconfig_from_pll <= reconfig_from_pll;
    

    -- Stimulus process
    stimulus: process
    begin
        wait for 20 ns;
        -- Apply reset
        -- Apply reset
        reset_p <= '1';
        -- reset_SM_p <= '1';
        -- reset_R_p <= '1';
        wait for 500 ns;
        
        reset_p <= '0';        
        reset_R_p <= '0';

        -- wait until pll_locked = '1';
        -- reset_SM_p <= '0';
        -- wait for 100 ns;

        -- Wait for PLL to lock
        -- wait until pll_locked = '1';
        -- wait for 100 ns; -- Allow some time after lock

        -- Wait for PLL reconfiguration to complete
        wait for 500 ns;
        reset_p <= '1';
        -- reset_SM_p <= '1';
        -- reset_R_p <= '1';
        wait for 200 ns;
        
        reset_p <= '0';        
        -- reset_R_p <= '0';

        -- -- wait until pll_locked = '1';
        -- reset_SM_p <= '0';
        -- wait for 500 ns;
        -- reset_p <= '1';
        -- wait for 50 ns;
        -- reset_p <= '0';

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
