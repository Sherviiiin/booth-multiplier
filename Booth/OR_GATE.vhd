----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2025 10:38:05 AM
-- Design Name: 
-- Module Name: OR_GATE - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OR_GATE is
Generic (
        N : integer := 4 
    );
    Port (
        A : in  STD_LOGIC_VECTOR(N-1 downto 0);
        Y_OR : out STD_LOGIC
    );
end OR_GATE;


architecture Structural of OR_GATE is
	 signal temp : STD_LOGIC_VECTOR(N-1 downto 0);
  component SIMPLE_OR is
    Port ( r : in STD_LOGIC;
           t : in STD_LOGIC;
           OUT_OR : out STD_LOGIC);
    end component;
begin
first_or: SIMPLE_OR
        Port map (
            r => A(0),
            t => A(1),
            OUT_OR => temp(1)
        );
    or_loop: for j in 2 to N-1 generate
    or_inst: SIMPLE_OR
        Port map (
            r => temp(j-1),
            t => A(j),
            OUT_OR => temp(j)
        );
          end generate;

	 Y_OR <= temp(N-1);
end Structural;