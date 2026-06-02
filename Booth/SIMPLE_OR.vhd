----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2025 10:36:21 AM
-- Design Name: 
-- Module Name: SIMPLE_OR - Structural
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

entity SIMPLE_OR is
    Port ( r : in STD_LOGIC;
           t : in STD_LOGIC;
           OUT_OR : out STD_LOGIC);
end SIMPLE_OR;

architecture Structural of SIMPLE_OR is

begin

OUT_OR <= r OR t;
end Structural;
