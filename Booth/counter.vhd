----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2025 09:54:25 AM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity Counter is
    Generic (
        N : integer := 8 
    );
    Port (
        CLK   : in  STD_LOGIC;
        S     : in  STD_LOGIC;
        I     : in  STD_LOGIC_VECTOR(7 downto 0);
        out_put     : out STD_LOGIC;
		  done     : out STD_LOGIC;
		  count : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Counter;

architecture Structural of Counter is

    signal Q      : STD_LOGIC_VECTOR(N-1 downto 0);
    signal QN     : STD_LOGIC_VECTOR(N-1 downto 0);
    signal mux_out_clk : STD_LOGIC_VECTOR(N-1 downto 0);
	signal mux_out_d : STD_LOGIC_VECTOR(N-1 downto 0);
	signal and_out : STD_LOGIC;
	signal y_out : STD_LOGIC := '1';


    component DFF is
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            QN    : out STD_LOGIC
        );
    end component;

    component MUX2to1 is
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            S : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	 
	   component OR_GATE is
        Generic (
        N : integer := 4
    );
    Port (
        A : in  STD_LOGIC_VECTOR(N-1 downto 0);
        Y_OR : out STD_LOGIC
    );
    end component;

begin
	 
		and_out <= y_out and CLK;
		
		   MUX_inst_first: MUX2to1
            Port map (
                A => and_out,          
                B => CLK,   
                S => S,
                Y => mux_out_clk(0)
            );
            
            MUX_first: MUX2to1
            Port map (
                A => QN(0),         
                B => I(0),   
                S => S,
                Y => mux_out_d(0)
            );
            
	    DFF_inst0: DFF
            Port map (
                D   =>  mux_out_d(0),
                CLK => mux_out_clk(0),
                Q   => Q(0),
                QN  => QN(0)
            );
				
	   -- Other instantiates --

    gen_dff: for j in 1 to N-1 generate

      MUX_instj: MUX2to1
            Port map (
                A => Q(j-1),          
                B => CLK,   
                S => S,
                Y => mux_out_clk(j)
            );
				
		MUX_j: MUX2to1
            Port map (
                A => QN(j),         
                B => I(j),   
                S => S,
                Y => mux_out_d(j)
            );
				
	    DFF_instj: DFF
            Port map (
                D   => mux_out_d(j),
                CLK => mux_out_clk(j),
                Q   => Q(j),
                QN  => QN(j)
            );
    end generate;

-- Instantiate OR_GATE 
    OR_inst: OR_GATE
        Generic map (
            N => N
        )
        Port map (
            A => Q,
            Y_OR => y_out
        );
		  
--	 out_put <= y_out;
	 out_put <= mux_out_clk(0);
	 
	 done <= not(y_out);
	 
	 count <= Q;
	 
end Structural;
