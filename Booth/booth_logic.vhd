----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:38 01/03/2025 
-- Design Name: 
-- Module Name:    booth_logic - Structural 
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

entity booth_logic is
	 generic (n: integer := 3);
    Port ( Q : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           s : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (n+n-1 downto 0));
end booth_logic;

architecture Structural of booth_logic is
component register_unit is
	 Port ( shift_input : in  STD_LOGIC;
           new_input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           select_bit : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;
component ops_unit is
	 Port ( pre_bit : in  STD_LOGIC;
           input : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           select_1bit : in  STD_LOGIC;
           select_2bit : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;
signal output_tmp: std_logic_vector(n+n downto 0);
signal ops_tmp, c_outs: std_logic_vector(n-1 downto 0);

signal s_1bit: std_logic;
signal s_2bit: std_logic_vector(1 downto 0);
begin
	
	s_1bit    <= output_tmp(1);
	s_2bit(1) <= output_tmp(1);
	s_2bit(0) <= output_tmp(0);

	reg_0: register_unit port map(output_tmp(1) , '0' , clk , s , output_tmp(0));
	Q_gen: for i in 1 to n-1 generate
	
				reg: register_unit port map(output_tmp(i+1) , Q(i-1) , clk , s , output_tmp(i));
				
				ops: ops_unit port map(output_tmp(i+n+1) , B(i) , c_outs(i-1) , s_1bit , s_2bit , ops_tmp(i) , c_outs(i));
				reg_with_ops: register_unit port map(ops_tmp(i) , '0' , clk , s , output_tmp(i+n));
	
	end generate;
	
	
	ops_n: ops_unit port map(output_tmp(n+1) , B(0) , s_1bit , s_1bit , s_2bit , ops_tmp(0) , c_outs(0));
	reg_n: register_unit port map(ops_tmp(0) , Q(n-1) , clk , s , output_tmp(n));
	
	
--	A_gen: for j in 1 to n-1 generate
	
--				ops: ops_unit port map(output_tmp(j+n+1) , B(j) , c_outs(j-1) , s_1bit , s_2bit , ops_tmp(j) , c_outs(j));
				
--				reg: register_unit port map(ops_tmp(j) , '0' , clk , s , output_tmp(j+n));
	
--	end generate;
	reg_last: register_unit port map(ops_tmp(n-1) , '0' , clk , s , output_tmp(n+n));
	
	result <= output_tmp(n+n downto 1);
	
end Structural;

