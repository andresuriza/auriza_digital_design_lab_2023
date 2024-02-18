-- File: Problema2.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 1-bit full adder
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

-- 4-bit adder using 1-bit adders
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Problema2 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end Problema2;

architecture Behavioral of Problema2 is
    component full_adder
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    signal c : STD_LOGIC_VECTOR (4 downto 0);
begin
    FA0: full_adder port map (a(0), b(0), '0', sum(0), c(1));
    FA1: full_adder port map (a(1), b(1), c(1), sum(1), c(2));
    FA2: full_adder port map (a(2), b(2), c(2), sum(2), c(3));
    FA3: full_adder port map (a(3), b(3), c(3), sum(3), c(4));
    cout <= c(4);
end Behavioral;

-- Hexadecimal to 7-segment decoder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity hex_to_7seg is
    Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end hex_to_7seg;

architecture Behavioral of hex_to_7seg is
begin
    process(hex)
    begin
        case hex is
            when "0000" => seg <= "1000000"; -- 0
            when "0001" => seg <= "1111001"; -- 1
            when "0010" => seg <= "0100100"; -- 2
            when "0011" => seg <= "0110000"; -- 3
            when "0100" => seg <= "0011001"; -- 4
            when "0101" => seg <= "0010010"; -- 5
            when "0110" => seg <= "0000010"; -- 6
            when "0111" => seg <= "1111000"; -- 7
            when "1000" => seg <= "0000000"; -- 8
            when "1001" => seg <= "0010000"; -- 9
            when "1010" => seg <= "0001000"; -- A
            when "1011" => seg <= "0000011"; -- B
            when "1100" => seg <= "1000110"; -- C
            when "1101" => seg <= "0100001"; -- D
            when "1110" => seg <= "0000110"; -- E
            when "1111" => seg <= "0001110"; -- F
            when others => seg <= "1111111"; -- Error
        end case;
    end process;
end Behavioral;

-- Top-level entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity top_level is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           led : out STD_LOGIC);
end top_level;

architecture Behavioral of top_level is
    signal sum : STD_LOGIC_VECTOR (3 downto 0);
    signal cout : STD_LOGIC;
begin
    U1: entity work.Problema2 port map (a => a, b => b, sum => sum, cout => cout);
    U2: entity work.hex_to_7seg port map (hex => sum, seg => seg);
    led <= cout;
end Behavioral;
