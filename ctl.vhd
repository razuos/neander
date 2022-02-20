library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CTL is
	PORT(
			CLK   : in  STD_LOGIC;
			RST   : in  STD_LOGIC;
			
			OADD  : in  STD_LOGIC;
			OAND  : in  STD_LOGIC;
			OOR   : in  STD_LOGIC;
			ONOT  : in  STD_LOGIC;
			OY    : in  STD_LOGIC;
			OHLT  : in  STD_LOGIC;
			ONOP  : in  STD_LOGIC;
			
			INCPC : out STD_LOGIC;
			ZERPC : out STD_LOGIC;
			PAR   : out STD_LOGIC_VECTOR(3 downto 0);
			CAR   : out STD_LOGIC;
			OP    : out STD_LOGIC_VECTOR(3 downto 0));
end CTL;

architecture HEHE of CTL is

	signal STATE: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

begin

	process(CLK)
	begin
		case STATE is
			when "000" =>
				INCPC <= '1';
				ZERPC <= '0';
				PAR   <= "0000";
				CAR   <= '1';
				STATE <= "001";
			when "001" =>
				INCPC <= '1';
				ZERPC <= '0';
				PAR   <= "0000";
				CAR   <= '1';
				if (OADD = '1') then
					OP <= "0001";
				elsif (OAND = '1') then
					OP <= "0010";
				elsif (OOR = '1') then
					OP <= "0011";
				elsif (ONOT = '1') then
					OP <= "0100";
				elsif (OY = '1') then
					OP <= "0101";
				elsif (OHLT = '1') or (ONOP = '1') then
					OP <= "0110";
				end if;
			when others =>
				STATE <= "111";
		end case;
	end process;
--				STATE <= "001";

--	process(CLK)
--	begin
--	
--		if (rising_edge(CLK) then
--
--			
--			if (RST = '1') then
--				ZERPC <= '1';	
--			elsif (OHLT = '1') then
--				INCPC <= '0';
--				PAR   <= "1111";				
--				OP    <= '1111';
--			else
--				ZERPC <= '';
--				INCPC <= '1';
--				PAR   <= "0000";								
				
--			end if;
--
--	end process;

end HEHE;