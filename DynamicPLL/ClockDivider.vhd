library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider is
    Port (
        clk_in : in STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end ClockDivider;

architecture Behavioral of ClockDivider is
    constant DIVISOR : integer := 0;  -- 50MHz / 10Hz = 5,000,000
    signal counter : integer range 0 to DIVISOR := 0;
    signal clk_out_internal : STD_LOGIC := '0';
begin
    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if counter = DIVISOR then
                clk_out_internal <= not clk_out_internal;  -- Toggle internal clock
                counter <= 0;  -- Reset counter
            else
                counter <= counter + 1;  -- Increment counter
            end if;
        end if;
    end process;

    clk_out <= clk_out_internal;  -- Assign internal clock to output clock
end Behavioral;