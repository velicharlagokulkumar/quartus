	qsys_top u0 (
		.hps_io_EMAC0_TX_CLK              (_connected_to_hps_io_EMAC0_TX_CLK_),              //  output,   width = 1,                    hps_io.EMAC0_TX_CLK
		.hps_io_EMAC0_TXD0                (_connected_to_hps_io_EMAC0_TXD0_),                //  output,   width = 1,                          .EMAC0_TXD0
		.hps_io_EMAC0_TXD1                (_connected_to_hps_io_EMAC0_TXD1_),                //  output,   width = 1,                          .EMAC0_TXD1
		.hps_io_EMAC0_TXD2                (_connected_to_hps_io_EMAC0_TXD2_),                //  output,   width = 1,                          .EMAC0_TXD2
		.hps_io_EMAC0_TXD3                (_connected_to_hps_io_EMAC0_TXD3_),                //  output,   width = 1,                          .EMAC0_TXD3
		.hps_io_EMAC0_RX_CTL              (_connected_to_hps_io_EMAC0_RX_CTL_),              //   input,   width = 1,                          .EMAC0_RX_CTL
		.hps_io_EMAC0_TX_CTL              (_connected_to_hps_io_EMAC0_TX_CTL_),              //  output,   width = 1,                          .EMAC0_TX_CTL
		.hps_io_EMAC0_RX_CLK              (_connected_to_hps_io_EMAC0_RX_CLK_),              //   input,   width = 1,                          .EMAC0_RX_CLK
		.hps_io_EMAC0_RXD0                (_connected_to_hps_io_EMAC0_RXD0_),                //   input,   width = 1,                          .EMAC0_RXD0
		.hps_io_EMAC0_RXD1                (_connected_to_hps_io_EMAC0_RXD1_),                //   input,   width = 1,                          .EMAC0_RXD1
		.hps_io_EMAC0_RXD2                (_connected_to_hps_io_EMAC0_RXD2_),                //   input,   width = 1,                          .EMAC0_RXD2
		.hps_io_EMAC0_RXD3                (_connected_to_hps_io_EMAC0_RXD3_),                //   input,   width = 1,                          .EMAC0_RXD3
		.hps_io_EMAC0_MDIO                (_connected_to_hps_io_EMAC0_MDIO_),                //   inout,   width = 1,                          .EMAC0_MDIO
		.hps_io_EMAC0_MDC                 (_connected_to_hps_io_EMAC0_MDC_),                 //  output,   width = 1,                          .EMAC0_MDC
		.hps_io_SDMMC_CMD                 (_connected_to_hps_io_SDMMC_CMD_),                 //   inout,   width = 1,                          .SDMMC_CMD
		.hps_io_SDMMC_D0                  (_connected_to_hps_io_SDMMC_D0_),                  //   inout,   width = 1,                          .SDMMC_D0
		.hps_io_SDMMC_D1                  (_connected_to_hps_io_SDMMC_D1_),                  //   inout,   width = 1,                          .SDMMC_D1
		.hps_io_SDMMC_D2                  (_connected_to_hps_io_SDMMC_D2_),                  //   inout,   width = 1,                          .SDMMC_D2
		.hps_io_SDMMC_D3                  (_connected_to_hps_io_SDMMC_D3_),                  //   inout,   width = 1,                          .SDMMC_D3
		.hps_io_SDMMC_CCLK                (_connected_to_hps_io_SDMMC_CCLK_),                //  output,   width = 1,                          .SDMMC_CCLK
		.hps_io_USB0_DATA0                (_connected_to_hps_io_USB0_DATA0_),                //   inout,   width = 1,                          .USB0_DATA0
		.hps_io_USB0_DATA1                (_connected_to_hps_io_USB0_DATA1_),                //   inout,   width = 1,                          .USB0_DATA1
		.hps_io_USB0_DATA2                (_connected_to_hps_io_USB0_DATA2_),                //   inout,   width = 1,                          .USB0_DATA2
		.hps_io_USB0_DATA3                (_connected_to_hps_io_USB0_DATA3_),                //   inout,   width = 1,                          .USB0_DATA3
		.hps_io_USB0_DATA4                (_connected_to_hps_io_USB0_DATA4_),                //   inout,   width = 1,                          .USB0_DATA4
		.hps_io_USB0_DATA5                (_connected_to_hps_io_USB0_DATA5_),                //   inout,   width = 1,                          .USB0_DATA5
		.hps_io_USB0_DATA6                (_connected_to_hps_io_USB0_DATA6_),                //   inout,   width = 1,                          .USB0_DATA6
		.hps_io_USB0_DATA7                (_connected_to_hps_io_USB0_DATA7_),                //   inout,   width = 1,                          .USB0_DATA7
		.hps_io_USB0_CLK                  (_connected_to_hps_io_USB0_CLK_),                  //   input,   width = 1,                          .USB0_CLK
		.hps_io_USB0_STP                  (_connected_to_hps_io_USB0_STP_),                  //  output,   width = 1,                          .USB0_STP
		.hps_io_USB0_DIR                  (_connected_to_hps_io_USB0_DIR_),                  //   input,   width = 1,                          .USB0_DIR
		.hps_io_USB0_NXT                  (_connected_to_hps_io_USB0_NXT_),                  //   input,   width = 1,                          .USB0_NXT
		.hps_io_UART0_RX                  (_connected_to_hps_io_UART0_RX_),                  //   input,   width = 1,                          .UART0_RX
		.hps_io_UART0_TX                  (_connected_to_hps_io_UART0_TX_),                  //  output,   width = 1,                          .UART0_TX
		.hps_io_I2C1_SDA                  (_connected_to_hps_io_I2C1_SDA_),                  //   inout,   width = 1,                          .I2C1_SDA
		.hps_io_I2C1_SCL                  (_connected_to_hps_io_I2C1_SCL_),                  //   inout,   width = 1,                          .I2C1_SCL
		.hps_io_gpio1_io0                 (_connected_to_hps_io_gpio1_io0_),                 //   inout,   width = 1,                          .gpio1_io0
		.hps_io_gpio1_io1                 (_connected_to_hps_io_gpio1_io1_),                 //   inout,   width = 1,                          .gpio1_io1
		.hps_io_gpio1_io4                 (_connected_to_hps_io_gpio1_io4_),                 //   inout,   width = 1,                          .gpio1_io4
		.hps_io_gpio1_io5                 (_connected_to_hps_io_gpio1_io5_),                 //   inout,   width = 1,                          .gpio1_io5
		.hps_io_jtag_tck                  (_connected_to_hps_io_jtag_tck_),                  //   input,   width = 1,                          .jtag_tck
		.hps_io_jtag_tms                  (_connected_to_hps_io_jtag_tms_),                  //   input,   width = 1,                          .jtag_tms
		.hps_io_jtag_tdo                  (_connected_to_hps_io_jtag_tdo_),                  //  output,   width = 1,                          .jtag_tdo
		.hps_io_jtag_tdi                  (_connected_to_hps_io_jtag_tdi_),                  //   input,   width = 1,                          .jtag_tdi
		.hps_io_hps_osc_clk               (_connected_to_hps_io_hps_osc_clk_),               //   input,   width = 1,                          .hps_osc_clk
		.hps_io_gpio1_io19                (_connected_to_hps_io_gpio1_io19_),                //   inout,   width = 1,                          .gpio1_io19
		.hps_io_gpio1_io20                (_connected_to_hps_io_gpio1_io20_),                //   inout,   width = 1,                          .gpio1_io20
		.hps_io_gpio1_io21                (_connected_to_hps_io_gpio1_io21_),                //   inout,   width = 1,                          .gpio1_io21
		.h2f_reset_reset                  (_connected_to_h2f_reset_reset_),                  //  output,   width = 1,                 h2f_reset.reset
		.mm2s_awcache                     (_connected_to_mm2s_awcache_),                     //   input,   width = 4,                      mm2s.awcache
		.mm2s_awprot                      (_connected_to_mm2s_awprot_),                      //   input,   width = 3,                          .awprot
		.mm2s_awuser                      (_connected_to_mm2s_awuser_),                      //   input,   width = 5,                          .awuser
		.mm2s_arcache                     (_connected_to_mm2s_arcache_),                     //   input,   width = 4,                          .arcache
		.mm2s_aruser                      (_connected_to_mm2s_aruser_),                      //   input,   width = 5,                          .aruser
		.mm2s_arprot                      (_connected_to_mm2s_arprot_),                      //   input,   width = 3,                          .arprot
		.clk_100_clk                      (_connected_to_clk_100_clk_),                      //   input,   width = 1,                   clk_100.clk
		.emif_hps_pll_ref_clk_clk         (_connected_to_emif_hps_pll_ref_clk_clk_),         //   input,   width = 1,      emif_hps_pll_ref_clk.clk
		.emif_hps_oct_oct_rzqin           (_connected_to_emif_hps_oct_oct_rzqin_),           //   input,   width = 1,              emif_hps_oct.oct_rzqin
		.emif_hps_mem_mem_ck              (_connected_to_emif_hps_mem_mem_ck_),              //  output,   width = 1,              emif_hps_mem.mem_ck
		.emif_hps_mem_mem_ck_n            (_connected_to_emif_hps_mem_mem_ck_n_),            //  output,   width = 1,                          .mem_ck_n
		.emif_hps_mem_mem_a               (_connected_to_emif_hps_mem_mem_a_),               //  output,  width = 17,                          .mem_a
		.emif_hps_mem_mem_act_n           (_connected_to_emif_hps_mem_mem_act_n_),           //  output,   width = 1,                          .mem_act_n
		.emif_hps_mem_mem_ba              (_connected_to_emif_hps_mem_mem_ba_),              //  output,   width = 2,                          .mem_ba
		.emif_hps_mem_mem_bg              (_connected_to_emif_hps_mem_mem_bg_),              //  output,   width = 1,                          .mem_bg
		.emif_hps_mem_mem_cke             (_connected_to_emif_hps_mem_mem_cke_),             //  output,   width = 1,                          .mem_cke
		.emif_hps_mem_mem_cs_n            (_connected_to_emif_hps_mem_mem_cs_n_),            //  output,   width = 1,                          .mem_cs_n
		.emif_hps_mem_mem_odt             (_connected_to_emif_hps_mem_mem_odt_),             //  output,   width = 1,                          .mem_odt
		.emif_hps_mem_mem_reset_n         (_connected_to_emif_hps_mem_mem_reset_n_),         //  output,   width = 1,                          .mem_reset_n
		.emif_hps_mem_mem_par             (_connected_to_emif_hps_mem_mem_par_),             //  output,   width = 1,                          .mem_par
		.emif_hps_mem_mem_alert_n         (_connected_to_emif_hps_mem_mem_alert_n_),         //   input,   width = 1,                          .mem_alert_n
		.emif_hps_mem_mem_dqs             (_connected_to_emif_hps_mem_mem_dqs_),             //   inout,   width = 9,                          .mem_dqs
		.emif_hps_mem_mem_dqs_n           (_connected_to_emif_hps_mem_mem_dqs_n_),           //   inout,   width = 9,                          .mem_dqs_n
		.emif_hps_mem_mem_dq              (_connected_to_emif_hps_mem_mem_dq_),              //   inout,  width = 72,                          .mem_dq
		.emif_hps_mem_mem_dbi_n           (_connected_to_emif_hps_mem_mem_dbi_n_),           //   inout,   width = 9,                          .mem_dbi_n
		.ila_source                       (_connected_to_ila_source_),                       //  output,   width = 1,                       ila.source
		.pio_0_external_connection_export (_connected_to_pio_0_external_connection_export_), //  output,   width = 2, pio_0_external_connection.export
		.reset_reset_n                    (_connected_to_reset_reset_n_),                    //   input,   width = 1,                     reset.reset_n
		.ninit_done_ninit_done            (_connected_to_ninit_done_ninit_done_)             //  output,   width = 1,                ninit_done.ninit_done
	);

