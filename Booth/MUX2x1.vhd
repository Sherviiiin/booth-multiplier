----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2025 09:55:47 AM
-- Design Name: 
-- Module Name: MUX2x1 - Behavioral
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

entity MUX2to1 is
port (
    A, B, S: in STD_LOGIC;
    Y : out STD_LOGIC
);
end MUX2to1;

architecture structure of MUX2to1 is
signal and0, and1 : STD_LOGIC;

begin
and0 <= not(S) and A;
and1 <= S and B;
Y <= and0 OR and1;
end structure;