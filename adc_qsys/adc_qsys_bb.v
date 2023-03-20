
module adc_qsys (
	clk_clk,
	command_valid,
	command_channel,
	command_startofpacket,
	command_endofpacket,
	command_ready,
	pll0_c1_clk,
	reset_reset_n,
	response_valid,
	response_channel,
	response_data,
	response_startofpacket,
	response_endofpacket);	

	input		clk_clk;
	input		command_valid;
	input	[4:0]	command_channel;
	input		command_startofpacket;
	input		command_endofpacket;
	output		command_ready;
	output		pll0_c1_clk;
	input		reset_reset_n;
	output		response_valid;
	output	[4:0]	response_channel;
	output	[11:0]	response_data;
	output		response_startofpacket;
	output		response_endofpacket;
endmodule
