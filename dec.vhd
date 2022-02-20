library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DEC is
	PORT(
			OP   : in STD_LOGIC_VECTOR(7 downto 0);
			OADD : out STD_LOGIC;
			OAND : out STD_LOGIC;
			OOR  : out STD_LOGIC;
			ONOT : out STD_LOGIC;
			OY   : out STD_LOGIC;
			OHLT : out STD_LOGIC;
			ONOP : out STD_LOGIC);
end DEC;


architecture HEHE of DEC is
begin
		process (OP)
		begin
		
			OADD <= '0';
			OAND <= '0';
			OOR  <= '0';
			ONOT <= '0';
			OY   <= '0';
			OHLT <= '0';
			ONOP <= '0';

			case OP is
				when "00000001" =>
					OADD <= '1';
				 when "00000010" =>
					OAND <= '1';
				when "00000011" =>
						OOR <= '1';
				when "00000100" =>
					ONOT <= '1';
				when "00000101" =>
					OY <= '1';
				when "00000110" =>
					OHLT <= '1';
				when others     =>
					ONOP <= '1';
			end case;

		end process;
end HEHE;