----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:12 03/20/2014 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    Port ( PATTERN : in  STD_LOGIC_VECTOR (7 downto 0);
           rst : in  STD_LOGIC;
           SDI : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           SEQ_DETECTED : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
type STATE_TYPE is (S_PATTERN, S_C7, S_C6, S_C5, S_C4, S_C3, S_C2, S_C1, S_C0, S_DONE);
signal state: STATE_TYPE;
signal output : std_logic_vector (7 downto 0);

begin

process (clk,rst)
	begin
	if(rst='0')then
		SEQ_DETECTED <= '0';
		state <= S_PATTERN;
	
	elsif(clk'event and clk='1') then
	
	case state is
		when S_PATTERN =>
			output <= PATTERN;
			state <= S_C7;
		
		when S_C7 =>
			if( SDI = output(7))then
				state <= S_C6;
			end if;
		
		when S_C6 =>
			if( SDI = output(6))then
				state <= S_C5;
			else
				state <= S_C7;
			end if;
		
		when S_C5 =>
			if( SDI = output(5))then
				state <= S_C4;
			else
				state <= S_C7;
			end if;

		when S_C4 =>
			if( SDI = output(4))then
				state <= S_C3;
			else
				state <= S_C7;
			end if;
		
		when S_C3 =>
			if( SDI = output(3))then
				state <= S_C2;
			else
				state <= S_C7;
			end if;
		
		when S_C2 =>
			if( SDI = output(2))then
				state <= S_C1;
			else
				state <= S_C7;
			end if;
			
		when S_C1 =>
			if( SDI = output(1))then
				state <= S_C0;
			else
				state <= S_C7;
			end if;
			
		when S_C0 =>
			if( SDI = output(0))then
				state <= S_DONE;
			else
				state <= S_C7;
			end if;
			
		when S_DONE =>
			SEQ_DETECTED <= '1';

end case;
end if;
end process;
			
end Behavioral;

