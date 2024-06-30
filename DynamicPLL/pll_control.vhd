library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pll_control is
    port (
        clk             : in  std_logic;
        reset           : in  std_logic;
        mgmt_readdata   : in  std_logic_vector(31 downto 0);
        mgmt_waitrequest : in  std_logic;
		sw_in				: in std_logic;
        mgmt_read       : out std_logic;
        mgmt_write      : out std_logic;
        mgmt_address    : out std_logic_vector(5 downto 0);
        mgmt_writedata  : out std_logic_vector(31 downto 0)
    );
end entity pll_control;

architecture Behavioral of pll_control is
    type state_type is (IDLE, WRITE_MODE, WRITE_MODE_WAIT, SET_M_COUNTER, 
                        SET_M_COUNTER_WAIT, SET_M_FRAC, SET_M_FRAC_WAIT,
                        SET_N_COUNTER, SET_N_COUNTER_WAIT, SET_C0_COUNTER,
                        SET_C0_COUNTER_WAIT, SET_C1_COUNTER, SET_C1_COUNTER_WAIT,
                        SET_BANDWIDTH, SET_BANDWIDTH_WAIT, SET_CHARGE_PUMP,
                        SET_CHARGE_PUMP_WAIT, START_REG, START_REG_WAIT,
                        READ_STATUS, READ_STATUS_WAIT, CONFIG_DONE);

    signal state           : state_type := IDLE;
    signal write_count     : std_logic_vector(3 downto 0) := (others => '0');
    signal mgmt_read_reg   : std_logic := '0';
    signal mgmt_write_reg  : std_logic := '0';
    signal mgmt_address_reg: std_logic_vector(5 downto 0) := (others => '0');
    signal mgmt_writedata_reg: std_logic_vector(31 downto 0) := (others => '0');
