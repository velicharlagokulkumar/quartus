module qsys_top (
		output wire        hps_io_EMAC0_TX_CLK,              //                    hps_io.EMAC0_TX_CLK
		output wire        hps_io_EMAC0_TXD0,                //                          .EMAC0_TXD0
		output wire        hps_io_EMAC0_TXD1,                //                          .EMAC0_TXD1
		output wire        hps_io_EMAC0_TXD2,                //                          .EMAC0_TXD2
		output wire        hps_io_EMAC0_TXD3,                //                          .EMAC0_TXD3
		input  wire        hps_io_EMAC0_RX_CTL,              //                          .EMAC0_RX_CTL
		output wire        hps_io_EMAC0_TX_CTL,              //                          .EMAC0_TX_CTL
		input  wire        hps_io_EMAC0_RX_CLK,              //                          .EMAC0_RX_CLK
		input  wire        hps_io_EMAC0_RXD0,                //                          .EMAC0_RXD0
		input  wire        hps_io_EMAC0_RXD1,                //                          .EMAC0_RXD1
		input  wire        hps_io_EMAC0_RXD2,                //                          .EMAC0_RXD2
		input  wire        hps_io_EMAC0_RXD3,                //                          .EMAC0_RXD3
		inout  wire        hps_io_EMAC0_MDIO,                //                          .EMAC0_MDIO
		output wire        hps_io_EMAC0_MDC,                 //                          .EMAC0_MDC
		inout  wire        hps_io_SDMMC_CMD,                 //                          .SDMMC_CMD
		inout  wire        hps_io_SDMMC_D0,                  //                          .SDMMC_D0
		inout  wire        hps_io_SDMMC_D1,                  //                          .SDMMC_D1
		inout  wire        hps_io_SDMMC_D2,                  //                          .SDMMC_D2
		inout  wire        hps_io_SDMMC_D3,                  //                          .SDMMC_D3
		output wire        hps_io_SDMMC_CCLK,                //                          .SDMMC_CCLK
		inout  wire        hps_io_USB0_DATA0,                //                          .USB0_DATA0
		inout  wire        hps_io_USB0_DATA1,                //                          .USB0_DATA1
		inout  wire        hps_io_USB0_DATA2,                //                          .USB0_DATA2
		inout  wire        hps_io_USB0_DATA3,                //                          .USB0_DATA3
		inout  wire        hps_io_USB0_DATA4,                //                          .USB0_DATA4
		inout  wire        hps_io_USB0_DATA5,                //                          .USB0_DATA5
		inout  wire        hps_io_USB0_DATA6,                //                          .USB0_DATA6
		inout  wire        hps_io_USB0_DATA7,                //                          .USB0_DATA7
		input  wire        hps_io_USB0_CLK,                  //                          .USB0_CLK
		output wire        hps_io_USB0_STP,                  //                          .USB0_STP
		input  wire        hps_io_USB0_DIR,                  //                          .USB0_DIR
		input  wire        hps_io_USB0_NXT,                  //                          .USB0_NXT
		input  wire        hps_io_UART0_RX,                  //                          .UART0_RX
		output wire        hps_io_UART0_TX,                  //                          .UART0_TX
		inout  wire        hps_io_I2C1_SDA,                  //                          .I2C1_SDA
		inout  wire        hps_io_I2C1_SCL,                  //                          .I2C1_SCL
		inout  wire        hps_io_gpio1_io0,                 //                          .gpio1_io0
		inout  wire        hps_io_gpio1_io1,                 //                          .gpio1_io1
		inout  wire        hps_io_gpio1_io4,                 //                          .gpio1_io4
		inout  wire        hps_io_gpio1_io5,                 //                          .gpio1_io5
		input  wire        hps_io_jtag_tck,                  //                          .jtag_tck
		input  wire        hps_io_jtag_tms,                  //                          .jtag_tms
		output wire        hps_io_jtag_tdo,                  //                          .jtag_tdo
		input  wire        hps_io_jtag_tdi,                  //                          .jtag_tdi
		input  wire        hps_io_hps_osc_clk,               //                          .hps_osc_clk
		inout  wire        hps_io_gpio1_io19,                //                          .gpio1_io19
		inout  wire        hps_io_gpio1_io20,                //                          .gpio1_io20
		inout  wire        hps_io_gpio1_io21,                //                          .gpio1_io21
		output wire        h2f_reset_reset,                  //                 h2f_reset.reset
		input  wire [3:0]  mm2s_awcache,                     //                      mm2s.awcache
		input  wire [2:0]  mm2s_awprot,                      //                          .awprot
		input  wire [4:0]  mm2s_awuser,                      //                          .awuser
		input  wire [3:0]  mm2s_arcache,                     //                          .arcache
		input  wire [4:0]  mm2s_aruser,                      //                          .aruser
		input  wire [2:0]  mm2s_arprot,                      //                          .arprot
		input  wire        clk_100_clk,                      //                   clk_100.clk
		input  wire        emif_hps_pll_ref_clk_clk,         //      emif_hps_pll_ref_clk.clk
		input  wire        emif_hps_oct_oct_rzqin,           //              emif_hps_oct.oct_rzqin
		output wire [0:0]  emif_hps_mem_mem_ck,              //              emif_hps_mem.mem_ck
		output wire [0:0]  emif_hps_mem_mem_ck_n,            //                          .mem_ck_n
		output wire [16:0] emif_hps_mem_mem_a,               //                          .mem_a
		output wire [0:0]  emif_hps_mem_mem_act_n,           //                          .mem_act_n
		output wire [1:0]  emif_hps_mem_mem_ba,              //                          .mem_ba
		output wire [0:0]  emif_hps_mem_mem_bg,              //                          .mem_bg
		output wire [0:0]  emif_hps_mem_mem_cke,             //                          .mem_cke
		output wire [0:0]  emif_hps_mem_mem_cs_n,            //                          .mem_cs_n
		output wire [0:0]  emif_hps_mem_mem_odt,             //                          .mem_odt
		output wire [0:0]  emif_hps_mem_mem_reset_n,         //                          .mem_reset_n
		output wire [0:0]  emif_hps_mem_mem_par,             //                          .mem_par
		input  wire [0:0]  emif_hps_mem_mem_alert_n,         //                          .mem_alert_n
		inout  wire [8:0]  emif_hps_mem_mem_dqs,             //                          .mem_dqs
		inout  wire [8:0]  emif_hps_mem_mem_dqs_n,           //                          .mem_dqs_n
		inout  wire [71:0] emif_hps_mem_mem_dq,              //                          .mem_dq
		inout  wire [8:0]  emif_hps_mem_mem_dbi_n,           //                          .mem_dbi_n
		output wire [0:0]  ila_source,                       //                       ila.source
		output wire [1:0]  pio_0_external_connection_export, // pio_0_external_connection.export
		input  wire        reset_reset_n,                    //                     reset.reset_n
		output wire        ninit_done_ninit_done             //                ninit_done.ninit_done
	);
endmodule

