module qsys_top_pattern_writer_0 #(
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
endmodule

