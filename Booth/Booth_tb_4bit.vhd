----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:44 01/07/2025 
-- Design Name: 
-- Module Name:    Booth_tb_4bit - Behavioral 
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

entity Booth_tb_4bit is
end Booth_tb_4bit;

architecture Behavioral of Booth_tb_4bit is
component Booth_Multiplier_nbit is
    generic (n: integer := 3);
    Port ( multiplier : in  STD_LOGIC_VECTOR (n-1 downto 0);
           multiplicand : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           s : in  STD_LOGIC;
           result : out STD_LOGIC_VECTOR (n+n-1 downto 0);
		     isDone : out STD_LOGIC;
		     count : out STD_LOGIC_VECTOR(7 downto 0);
			  counter_input : out STD_LOGIC_VECTOR(7 downto 0)
	 );
end component;
    
signal multipliers : std_logic_vector(3 downto 0) := (others => '0');
signal multiplicands : std_logic_vector(3 downto 0) := (others => '0');
signal clk : std_logic := '0';
signal s : std_logic := '0';
signal result : std_logic_vector(7 downto 0);
signal done : std_logic := '0';
signal count : std_logic_vector(7 downto 0) := (others => '0');
signal counter_input : std_logic_vector(7 downto 0) := (others => '0');

constant clk_period : time := 10 ns;
begin

	uut: Booth_Multiplier_nbit
		generic map (
			n => 4
		)
		port map (
			multiplier    => multipliers,
			multiplicand  => multiplicands,
			clk           => clk,
			s             => s,
			result        => result,
			isDone        => done,
			count         => count,
			counter_input => counter_input
		);

	clk_process: process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	stim_process: process
	begin
		-- initilize
		multipliers <= "0000";
		multiplicands <= "0000";
		s <= '1';

		wait for 2*clk_period;

		--two posetive values 3*7
		multipliers   <= "0011";
		multiplicands <= "0111";
		s <= '1'; 
		wait for 2*clk_period;
		s <= '0';                 
		wait for 20*clk_period; 
		
		
		--two negative values -5*-6
		multipliers   <= "1011";
		multiplicands <= "1010";
		s <= '1'; 
		wait for 2*clk_period;
		s <= '0';                 
		wait for 20*clk_period; 

		--negetive and posetive values -7*6
		multipliers   <= "1001";
		multiplicands <= "0110";
		s <= '1'; 
		wait for 2*clk_period;
		s <= '0';                 
		wait for 20*clk_period; 
		
		
		--posetive and negative values 5*-2
		multipliers   <= "0101";
		multiplicands <= "1110";
		s <= '1'; 
		wait for 2*clk_period;
		s <= '0';                 
		wait for 20*clk_period; 
		
		--negative zero -6*0
		multipliers   <= "1010";
		multiplicands <= "0000";
		s <= '1'; 
		wait for 2*clk_period;
		s <= '0';                 
		wait for 20*clk_period; 
		
		
		wait;
	end process;
	
end Behavioral;

