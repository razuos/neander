library ieee;
use ieee.std_logic_1164.all;

entity TB_PC is
end TB_PC;

architecture HEHE of TB_PC is

	component pc
		PORT(
			CLK : in STD_LOGIC;
			INC : in STD_LOGIC;
			RST : in STD_LOGIC;
			CNT : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	signal CLK, INC, RST : STD_LOGIC := '0';
	signal CNT : STD_LOGIC_VECTOR(3 downto 0);

begin

	uut: pc PORT MAP (CLK => CLK, INC => INC, RST => RST, CNT => CNT);
	
	   CLK <= not CLK after 5 ns; 
	
		stim_proc: process
		begin
			
			INC <= '0';
			RST <= '0';
			
			wait for 20 ns;
			assert CNT = "0000" report "should not increment if INC is 0" severity warning;
			
			INC <= '1';
			RST <= '0';
			
			wait for 10 ns;
			assert CNT = "0001" report "should increment when INC is 1" severity warning;
			
			INC <= '1';
			RST <= '1';
			
			wait for 10 ns;
			assert CNT = "0000" report "should reset when RST is 1, regardless of INC" severity warning;
			
			INC <= '0';
			RST <= '0';
			
			wait for 10 ns;
			assert CNT = "0000" report "should not increment when INC is 0" severity warning;

		end process;

end HEHE;