module agilex_hps (
		output wire          s2f_user_clk0_hio,    // h2f_user0_clock.clk
		output wire          s2f_user_clk1_hio,    // h2f_user1_clock.clk
		input  wire [4095:0] hps_emif_emif_to_hps, //        hps_emif.emif_to_hps
		output wire [4095:0] hps_emif_hps_to_emif, //                .hps_to_emif
		input  wire          hps_emif_emif_to_gp,  //                .emif_to_gp
		output wire [1:0]    hps_emif_gp_to_emif,  //                .gp_to_emif
		output wire          EMAC1_TX_CLK,         //          hps_io.EMAC1_TX_CLK
		output wire          EMAC1_TXD0,           //                .EMAC1_TXD0
		output wire          EMAC1_TXD1,           //                .EMAC1_TXD1
		output wire          EMAC1_TXD2,           //                .EMAC1_TXD2
		output wire          EMAC1_TXD3,           //                .EMAC1_TXD3
		input  wire          EMAC1_RX_CTL,         //                .EMAC1_RX_CTL
		output wire          EMAC1_TX_CTL,         //                .EMAC1_TX_CTL
		input  wire          EMAC1_RX_CLK,         //                .EMAC1_RX_CLK
		input  wire          EMAC1_RXD0,           //                .EMAC1_RXD0
		input  wire          EMAC1_RXD1,           //                .EMAC1_RXD1
		input  wire          EMAC1_RXD2,           //                .EMAC1_RXD2
		input  wire          EMAC1_RXD3,           //                .EMAC1_RXD3
		inout  wire          EMAC1_MDIO,           //                .EMAC1_MDIO
		output wire          EMAC1_MDC,            //                .EMAC1_MDC
		inout  wire          SDMMC_CMD,            //                .SDMMC_CMD
		inout  wire          SDMMC_D0,             //                .SDMMC_D0
		inout  wire          SDMMC_D1,             //                .SDMMC_D1
		inout  wire          SDMMC_D2,             //                .SDMMC_D2
		inout  wire          SDMMC_D3,             //                .SDMMC_D3
		inout  wire          SDMMC_D4,             //                .SDMMC_D4
		inout  wire          SDMMC_D5,             //                .SDMMC_D5
		inout  wire          SDMMC_D6,             //                .SDMMC_D6
		inout  wire          SDMMC_D7,             //                .SDMMC_D7
		output wire          SDMMC_CCLK,           //                .SDMMC_CCLK
		output wire          SPIM0_CLK,            //                .SPIM0_CLK
		output wire          SPIM0_MOSI,           //                .SPIM0_MOSI
		input  wire          SPIM0_MISO,           //                .SPIM0_MISO
		output wire          SPIM0_SS0_N,          //                .SPIM0_SS0_N
		output wire          SPIM1_CLK,            //                .SPIM1_CLK
		output wire          SPIM1_MOSI,           //                .SPIM1_MOSI
		input  wire          SPIM1_MISO,           //                .SPIM1_MISO
		output wire          SPIM1_SS0_N,          //                .SPIM1_SS0_N
		output wire          SPIM1_SS1_N,          //                .SPIM1_SS1_N
		input  wire          UART1_RX,             //                .UART1_RX
		output wire          UART1_TX,             //                .UART1_TX
		inout  wire          I2C1_SDA,             //                .I2C1_SDA
		inout  wire          I2C1_SCL,             //                .I2C1_SCL
		input  wire          hps_osc_clk,          //                .hps_osc_clk
		inout  wire          gpio0_io11,           //                .gpio0_io11
		inout  wire          gpio0_io12,           //                .gpio0_io12
		inout  wire          gpio0_io13,           //                .gpio0_io13
		inout  wire          gpio0_io14,           //                .gpio0_io14
		inout  wire          gpio0_io15,           //                .gpio0_io15
		inout  wire          gpio0_io16,           //                .gpio0_io16
		inout  wire          gpio0_io17,           //                .gpio0_io17
		inout  wire          gpio0_io18,           //                .gpio0_io18
		inout  wire          gpio1_io16,           //                .gpio1_io16
		inout  wire          gpio1_io17,           //                .gpio1_io17
		output wire          h2f_rst,              //       h2f_reset.reset
		input  wire          h2f_axi_clk,          //   h2f_axi_clock.clk
		input  wire          h2f_axi_rst_n,        //   h2f_axi_reset.reset_n
		output wire [3:0]    h2f_AWID,             //  h2f_axi_master.awid
		output wire [31:0]   h2f_AWADDR,           //                .awaddr
		output wire [7:0]    h2f_AWLEN,            //                .awlen
		output wire [2:0]    h2f_AWSIZE,           //                .awsize
		output wire [1:0]    h2f_AWBURST,          //                .awburst
		output wire          h2f_AWLOCK,           //                .awlock
		output wire [3:0]    h2f_AWCACHE,          //                .awcache
		output wire [2:0]    h2f_AWPROT,           //                .awprot
		output wire          h2f_AWVALID,          //                .awvalid
		input  wire          h2f_AWREADY,          //                .awready
		output wire [31:0]   h2f_WDATA,            //                .wdata
		output wire [3:0]    h2f_WSTRB,            //                .wstrb
		output wire          h2f_WLAST,            //                .wlast
		output wire          h2f_WVALID,           //                .wvalid
		input  wire          h2f_WREADY,           //                .wready
		input  wire [3:0]    h2f_BID,              //                .bid
		input  wire [1:0]    h2f_BRESP,            //                .bresp
		input  wire          h2f_BVALID,           //                .bvalid
		output wire          h2f_BREADY,           //                .bready
		output wire [3:0]    h2f_ARID,             //                .arid
		output wire [31:0]   h2f_ARADDR,           //                .araddr
		output wire [7:0]    h2f_ARLEN,            //                .arlen
		output wire [2:0]    h2f_ARSIZE,           //                .arsize
		output wire [1:0]    h2f_ARBURST,          //                .arburst
		output wire          h2f_ARLOCK,           //                .arlock
		output wire [3:0]    h2f_ARCACHE,          //                .arcache
		output wire [2:0]    h2f_ARPROT,           //                .arprot
		output wire          h2f_ARVALID,          //                .arvalid
		input  wire          h2f_ARREADY,          //                .arready
		input  wire [3:0]    h2f_RID,              //                .rid
		input  wire [31:0]   h2f_RDATA,            //                .rdata
		input  wire [1:0]    h2f_RRESP,            //                .rresp
		input  wire          h2f_RLAST,            //                .rlast
		input  wire          h2f_RVALID,           //                .rvalid
		output wire          h2f_RREADY,           //                .rready
		input  wire          f2h_axi_clk,          //   f2h_axi_clock.clk
		input  wire          f2h_axi_rst_n,        //   f2h_axi_reset.reset_n
		input  wire [4:0]    f2h_AWID,             //   f2h_axi_slave.awid
		input  wire [31:0]   f2h_AWADDR,           //                .awaddr
		input  wire [7:0]    f2h_AWLEN,            //                .awlen
		input  wire [2:0]    f2h_AWSIZE,           //                .awsize
		input  wire [1:0]    f2h_AWBURST,          //                .awburst
		input  wire          f2h_AWLOCK,           //                .awlock
		input  wire [3:0]    f2h_AWCACHE,          //                .awcache
		input  wire [2:0]    f2h_AWPROT,           //                .awprot
		input  wire          f2h_AWVALID,          //                .awvalid
		output wire          f2h_AWREADY,          //                .awready
		input  wire [3:0]    f2h_AWQOS,            //                .awqos
		input  wire [511:0]  f2h_WDATA,            //                .wdata
		input  wire [63:0]   f2h_WSTRB,            //                .wstrb
		input  wire          f2h_WLAST,            //                .wlast
		input  wire          f2h_WVALID,           //                .wvalid
		output wire          f2h_WREADY,           //                .wready
		output wire [4:0]    f2h_BID,              //                .bid
		output wire [1:0]    f2h_BRESP,            //                .bresp
		output wire          f2h_BVALID,           //                .bvalid
		input  wire          f2h_BREADY,           //                .bready
		input  wire [4:0]    f2h_ARID,             //                .arid
		input  wire [31:0]   f2h_ARADDR,           //                .araddr
		input  wire [7:0]    f2h_ARLEN,            //                .arlen
		input  wire [2:0]    f2h_ARSIZE,           //                .arsize
		input  wire [1:0]    f2h_ARBURST,          //                .arburst
		input  wire          f2h_ARLOCK,           //                .arlock
		input  wire [3:0]    f2h_ARCACHE,          //                .arcache
		input  wire [2:0]    f2h_ARPROT,           //                .arprot
		input  wire          f2h_ARVALID,          //                .arvalid
		output wire          f2h_ARREADY,          //                .arready
		input  wire [3:0]    f2h_ARQOS,            //                .arqos
		output wire [4:0]    f2h_RID,              //                .rid
		output wire [511:0]  f2h_RDATA,            //                .rdata
		output wire [1:0]    f2h_RRESP,            //                .rresp
		output wire          f2h_RLAST,            //                .rlast
		output wire          f2h_RVALID,           //                .rvalid
		input  wire          f2h_RREADY,           //                .rready
		input  wire [22:0]   f2h_ARUSER,           //                .aruser
		input  wire [22:0]   f2h_AWUSER,           //                .awuser
		input  wire [31:0]   f2h_irq_p0,           //        f2h_irq0.irq
		input  wire [31:0]   f2h_irq_p1            //        f2h_irq1.irq
	);
endmodule

