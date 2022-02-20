library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity neander is
	PORT(
			CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			ROUT: out STD_LOGIC);
end neander;


architecture HEHE of neander IS

signal PC_INC, PC_RST : STD_LOGIC;
signal PC_CNT : STD_LOGIC_VECTOR(3 downto 0);

component pc is
	PORT(
			CLK : in STD_LOGIC;
			INC : in STD_LOGIC;
			RST : in STD_LOGIC;
			CNT : out STD_LOGIC_VECTOR(3 downto 0));
end component;

begin

	myPc: pc PORT MAP(
		CLK => CLK,
		INC => PC_INC,
		RST => PC_RST,
	   CNT => PC_CNT);
		
end HEHE;