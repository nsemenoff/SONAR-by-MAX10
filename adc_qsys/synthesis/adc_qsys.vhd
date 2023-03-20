-- adc_qsys.vhd

-- Generated using ACDS version 18.0 614

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adc_qsys is
	port (
		clk_clk                : in  std_logic                     := '0';             --      clk.clk
		command_valid          : in  std_logic                     := '0';             --  command.valid
		command_channel        : in  std_logic_vector(4 downto 0)  := (others => '0'); --         .channel
		command_startofpacket  : in  std_logic                     := '0';             --         .startofpacket
		command_endofpacket    : in  std_logic                     := '0';             --         .endofpacket
		command_ready          : out std_logic;                                        --         .ready
		reset_reset_n          : in  std_logic                     := '0';             --    reset.reset_n
		response_valid         : out std_logic;                                        -- response.valid
		response_channel       : out std_logic_vector(4 downto 0);                     --         .channel
		response_data          : out std_logic_vector(11 downto 0);                    --         .data
		response_startofpacket : out std_logic;                                        --         .startofpacket
		response_endofpacket   : out std_logic                                         --         .endofpacket
	);
end entity adc_qsys;

architecture rtl of adc_qsys is
	component adc_qsys_ADC_0 is
		port (
			clock_clk              : in  std_logic                     := 'X';             -- clk
			reset_sink_reset_n     : in  std_logic                     := 'X';             -- reset_n
			adc_pll_clock_clk      : in  std_logic                     := 'X';             -- clk
			adc_pll_locked_export  : in  std_logic                     := 'X';             -- export
			command_valid          : in  std_logic                     := 'X';             -- valid
			command_channel        : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- channel
			command_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			command_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			command_ready          : out std_logic;                                        -- ready
			response_valid         : out std_logic;                                        -- valid
			response_channel       : out std_logic_vector(4 downto 0);                     -- channel
			response_data          : out std_logic_vector(11 downto 0);                    -- data
			response_startofpacket : out std_logic;                                        -- startofpacket
			response_endofpacket   : out std_logic                                         -- endofpacket
		);
	end component adc_qsys_ADC_0;

	component adc_qsys_PLL0 is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			reset              : in  std_logic                     := 'X';             -- reset
			read               : in  std_logic                     := 'X';             -- read
			write              : in  std_logic                     := 'X';             -- write
			address            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			c0                 : out std_logic;                                        -- clk
			areset             : in  std_logic                     := 'X';             -- export
			locked             : out std_logic;                                        -- export
			scandone           : out std_logic;                                        -- export
			scandataout        : out std_logic;                                        -- export
			c1                 : out std_logic;                                        -- clk
			c2                 : out std_logic;                                        -- clk
			c3                 : out std_logic;                                        -- clk
			c4                 : out std_logic;                                        -- clk
			phasedone          : out std_logic;                                        -- export
			phasecounterselect : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			phaseupdown        : in  std_logic                     := 'X';             -- export
			phasestep          : in  std_logic                     := 'X';             -- export
			scanclk            : in  std_logic                     := 'X';             -- export
			scanclkena         : in  std_logic                     := 'X';             -- export
			scandata           : in  std_logic                     := 'X';             -- export
			configupdate       : in  std_logic                     := 'X'              -- export
		);
	end component adc_qsys_PLL0;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal pll0_c0_clk                              : std_logic; -- PLL0:c0 -> ADC_0:adc_pll_clock_clk
	signal pll0_locked_conduit_export               : std_logic; -- PLL0:locked -> ADC_0:adc_pll_locked_export
	signal rst_controller_reset_out_reset           : std_logic; -- rst_controller:reset_out -> [PLL0:reset, rst_controller_reset_out_reset:in]
	signal reset_reset_n_ports_inv                  : std_logic; -- reset_reset_n:inv -> rst_controller:reset_in0
	signal rst_controller_reset_out_reset_ports_inv : std_logic; -- rst_controller_reset_out_reset:inv -> ADC_0:reset_sink_reset_n

begin

	adc_0 : component adc_qsys_ADC_0
		port map (
			clock_clk              => clk_clk,                                  --          clock.clk
			reset_sink_reset_n     => rst_controller_reset_out_reset_ports_inv, --     reset_sink.reset_n
			adc_pll_clock_clk      => pll0_c0_clk,                              --  adc_pll_clock.clk
			adc_pll_locked_export  => pll0_locked_conduit_export,               -- adc_pll_locked.export
			command_valid          => command_valid,                            --        command.valid
			command_channel        => command_channel,                          --               .channel
			command_startofpacket  => command_startofpacket,                    --               .startofpacket
			command_endofpacket    => command_endofpacket,                      --               .endofpacket
			command_ready          => command_ready,                            --               .ready
			response_valid         => response_valid,                           --       response.valid
			response_channel       => response_channel,                         --               .channel
			response_data          => response_data,                            --               .data
			response_startofpacket => response_startofpacket,                   --               .startofpacket
			response_endofpacket   => response_endofpacket                      --               .endofpacket
		);

	pll0 : component adc_qsys_PLL0
		port map (
			clk                => clk_clk,                        --       inclk_interface.clk
			reset              => rst_controller_reset_out_reset, -- inclk_interface_reset.reset
			read               => open,                           --             pll_slave.read
			write              => open,                           --                      .write
			address            => open,                           --                      .address
			readdata           => open,                           --                      .readdata
			writedata          => open,                           --                      .writedata
			c0                 => pll0_c0_clk,                    --                    c0.clk
			areset             => open,                           --        areset_conduit.export
			locked             => pll0_locked_conduit_export,     --        locked_conduit.export
			scandone           => open,                           --           (terminated)
			scandataout        => open,                           --           (terminated)
			c1                 => open,                           --           (terminated)
			c2                 => open,                           --           (terminated)
			c3                 => open,                           --           (terminated)
			c4                 => open,                           --           (terminated)
			phasedone          => open,                           --           (terminated)
			phasecounterselect => "000",                          --           (terminated)
			phaseupdown        => '0',                            --           (terminated)
			phasestep          => '0',                            --           (terminated)
			scanclk            => '0',                            --           (terminated)
			scanclkena         => '0',                            --           (terminated)
			scandata           => '0',                            --           (terminated)
			configupdate       => '0'                             --           (terminated)
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_in1      => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

	rst_controller_reset_out_reset_ports_inv <= not rst_controller_reset_out_reset;

end architecture rtl; -- of adc_qsys
