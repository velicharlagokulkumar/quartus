	qsys_top_pattern_writer_1 #(
		.ADDRESS_WIDTH          (INTEGER_VALUE_FOR_ADDRESS_WIDTH),
		.LENGTH_WIDTH           (INTEGER_VALUE_FOR_LENGTH_WIDTH),
		.DATA_WIDTH             (INTEGER_VALUE_FOR_DATA_WIDTH),
		.BYTE_ENABLE_WIDTH      (INTEGER_VALUE_FOR_BYTE_ENABLE_WIDTH),
		.BYTE_ENABLE_WIDTH_LOG2 (INTEGER_VALUE_FOR_BYTE_ENABLE_WIDTH_LOG2),
		.BURST_ENABLE           (INTEGER_VALUE_FOR_BURST_ENABLE),
		.MAX_BURST_COUNT        (INTEGER_VALUE_FOR_MAX_BURST_COUNT),
		.BURST_WIDTH            (INTEGER_VALUE_FOR_BURST_WIDTH),
		.FIFO_DEPTH             (INTEGER_VALUE_FOR_FIFO_DEPTH),
		.FIFO_DEPTH_LOG2        (INTEGER_VALUE_FOR_FIFO_DEPTH_LOG2),
		.BURST_REALIGN_ENABLE   (INTEGER_VALUE_FOR_BURST_REALIGN_ENABLE)
	) u0 (
		.clk                (_connected_to_clk_),                //   input,                              width = 1,          clock.clk
		.reset              (_connected_to_reset_),              //   input,                              width = 1,          reset.reset
		.snk_data           (_connected_to_snk_data_),           //   input,         width = (((DATA_WIDTH-1)-0)+1), snk_data_slave.tdata
		.snk_valid          (_connected_to_snk_valid_),          //   input,                              width = 1,               .tvalid
		.snk_ready          (_connected_to_snk_ready_),          //  output,                              width = 1,               .tready
		.snk_command_data   (_connected_to_snk_command_data_),   //   input,                             width = 96,  snk_cmd_slave.tdata
		.snk_command_valid  (_connected_to_snk_command_valid_),  //   input,                              width = 1,               .tvalid
		.snk_command_ready  (_connected_to_snk_command_ready_),  //  output,                              width = 1,               .tready
		.master_address     (_connected_to_master_address_),     //  output,      width = (((ADDRESS_WIDTH-1)-0)+1),  avalon_master.address
		.master_write       (_connected_to_master_write_),       //  output,                              width = 1,               .write
		.master_writedata   (_connected_to_master_writedata_),   //  output,         width = (((DATA_WIDTH-1)-0)+1),               .writedata
		.master_burstcount  (_connected_to_master_burstcount_),  //  output,        width = (((BURST_WIDTH-1)-0)+1),               .burstcount
		.master_byteenable  (_connected_to_master_byteenable_),  //  output,  width = (((BYTE_ENABLE_WIDTH-1)-0)+1),               .byteenable
		.master_waitrequest (_connected_to_master_waitrequest_)  //   input,                              width = 1,               .waitrequest
	);

