module qsys_top_ram_controller_1 #(
		parameter DEFAULT_TIMER_RESOLUTION = 10,
		parameter DEFAULT_BLOCK_SIZE       = 1024,
		parameter DEFAULT_TRAIL_DISTANCE   = 1
	) (
		input  wire        clk,                     //         clock.clk
		input  wire        reset,                   //         reset.reset
		input  wire [2:0]  csr_address,             //           csr.address
		input  wire        csr_read,                //              .read
		input  wire        csr_write,               //              .write
		output wire [31:0] csr_readdata,            //              .readdata
		input  wire [31:0] csr_writedata,           //              .writedata
		input  wire [3:0]  csr_byteenable,          //              .byteenable
		output wire        csr_waitrequest,         //              .waitrequest
		input  wire        src_write_command_ready, // src_write_cmd.tready
		output wire [95:0] src_write_command_data,  //              .tdata
		output wire        src_write_command_valid, //              .tvalid
		input  wire        src_read_command_ready,  //  src_read_cmd.tready
		output wire [96:0] src_read_command_data,   //              .tdata
		output wire        src_read_command_valid   //              .tvalid
	);
endmodule

