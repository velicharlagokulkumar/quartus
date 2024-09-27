module qsys_top_prbs_generator_1 #(
		parameter DATA_WIDTH = 32
	) (
		input  wire                              clk,            //      clock.clk
		input  wire                              reset,          //      reset.reset
		input  wire [2:0]                        csr_address,    //        csr.address
		input  wire [31:0]                       csr_writedata,  //           .writedata
		input  wire                              csr_write,      //           .write
		output wire [31:0]                       csr_readdata,   //           .readdata
		input  wire                              csr_read,       //           .read
		input  wire [3:0]                        csr_byteenable, //           .byteenable
		output wire [(((DATA_WIDTH-1)-0)+1)-1:0] src_data,       // src_master.tdata
		output wire                              src_valid,      //           .tvalid
		input  wire                              src_ready       //           .tready
	);
endmodule

