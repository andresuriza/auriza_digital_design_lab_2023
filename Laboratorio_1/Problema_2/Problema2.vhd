-- 1-bit full adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- 4-bit binary to 7-segment hexadecimal decoder
entity hex_decoder is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           hex : out STD_LOGIC_VECTOR (6 downto 0));
end hex_decoder;

architecture Behavioral of hex_decoder is
begin
    process(bin)
    begin
        case bin is
            when "0000" => hex <= "0000001"; -- 0
            when "0001" => hex <= "1001111"; -- 1
            when "0010" => hex <= "0010010"; -- 2
            when "0011" => hex <= "0000110"; -- 3
            when "0100" => hex <= "1001100"; -- 4
            when "0101" => hex <= "0100100"; -- 5
            when "0110" => hex <= "0100000"; -- 6
            when "0111" => hex <= "0001111"; -- 7
            when "1000" => hex <= "0000000"; -- 8
            when "1001" => hex <= "0000100"; -- 9
            when "1010" => hex <= "0000100"; -- A
            when "1011" => hex <= "1100000"; -- B
            when "1100" => hex <= "0110001"; -- C
            when "1101" => hex <= "1000010"; -- D
            when "1110" => hex <= "0110000"; -- E
            when "1111" => hex <= "0111000"; -- F
            when others => hex <= "1111111"; -- Error
        end case;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- 4-bit adder using 1-bit adders and 7-segment display
entity Problema2 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : buffer STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC;
           hex : out STD_LOGIC_VECTOR (6 downto 0));
end Problema2;

architecture Behavioral of Problema2 is
    component full_adder
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    component hex_decoder
        Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
               hex : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    signal c : STD_LOGIC_VECTOR (4 downto 0);
begin
    FA0: full_adder port map (a(0), b(0), '0', sum(0), c(1));
    FA1: full_adder port map (a(1), b(1), c(1), sum(1), c(2));
    FA2: full_adder port map (a(2), b(2), c(2), sum(2), c(3));
    FA3: full_adder port map (a(3), b(3), c(3), sum(3), c(4));
    cout <= c(4);
    HD: hex_decoder port map (sum, hex);
end Behavioral;
