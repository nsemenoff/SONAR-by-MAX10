
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY filter IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(15 DOWNTO 0); -- sfix16_En11
         filter_out                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En11
         );
END filter;

ARCHITECTURE rtl OF filter IS
  -- Signals 0
  SIGNAL input_register 				: signed(15 DOWNTO 0) := (others => '0');
  SIGNAL y0									: signed(15 downto 0) := (others => '0');
  -- Section 1 Signals
  SIGNAL y1									: signed(15 downto 0) := (others => '0');
BEGIN

  -- Block Statements
  filter1_process : PROCESS (clk, reset)
  variable delay_x1 : signed(15 downto 0);
  variable delay_x2 : signed(15 downto 0);
  variable delay_y1 : signed(15 downto 0);
  variable delay_y2 : signed(15 downto 0);
  variable mul1 : signed(31 downto 0);
  variable mul2 : signed(31 downto 0);
  BEGIN
    IF reset = '1' THEN
      input_register <= (OTHERS => '0');
	  delay_x1 := (OTHERS => '0');
	  delay_x2 := (OTHERS => '0');
	  delay_y1 := (OTHERS => '0');
	  delay_y2 := (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF clk_enable = '1' THEN
        input_register <= signed( '0'&filter_in(15 downto 1) );
		mul1 := delay_y1*39000;
		mul2 := delay_y2*24575;
		y0 <= input_register + delay_x1 + delay_x1 + delay_x2 + mul1(31 downto 16) - mul2(31 downto 16);
		delay_y2 := delay_y1;
		delay_y1 := y0;
		delay_x2 := delay_x1;
		delay_x1 := input_register;
      END IF;
    END IF; 
  END PROCESS filter1_process;

  filter2_process : PROCESS (clk, reset)
  variable delay_x1 : signed(15 downto 0);
  variable delay_x2 : signed(15 downto 0);
  variable delay_y1 : signed(15 downto 0);
  variable delay_y2 : signed(15 downto 0);
  variable mul1 : signed(31 downto 0);
  variable mul2 : signed(31 downto 0);
  BEGIN
    IF reset = '1' THEN
	  delay_x1 := (OTHERS => '0');
	  delay_x2 := (OTHERS => '0');
	  delay_y1 := (OTHERS => '0');
	  delay_y2 := (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF clk_enable = '1' THEN
		mul1 := delay_y1*55009;
		mul2 := delay_y2*27796;
		y1 <= y0 - delay_x1 - delay_x1 + delay_x2 + mul1(31 downto 16) - mul2(31 downto 16);
		delay_y2 := delay_y1;
		delay_y1 := y1;
		delay_x2 := delay_x1;
		delay_x1 := y0;
		filter_out <= std_logic_vector(y1);
      END IF;
    END IF; 
  END PROCESS filter2_process;

  -- Assignment Statements
END rtl;