begin

    mgmt_read <= mgmt_read_reg;
    mgmt_write <= mgmt_write_reg;
    mgmt_address <= mgmt_address_reg;
    mgmt_writedata <= mgmt_writedata_reg;

    process(clk, reset)
    begin
	 
	 
	 
	 
        if reset = '1' then
            state <= IDLE;
            mgmt_read_reg <= '0';
            mgmt_write_reg <= '0';
            mgmt_address_reg <= (others => '0');
            mgmt_writedata_reg <= (others => '0');
            write_count <= (others => '0');
        elsif rising_edge(clk) then
		  	 if sw_in = '0' then

            case state is
                when IDLE =>
                    state <= WRITE_MODE;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting up data: Mode Register(Add=0), Data=1, Mode=Polling Mode

                when WRITE_MODE =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000001";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_M_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_M_COUNTER =>
                    state <= SET_M_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000100";
                    mgmt_writedata_reg <= "00000000000000000001001000010010";
                    -- Setting up data: M Counter=36

                when SET_M_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000100";
                    mgmt_writedata_reg <= "00000000000000000001001000010010";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_M_FRAC;
                        write_count <= (others => '0');
                    end if;

                when SET_M_FRAC =>
                    state <= SET_M_FRAC_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000111";
                    mgmt_writedata_reg <= x"00444444";
                    -- Setting up data: MFrac=0.2665

                when SET_M_FRAC_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000111";
                    mgmt_writedata_reg <= x"00444444";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_N_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_N_COUNTER =>
                    state <= SET_N_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000011";
                    mgmt_writedata_reg <= "00000000000000000000001000000010";
                    -- Setting up data: N=4

                when SET_N_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000011";
                    mgmt_writedata_reg <= "00000000000000000000001000000010";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_C0_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_C0_COUNTER =>
                    state <= SET_C0_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000000000000001100000011";
                    -- Setting up data: C0 Counter=6, High Count=3, Low Count=3, Even Division

                when SET_C0_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000000000000001100000011";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_C1_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_C1_COUNTER =>
                    state <= SET_C1_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000001000000010000000100";
                    -- Setting up data: C1 Counter=10, High Count=4, Low Count=4, Even Division

                when SET_C1_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000001000000010000000100";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_BANDWIDTH;
                        write_count <= (others => '0');
                    end if;

                when SET_BANDWIDTH =>
                    state <= SET_BANDWIDTH_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "001000";
                    mgmt_writedata_reg <= "00000000000000000000000000000110";
                    -- Setting up bandwidth setting register to medium bandwidth

                when SET_BANDWIDTH_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "001000";
                    mgmt_writedata_reg <= "00000000000000000000000000000110";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_CHARGE_PUMP;
                        write_count <= (others => '0');
                    end if;

                when SET_CHARGE_PUMP =>
                    state <= SET_CHARGE_PUMP_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "001001";
                    mgmt_writedata_reg <= "00000000000000000000000000000010";
                    -- Setting up charge pump setting register to medium bandwidth

                when SET_CHARGE_PUMP_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "001001";
                    mgmt_writedata_reg <= "00000000000000000000000000000011";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= START_REG;
                        write_count <= (others => '0');
                    end if;

                when START_REG =>
                    state <= START_REG_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000010";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting up data, start register

                when START_REG_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000010";
                    mgmt_writedata_reg <= x"00000001";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= READ_STATUS;
                        write_count <= (others => '0');
                    end if;

                when READ_STATUS =>
                    state <= READ_STATUS_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000001";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting to read from status Register

                when READ_STATUS_WAIT =>
                    mgmt_read_reg <= '1';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000001";
                    mgmt_writedata_reg <= x"00000000";

                    if mgmt_readdata(0) = '1' then
                        state <= CONFIG_DONE;
                    end if;

                when CONFIG_DONE =>
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000000";
                    -- No activity after configuration complete

                when others =>
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000000";
            end case;
				
			else
			case state is
                when IDLE =>
                    state <= WRITE_MODE;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting up data: Mode Register(Add=0), Data=1, Mode=Polling Mode

                when WRITE_MODE =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000001";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_M_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_M_COUNTER =>
                    state <= SET_M_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000100";
                    mgmt_writedata_reg <= "00000000000000000001001000010010";
                    -- Setting up data: M Counter=36

                when SET_M_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000100";
                    mgmt_writedata_reg <= "00000000000000000001001000010010";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_M_FRAC;
                        write_count <= (others => '0');
                    end if;

                when SET_M_FRAC =>
                    state <= SET_M_FRAC_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000111";
                    mgmt_writedata_reg <= x"00444444";
                    -- Setting up data: MFrac=0.2665

                when SET_M_FRAC_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000111";
                    mgmt_writedata_reg <= x"00444444";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_N_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_N_COUNTER =>
                    state <= SET_N_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000011";
                    mgmt_writedata_reg <= "00000000000000000000001000000010";
                    -- Setting up data: N=4

                when SET_N_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000011";
                    mgmt_writedata_reg <= "00000000000000000000001000000010";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_C0_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_C0_COUNTER =>
                    state <= SET_C0_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000000000000000100000001";
                    -- Setting up data: C0 Counter=2, High Count=1, Low Count=1, Even Division

                when SET_C0_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000000000000001100000011";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_C1_COUNTER;
                        write_count <= (others => '0');
                    end if;

                when SET_C1_COUNTER =>
                    state <= SET_C1_COUNTER_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000001000000010000000100";
                    -- Setting up data: C1 Counter=10, High Count=4, Low Count=4, Even Division

                when SET_C1_COUNTER_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000101";
                    mgmt_writedata_reg <= "00000000000001000000010000000100";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_BANDWIDTH;
                        write_count <= (others => '0');
                    end if;

                when SET_BANDWIDTH =>
                    state <= SET_BANDWIDTH_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "001000";
                    mgmt_writedata_reg <= "00000000000000000000000000000110";
                    -- Setting up bandwidth setting register to medium bandwidth

                when SET_BANDWIDTH_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "001000";
                    mgmt_writedata_reg <= "00000000000000000000000000000110";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= SET_CHARGE_PUMP;
                        write_count <= (others => '0');
                    end if;

                when SET_CHARGE_PUMP =>
                    state <= SET_CHARGE_PUMP_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "001001";
                    mgmt_writedata_reg <= "00000000000000000000000000000010";
                    -- Setting up charge pump setting register to medium bandwidth

                when SET_CHARGE_PUMP_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "001001";
                    mgmt_writedata_reg <= "00000000000000000000000000000011";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= START_REG;
                        write_count <= (others => '0');
                    end if;

                when START_REG =>
                    state <= START_REG_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000010";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting up data, start register

                when START_REG_WAIT =>
                    write_count <= std_logic_vector(unsigned(write_count) + 1);
                    mgmt_read_reg <= '0';
                    mgmt_address_reg <= "000010";
                    mgmt_writedata_reg <= x"00000001";

                    if write_count = "0000" then
                        mgmt_write_reg <= '1';
                    else
                        mgmt_write_reg <= '0';
                    end if;

                    if write_count = "0001" then
                        state <= READ_STATUS;
                        write_count <= (others => '0');
                    end if;

                when READ_STATUS =>
                    state <= READ_STATUS_WAIT;
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000001";
                    mgmt_writedata_reg <= x"00000001";
                    -- Setting to read from status Register

                when READ_STATUS_WAIT =>
                    mgmt_read_reg <= '1';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000001";
                    mgmt_writedata_reg <= x"00000000";

                    if mgmt_readdata(0) = '1' then
                        state <= CONFIG_DONE;
                    end if;

                when CONFIG_DONE =>
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000000";
                    -- No activity after configuration complete

                when others =>
                    mgmt_read_reg <= '0';
                    mgmt_write_reg <= '0';
                    mgmt_address_reg <= "000000";
                    mgmt_writedata_reg <= x"00000000";
            end case;
				
				end if;
        end if;
		  
	
	
    end process;

end architecture Behavioral;
