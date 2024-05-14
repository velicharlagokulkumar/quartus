module qsys_top_axil_interconnect_0 #(
		parameter S_COUNT         = 1,
		parameter M_COUNT         = 2,
		parameter DATA_WIDTH      = 32,
		parameter ADDR_WIDTH      = 12,
		parameter STRB_WIDTH      = 4,
		parameter M_REGIONS       = 1,
		parameter M_BASE_ADDR     = 0,
		parameter M_ADDR_WIDTH    = 0,
		parameter M_CONNECT_READ  = 0,
		parameter M_CONNECT_WRITE = 0,
		parameter M_SECURE        = 0
	) (
		input  wire        clk,            //                  clock.clk
		input  wire        rst,            //             reset_sink.reset
		input  wire [2:0]  s_axil_awprot,  //  altera_axi4lite_slave.awprot
		input  wire [31:0] s_axil_awaddr,  //                       .awaddr
		input  wire [0:0]  s_axil_awvalid, //                       .awvalid
		output wire [0:0]  s_axil_awready, //                       .awready
		input  wire [31:0] s_axil_wdata,   //                       .wdata
		input  wire [3:0]  s_axil_wstrb,   //                       .wstrb
		input  wire [0:0]  s_axil_wvalid,  //                       .wvalid
		output wire [0:0]  s_axil_wready,  //                       .wready
		output wire [1:0]  s_axil_bresp,   //                       .bresp
		output wire [0:0]  s_axil_bvalid,  //                       .bvalid
		input  wire [0:0]  s_axil_bready,  //                       .bready
		input  wire [31:0] s_axil_araddr,  //                       .araddr
		input  wire [2:0]  s_axil_arprot,  //                       .arprot
		input  wire [0:0]  s_axil_arvalid, //                       .arvalid
		output wire [0:0]  s_axil_arready, //                       .arready
		output wire [31:0] s_axil_rdata,   //                       .rdata
		output wire [1:0]  s_axil_rresp,   //                       .rresp
		output wire [0:0]  s_axil_rvalid,  //                       .rvalid
		input  wire [0:0]  s_axil_rready,  //                       .rready
		output wire        m_axil_bready,  // altera_axi4lite_master.bready
		output wire [31:0] m_axil_araddr,  //                       .araddr
		output wire [2:0]  m_axil_arprot,  //                       .arprot
		output wire        m_axil_arvalid, //                       .arvalid
		input  wire        m_axil_arready, //                       .arready
		input  wire [31:0] m_axil_rdata,   //                       .rdata
		input  wire [1:0]  m_axil_rresp,   //                       .rresp
		input  wire        m_axil_rvalid,  //                       .rvalid
		output wire        m_axil_rready,  //                       .rready
		output wire [31:0] m_axil_awaddr,  //                       .awaddr
		output wire [2:0]  m_axil_awprot,  //                       .awprot
		output wire        m_axil_awvalid, //                       .awvalid
		input  wire        m_axil_awready, //                       .awready
		output wire [31:0] m_axil_wdata,   //                       .wdata
		output wire [3:0]  m_axil_wstrb,   //                       .wstrb
		output wire        m_axil_wvalid,  //                       .wvalid
		input  wire        m_axil_wready,  //                       .wready
		input  wire [1:0]  m_axil_bresp,   //                       .bresp
		input  wire        m_axil_bvalid   //                       .bvalid
	);
endmodule

