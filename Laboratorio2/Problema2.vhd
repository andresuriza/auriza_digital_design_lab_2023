-- ENGR 10 VHDL Lab
-- 1-bit Adder

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- We declare the 1-bit adder with the inputs and outputs
-- shown inside the port().
-- This will add two bits together(x,y), with a carry in(cin) and 
-- output the sum(sum) and a carry out(cout).
entity BIT_ADDER is
	port( a, b, cin         : in  STD_LOGIC;
	      sum, cout         : out STD_LOGIC );
end BIT_ADDER;

-- This describes the functionality of the 1-BIT adder.
architecture BHV of BIT_ADDER is
begin
	
	-- Calculate the sum of the 1-BIT adder.
	sum <=  (not a and not b and cin) or
			(not a and b and not cin) or
			(a and not b and not cin) or
			(a and b and cin);

	-- Calculates the carry out of the 1-BIT adder.
	cout <= (not a and b and cin) or
			(a and not b and cin) or
			(a and b and not cin) or
			(a and b and cin);
end BHV;


-- Structural description of a 4-bit Adder. This device
-- adds two 4-bit numbers together using four 1-bit adders
-- described above.

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This describes the black-box view of the component we are
-- designing. The inputs and outputs are again described
-- inside port(). It takes two 4-bit values as input (x and y)
-- and produces a 4-bit output (ANS) and a carry out bit (Cout).

entity Problema2 is
	port( a, b		: in	STD_LOGIC_VECTOR(3 downto 0);
	      ans		: out	STD_LOGIC_VECTOR(3 downto 0);
			HEX_out  : out STD_LOGIC_VECTOR(6 downto 0);
	      cout		: out	STD_LOGIC		);
end Problema2;

-- Although we have already described the inputs and outputs,
-- we must now describe the functionality of the adder (ie:
-- how we produced the desired outputs from the given inputs).

architecture STRUCTURE of Problema2 is

-- We are going to need four 1-bit adders, so include the
  -- design that we have already done above.
  component BIT_ADDER
    port( a, b, cin : in  STD_LOGIC;
          sum, cout : out STD_LOGIC );
  end component;

  -- Component declaration for the 7-segment display
  component to_7seg
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           seg7 : out STD_LOGIC_VECTOR (6 downto 0)
         );
  end component;

  -- Signals to hold the binary result and the hexadecimal result
  signal binary_result : STD_LOGIC_VECTOR(3 downto 0);
  signal hex_result : STD_LOGIC_VECTOR(3 downto 0);

  -- Signals to hold the carry bits for the adders
  signal c0, c1, c2, c3 : STD_LOGIC;

begin

  -- Adder instantiation
  c0 <= '0';
  b_adder0: BIT_ADDER port map (a(0), b(0), c0, binary_result(0), c1);
  b_adder1: BIT_ADDER port map (a(1), b(1), c1, binary_result(1), c2);
  b_adder2: BIT_ADDER port map (a(2), b(2), c2, binary_result(2), c3);
  b_adder3: BIT_ADDER port map (a(3), b(3), c3, binary_result(3), cout);

  -- Binary to Hexadecimal conversion process
  process(binary_result)
  begin
    case binary_result is
      when "0000" => hex_result <= "0000";
      when "0001" => hex_result <= "0001";
      when "0010" => hex_result <= "0010";
      when "0011" => hex_result <= "0011";
      when "0100" => hex_result <= "0100";
      when "0101" => hex_result <= "0101";
      when "0110" => hex_result <= "0110";
      when "0111" => hex_result <= "0111";
      when "1000" => hex_result <= "1000";
      when "1001" => hex_result <= "1001";
      when "1010" => hex_result <= "1010";
      when "1011" => hex_result <= "1011";
      when "1100" => hex_result <= "1100";
      when "1101" => hex_result <= "1101";
      when "1110" => hex_result <= "1110";
      when "1111" => hex_result <= "1111";
      when others => hex_result <= "0000"; -- Default to 0 if unexpected input
    end case;
  end process;

  -- Map the hexadecimal result to the 7-segment display component
  to_7seg_inst : to_7seg port map (A => hex_result, seg7 => HEX_out);

end STRUCTURE;