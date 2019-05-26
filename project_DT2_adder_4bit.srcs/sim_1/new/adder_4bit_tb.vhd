----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2019 06:45:17
-- Design Name: 
-- Module Name: adder_4bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_4bit_tb is
--  Port ( );
end adder_4bit_tb;

architecture Behavioral of adder_4bit_tb is

	-- component declaration for the unit under test
	component adder_4bit
		port (
			a : 	in std_logic_vector(3 downto 0);
			b : 	in std_logic_vector(3 downto 0);
			c : 	out std_logic_vector(3 downto 0);
			ovf:	out std_logic
			);
	end component;
	
	-- inputs
	signal a : std_logic_vector(3 downto 0) := "0000";
	signal b : std_logic_vector(3 downto 0) := "0000";
	
	-- outputs
	signal c : std_logic_vector(3 downto 0);
	signal ovf: std_logic;

begin

	-- instantiate the Unit Under Test (uut)
	uut: adder_4bit port map(
		a => a,
		b => b,
		c => c,
		ovf => ovf
	);
	
	-- stimulus process
	stim_proc: process
	begin
		-- Addition zweier positiver Werte ohne Überlauf, ( 0) + ( 1)
		a <= "0000";
		b <= "0001";
		wait for 100 ns;
		
		-- Additioin zweier positiver Werte mit Überlauf, ( 7) + ( 2)
		a <= "0111";
		b <= "0010";
		wait for 100 ns;
		
		-- Addition zweier negativer Werte ohne Überlauf, (-1) + (-7)	
		a <= "1111";
		b <= "1001";
		wait for 100 ns;
		
		-- Addition zweier negativer Werte mit Überlauf, (-2) + (-8)
		a <= "1110";
		b <= "1000";
		wait for 100ns;
				
	end process;


end Behavioral;
