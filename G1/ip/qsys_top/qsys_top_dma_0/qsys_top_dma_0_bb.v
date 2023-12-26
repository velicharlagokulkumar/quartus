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
endmodule

