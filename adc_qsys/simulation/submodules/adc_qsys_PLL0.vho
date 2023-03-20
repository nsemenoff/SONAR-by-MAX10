--IP Functional Simulation Model
--VERSION_BEGIN 18.0 cbx_mgl 2018:04:24:18:08:49:SJ cbx_simgen 2018:04:24:18:04:18:SJ  VERSION_END


-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Intel disclaims all warranties of any kind).


--synopsys translate_off

 LIBRARY fiftyfivenm;
 USE fiftyfivenm.fiftyfivenm_components.all;

--synthesis_resources = fiftyfivenm_pll 1 lut 6 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  adc_qsys_PLL0 IS 
	 PORT 
	 ( 
		 address	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 areset	:	IN  STD_LOGIC;
		 c0	:	OUT  STD_LOGIC;
		 c1	:	OUT  STD_LOGIC;
		 c2	:	OUT  STD_LOGIC;
		 c3	:	OUT  STD_LOGIC;
		 c4	:	OUT  STD_LOGIC;
		 clk	:	IN  STD_LOGIC;
		 configupdate	:	IN  STD_LOGIC;
		 locked	:	OUT  STD_LOGIC;
		 phasecounterselect	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		 phasedone	:	OUT  STD_LOGIC;
		 phasestep	:	IN  STD_LOGIC;
		 phaseupdown	:	IN  STD_LOGIC;
		 read	:	IN  STD_LOGIC;
		 readdata	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 reset	:	IN  STD_LOGIC;
		 scanclk	:	IN  STD_LOGIC;
		 scanclkena	:	IN  STD_LOGIC;
		 scandata	:	IN  STD_LOGIC;
		 scandataout	:	OUT  STD_LOGIC;
		 scandone	:	OUT  STD_LOGIC;
		 write	:	IN  STD_LOGIC;
		 writedata	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END adc_qsys_PLL0;

 ARCHITECTURE RTL OF adc_qsys_PLL0 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_pll_lock_sync_134q	:	STD_LOGIC := '0';
	 SIGNAL	adc_qsys_pll0_pfdena_reg_24q	:	STD_LOGIC := '0';
	 SIGNAL	adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe4a_0_122q	:	STD_LOGIC := '0';
	 SIGNAL	adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe5a_0_125q	:	STD_LOGIC := '0';
	 SIGNAL	adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe6a_0_126q	:	STD_LOGIC := '0';
	 SIGNAL	adc_qsys_pll0_prev_reset_1q	:	STD_LOGIC := '0';
	 SIGNAL  wire_nO_w21w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nO_w_lg_adc_qsys_pll0_prev_reset_1q18w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nO_w_lg_w_lg_adc_qsys_pll0_prev_reset_1q18w20w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_fbout	:	STD_LOGIC;
	 SIGNAL  wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_inclk	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_lg_w24w25w26w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w24w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w19w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_address_range5w8w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_reset3w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w89w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_address_range6w7w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w24w25w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_locked_132_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_adc_qsys_pll0_w_select_control_17_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_adc_qsys_pll0_w_select_status_18_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_adc_qsys_pll0_wire_pfdena_reg_ena_14_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_vcc :	STD_LOGIC;
	 SIGNAL  wire_w_address_range5w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_address_range6w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_w_lg_w_lg_w24w25w26w(0) <= wire_w_lg_w24w25w(0) AND read;
	wire_w24w(0) <= s_wire_adc_qsys_pll0_w_select_control_17_dataout AND adc_qsys_pll0_pfdena_reg_24q;
	wire_w19w(0) <= s_wire_adc_qsys_pll0_w_select_status_18_dataout AND adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe6a_0_126q;
	wire_w_lg_w_address_range5w8w(0) <= wire_w_address_range5w(0) AND wire_w_lg_w_address_range6w7w(0);
	wire_w_lg_reset3w(0) <= NOT reset;
	wire_w89w(0) <= NOT s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout;
	wire_w_lg_w_address_range6w7w(0) <= NOT wire_w_address_range6w(0);
	wire_w_lg_w24w25w(0) <= wire_w24w(0) OR s_wire_adc_qsys_pll0_w_select_status_18_dataout;
	c0 <= wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk(0);
	c1 <= wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk(1);
	c2 <= wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk(2);
	c3 <= wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk(3);
	c4 <= wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk(4);
	locked <= s_wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_locked_132_dataout;
	phasedone <= '0';
	readdata <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & wire_w_lg_w_lg_w24w25w26w & wire_nO_w21w);
	s_wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_locked_132_dataout <= (adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_pll_lock_sync_134q AND wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked);
	s_wire_adc_qsys_pll0_w_select_control_17_dataout <= wire_w_lg_w_address_range5w8w(0);
	s_wire_adc_qsys_pll0_w_select_status_18_dataout <= ((NOT address(0)) AND wire_w_lg_w_address_range6w7w(0));
	s_wire_adc_qsys_pll0_wire_pfdena_reg_ena_14_dataout <= (s_wire_adc_qsys_pll0_w_select_control_17_dataout AND write);
	s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout <= (adc_qsys_pll0_prev_reset_1q OR areset);
	s_wire_vcc <= '1';
	scandataout <= '0';
	scandone <= '0';
	wire_w_address_range5w(0) <= address(0);
	wire_w_address_range6w(0) <= address(1);
	PROCESS (wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked, s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout)
	BEGIN
		IF (s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout = '1') THEN
				adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_pll_lock_sync_134q <= '0';
		ELSIF (wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked = '1' AND wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked'event) THEN
				adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_pll_lock_sync_134q <= s_wire_vcc;
		END IF;
	END PROCESS;
	PROCESS (clk, reset)
	BEGIN
		IF (reset = '1') THEN
				adc_qsys_pll0_pfdena_reg_24q <= '1';
		ELSIF (clk = '1' AND clk'event) THEN
			IF (s_wire_adc_qsys_pll0_wire_pfdena_reg_ena_14_dataout = '1') THEN
				adc_qsys_pll0_pfdena_reg_24q <= writedata(1);
			END IF;
		END IF;
		if (now = 0 ns) then
			adc_qsys_pll0_pfdena_reg_24q <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk, reset)
	BEGIN
		IF (reset = '1') THEN
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe4a_0_122q <= '0';
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe5a_0_125q <= '0';
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe6a_0_126q <= '0';
				adc_qsys_pll0_prev_reset_1q <= '0';
		ELSIF (clk = '1' AND clk'event) THEN
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe4a_0_122q <= s_wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_locked_132_dataout;
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe5a_0_125q <= adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe4a_0_122q;
				adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe6a_0_126q <= adc_qsys_pll0_adc_qsys_pll0_stdsync_sv6_stdsync2_adc_qsys_pll0_dffpipe_l2c_dffpipe3_dffe5a_0_125q;
				adc_qsys_pll0_prev_reset_1q <= (s_wire_adc_qsys_pll0_wire_pfdena_reg_ena_14_dataout AND writedata(0));
		END IF;
	END PROCESS;
	wire_nO_w21w(0) <= wire_nO_w_lg_w_lg_adc_qsys_pll0_prev_reset_1q18w20w(0) AND read;
	wire_nO_w_lg_adc_qsys_pll0_prev_reset_1q18w(0) <= adc_qsys_pll0_prev_reset_1q AND s_wire_adc_qsys_pll0_w_select_control_17_dataout;
	wire_nO_w_lg_w_lg_adc_qsys_pll0_prev_reset_1q18w20w(0) <= wire_nO_w_lg_adc_qsys_pll0_prev_reset_1q18w(0) OR wire_w19w(0);
	wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_inclk <= ( "0" & clk);
	adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144 :  fiftyfivenm_pll
	  GENERIC MAP (
		BANDWIDTH_TYPE => "auto",
		CLK0_DIVIDE_BY => 5,
		CLK0_DUTY_CYCLE => 50,
		CLK0_MULTIPLY_BY => 1,
		CLK0_PHASE_SHIFT => "0",
		COMPENSATE_CLOCK => "clk0",
		INCLK0_INPUT_FREQUENCY => 20000,
		OPERATION_MODE => "normal",
		PLL_TYPE => "auto"
	  )
	  PORT MAP ( 
		areset => s_wire_adc_qsys_pll0_wire_sd1_areset_20_dataout,
		clk => wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_clk,
		fbin => wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_fbout,
		fbout => wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_fbout,
		inclk => wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_inclk,
		locked => wire_adc_qsys_pll0_adc_qsys_pll0_altpll_5q22_sd1_fiftyfivenm_pll_pll7_144_locked
	  );

 END RTL; --adc_qsys_PLL0
--synopsys translate_on
--VALID FILE
