	qsys_top_prbs_generator_0 #(
		.DATA_WIDTH (INTEGER_VALUE_FOR_DATA_WIDTH)
	) u0 (
		.clk            (_connected_to_clk_),            //   input,                       width = 1,      clock.clk
		.reset          (_connected_to_reset_),          //   input,                       width = 1,      reset.reset
		.csr_address    (_connected_to_csr_address_),    //   input,                       width = 3,        csr.address
		.csr_writedata  (_connected_to_csr_writedata_),  //   input,                      width = 32,           .writedata
		.csr_write      (_connected_to_csr_write_),      //   input,                       width = 1,           .write
		.csr_readdata   (_connected_to_csr_readdata_),   //  output,                      width = 32,           .readdata
		.csr_read       (_connected_to_csr_read_),       //   input,                       width = 1,           .read
		.csr_byteenable (_connected_to_csr_byteenable_), //   input,                       width = 4,           .byteenable
		.src_data       (_connected_to_src_data_),       //  output,  width = (((DATA_WIDTH-1)-0)+1), src_master.tdata
		.src_valid      (_connected_to_src_valid_),      //  output,                       width = 1,           .tvalid
		.src_ready      (_connected_to_src_ready_)       //   input,                       width = 1,           .tready
	);

