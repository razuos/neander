library ieee;
use ieee.std_logic_1164.all;

entity TB_MEM is
end TB_MEM;


architecture HEHE of TB_MEM is

	component mem
		PORT(
			CLK : in STD_LOGIC;
			ADR : in STD_LOGIC_VECTOR(3 downto 0);
			OP  : out STD_LOGIC_VECTOR(7 downto 0);
			VAL : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	signal CLK : STD_LOGIC                    := '0';
	signal ADR : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal OP  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal VAL : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	

begin

	uut: mem PORT MAP (CLK => CLK, ADR => ADR, OP => OP, VAL => VAL);
	
	CLK <= not CLK after 5 ns;

	stim_proc: process
	begin
		
		ADR <= "0000";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "0001";
		
		wait for 10 ns;
		assert OP  = "00000101" report "should return right OP" severity warning;
		assert VAL = "00000010" report "should return right VAL" severity warning;
		
		ADR <= "0010";
		
		wait for 10 ns;
		assert OP  = "00000001" report "should return right OP" severity warning;
		assert VAL = "00000101" report "should return right VAL" severity warning;
		
		ADR <= "0011";
		
		wait for 10 ns;
		assert OP  = "00000001" report "should return right OP" severity warning;
		assert VAL = "00001000" report "should return right VAL" severity warning;
		
		ADR <= "0100";
		
		wait for 10 ns;
		assert OP  = "00000010" report "should return right OP" severity warning;
		assert VAL = "00000101" report "should return right VAL" severity warning;
		
		ADR <= "0101";
		
		wait for 10 ns;
		assert OP  = "00000100" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "0110";
		
		wait for 10 ns;
		assert OP  = "00000010" report "should return right OP" severity warning;
		assert VAL = "00001111" report "should return right VAL" severity warning;
		
		ADR <= "0111";
		
		wait for 10 ns;
		assert OP  = "00000011" report "should return right OP" severity warning;
		assert VAL = "00000100" report "should return right VAL" severity warning;
		
		ADR <= "1000";
		
		wait for 10 ns;
		assert OP  = "00000101" report "should return right OP" severity warning;
		assert VAL = "10101010" report "should return right VAL" severity warning;
		
		ADR <= "1001";
		
		wait for 10 ns;
		assert OP  = "00000001" report "should return right OP" severity warning;
		assert VAL = "01000100" report "should return right VAL" severity warning;
		
		ADR <= "1010";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "1011";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "1100";
		
		wait for 10 ns;
		assert OP  = "00000110" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "1101";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "1110";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;
		
		ADR <= "1111";
		
		wait for 10 ns;
		assert OP  = "00000000" report "should return right OP" severity warning;
		assert VAL = "00000000" report "should return right VAL" severity warning;

	end process;

end HEHE;