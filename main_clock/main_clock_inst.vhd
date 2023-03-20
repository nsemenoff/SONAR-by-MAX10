	component main_clock is
		port (
			clkout : out std_logic;        -- clk
			oscena : in  std_logic := 'X'  -- oscena
		);
	end component main_clock;

	u0 : component main_clock
		port map (
			clkout => CONNECTED_TO_clkout, -- clkout.clk
			oscena => CONNECTED_TO_oscena  -- oscena.oscena
		);

