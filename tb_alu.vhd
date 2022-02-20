library ieee;
use ieee.std_logic_1164.all;

entity TB_ALU is
end TB_ALU;


architecture HEHE of TB_ALU is

	component alu
		PORT(
			CLK : in STD_LOGIC;
			X   : in STD_LOGIC_VECTOR(15 downto 0);
			Y   : in STD_LOGIC_VECTOR (7 downto 0);
			OP  : in STD_LOGIC_VECTOR(3 downto 0);
			O   : out STD_LOGIC_VECTOR(15 downto 0));	
	end component;
	
	signal CLK  : STD_LOGIC                     := '0';
	signal X, O : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal Y    : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
	signal OP   : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
	

begin

	uut: alu PORT MAP (CLK => CLK, X => X, Y => Y, OP => OP, O => O);
	
	CLK <= not CLK after 5 ns;

	stim_proc: process
	begin
		
		X  <= "0000000000000000";
		Y  <= "00000000";
		OP <= "0000";
		
		wait for 20 ns;
		assert O = "0000000000000000" report "should initialize as 0" severity warning;
		
		X  <= "0000000000000001";
		Y  <= "00000001";
		OP <= "0001";
		
		wait for 10 ns;
		assert O = "0000000000000010" report "should add correctly" severity warning;
		
		X  <= "0000000000000000";
		Y  <= "00000001";
		OP <= "0010";
		
		wait for 10 ns;
		assert O = "0000000000000000" report "should AND correctly" severity warning;
		
		X  <= "0000000000000001";
		Y  <= "00000000";
		OP <= "0011";
		
		wait for 10 ns;
		assert O = "0000000000000001" report "should OR correctly" severity warning;
		
		X  <= "0000000000000000";
		Y  <= "00000000";
		OP <= "0100";
		
		wait for 10 ns;
		assert O = "1111111111111111" report "should NOT correctly" severity warning;
		
		X  <= "0000000000000000";
		Y  <= "01010101";
		OP <= "0101";
		
		wait for 10 ns;
		assert O = "0000000001010101" report "should Y correctly" severity warning;

	end process;

end HEHE;