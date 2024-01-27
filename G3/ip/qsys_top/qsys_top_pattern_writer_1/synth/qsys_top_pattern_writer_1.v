// qsys_top_pattern_writer_1.v

// Generated using ACDS version 22.4 94

`timescale 1 ps / 1 ps
module qsys_top_pattern_writer_1 #(
		parameter ADDRESS_WIDTH          = 32,
		parameter LENGTH_WIDTH           = 32,
		parameter DATA_WIDTH             = 32,
		parameter BYTE_ENABLE_WIDTH      = 4,
		parameter BYTE_ENABLE_WIDTH_LOG2 = 2,
		parameter BURST_ENABLE           = 1,
		parameter MAX_BURST_COUNT        = 2,
		parameter BURST_WIDTH            = 2,
		parameter FIFO_DEPTH             = 128,
		parameter FIFO_DEPTH_LOG2        = 7,
		parameter BURST_REALIGN_ENABLE   = 1
	) (
		input  wire                                     clk,                //          clock.clk
		input  wire                                     reset,              //          reset.reset
		input  wire [(((DATA_WIDTH-1)-0)+1)-1:0]        snk_data,           // snk_data_slave.tdata
		input  wire                                     snk_valid,          //               .tvalid
		output wire                                     snk_ready,          //               .tready
		input  wire [95:0]                              snk_command_data,   //  snk_cmd_slave.tdata
		input  wire                                     snk_command_valid,  //               .tvalid
		output wire                                     snk_command_ready,  //               .tready
		output wire [(((ADDRESS_WIDTH-1)-0)+1)-1:0]     master_address,     //  avalon_master.address
		output wire                                     master_write,       //               .write
		output wire [(((DATA_WIDTH-1)-0)+1)-1:0]        master_writedata,   //               .writedata
		output wire [(((BURST_WIDTH-1)-0)+1)-1:0]       master_burstcount,  //               .burstcount
		output wire [(((BYTE_ENABLE_WIDTH-1)-0)+1)-1:0] master_byteenable,  //               .byteenable
		input  wire                                     master_waitrequest  //               .waitrequest
	);

	pattern_writer #(
		.ADDRESS_WIDTH          (ADDRESS_WIDTH),
		.LENGTH_WIDTH           (LENGTH_WIDTH),
		.DATA_WIDTH             (DATA_WIDTH),
		.BYTE_ENABLE_WIDTH      (BYTE_ENABLE_WIDTH),
		.BYTE_ENABLE_WIDTH_LOG2 (BYTE_ENABLE_WIDTH_LOG2),
		.BURST_ENABLE           (BURST_ENABLE),
		.MAX_BURST_COUNT        (MAX_BURST_COUNT),
		.BURST_WIDTH            (BURST_WIDTH),
		.FIFO_DEPTH             (FIFO_DEPTH),
		.FIFO_DEPTH_LOG2        (FIFO_DEPTH_LOG2),
		.BURST_REALIGN_ENABLE   (BURST_REALIGN_ENABLE)
	) pattern_writer_1 (
		.clk                (clk),                //   input,                              width = 1,          clock.clk
		.reset              (reset),              //   input,                              width = 1,          reset.reset
		.snk_data           (snk_data),           //   input,         width = (((DATA_WIDTH-1)-0)+1), snk_data_slave.tdata
		.snk_valid          (snk_valid),          //   input,                              width = 1,               .tvalid
		.snk_ready          (snk_ready),          //  output,                              width = 1,               .tready
		.snk_command_data   (snk_command_data),   //   input,                             width = 96,  snk_cmd_slave.tdata
		.snk_command_valid  (snk_command_valid),  //   input,                              width = 1,               .tvalid
		.snk_command_ready  (snk_command_ready),  //  output,                              width = 1,               .tready
		.master_address     (master_address),     //  output,      width = (((ADDRESS_WIDTH-1)-0)+1),  avalon_master.address
		.master_write       (master_write),       //  output,                              width = 1,               .write
		.master_writedata   (master_writedata),   //  output,         width = (((DATA_WIDTH-1)-0)+1),               .writedata
		.master_burstcount  (master_burstcount),  //  output,        width = (((BURST_WIDTH-1)-0)+1),               .burstcount
		.master_byteenable  (master_byteenable),  //  output,  width = (((BYTE_ENABLE_WIDTH-1)-0)+1),               .byteenable
		.master_waitrequest (master_waitrequest)  //   input,                              width = 1,               .waitrequest
	);

endmodule
