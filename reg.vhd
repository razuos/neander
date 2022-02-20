library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity REG is
	PORT(
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			WRT : in STD_LOGIC;
			D   : in STD_LOGIC_VECTOR(15 downto 0);	
			Q   : out STD_LOGIC_VECTOR(15 downto 0));			
end REG;


architecture HEHE of REG IS

signal TMP : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

	process(CLK, RST)
	begin
		if(RST = '1') then
			TMP <= (others => '0');		
		elsif(rising_edge(CLK))then
			IF(WRT = '1') then
				TMP <= D;
			end if;
		end if;
	end process;

	Q <= TMP;

end HEHE;