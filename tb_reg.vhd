library ieee;
use ieee.std_logic_1164.all;

entity TB_REG is
end TB_REG;


architecture HEHE of TB_REG is

	component reg
		PORT(
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			WRT : in STD_LOGIC;
			D   : in STD_LOGIC_VECTOR(15 downto 0);	
			Q   : out STD_LOGIC_VECTOR(15 downto 0));		
	end component;
	
	signal CLK, RST, WRT : STD_LOGIC := '0';
	signal D, Q : STD_LOGIC_VECTOR(15 downto 0);

begin

	uut: reg PORT MAP (CLK => CLK, RST => RST, WRT => WRT, D => D, Q => Q);
	
	   CLK <= not CLK after 5 ns; 
	
		stim_proc: process
		begin
			
			RST <= '0';
			WRT <= '0';
			D   <= "0101010101010101";
			
			wait for 20 ns;
			assert Q = "0000000000000000" report "should not write if WRT is 0" severity warning;
			
			RST <= '0';
			WRT <= '1';
			D   <= "0101010101010101";
			
			wait for 10 ns;
			assert Q = "0101010101010101" report "should write when WRT is 1" severity warning;
			
			RST <= '0';
			WRT <= '0';
			D   <= "1111111111111111";
			
			wait for 10 ns;
			assert Q = "0101010101010101" report "should not update when WRT is 0" severity warning;
			
			RST <= '0';
			WRT <= '1';
			D   <= "1111111111111111";
			
			wait for 10 ns;
			assert Q = "1111111111111111" report "should update when WRT is 1" severity warning;
			
			RST <= '1';
			WRT <= '1';
			D   <= "1111111111111111";
			
			wait for 10 ns;
			assert Q = "0000000000000000" report "should reset when RST is 1 regardless of other inputs" severity warning;

		end process;

end HEHE;