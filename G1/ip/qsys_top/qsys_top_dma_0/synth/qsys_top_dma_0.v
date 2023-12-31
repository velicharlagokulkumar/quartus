// qsys_top_dma_0.v

// Generated using ACDS version 22.4 94

`timescale 1 ps / 1 ps
module qsys_top_dma_0 (
		input  wire        clk,                //                clk.clk
		input  wire        system_reset_n,     //              reset.reset_n
		input  wire [2:0]  dma_ctl_address,    // control_port_slave.address
		input  wire        dma_ctl_chipselect, //                   .chipselect
		output wire [31:0] dma_ctl_readdata,   //                   .readdata
		input  wire        dma_ctl_write_n,    //                   .write_n
		input  wire [31:0] dma_ctl_writedata,  //                   .writedata
		output wire        dma_ctl_irq,        //                irq.irq
		output wire [23:0] read_address,       //        read_master.address
		output wire        read_chipselect,    //                   .chipselect
		output wire        read_read_n,        //                   .read_n
		input  wire [31:0] read_readdata,      //                   .readdata
		input  wire        read_readdatavalid, //                   .readdatavalid
		input  wire        read_waitrequest,   //                   .waitrequest
		output wire [31:0] write_address,      //       write_master.address
		output wire        write_chipselect,   //                   .chipselect
		input  wire        write_waitrequest,  //                   .waitrequest
		output wire        write_write_n,      //                   .write_n
		output wire [31:0] write_writedata,    //                   .writedata
		output wire [3:0]  write_byteenable    //                   .byteenable
	);

	qsys_top_dma_0_altera_avalon_dma_1910_tjkdlhi dma_0 (
		.clk                (clk),                //   input,   width = 1,                clk.clk
		.system_reset_n     (system_reset_n),     //   input,   width = 1,              reset.reset_n
		.dma_ctl_address    (dma_ctl_address),    //   input,   width = 3, control_port_slave.address
		.dma_ctl_chipselect (dma_ctl_chipselect), //   input,   width = 1,                   .chipselect
		.dma_ctl_readdata   (dma_ctl_readdata),   //  output,  width = 32,                   .readdata
		.dma_ctl_write_n    (dma_ctl_write_n),    //   input,   width = 1,                   .write_n
		.dma_ctl_writedata  (dma_ctl_writedata),  //   input,  width = 32,                   .writedata
		.dma_ctl_irq        (dma_ctl_irq),        //  output,   width = 1,                irq.irq
		.read_address       (read_address),       //  output,  width = 24,        read_master.address
		.read_chipselect    (read_chipselect),    //  output,   width = 1,                   .chipselect
		.read_read_n        (read_read_n),        //  output,   width = 1,                   .read_n
		.read_readdata      (read_readdata),      //   input,  width = 32,                   .readdata
		.read_readdatavalid (read_readdatavalid), //   input,   width = 1,                   .readdatavalid
		.read_waitrequest   (read_waitrequest),   //   input,   width = 1,                   .waitrequest
		.write_address      (write_address),      //  output,  width = 32,       write_master.address
		.write_chipselect   (write_chipselect),   //  output,   width = 1,                   .chipselect
		.write_waitrequest  (write_waitrequest),  //   input,   width = 1,                   .waitrequest
		.write_write_n      (write_write_n),      //  output,   width = 1,                   .write_n
		.write_writedata    (write_writedata),    //  output,  width = 32,                   .writedata
		.write_byteenable   (write_byteenable)    //  output,   width = 4,                   .byteenable
	);

endmodule
