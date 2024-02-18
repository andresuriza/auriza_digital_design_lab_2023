-- File: Problema2_tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Problema2_tb is
end Problema2_tb;

architecture Behavioral of Problema2_tb is
    component Problema2
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               sum : out STD_LOGIC_VECTOR (3 downto 0);
               cout : out STD_LOGIC);
    end component;
    signal a, b, sum : STD_LOGIC_VECTOR (3 downto 0);
    signal cout : STD_LOGIC;
begin
    UUT: Problema2 port map (a => a, b => b, sum => sum, cout => cout);

    stimulus : process
    begin
			a <= "0011"; b <= "0101"; wait for 10 ns;

			a <= "0111"; b <= "0110"; wait for 10 ns;
		  
			a <= "1111"; b <= "1111"; wait for 10 ns;

			a <= "1001"; b <= "0010"; wait for 10 ns;
        wait;
    end process stimulus;
end Behavioral;
