----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:27 01/03/2025 
-- Design Name: 
-- Module Name:    MUX4to1 - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity MUX4to1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
end MUX4to1;

architecture Structural of MUX4to1 is
component MUX2to1 is
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Y : out STD_LOGIC
    );
end component;
signal y1, y2 : std_logic;
begin
	
	mux1 : MUX2to1 port map (A , B , s(0) , y1);
	mux2 : MUX2to1 port map (C , D , s(0) , y2);
	
	mux3 : MUX2to1 port map (y1 , y2 , s(1) , output);
	
end Structural;

