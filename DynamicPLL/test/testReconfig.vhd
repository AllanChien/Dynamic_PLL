library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_reconfig is
end tb_reconfig;

architecture Behavioral of tb_reconfig is
    signal clk              : std_logic := '0';
    signal reset_n          : std_logic := '0';
    -- signal mgmt_waitrequest : std_logic := '0';
    -- signal mgmt_read        : std_logic;
    -- signal mgmt_write       : std_logic;
    -- signal mgmt_readdata    : std_logic_vector(31 downto 0);
    -- signal mgmt_address     : std_logic_vector(5 downto 0);
    -- signal mgmt_writedata   : std_logic_vector(31 downto 0);
    -- signal config_done      : std_logic;

    signal pll_reconfig_waitrequest : std_logic;
    signal pll_reconfig_read        : std_logic;
    signal pll_reconfig_write       : std_logic;
    signal pll_reconfig_readdata    : std_logic_vector(31 downto 0);
    signal pll_reconfig_address     : std_logic_vector(5 downto 0);
    signal pll_reconfig_writedata   : std_logic_vector(31 downto 0);
    

    -- signal pll_outclk_0      : std_logic;
    -- signal pll_locked        : std_logic;

    signal reconfig_to_pll   : std_logic_vector(63 downto 0);
    signal reconfig_from_pll : std_logic_vector(63 downto 0);

    constant clk_period : time := 20 ns;

begin
    -- -- Instantiate the Unit Under Test (UUT)
    -- uut: entity work.pll_control
    --     port map (
    --         clk                => clk,
    --         reset_n            => reset_n,
    --         mgmt_waitrequest   => mgmt_waitrequest,
    --         mgmt_read          => mgmt_read,
    --         mgmt_write         => mgmt_write,
    --         mgmt_readdata      => mgmt_readdata,
    --         mgmt_address       => mgmt_address,
    --         mgmt_writedata     => mgmt_writedata,
    --         config_done        => config_done
    --     );

    pll_reconfig_inst : entity work.PLL_Reconfig
        port map (
            mgmt_clk          => clk,
            mgmt_reset        => reset_n,
            mgmt_waitrequest  => pll_reconfig_waitrequest,
            mgmt_read         => pll_reconfig_read,
            mgmt_write        => pll_reconfig_write,
            mgmt_readdata     => pll_reconfig_readdata,
            mgmt_address      => pll_reconfig_address,
            mgmt_writedata    => pll_reconfig_writedata,
            reconfig_to_pll   => reconfig_to_pll,
            reconfig_from_pll => reconfig_from_pll
        );

    --     -- Instantiate the PLL component
    -- pll_inst : entity work.PLL
    --     port map (
    --         refclk            => clk,
    --         rst               => reset_n,
    --         outclk_0          => pll_outclk_0,
    --         locked            => pll_locked,
    --         reconfig_to_pll   => reconfig_to_pll,
    --         reconfig_from_pll => reconfig_from_pll
    --     );

        -- pll_reconfig_read <= mgmt_read;
        -- mgmt_readdata <= pll_reconfig_readdata;
        -- pll_reconfig_write <= mgmt_write;
        -- pll_reconfig_address <= mgmt_address;
        -- pll_reconfig_writedata <= mgmt_writedata;

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

    -- Stimulus process
    stimulus: process
    begin
       
        pll_reconfig_write <= '1';
        pll_reconfig_address <= "000010";
        pll_reconfig_writedata <= X"00000001";
        
        wait for 40 ns;
        pll_reconfig_write <= '0';
        pll_reconfig_read <= '1';
        pll_reconfig_address <= "000001";

        -- mgmt_write <= '1';
        -- mgmt_address <= "000000";
        -- mgmt_writedata <= X"00000001";
        -- wait for 40 ns;
        -- mgmt_write <= '0';
        -- wait for 20 ns;

        -- mgmt_write <= '1';
        -- mgmt_address <= "000011";
        -- mgmt_writedata <= X"00000101";
        -- wait for 40 ns;
        -- mgmt_write <= '0';
        -- wait for 20 ns;


        -- mgmt_write <= '1';
        -- mgmt_address <= "000100";
        -- mgmt_writedata <= X"00000202";
        -- wait for 40 ns;
        -- mgmt_write <= '0';
        -- wait for 20 ns;

        -- mgmt_write <= '1';
        -- mgmt_address <= "000101";
        -- mgmt_writedata <= X"00000101";
        -- wait for 40 ns;
        -- mgmt_write <= '0';
        

        wait;
    end process;

end Behavioral;
