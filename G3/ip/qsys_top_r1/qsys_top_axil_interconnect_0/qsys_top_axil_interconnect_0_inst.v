	qsys_top_axil_interconnect_0 #(
		.S_COUNT         (INTEGER_VALUE_FOR_S_COUNT),
		.M_COUNT         (INTEGER_VALUE_FOR_M_COUNT),
		.DATA_WIDTH      (INTEGER_VALUE_FOR_DATA_WIDTH),
		.ADDR_WIDTH      (INTEGER_VALUE_FOR_ADDR_WIDTH),
		.STRB_WIDTH      (INTEGER_VALUE_FOR_STRB_WIDTH),
		.M_REGIONS       (INTEGER_VALUE_FOR_M_REGIONS),
		.M_BASE_ADDR     (INTEGER_VALUE_FOR_M_BASE_ADDR),
		.M_ADDR_WIDTH    (INTEGER_VALUE_FOR_M_ADDR_WIDTH),
		.M_CONNECT_READ  (INTEGER_VALUE_FOR_M_CONNECT_READ),
		.M_CONNECT_WRITE (INTEGER_VALUE_FOR_M_CONNECT_WRITE),
		.M_SECURE        (INTEGER_VALUE_FOR_M_SECURE)
	) u0 (
		.clk            (_connected_to_clk_),            //   input,   width = 1,                  clock.clk
		.rst            (_connected_to_rst_),            //   input,   width = 1,             reset_sink.reset
		.s_axil_awprot  (_connected_to_s_axil_awprot_),  //   input,   width = 3,  altera_axi4lite_slave.awprot
		.s_axil_awaddr  (_connected_to_s_axil_awaddr_),  //   input,  width = 32,                       .awaddr
		.s_axil_awvalid (_connected_to_s_axil_awvalid_), //   input,   width = 1,                       .awvalid
		.s_axil_awready (_connected_to_s_axil_awready_), //  output,   width = 1,                       .awready
		.s_axil_wdata   (_connected_to_s_axil_wdata_),   //   input,  width = 32,                       .wdata
		.s_axil_wstrb   (_connected_to_s_axil_wstrb_),   //   input,   width = 4,                       .wstrb
		.s_axil_wvalid  (_connected_to_s_axil_wvalid_),  //   input,   width = 1,                       .wvalid
		.s_axil_wready  (_connected_to_s_axil_wready_),  //  output,   width = 1,                       .wready
		.s_axil_bresp   (_connected_to_s_axil_bresp_),   //  output,   width = 2,                       .bresp
		.s_axil_bvalid  (_connected_to_s_axil_bvalid_),  //  output,   width = 1,                       .bvalid
		.s_axil_bready  (_connected_to_s_axil_bready_),  //   input,   width = 1,                       .bready
		.s_axil_araddr  (_connected_to_s_axil_araddr_),  //   input,  width = 32,                       .araddr
		.s_axil_arprot  (_connected_to_s_axil_arprot_),  //   input,   width = 3,                       .arprot
		.s_axil_arvalid (_connected_to_s_axil_arvalid_), //   input,   width = 1,                       .arvalid
		.s_axil_arready (_connected_to_s_axil_arready_), //  output,   width = 1,                       .arready
		.s_axil_rdata   (_connected_to_s_axil_rdata_),   //  output,  width = 32,                       .rdata
		.s_axil_rresp   (_connected_to_s_axil_rresp_),   //  output,   width = 2,                       .rresp
		.s_axil_rvalid  (_connected_to_s_axil_rvalid_),  //  output,   width = 1,                       .rvalid
		.s_axil_rready  (_connected_to_s_axil_rready_),  //   input,   width = 1,                       .rready
		.m_axil_bready  (_connected_to_m_axil_bready_),  //  output,   width = 1, altera_axi4lite_master.bready
		.m_axil_araddr  (_connected_to_m_axil_araddr_),  //  output,  width = 32,                       .araddr
		.m_axil_arprot  (_connected_to_m_axil_arprot_),  //  output,   width = 3,                       .arprot
		.m_axil_arvalid (_connected_to_m_axil_arvalid_), //  output,   width = 1,                       .arvalid
		.m_axil_arready (_connected_to_m_axil_arready_), //   input,   width = 1,                       .arready
		.m_axil_rdata   (_connected_to_m_axil_rdata_),   //   input,  width = 32,                       .rdata
		.m_axil_rresp   (_connected_to_m_axil_rresp_),   //   input,   width = 2,                       .rresp
		.m_axil_rvalid  (_connected_to_m_axil_rvalid_),  //   input,   width = 1,                       .rvalid
		.m_axil_rready  (_connected_to_m_axil_rready_),  //  output,   width = 1,                       .rready
		.m_axil_awaddr  (_connected_to_m_axil_awaddr_),  //  output,  width = 32,                       .awaddr
		.m_axil_awprot  (_connected_to_m_axil_awprot_),  //  output,   width = 3,                       .awprot
		.m_axil_awvalid (_connected_to_m_axil_awvalid_), //  output,   width = 1,                       .awvalid
		.m_axil_awready (_connected_to_m_axil_awready_), //   input,   width = 1,                       .awready
		.m_axil_wdata   (_connected_to_m_axil_wdata_),   //  output,  width = 32,                       .wdata
		.m_axil_wstrb   (_connected_to_m_axil_wstrb_),   //  output,   width = 4,                       .wstrb
		.m_axil_wvalid  (_connected_to_m_axil_wvalid_),  //  output,   width = 1,                       .wvalid
		.m_axil_wready  (_connected_to_m_axil_wready_),  //   input,   width = 1,                       .wready
		.m_axil_bresp   (_connected_to_m_axil_bresp_),   //   input,   width = 2,                       .bresp
		.m_axil_bvalid  (_connected_to_m_axil_bvalid_)   //   input,   width = 1,                       .bvalid
	);

