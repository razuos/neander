library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ALU is
	PORT(
			CLK : in STD_LOGIC;
			X   : in STD_LOGIC_VECTOR(15 downto 0);
			Y   : in STD_LOGIC_VECTOR (7 downto 0);
			OP  : in STD_LOGIC_VECTOR(3 downto 0);
			O   : out STD_LOGIC_VECTOR(15 downto 0));
end ALU;


architecture HEHE of ALU is

   signal RES: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal TMP: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin
	
	TMP(7 downto 0) <= y;
	
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			case OP is
				when "0001" =>
					RES <= X + TMP;
				when "0010" =>
				   RES <= X and TMP;
				when "0011" =>
				   RES <= X or TMP;
				when "0100" =>
				   RES <= not x;
				when "0101" =>
				   RES <= TMP;
				when others =>
					RES <= (others => '0');
			end case;
		end if;
	end process;
	
	O <= RES;
		

end HEHE;