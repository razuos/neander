library ieee;
use ieee.std_logic_1164.all;

entity TB_DEC is
end TB_DEC;


architecture HEHE of TB_DEC is

	component dec
		PORT(
			CLK  : in STD_LOGIC;
			OP   : in STD_LOGIC_VECTOR(7 downto 0);
			OADD : out STD_LOGIC;
		    OAND : out STD_LOGIC;
			OOR  : out STD_LOGIC;
			ONOT : out STD_LOGIC;
			OY   : out STD_LOGIC;
			OHLT : out STD_LOGIC;
			ONOP : out STD_LOGIC);
	end component;
	
	signal CLK, OADD, OAND, OOR, ONOT, OY, OHLT, ONOP : STD_LOGIC := '0';
	signal OP                                   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');	

begin

	uut: dec PORT MAP (CLK => CLK, OP => OP, OADD => OADD, OAND => OAND, OOR=> OOR, ONOT => ONOT, OY => OY, OHLT => OHLT, ONOP => ONOP);
	
	CLK <= not CLK after 5 ns;

	stim_proc: process
	begin
		
		OP <= "00000000";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '1' report "should return correct op" severity warning;
		
		OP <= "00000001";
		
		wait for 10 ns;
		assert OADD = '1' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		
		OP <= "00000010";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '1' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		
		OP <= "00000011";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '1' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		
		OP <= "00000100";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '1' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		
		OP <= "00000101";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '1' report "should return correct op" severity warning;
		assert OHLT = '0' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		
		OP <= "00000110";
		
		wait for 10 ns;
		assert OADD = '0' report "should return correct op" severity warning;
		assert OAND = '0' report "should return correct op" severity warning;
		assert OOR  = '0' report "should return correct op" severity warning;
		assert ONOT = '0' report "should return correct op" severity warning;
		assert OY   = '0' report "should return correct op" severity warning;
		assert OHLT = '1' report "should return correct op" severity warning;
		assert ONOP = '0' report "should return correct op" severity warning;
		

	end process;

end HEHE;