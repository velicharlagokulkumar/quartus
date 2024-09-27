	qsys_top_ram_controller_1 #(
		.DEFAULT_TIMER_RESOLUTION (INTEGER_VALUE_FOR_DEFAULT_TIMER_RESOLUTION),
		.DEFAULT_BLOCK_SIZE       (INTEGER_VALUE_FOR_DEFAULT_BLOCK_SIZE),
		.DEFAULT_TRAIL_DISTANCE   (INTEGER_VALUE_FOR_DEFAULT_TRAIL_DISTANCE)
	) u0 (
		.clk                     (_connected_to_clk_),                     //   input,   width = 1,         clock.clk
		.reset                   (_connected_to_reset_),                   //   input,   width = 1,         reset.reset
		.csr_address             (_connected_to_csr_address_),             //   input,   width = 3,           csr.address
		.csr_read                (_connected_to_csr_read_),                //   input,   width = 1,              .read
		.csr_write               (_connected_to_csr_write_),               //   input,   width = 1,              .write
		.csr_readdata            (_connected_to_csr_readdata_),            //  output,  width = 32,              .readdata
		.csr_writedata           (_connected_to_csr_writedata_),           //   input,  width = 32,              .writedata
		.csr_byteenable          (_connected_to_csr_byteenable_),          //   input,   width = 4,              .byteenable
		.csr_waitrequest         (_connected_to_csr_waitrequest_),         //  output,   width = 1,              .waitrequest
		.src_write_command_ready (_connected_to_src_write_command_ready_), //   input,   width = 1, src_write_cmd.tready
		.src_write_command_data  (_connected_to_src_write_command_data_),  //  output,  width = 96,              .tdata
		.src_write_command_valid (_connected_to_src_write_command_valid_), //  output,   width = 1,              .tvalid
		.src_read_command_ready  (_connected_to_src_read_command_ready_),  //   input,   width = 1,  src_read_cmd.tready
		.src_read_command_data   (_connected_to_src_read_command_data_),   //  output,  width = 97,              .tdata
		.src_read_command_valid  (_connected_to_src_read_command_valid_)   //  output,   width = 1,              .tvalid
	);

