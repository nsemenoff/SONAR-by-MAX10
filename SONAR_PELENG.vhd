library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--USE IEEE.std_logic_signed.ALL;
--use IEEE.std_logic_arith.ALL;

entity SONAR_PELENG is
	 port(
		 CLK : in STD_LOGIC;
		 DATA_en : in STD_LOGIC;
		 DATA_A : in STD_LOGIC_VECTOR(15 downto 0);
		 DATA_B : in STD_LOGIC_VECTOR(15 downto 0);
		 DATA_C : in STD_LOGIC_VECTOR(15 downto 0);
		 detect : inout std_logic := '0';
		 K12 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		 K13 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		 K23 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		 Kxx_en : out std_logic;
		 LEVEL_OUT : out std_logic_vector(15 downto 0)
	     );
end SONAR_PELENG;

--}} End of automatically maintained section

architecture SONAR_PELENG of SONAR_PELENG is 
constant max_delay : integer := 4;
signal s1_f : signed(15 downto 0) := (others => '0');
signal s2_f : signed(15 downto 0) := (others => '0');
signal s3_f : signed(15 downto 0) := (others => '0');
signal old_s1: signed(15 downto 0) := (others => '0');
signal old_s2: signed(15 downto 0) := (others => '0');
signal old_s3: signed(15 downto 0) := (others => '0');
signal abs_s1 : unsigned(15 downto 0) := (others => '0');
signal cntr : integer range 0 to 67 := 0;
signal int_en : std_logic := '0';

signal K12_sum : signed(9 downto 0) := (others => '0');
signal K13_sum : signed(9 downto 0) := (others => '0');
signal K23_sum : signed(9 downto 0) := (others => '0');

signal level: unsigned(23 downto 0) := (others => '0');
signal level_noise: unsigned(31 downto 0) := (others => '0');
signal level_ff : unsigned(15 downto 0) := (others => '0');
begin

	filter: process(CLK, DATA_en)
	variable mult_buff : unsigned(31 downto 0);
	variable mult_noise : unsigned(47 downto 0);
	variable i1 : signed(3 downto 0) := (others => '0');
	variable i2 : signed(3 downto 0) := (others => '0');
	variable i3 : signed(3 downto 0) := (others => '0');
	variable noise_cnt : integer range 0 to 63 := 0;
	variable detect_filter : integer range 0 to 127 := 0;
	begin
		if rising_edge(CLK) then
			if DATA_en='1' then
				old_s1 <= s1_f;
				s1_f <= signed(DATA_A);

				old_s2 <= s2_f;
				s2_f <= signed(DATA_B);
				
				old_s3 <= s3_f;
				s3_f <= signed(DATA_C);

				if s1_f>0 then
					abs_s1 <= unsigned(s1_f);
				else
					abs_s1 <= unsigned(-s1_f);
				end if;
----------------------------------			
				if abs_s1 > level(23 downto 8) then
					level(23 downto 8) <= abs_s1;
					level(7 downto 0) <= (others => '0');
				else
					mult_buff := level(23 downto 8) * x"FFF0"; 
					level <= mult_buff(31 downto 8); -- abs_s1 + 
				end if;
-----------------------------------
--				if (level + level(23 downto 1)) > level_noise(31 downto 8) then
--					if noise_cnt=63 then
--						mult_noise := level_noise(31 downto 0) * x"FFFF";
--						level_noise <= level + level(23 downto 1) + mult_noise(47 downto 16);
--						noise_cnt := 0;
--					else
--						noise_cnt := noise_cnt + 1;
--					end if;
--				else
--					mult_noise := level_noise(31 downto 0) * x"FFF0";
--					level_noise <= mult_noise(47 downto 16);
--				end if;

----------------------------------				
				if (('0'&level(23 downto 8)) > X"3000") then -- ('0'&level_noise(31 downto 16))) then
					-- detect
					
					if detect = '0' then
						if detect_filter = 47 then
							detect <= '1';
							level_ff <= (others => '0');
						else
							detect_filter := detect_filter + 1;
						end if;
					else
						if level_ff<level(23 downto 8) then
							level_ff <= level(23 downto 8);
						end if;
						 -------
						if (old_s1<0) and (s1_f>0) then
							i1 := (others => '0');
							int_en <= '1';
						else
							if i1<max_delay+1 then
								i1 := i1 + 1;
							end if;
						end if;
						if (old_s2<0) and (s2_f>0) then
							i2 := (others => '0');
						else
							if i2<max_delay+1 then
								i2 := i2 + 1;
							end if;
						end if;
						if (old_s3<0) and (s3_f>0) then
							i3 := (others => '0');
						else
							if i3<max_delay+1 then
								i3 := i3 + 1;
							end if;
						end if;	
						 --------=============================================
						if i1=0 then
							if cntr<67 then
								cntr <= cntr + 1;
							end if;
							if cntr<66 then
								if i2<=max_delay then
									K12_sum <= K12_sum + i2;
								end if;
								if i3<=max_delay then
									K13_sum <= K13_sum + i3;
								end if;
							end if;
						elsif i2=0 then
							if cntr<66 then
								if i1<=max_delay then
									K12_sum <= K12_sum - i1;
								end if;
								if i3<=max_delay then
									K23_sum <= K23_sum + i3;
								end if;
							end if;
						elsif i3=0 then
							if cntr<66 then
								if i1<=max_delay then
									K13_sum <= K13_sum - i1;
								end if;
								if i2<=max_delay then
									K23_sum <= K23_sum - i2;
								end if;
							end if;	-- cntr
						end if;	-- i=0
						 --------=============================================
					end if;	-- detect == 0?
				else
					detect <= '0';
					
					cntr <= 0;
					
					if detect='1' then
						if cntr>66 then
							K12 <= std_logic_vector(K12_sum(8 downto 1));
							K13 <= std_logic_vector(K13_sum(8 downto 1));
							K23 <= std_logic_vector(K23_sum(8 downto 1));
						end if;
						K12_sum <= (others => '0');
						K13_sum <= (others => '0');
						K23_sum <= (others => '0');
						detect_filter := 31;
					else
						if detect_filter>0 then
							detect_filter := detect_filter - 1;
						end if;
					end if;
				end if;
			else
				int_en <= '0';
			end if;	-- DATA_en
		end if; -- clk
	end process;

	Kxx_en <= '1' when (int_en='1' and DATA_en='1') else '0'; 

	LEVEL_OUT <= std_logic_vector(level_ff);

end SONAR_PELENG;
