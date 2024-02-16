-- ENGR 10 VHDL Lab
-- 1-bit Adder Testbench

-- A testbench is used to rigorously tests a design that you have made.
-- The output of the testbench should allow the designer to see if
-- the design worked.  The testbench should also report where the testbench
-- failed.

-- This is just to make a reference to some common things needed.

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decare a testbench.  Notice that the testbench does not have any
-- input or output ports.

entity Problema2_tb is
end Problema2_tb;

-- Describes the functionality of the tesbench.

architecture TEST of Problema2_tb is 

	component Problema2
		port( a, b		: in    	STD_LOGIC_VECTOR(3 downto 0);
		      ans		: out		STD_LOGIC_VECTOR(3 downto 0);
		      cout		: out 	STD_LOGIC		);
	end component;

	for U1: Problema2 use entity WORK.Problema2(STRUCTURE);
	signal a, b		: STD_LOGIC_VECTOR(3 downto 0);
	signal ans		: STD_LOGIC_VECTOR(3 downto 0);
	signal cout		: STD_LOGIC;
	
	begin
	U1: Problema2 port map (a,b,ans,cout);
	
		process
		begin

		-- Case 1 that we are testing.

			a <= "0000";
			b <= "0000";
			wait for 10 ns;
			assert ( ANS = "0000" )	report "Failed Case 1 - ANS" severity error;
			assert ( Cout = '0' )   report "Failed Case 1 - Cout" severity error;
			wait for 40 ns;

		-- Case 2 that we are testing.

			a <= "1111";
			b <= "1111";
			wait for 10 ns;
			assert ( ANS = "1110" )	report "Failed Case 2 - ANS" severity error;
			assert ( Cout = '1' )   report "Failed Case 2 - Cout" severity error;
			wait for 40 ns;
			
			a <= "1010";
			b <= "0011";
			wait for 10 ns;
			assert ( ANS = "1101" )	report "Failed Case 3 - ANS" severity error;
			assert ( Cout = '0' )   report "Failed Case 3 - Cout" severity error;
			wait for 40 ns;
			
			a <= "1001";
			b <= "1100";
			wait for 10 ns;
			assert ( ANS = "0101" )	report "Failed Case 4 - ANS" severity error;
			assert ( Cout = '1' )   report "Failed Case 4 - Cout" severity error;
			wait for 40 ns;
		end process;
END TEST;
