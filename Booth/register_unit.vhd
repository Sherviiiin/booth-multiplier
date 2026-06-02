----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:36 01/03/2025 
-- Design Name: 
-- Module Name:    register_unit - Structural 
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

entity register_unit is
    Port ( shift_input : in  STD_LOGIC;
           new_input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           select_bit : in  STD_LOGIC;
           output : out  STD_LOGIC);
end register_unit;

architecture Structural of register_unit is
component MUX2to1 is
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Y : out STD_LOGIC
    );
end component;
component DFF is
	 Port ( D     : in  STD_LOGIC;
           CLK   : in  STD_LOGIC;
           Q     : out STD_LOGIC;
           QN    : out STD_LOGIC
    );
end component;
signal Q_not, mux_out: std_logic;
begin

	mux1: MUX2to1 port map(shift_input , new_input , select_bit , mux_out);
	
	reg: DFF port map(mux_out , clk , output , Q_not);

end Structural;

