--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:50:39 03/20/2014
-- Design Name:   
-- Module Name:   C:/VLSI/FSM_tb.vhd
-- Project Name:  VLSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY FSM_tb IS
END FSM_tb;
 
ARCHITECTURE behavior OF FSM_tb IS  

   --Inputs
   signal PATTERN : std_logic_vector(7 downto 0);
   signal rst : std_logic ;
   signal SDI : std_logic ;
   signal clk : std_logic := '0';

 	--Outputs
   signal SEQ_DETECTED : std_logic;

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   U_FSM: entity work.FSM PORT MAP (
          PATTERN => PATTERN,
          rst => rst,
          SDI => SDI,
          clk => clk,
          SEQ_DETECTED => SEQ_DETECTED
        );

clk <= not clk after 10 ns;

process
begin

	rst <= '1';
	
	PATTERN <= "10101011";
	
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';

	rst <= '0';
	wait for 10ns;
	
	rst <= '1';
	PATTERN <= "11111111";
	
	wait for 20ns;
	SDI <= '0';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '1';
	wait for 20ns;
	SDI <= '0';

	report "SIMULATION COMPLETE!!!!"; 
      wait;
   end process;

END;

