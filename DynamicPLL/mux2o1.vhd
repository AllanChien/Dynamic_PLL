library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port ( 
			  sel : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out  STD_LOGIC
		);
end mux2to1;

architecture Behavioral of mux2to1 is
begin
    y <= a when sel = '0' else b;
end Behavioral;
