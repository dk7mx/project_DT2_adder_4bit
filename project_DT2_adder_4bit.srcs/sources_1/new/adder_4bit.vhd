----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2019 06:29:33
-- Design Name: 
-- Module Name: adder_4bit - Behavioral
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

entity adder_4bit is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : out STD_LOGIC_VECTOR (3 downto 0);
           ovf : out STD_LOGIC);
end adder_4bit;

architecture Behavioral of adder_4bit is
signal a_int, b_int, c_int : signed (3 downto 0);

begin
    -- input
    a_int <= signed(a);
    b_int <= signed(b);
    
    -- calculation
    c_int <= a_int + b_int;
    
    -- output
    c <= STD_LOGIC_VECTOR(c_int);
    
     -- overflow flag
    ovf <= (not a_int(3) and not b_int(3) and c_int(3)) or ( a(3) and b(3) and not c_int(3));
    
   
    
    


end Behavioral;
