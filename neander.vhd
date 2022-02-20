library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity neander is
	PORT(
--			CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			REGQ: out STD_LOGIC_VECTOR(15 downto 0));
end neander;


architecture HEHE of neander IS

	signal CLK : STD_LOGIC := '0';

	signal PC_CNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

	component pc is
		PORT(
				CLK : in STD_LOGIC;
				INC : in STD_LOGIC;
				RST : in STD_LOGIC;
				CNT : out STD_LOGIC_VECTOR(3 downto 0));
	end component;

	signal REG_Q : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

	component reg is 
		PORT(
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			WRT : in STD_LOGIC;
			D   : in STD_LOGIC_VECTOR(15 downto 0);	
			Q   : out STD_LOGIC_VECTOR(15 downto 0));			
	end component;
	
	signal ALU_O : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

	component alu is
		PORT(
		   CLK : in STD_LOGIC;
			X   : in STD_LOGIC_VECTOR(15 downto 0);
			Y   : in STD_LOGIC_VECTOR (7 downto 0);
			OP  : in STD_LOGIC_VECTOR(3 downto 0);
			O   : out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	signal MEM_OP, MEM_VAL : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	component mem is
		PORT(
			CLK : in STD_LOGIC;
			ADR : in STD_LOGIC_VECTOR(3 downto 0);
			OP  : out STD_LOGIC_VECTOR(7 downto 0);
			VAL : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	signal OADD, OAND, OOR, ONOT, OY, OHLT, ONOP : STD_LOGIC := '0';
	
	component dec is
		PORT(
			OP   : in STD_LOGIC_VECTOR(7 downto 0);
			OADD : out STD_LOGIC;
			OAND : out STD_LOGIC;
			OOR  : out STD_LOGIC;
			ONOT : out STD_LOGIC;
			OY   : out STD_LOGIC;
			OHLT : out STD_LOGIC;
			ONOP : out STD_LOGIC);
	end component;
	
	signal CTL_INCPC, CTL_ZERPC, CTL_CAR : STD_LOGIC := '0';
	signal CTL_OP, CTL_PAR : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	
	component ctl is
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
	end component;
	
	signal MEMADR : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

	CLK <= not CLK after 5 ns;

	myPc: pc PORT MAP(
		CLK => CLK,
		INC => CTL_INCPC,
		RST => CTL_ZERPC,
	   CNT => PC_CNT);
		
   myReg: reg PORT MAP(
		CLK => CLK,
		RST => CTL_ZERPC,
		WRT => CTL_CAR,
		D   => ALU_O,
		Q   => REG_Q);
		
	myAlu: alu PORT MAP(
		CLK => CLK,
		X => REG_Q,
		Y => MEM_VAL,
		OP => CTL_OP,
		O => ALU_O);
		
	myMem: mem PORT MAP(
		CLK => CLK,
		ADR => MEMADR,
		OP  => MEM_OP,
		VAL => MEM_VAL);

   myDec: dec PORT MAP(
		OP => MEM_OP,
		OADD => OADD,
		OAND => OAND,
		OOR => OOR,
		ONOT => ONOT,
		OY => OY,
		OHLT => OHLT,
		ONOP => ONOP);
	
	myCtl: ctl PORT MAP(
		CLK => CLK,
		RST => RST,
		OADD => OADD,
		OAND => OAND,
		OOR => OOR,
		ONOT => ONOT,
		OY => OY,
		OHLT => OHLT,
		ONOP => ONOP,
		INCPC => CTL_INCPC,
		ZERPC => CTL_ZERPC,
		PAR => CTL_PAR,
		CAR => CTL_CAR,
		OP => CTL_OP);
	
	process(CLK)
	begin
		MEMADR <= PC_CNT;
		REGQ   <= REG_Q;
	end process;
		
end HEHE;