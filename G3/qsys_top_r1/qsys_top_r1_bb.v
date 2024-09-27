module qsys_top_r1 (
		output wire        agilex_hps_h2f_user0_clock_clk,       //    agilex_hps_h2f_user0_clock.clk
		output wire        agilex_hps_h2f_user1_clock_clk,       //    agilex_hps_h2f_user1_clock.clk
		output wire        hps_io_EMAC1_TX_CLK,                  //                        hps_io.EMAC1_TX_CLK
		output wire        hps_io_EMAC1_TXD0,                    //                              .EMAC1_TXD0
		output wire        hps_io_EMAC1_TXD1,                    //                              .EMAC1_TXD1
		output wire        hps_io_EMAC1_TXD2,                    //                              .EMAC1_TXD2
		output wire        hps_io_EMAC1_TXD3,                    //                              .EMAC1_TXD3
		input  wire        hps_io_EMAC1_RX_CTL,                  //                              .EMAC1_RX_CTL
		output wire        hps_io_EMAC1_TX_CTL,                  //                              .EMAC1_TX_CTL
		input  wire        hps_io_EMAC1_RX_CLK,                  //                              .EMAC1_RX_CLK
		input  wire        hps_io_EMAC1_RXD0,                    //                              .EMAC1_RXD0
		input  wire        hps_io_EMAC1_RXD1,                    //                              .EMAC1_RXD1
		input  wire        hps_io_EMAC1_RXD2,                    //                              .EMAC1_RXD2
		input  wire        hps_io_EMAC1_RXD3,                    //                              .EMAC1_RXD3
		inout  wire        hps_io_EMAC1_MDIO,                    //                              .EMAC1_MDIO
		output wire        hps_io_EMAC1_MDC,                     //                              .EMAC1_MDC
		inout  wire        hps_io_SDMMC_CMD,                     //                              .SDMMC_CMD
		inout  wire        hps_io_SDMMC_D0,                      //                              .SDMMC_D0
		inout  wire        hps_io_SDMMC_D1,                      //                              .SDMMC_D1
		inout  wire        hps_io_SDMMC_D2,                      //                              .SDMMC_D2
		inout  wire        hps_io_SDMMC_D3,                      //                              .SDMMC_D3
		inout  wire        hps_io_SDMMC_D4,                      //                              .SDMMC_D4
		inout  wire        hps_io_SDMMC_D5,                      //                              .SDMMC_D5
		inout  wire        hps_io_SDMMC_D6,                      //                              .SDMMC_D6
		inout  wire        hps_io_SDMMC_D7,                      //                              .SDMMC_D7
		output wire        hps_io_SDMMC_CCLK,                    //                              .SDMMC_CCLK
		output wire        hps_io_SPIM0_CLK,                     //                              .SPIM0_CLK
		output wire        hps_io_SPIM0_MOSI,                    //                              .SPIM0_MOSI
		input  wire        hps_io_SPIM0_MISO,                    //                              .SPIM0_MISO
		output wire        hps_io_SPIM0_SS0_N,                   //                              .SPIM0_SS0_N
		output wire        hps_io_SPIM1_CLK,                     //                              .SPIM1_CLK
		output wire        hps_io_SPIM1_MOSI,                    //                              .SPIM1_MOSI
		input  wire        hps_io_SPIM1_MISO,                    //                              .SPIM1_MISO
		output wire        hps_io_SPIM1_SS0_N,                   //                              .SPIM1_SS0_N
		output wire        hps_io_SPIM1_SS1_N,                   //                              .SPIM1_SS1_N
		input  wire        hps_io_UART1_RX,                      //                              .UART1_RX
		output wire        hps_io_UART1_TX,                      //                              .UART1_TX
		inout  wire        hps_io_I2C1_SDA,                      //                              .I2C1_SDA
		inout  wire        hps_io_I2C1_SCL,                      //                              .I2C1_SCL
		input  wire        hps_io_hps_osc_clk,                   //                              .hps_osc_clk
		inout  wire        hps_io_gpio0_io11,                    //                              .gpio0_io11
		inout  wire        hps_io_gpio0_io12,                    //                              .gpio0_io12
		inout  wire        hps_io_gpio0_io13,                    //                              .gpio0_io13
		inout  wire        hps_io_gpio0_io14,                    //                              .gpio0_io14
		inout  wire        hps_io_gpio0_io15,                    //                              .gpio0_io15
		inout  wire        hps_io_gpio0_io16,                    //                              .gpio0_io16
		inout  wire        hps_io_gpio0_io17,                    //                              .gpio0_io17
		inout  wire        hps_io_gpio0_io18,                    //                              .gpio0_io18
		inout  wire        hps_io_gpio1_io16,                    //                              .gpio1_io16
		inout  wire        hps_io_gpio1_io17,                    //                              .gpio1_io17
		output wire        h2f_reset_reset,                      //                     h2f_reset.reset
		input  wire [31:0] f2h_irq0_irq,                         //                      f2h_irq0.irq
		input  wire [31:0] f2h_irq1_irq,                         //                      f2h_irq1.irq
		input  wire        clk_100_clk,                          //                       clk_100.clk
		input  wire        emif_hps_pll_ref_clk_clk,             //          emif_hps_pll_ref_clk.clk
		input  wire        emif_hps_oct_oct_rzqin,               //                  emif_hps_oct.oct_rzqin
		output wire [0:0]  emif_hps_mem_mem_ck,                  //                  emif_hps_mem.mem_ck
		output wire [0:0]  emif_hps_mem_mem_ck_n,                //                              .mem_ck_n
		output wire [16:0] emif_hps_mem_mem_a,                   //                              .mem_a
		output wire [0:0]  emif_hps_mem_mem_act_n,               //                              .mem_act_n
		output wire [1:0]  emif_hps_mem_mem_ba,                  //                              .mem_ba
		output wire [0:0]  emif_hps_mem_mem_bg,                  //                              .mem_bg
		output wire [0:0]  emif_hps_mem_mem_cke,                 //                              .mem_cke
		output wire [1:0]  emif_hps_mem_mem_cs_n,                //                              .mem_cs_n
		output wire [0:0]  emif_hps_mem_mem_odt,                 //                              .mem_odt
		output wire [0:0]  emif_hps_mem_mem_reset_n,             //                              .mem_reset_n
		output wire [0:0]  emif_hps_mem_mem_par,                 //                              .mem_par
		input  wire [0:0]  emif_hps_mem_mem_alert_n,             //                              .mem_alert_n
		inout  wire [8:0]  emif_hps_mem_mem_dqs,                 //                              .mem_dqs
		inout  wire [8:0]  emif_hps_mem_mem_dqs_n,               //                              .mem_dqs_n
		inout  wire [71:0] emif_hps_mem_mem_dq,                  //                              .mem_dq
		inout  wire [8:0]  emif_hps_mem_mem_dbi_n,               //                              .mem_dbi_n
		output wire [1:0]  pio_0_external_connection_export,     //     pio_0_external_connection.export
		input  wire        ram_controller_1_src_read_cmd_tready, // ram_controller_1_src_read_cmd.tready
		output wire [96:0] ram_controller_1_src_read_cmd_tdata,  //                              .tdata
		output wire        ram_controller_1_src_read_cmd_tvalid, //                              .tvalid
		input  wire        reset_reset_n,                        //                         reset.reset_n
		output wire        ninit_done_ninit_done                 //                    ninit_done.ninit_done
	);
endmodule

