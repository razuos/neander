library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MEM is
	PORT(
			CLK : in STD_LOGIC;
			ADR : in STD_LOGIC_VECTOR(3 downto 0);
			OP  : out STD_LOGIC_VECTOR(7 downto 0);
			VAL : out STD_LOGIC_VECTOR(7 downto 0));
end MEM;


architecture HEHE of MEM is

	signal BLK00, BLK01, BLK02, BLK03, BLK04, BLK05, BLK06, BLK07 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal BLK08, BLK09, BLK10, BLK11, BLK12, BLK13, BLK14, BLK15 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	
	signal O : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	
	component reg is
		PORT(
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			WRT : in STD_LOGIC;
			D   : in STD_LOGIC_VECTOR(15 downto 0);	
			Q   : out STD_LOGIC_VECTOR(15 downto 0));			
	end component;

begin

	reg00: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK00);
	reg01: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000010100000010", Q => BLK01);
	reg02: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000100000101", Q => BLK02);
	reg03: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000100001000", Q => BLK03);
	reg04: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000001000000101", Q => BLK04);
	reg05: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000010000000000", Q => BLK05);
	reg06: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000001000001111", Q => BLK06);
	reg07: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000001100000100", Q => BLK07);
	reg08: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000010110101010", Q => BLK08);
	reg09: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000101000100", Q => BLK09);
	reg10: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK10);
	reg11: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK11);
	reg12: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000011000000000", Q => BLK12);
	reg13: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK13);
	reg14: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK14);
	reg15: reg PORT MAP (CLK => CLK, RST => '0', WRT => '1', D => "0000000000000000", Q => BLK15);
	
	process(CLK, ADR)
	begin
		if(rising_edge(CLK)) then
			case ADR is
				when "0000" =>
					O <= BLK00;
				when "0001" =>
					O <= BLK01;
				when "0010" =>
					O <= BLK02;
				when "0011" =>
					O <= BLK03;
				when "0100" =>
					O <= BLK04;
				when "0101" =>
					O <= BLK05;
				when "0110" =>
					O <= BLK06;
				when "0111" =>
					O <= BLK07;
				when "1000" =>
					O <= BLK08;
				when "1001" =>
					O <= BLK09;
				when "1010" =>
					O <= BLK10;
				when "1011" =>
					O <= BLK11;
				when "1100" =>
					O <= BLK12;
				when "1101" =>
					O <= BLK13;
				when "1110" =>
					O <= BLK14;
				when "1111" =>
					O <= BLK15;
				when others =>
					o <= "0000000000000000";
			end case;
		end if;
	end process;
	
	OP  <= O(15 downto 8);
	VAL <= O(7 downto 0);

end HEHE;