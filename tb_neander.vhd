library ieee;
use ieee.std_logic_1164.all;

entity TB_NEANDER is
end TB_NEANDER;


architecture HEHE of TB_NEANDER is

	component neander
		PORT(
			CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			REGQ: out STD_LOGIC_VECTOR(15 downto 0));	
	end component;
	
	signal CLK, RST : STD_LOGIC := '0';
	signal REGQ : STD_LOGIC_VECTOR(15 downto 0);

begin

	uut: neander PORT MAP (CLK => CLK, RST => RST, REGQ => REGQ);
	
	   CLK <= not CLK after 5 ns; 
	
		stim_proc: process
		begin
			
			RST <= '0';
			wait for 10 ns;
			
		end process;

end HEHE;