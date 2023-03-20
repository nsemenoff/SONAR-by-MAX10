library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CRC16_MB is
	 port(
		 CLK : in STD_LOGIC;
		 init : in STD_LOGIC;
		 DATA_en : in STD_LOGIC;
		 DATA : in STD_LOGIC_VECTOR(7 downto 0);
		 CRC : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end CRC16_MB;

--}} End of automatically maintained section

architecture CRC16_MB of CRC16_MB is
signal CRC_int : std_logic_vector(15 downto 0);
begin

	main: process(CLK, init, DATA_en)
	variable i : integer range 0 to 8;
	begin
		if rising_edge(CLK) then
			if DATA_en='1' then
				CRC_int(7 downto 0) <= CRC_int(7 downto 0) xor DATA;
				i := 0;
			elsif init='1' then
				CRC_int(15 downto 8) <= x"FF";
				CRC_int(7 downto 0) <= x"FF" xor DATA;
				i := 0;
			elsif i<8 then
				if CRC_int(0)='1' then
					CRC_int(15 downto 0) <= ('0'&CRC_int(15 downto 1)) xor x"A001";
				else
					CRC_int(15 downto 0) <= ('0'&CRC_int(15 downto 1));
				end if;
				i := i + 1;
			else
				CRC <= CRC_int;
			end if;
		end if;
	end process;

end CRC16_MB;
