library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	PORT(
			CLK : in STD_LOGIC;
			INC : in STD_LOGIC;
			RST : in STD_LOGIC;
			CNT : out STD_LOGIC_VECTOR(3 downto 0));
end PC;


architecture HEHE of PC is

	signal TMP: STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

	process(CLK, RST, INC) begin
		if(RST = '1') then
			tmp <= "0000";
		ELSIF (INC = '1' AND rising_edge(CLK)) THEN
			if (tmp = "1111") then
				tmp <= "0000";
			else
				tmp <= tmp + "0001";
			end if;
		end if;	
	end process;
	
	CNT <= tmp;

end HEHE;