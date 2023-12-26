module agilex_hps (
		input  wire [4095:0] hps_emif_emif_to_hps, //          hps_emif.emif_to_hps
		output wire [4095:0] hps_emif_hps_to_emif, //                  .hps_to_emif
		input  wire          hps_emif_emif_to_gp,  //                  .emif_to_gp
		output wire [1:0]    hps_emif_gp_to_emif,  //                  .gp_to_emif
		output wire          EMAC0_TX_CLK,         //            hps_io.EMAC0_TX_CLK
		output wire          EMAC0_TXD0,           //                  .EMAC0_TXD0
		output wire          EMAC0_TXD1,           //                  .EMAC0_TXD1
		output wire          EMAC0_TXD2,           //                  .EMAC0_TXD2
		output wire          EMAC0_TXD3,           //                  .EMAC0_TXD3
		input  wire          EMAC0_RX_CTL,         //                  .EMAC0_RX_CTL
		output wire          EMAC0_TX_CTL,         //                  .EMAC0_TX_CTL
		input  wire          EMAC0_RX_CLK,         //                  .EMAC0_RX_CLK
		input  wire          EMAC0_RXD0,           //                  .EMAC0_RXD0
		input  wire          EMAC0_RXD1,           //                  .EMAC0_RXD1
		input  wire          EMAC0_RXD2,           //                  .EMAC0_RXD2
		input  wire          EMAC0_RXD3,           //                  .EMAC0_RXD3
		inout  wire          EMAC0_MDIO,           //                  .EMAC0_MDIO
		output wire          EMAC0_MDC,            //                  .EMAC0_MDC
		inout  wire          SDMMC_CMD,            //                  .SDMMC_CMD
		inout  wire          SDMMC_D0,             //                  .SDMMC_D0
		inout  wire          SDMMC_D1,             //                  .SDMMC_D1
		inout  wire          SDMMC_D2,             //                  .SDMMC_D2
		inout  wire          SDMMC_D3,             //                  .SDMMC_D3
		output wire          SDMMC_CCLK,           //                  .SDMMC_CCLK
		inout  wire          USB0_DATA0,           //                  .USB0_DATA0
		inout  wire          USB0_DATA1,           //                  .USB0_DATA1
		inout  wire          USB0_DATA2,           //                  .USB0_DATA2
		inout  wire          USB0_DATA3,           //                  .USB0_DATA3
		inout  wire          USB0_DATA4,           //                  .USB0_DATA4
		inout  wire          USB0_DATA5,           //                  .USB0_DATA5
		inout  wire          USB0_DATA6,           //                  .USB0_DATA6
		inout  wire          USB0_DATA7,           //                  .USB0_DATA7
		input  wire          USB0_CLK,             //                  .USB0_CLK
		output wire          USB0_STP,             //                  .USB0_STP
		input  wire          USB0_DIR,             //                  .USB0_DIR
		input  wire          USB0_NXT,             //                  .USB0_NXT
		input  wire          UART0_RX,             //                  .UART0_RX
		output wire          UART0_TX,             //                  .UART0_TX
		inout  wire          I2C1_SDA,             //                  .I2C1_SDA
		inout  wire          I2C1_SCL,             //                  .I2C1_SCL
		inout  wire          gpio1_io0,            //                  .gpio1_io0
		inout  wire          gpio1_io1,            //                  .gpio1_io1
		inout  wire          gpio1_io4,            //                  .gpio1_io4
		inout  wire          gpio1_io5,            //                  .gpio1_io5
		input  wire          jtag_tck,             //                  .jtag_tck
		input  wire          jtag_tms,             //                  .jtag_tms
		output wire          jtag_tdo,             //                  .jtag_tdo
		input  wire          jtag_tdi,             //                  .jtag_tdi
		input  wire          hps_osc_clk,          //                  .hps_osc_clk
		inout  wire          gpio1_io19,           //                  .gpio1_io19
		inout  wire          gpio1_io20,           //                  .gpio1_io20
		inout  wire          gpio1_io21,           //                  .gpio1_io21
		output wire          h2f_rst,              //         h2f_reset.reset
		input  wire          h2f_axi_clk,          //     h2f_axi_clock.clk
		input  wire          h2f_axi_rst_n,        //     h2f_axi_reset.reset_n
		output wire [3:0]    h2f_AWID,             //    h2f_axi_master.awid
		output wire [31:0]   h2f_AWADDR,           //                  .awaddr
		output wire [7:0]    h2f_AWLEN,            //                  .awlen
		output wire [2:0]    h2f_AWSIZE,           //                  .awsize
		output wire [1:0]    h2f_AWBURST,          //                  .awburst
		output wire          h2f_AWLOCK,           //                  .awlock
		output wire [3:0]    h2f_AWCACHE,          //                  .awcache
		output wire [2:0]    h2f_AWPROT,           //                  .awprot
		output wire          h2f_AWVALID,          //                  .awvalid
		input  wire          h2f_AWREADY,          //                  .awready
		output wire [127:0]  h2f_WDATA,            //                  .wdata
		output wire [15:0]   h2f_WSTRB,            //                  .wstrb
		output wire          h2f_WLAST,            //                  .wlast
		output wire          h2f_WVALID,           //                  .wvalid
		input  wire          h2f_WREADY,           //                  .wready
		input  wire [3:0]    h2f_BID,              //                  .bid
		input  wire [1:0]    h2f_BRESP,            //                  .bresp
		input  wire          h2f_BVALID,           //                  .bvalid
		output wire          h2f_BREADY,           //                  .bready
		output wire [3:0]    h2f_ARID,             //                  .arid
		output wire [31:0]   h2f_ARADDR,           //                  .araddr
		output wire [7:0]    h2f_ARLEN,            //                  .arlen
		output wire [2:0]    h2f_ARSIZE,           //                  .arsize
		output wire [1:0]    h2f_ARBURST,          //                  .arburst
		output wire          h2f_ARLOCK,           //                  .arlock
		output wire [3:0]    h2f_ARCACHE,          //                  .arcache
		output wire [2:0]    h2f_ARPROT,           //                  .arprot
		output wire          h2f_ARVALID,          //                  .arvalid
		input  wire          h2f_ARREADY,          //                  .arready
		input  wire [3:0]    h2f_RID,              //                  .rid
		input  wire [127:0]  h2f_RDATA,            //                  .rdata
		input  wire [1:0]    h2f_RRESP,            //                  .rresp
		input  wire          h2f_RLAST,            //                  .rlast
		input  wire          h2f_RVALID,           //                  .rvalid
		output wire          h2f_RREADY,           //                  .rready
		input  wire          h2f_lw_axi_clk,       //  h2f_lw_axi_clock.clk
		input  wire          h2f_lw_axi_rst_n,     //  h2f_lw_axi_reset.reset_n
		output wire [3:0]    h2f_lw_AWID,          // h2f_lw_axi_master.awid
		output wire [20:0]   h2f_lw_AWADDR,        //                  .awaddr
		output wire [7:0]    h2f_lw_AWLEN,         //                  .awlen
		output wire [2:0]    h2f_lw_AWSIZE,        //                  .awsize
		output wire [1:0]    h2f_lw_AWBURST,       //                  .awburst
		output wire          h2f_lw_AWLOCK,        //                  .awlock
		output wire [3:0]    h2f_lw_AWCACHE,       //                  .awcache
		output wire [2:0]    h2f_lw_AWPROT,        //                  .awprot
		output wire          h2f_lw_AWVALID,       //                  .awvalid
		input  wire          h2f_lw_AWREADY,       //                  .awready
		output wire [31:0]   h2f_lw_WDATA,         //                  .wdata
		output wire [3:0]    h2f_lw_WSTRB,         //                  .wstrb
		output wire          h2f_lw_WLAST,         //                  .wlast
		output wire          h2f_lw_WVALID,        //                  .wvalid
		input  wire          h2f_lw_WREADY,        //                  .wready
		input  wire [3:0]    h2f_lw_BID,           //                  .bid
		input  wire [1:0]    h2f_lw_BRESP,         //                  .bresp
		input  wire          h2f_lw_BVALID,        //                  .bvalid
		output wire          h2f_lw_BREADY,        //                  .bready
		output wire [3:0]    h2f_lw_ARID,          //                  .arid
		output wire [20:0]   h2f_lw_ARADDR,        //                  .araddr
		output wire [7:0]    h2f_lw_ARLEN,         //                  .arlen
		output wire [2:0]    h2f_lw_ARSIZE,        //                  .arsize
		output wire [1:0]    h2f_lw_ARBURST,       //                  .arburst
		output wire          h2f_lw_ARLOCK,        //                  .arlock
		output wire [3:0]    h2f_lw_ARCACHE,       //                  .arcache
		output wire [2:0]    h2f_lw_ARPROT,        //                  .arprot
		output wire          h2f_lw_ARVALID,       //                  .arvalid
		input  wire          h2f_lw_ARREADY,       //                  .arready
		input  wire [3:0]    h2f_lw_RID,           //                  .rid
		input  wire [31:0]   h2f_lw_RDATA,         //                  .rdata
		input  wire [1:0]    h2f_lw_RRESP,         //                  .rresp
		input  wire          h2f_lw_RLAST,         //                  .rlast
		input  wire          h2f_lw_RVALID,        //                  .rvalid
		output wire          h2f_lw_RREADY,        //                  .rready
		input  wire          f2h_axi_clk,          //     f2h_axi_clock.clk
		input  wire          f2h_axi_rst_n,        //     f2h_axi_reset.reset_n
		input  wire [4:0]    f2h_AWID,             //     f2h_axi_slave.awid
		input  wire [31:0]   f2h_AWADDR,           //                  .awaddr
		input  wire [7:0]    f2h_AWLEN,            //                  .awlen
		input  wire [2:0]    f2h_AWSIZE,           //                  .awsize
		input  wire [1:0]    f2h_AWBURST,          //                  .awburst
		input  wire          f2h_AWLOCK,           //                  .awlock
		input  wire [3:0]    f2h_AWCACHE,          //                  .awcache
		input  wire [2:0]    f2h_AWPROT,           //                  .awprot
		input  wire          f2h_AWVALID,          //                  .awvalid
		output wire          f2h_AWREADY,          //                  .awready
		input  wire [3:0]    f2h_AWQOS,            //                  .awqos
		input  wire [511:0]  f2h_WDATA,            //                  .wdata
		input  wire [63:0]   f2h_WSTRB,            //                  .wstrb
		input  wire          f2h_WLAST,            //                  .wlast
		input  wire          f2h_WVALID,           //                  .wvalid
		output wire          f2h_WREADY,           //                  .wready
		output wire [4:0]    f2h_BID,              //                  .bid
		output wire [1:0]    f2h_BRESP,            //                  .bresp
		output wire          f2h_BVALID,           //                  .bvalid
		input  wire          f2h_BREADY,           //                  .bready
		input  wire [4:0]    f2h_ARID,             //                  .arid
		input  wire [31:0]   f2h_ARADDR,           //                  .araddr
		input  wire [7:0]    f2h_ARLEN,            //                  .arlen
		input  wire [2:0]    f2h_ARSIZE,           //                  .arsize
		input  wire [1:0]    f2h_ARBURST,          //                  .arburst
		input  wire          f2h_ARLOCK,           //                  .arlock
		input  wire [3:0]    f2h_ARCACHE,          //                  .arcache
		input  wire [2:0]    f2h_ARPROT,           //                  .arprot
		input  wire          f2h_ARVALID,          //                  .arvalid
		output wire          f2h_ARREADY,          //                  .arready
		input  wire [3:0]    f2h_ARQOS,            //                  .arqos
		output wire [4:0]    f2h_RID,              //                  .rid
		output wire [511:0]  f2h_RDATA,            //                  .rdata
		output wire [1:0]    f2h_RRESP,            //                  .rresp
		output wire          f2h_RLAST,            //                  .rlast
		output wire          f2h_RVALID,           //                  .rvalid
		input  wire          f2h_RREADY,           //                  .rready
		input  wire [22:0]   f2h_ARUSER,           //                  .aruser
		input  wire [22:0]   f2h_AWUSER,           //                  .awuser
		input  wire [31:0]   f2h_irq_p0,           //          f2h_irq0.irq
		input  wire [31:0]   f2h_irq_p1            //          f2h_irq1.irq
	);
endmodule

