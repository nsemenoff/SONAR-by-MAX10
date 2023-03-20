	adc_qsys u0 (
		.clk_clk                (<connected-to-clk_clk>),                //      clk.clk
		.command_valid          (<connected-to-command_valid>),          //  command.valid
		.command_channel        (<connected-to-command_channel>),        //         .channel
		.command_startofpacket  (<connected-to-command_startofpacket>),  //         .startofpacket
		.command_endofpacket    (<connected-to-command_endofpacket>),    //         .endofpacket
		.command_ready          (<connected-to-command_ready>),          //         .ready
		.pll0_c1_clk            (<connected-to-pll0_c1_clk>),            //  pll0_c1.clk
		.reset_reset_n          (<connected-to-reset_reset_n>),          //    reset.reset_n
		.response_valid         (<connected-to-response_valid>),         // response.valid
		.response_channel       (<connected-to-response_channel>),       //         .channel
		.response_data          (<connected-to-response_data>),          //         .data
		.response_startofpacket (<connected-to-response_startofpacket>), //         .startofpacket
		.response_endofpacket   (<connected-to-response_endofpacket>)    //         .endofpacket
	);

