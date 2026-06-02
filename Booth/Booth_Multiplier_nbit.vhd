----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:04:47 01/04/2025 
-- Design Name: 
-- Module Name:    Booth_Multiplier_nbit - Structural 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Booth_Multiplier_nbit is
	 generic (n: integer := 4);
    Port ( multiplier : in  STD_LOGIC_VECTOR (n-1 downto 0);
           multiplicand : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           s : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (n+n-1 downto 0);
		     isDone : out STD_LOGIC;
		     count : out STD_LOGIC_VECTOR(7 downto 0);
			  counter_input : out STD_LOGIC_VECTOR(7 downto 0));
end Booth_Multiplier_nbit;

architecture Structural of Booth_Multiplier_nbit is
component Counter is
	 generic (N: integer := 3);
	 Port ( CLK : in  STD_LOGIC;
           S : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR(N-1 downto 0);
           out_put : out STD_LOGIC;
			  done : out STD_LOGIC;
		     count : out STD_LOGIC_VECTOR(7 downto 0));
end component;
component booth_logic is
    generic (n: integer := 3);
    Port ( Q : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           s : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (n+n-1 downto 0));
end component;

signal controlled_clk: std_logic;
signal n_binary: std_logic_vector(7 downto 0);
begin

	n_binary  <= std_logic_vector(to_unsigned(n-2 , 8));
	counter_input <= n_binary;
	
	booth_controller: Counter generic map (8)
                             port map (clk , s , n_binary , controlled_clk , isDone , count);
	
	booth_logics: booth_logic generic map (n)
                             port map (multiplier , multiplicand , controlled_clk , s , result);

end Structural;

