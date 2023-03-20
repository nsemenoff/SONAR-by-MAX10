
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE IEEE.numeric_std.ALL;

entity kFilter is
	 port(
		 CLK : in STD_LOGIC;
		 DATA_en : in STD_LOGIC;
		 filterIn : in STD_LOGIC_VECTOR(7 downto 0);		
		 filterOut : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
	     );
end kFilter;

--}} End of automatically maintained section

architecture kFilter of kFilter is
	type delayLine is array (2 downto 0) of signed(7 downto 0);
	signal filterDelayLine : delayLine := (OTHERS => (OTHERS => '0'));	
begin
	
	simpleFilterProcess : process (CLK)
	begin
		if ( rising_edge(CLK) ) then
			if ( DATA_en='1' ) then	 
				filterDelayLine(2) <= filterDelayLine(1);
				filterDelayLine(1) <= filterDelayLine(0);
				filterDelayLine(0) <= signed(filterIn);
				
				if filterDelayLine(0)>=filterDelayLine(1) and filterDelayLine(0)<=filterDelayLine(2) then	filterOut <= std_logic_vector(filterDelayLine(0)); 
				elsif filterDelayLine(0)<=filterDelayLine(1) and filterDelayLine(0)>=filterDelayLine(2) then	filterOut <= std_logic_vector(filterDelayLine(0));
				elsif filterDelayLine(1)>=filterDelayLine(0) and filterDelayLine(1)<=filterDelayLine(2) then	filterOut <= std_logic_vector(filterDelayLine(1));	
				elsif filterDelayLine(1)<=filterDelayLine(0) and filterDelayLine(1)>=filterDelayLine(2) then	filterOut <= std_logic_vector(filterDelayLine(1));	
				elsif filterDelayLine(2)>=filterDelayLine(0) and filterDelayLine(2)<=filterDelayLine(1) then	filterOut <= std_logic_vector(filterDelayLine(2));	
				elsif filterDelayLine(2)<=filterDelayLine(0) and filterDelayLine(2)>=filterDelayLine(1) then	filterOut <= std_logic_vector(filterDelayLine(2));
				else
					filterOut <= (OTHERS => '0');
				end if;						
			end if;	-- data_en				
		end if;	-- clk				    
	end process;	
	 

end kFilter;
