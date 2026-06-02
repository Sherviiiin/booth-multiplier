----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2025 10:25:20 AM
-- Design Name: 
-- Module Name: DFF - Structural
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF is
    Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           QN : out STD_LOGIC);
end DFF;

architecture Behavioral of DFF is
--signal nand0,nand1,tempq, tempnq : STD_LOGIC;
begin

	process(clk)
	begin
		if (clk' event and clk='0') then
			Q <= D;
			QN <= (not D);
		end if;
	end process;

end Behavioral;
