	qsys_top_dma_0 u0 (
		.clk                (_connected_to_clk_),                //   input,   width = 1,                clk.clk
		.system_reset_n     (_connected_to_system_reset_n_),     //   input,   width = 1,              reset.reset_n
		.dma_ctl_address    (_connected_to_dma_ctl_address_),    //   input,   width = 3, control_port_slave.address
		.dma_ctl_chipselect (_connected_to_dma_ctl_chipselect_), //   input,   width = 1,                   .chipselect
		.dma_ctl_readdata   (_connected_to_dma_ctl_readdata_),   //  output,  width = 32,                   .readdata
		.dma_ctl_write_n    (_connected_to_dma_ctl_write_n_),    //   input,   width = 1,                   .write_n
		.dma_ctl_writedata  (_connected_to_dma_ctl_writedata_),  //   input,  width = 32,                   .writedata
		.dma_ctl_irq        (_connected_to_dma_ctl_irq_),        //  output,   width = 1,                irq.irq
		.read_address       (_connected_to_read_address_),       //  output,  width = 24,        read_master.address
		.read_chipselect    (_connected_to_read_chipselect_),    //  output,   width = 1,                   .chipselect
		.read_read_n        (_connected_to_read_read_n_),        //  output,   width = 1,                   .read_n
		.read_readdata      (_connected_to_read_readdata_),      //   input,  width = 32,                   .readdata
		.read_readdatavalid (_connected_to_read_readdatavalid_), //   input,   width = 1,                   .readdatavalid
		.read_waitrequest   (_connected_to_read_waitrequest_),   //   input,   width = 1,                   .waitrequest
		.write_address      (_connected_to_write_address_),      //  output,  width = 32,       write_master.address
		.write_chipselect   (_connected_to_write_chipselect_),   //  output,   width = 1,                   .chipselect
		.write_waitrequest  (_connected_to_write_waitrequest_),  //   input,   width = 1,                   .waitrequest
		.write_write_n      (_connected_to_write_write_n_),      //  output,   width = 1,                   .write_n
		.write_writedata    (_connected_to_write_writedata_),    //  output,  width = 32,                   .writedata
		.write_byteenable   (_connected_to_write_byteenable_)    //  output,   width = 4,                   .byteenable
	);

