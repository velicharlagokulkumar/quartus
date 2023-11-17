module agilex_hps (
		input  wire [4095:0] hps_emif_emif_to_hps, //       hps_emif.emif_to_hps
		output wire [4095:0] hps_emif_hps_to_emif, //               .hps_to_emif
		input  wire          hps_emif_emif_to_gp,  //               .emif_to_gp
		output wire [1:0]    hps_emif_gp_to_emif,  //               .gp_to_emif
		output wire          EMAC0_TX_CLK,         //         hps_io.EMAC0_TX_CLK
		output wire          EMAC0_TXD0,           //               .EMAC0_TXD0
		output wire          EMAC0_TXD1,           //               .EMAC0_TXD1
		output wire          EMAC0_TXD2,           //               .EMAC0_TXD2
		output wire          EMAC0_TXD3,           //               .EMAC0_TXD3
		input  wire          EMAC0_RX_CTL,         //               .EMAC0_RX_CTL
		output wire          EMAC0_TX_CTL,         //               .EMAC0_TX_CTL
		input  wire          EMAC0_RX_CLK,         //               .EMAC0_RX_CLK
		input  wire          EMAC0_RXD0,           //               .EMAC0_RXD0
		input  wire          EMAC0_RXD1,           //               .EMAC0_RXD1
		input  wire          EMAC0_RXD2,           //               .EMAC0_RXD2
		input  wire          EMAC0_RXD3,           //               .EMAC0_RXD3
		inout  wire          EMAC0_MDIO,           //               .EMAC0_MDIO
		output wire          EMAC0_MDC,            //               .EMAC0_MDC
		inout  wire          SDMMC_CMD,            //               .SDMMC_CMD
		inout  wire          SDMMC_D0,             //               .SDMMC_D0
		inout  wire          SDMMC_D1,             //               .SDMMC_D1
		inout  wire          SDMMC_D2,             //               .SDMMC_D2
		inout  wire          SDMMC_D3,             //               .SDMMC_D3
		output wire          SDMMC_CCLK,           //               .SDMMC_CCLK
		inout  wire          USB0_DATA0,           //               .USB0_DATA0
		inout  wire          USB0_DATA1,           //               .USB0_DATA1
		inout  wire          USB0_DATA2,           //               .USB0_DATA2
		inout  wire          USB0_DATA3,           //               .USB0_DATA3
		inout  wire          USB0_DATA4,           //               .USB0_DATA4
		inout  wire          USB0_DATA5,           //               .USB0_DATA5
		inout  wire          USB0_DATA6,           //               .USB0_DATA6
		inout  wire          USB0_DATA7,           //               .USB0_DATA7
		input  wire          USB0_CLK,             //               .USB0_CLK
		output wire          USB0_STP,             //               .USB0_STP
		input  wire          USB0_DIR,             //               .USB0_DIR
		input  wire          USB0_NXT,             //               .USB0_NXT
		input  wire          UART0_RX,             //               .UART0_RX
		output wire          UART0_TX,             //               .UART0_TX
		inout  wire          I2C1_SDA,             //               .I2C1_SDA
		inout  wire          I2C1_SCL,             //               .I2C1_SCL
		inout  wire          gpio1_io0,            //               .gpio1_io0
		inout  wire          gpio1_io1,            //               .gpio1_io1
		inout  wire          gpio1_io4,            //               .gpio1_io4
		inout  wire          gpio1_io5,            //               .gpio1_io5
		input  wire          jtag_tck,             //               .jtag_tck
		input  wire          jtag_tms,             //               .jtag_tms
		output wire          jtag_tdo,             //               .jtag_tdo
		input  wire          jtag_tdi,             //               .jtag_tdi
		input  wire          hps_osc_clk,          //               .hps_osc_clk
		inout  wire          gpio1_io19,           //               .gpio1_io19
		inout  wire          gpio1_io20,           //               .gpio1_io20
		inout  wire          gpio1_io21,           //               .gpio1_io21
		output wire          h2f_rst,              //      h2f_reset.reset
		input  wire          h2f_axi_clk,          //  h2f_axi_clock.clk
		input  wire          h2f_axi_rst_n,        //  h2f_axi_reset.reset_n
		output wire [3:0]    h2f_AWID,             // h2f_axi_master.awid
		output wire [31:0]   h2f_AWADDR,           //               .awaddr
		output wire [7:0]    h2f_AWLEN,            //               .awlen
		output wire [2:0]    h2f_AWSIZE,           //               .awsize
		output wire [1:0]    h2f_AWBURST,          //               .awburst
		output wire          h2f_AWLOCK,           //               .awlock
		output wire [3:0]    h2f_AWCACHE,          //               .awcache
		output wire [2:0]    h2f_AWPROT,           //               .awprot
		output wire          h2f_AWVALID,          //               .awvalid
		input  wire          h2f_AWREADY,          //               .awready
		output wire [127:0]  h2f_WDATA,            //               .wdata
		output wire [15:0]   h2f_WSTRB,            //               .wstrb
		output wire          h2f_WLAST,            //               .wlast
		output wire          h2f_WVALID,           //               .wvalid
		input  wire          h2f_WREADY,           //               .wready
		input  wire [3:0]    h2f_BID,              //               .bid
		input  wire [1:0]    h2f_BRESP,            //               .bresp
		input  wire          h2f_BVALID,           //               .bvalid
		output wire          h2f_BREADY,           //               .bready
		output wire [3:0]    h2f_ARID,             //               .arid
		output wire [31:0]   h2f_ARADDR,           //               .araddr
		output wire [7:0]    h2f_ARLEN,            //               .arlen
		output wire [2:0]    h2f_ARSIZE,           //               .arsize
		output wire [1:0]    h2f_ARBURST,          //               .arburst
		output wire          h2f_ARLOCK,           //               .arlock
		output wire [3:0]    h2f_ARCACHE,          //               .arcache
		output wire [2:0]    h2f_ARPROT,           //               .arprot
		output wire          h2f_ARVALID,          //               .arvalid
		input  wire          h2f_ARREADY,          //               .arready
		input  wire [3:0]    h2f_RID,              //               .rid
		input  wire [127:0]  h2f_RDATA,            //               .rdata
		input  wire [1:0]    h2f_RRESP,            //               .rresp
		input  wire          h2f_RLAST,            //               .rlast
		input  wire          h2f_RVALID,           //               .rvalid
		output wire          h2f_RREADY            //               .rready
	);
endmodule

