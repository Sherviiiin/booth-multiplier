----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:38 01/03/2025 
-- Design Name: 
-- Module Name:    ops_unit - Structural 
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

entity ops_unit is
    Port ( pre_bit : in  STD_LOGIC;
           input : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           select_1bit : in  STD_LOGIC;
           select_2bit : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end ops_unit;

architecture Structural of ops_unit is
component MUX2to1 is
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Y : out STD_LOGIC
    );
end component;
component MUX4to1 is
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  C : in  STD_LOGIC;
			  D : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC);
end component;
component fulladder_1bit is
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;
signal input_not, mux2to1_out, fulladder_out: std_logic;
begin
	
	input_not <= not(input);
	mux2x1: MUX2to1 port map(input , input_not , select_1bit , mux2to1_out);
	
	fulladder: fulladder_1bit port map(pre_bit , mux2to1_out , C_in , fulladder_out , C_out);
	
	mux4x1: MUX4to1 port map(pre_bit , fulladder_out , fulladder_out , pre_bit , select_2bit , output);

end Structural;

