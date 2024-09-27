module qsys_top_axi_conduit_merger_0 #(
		parameter ID_WIDTH      = 5,
		parameter DATA_WIDTH    = 32,
		parameter ADDRESS_WIDTH = 32,
		parameter AXUSER_WIDTH  = 5
	) (
		input  wire                      clk,       //             clock.clk
		input  wire                      rst_n,     //        reset_sink.reset_n
		output wire                      m_awvalid, // altera_axi_master.awvalid
		output wire [3:0]                m_awlen,   //                  .awlen
		output wire [2:0]                m_awsize,  //                  .awsize
		output wire [1:0]                m_awburst, //                  .awburst
		output wire [1:0]                m_awlock,  //                  .awlock
		output wire [3:0]                m_awcache, //                  .awcache
		output wire [2:0]                m_awprot,  //                  .awprot
		input  wire                      m_awready, //                  .awready
		output wire [AXUSER_WIDTH-1:0]   m_awuser,  //                  .awuser
		output wire                      m_arvalid, //                  .arvalid
		output wire [3:0]                m_arlen,   //                  .arlen
		output wire [2:0]                m_arsize,  //                  .arsize
		output wire [1:0]                m_arburst, //                  .arburst
		output wire [1:0]                m_arlock,  //                  .arlock
		output wire [3:0]                m_arcache, //                  .arcache
		output wire [2:0]                m_arprot,  //                  .arprot
		input  wire                      m_arready, //                  .arready
		output wire [AXUSER_WIDTH-1:0]   m_aruser,  //                  .aruser
		input  wire                      m_rvalid,  //                  .rvalid
		input  wire                      m_rlast,   //                  .rlast
		input  wire [1:0]                m_rresp,   //                  .rresp
		output wire                      m_rready,  //                  .rready
		output wire                      m_wvalid,  //                  .wvalid
		output wire                      m_wlast,   //                  .wlast
		input  wire                      m_wready,  //                  .wready
		input  wire                      m_bvalid,  //                  .bvalid
		input  wire [1:0]                m_bresp,   //                  .bresp
		output wire                      m_bready,  //                  .bready
		output wire [ADDRESS_WIDTH-1:0]  m_awaddr,  //                  .awaddr
		output wire [ID_WIDTH-1:0]       m_awid,    //                  .awid
		output wire [ADDRESS_WIDTH-1:0]  m_araddr,  //                  .araddr
		output wire [ID_WIDTH-1:0]       m_arid,    //                  .arid
		input  wire [DATA_WIDTH-1:0]     m_rdata,   //                  .rdata
		input  wire [ID_WIDTH-1:0]       m_rid,     //                  .rid
		output wire [DATA_WIDTH-1:0]     m_wdata,   //                  .wdata
		output wire [(DATA_WIDTH/8)-1:0] m_wstrb,   //                  .wstrb
		output wire [ID_WIDTH-1:0]       m_wid,     //                  .wid
		input  wire [ID_WIDTH-1:0]       m_bid,     //                  .bid
		input  wire                      s_awvalid, //  altera_axi_slave.awvalid
		input  wire [3:0]                s_awlen,   //                  .awlen
		input  wire [2:0]                s_awsize,  //                  .awsize
		input  wire [1:0]                s_awburst, //                  .awburst
		input  wire [1:0]                s_awlock,  //                  .awlock
		input  wire [3:0]                s_awcache, //                  .awcache
		input  wire [2:0]                s_awprot,  //                  .awprot
		output wire                      s_awready, //                  .awready
		input  wire [AXUSER_WIDTH-1:0]   s_awuser,  //                  .awuser
		input  wire                      s_arvalid, //                  .arvalid
		input  wire [3:0]                s_arlen,   //                  .arlen
		input  wire [2:0]                s_arsize,  //                  .arsize
		input  wire [1:0]                s_arburst, //                  .arburst
		input  wire [1:0]                s_arlock,  //                  .arlock
		input  wire [3:0]                s_arcache, //                  .arcache
		input  wire [2:0]                s_arprot,  //                  .arprot
		output wire                      s_arready, //                  .arready
		input  wire [AXUSER_WIDTH-1:0]   s_aruser,  //                  .aruser
		output wire                      s_rvalid,  //                  .rvalid
		output wire                      s_rlast,   //                  .rlast
		output wire [1:0]                s_rresp,   //                  .rresp
		input  wire                      s_rready,  //                  .rready
		input  wire                      s_wvalid,  //                  .wvalid
		input  wire                      s_wlast,   //                  .wlast
		output wire                      s_wready,  //                  .wready
		output wire                      s_bvalid,  //                  .bvalid
		output wire [1:0]                s_bresp,   //                  .bresp
		input  wire                      s_bready,  //                  .bready
		input  wire [ADDRESS_WIDTH-1:0]  s_awaddr,  //                  .awaddr
		input  wire [ID_WIDTH-1:0]       s_awid,    //                  .awid
		input  wire [ADDRESS_WIDTH-1:0]  s_araddr,  //                  .araddr
		input  wire [ID_WIDTH-1:0]       s_arid,    //                  .arid
		output wire [DATA_WIDTH-1:0]     s_rdata,   //                  .rdata
		output wire [ID_WIDTH-1:0]       s_rid,     //                  .rid
		input  wire [DATA_WIDTH-1:0]     s_wdata,   //                  .wdata
		input  wire [(DATA_WIDTH/8)-1:0] s_wstrb,   //                  .wstrb
		input  wire [ID_WIDTH-1:0]       s_wid,     //                  .wid
		output wire [ID_WIDTH-1:0]       s_bid,     //                  .bid
		input  wire [3:0]                c_awcache, //       conduit_end.awcache
		input  wire [2:0]                c_awprot,  //                  .awprot
		input  wire [AXUSER_WIDTH-1:0]   c_awuser,  //                  .awuser
		input  wire [3:0]                c_arcache, //                  .arcache
		input  wire [AXUSER_WIDTH-1:0]   c_aruser,  //                  .aruser
		input  wire [2:0]                c_arprot   //                  .arprot
	);
endmodule

