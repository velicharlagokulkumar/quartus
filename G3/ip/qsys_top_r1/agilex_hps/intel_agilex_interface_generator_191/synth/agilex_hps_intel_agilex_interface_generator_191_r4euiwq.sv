// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module agilex_hps_intel_agilex_interface_generator_191_r4euiwq #(
	parameter F2S_DATA_WIDTH = 512 ,
	parameter F2S_ADDRESS_WIDTH = 32 ,
	parameter S2F_DATA_WIDTH = 0 ,
	parameter S2F_ADDRESS_WIDTH = 32 ,
	parameter LWH2S_DATA_WIDTH = 32 ,
	parameter LWH2S_ADDRESS_WIDTH = 21  
) (
// h2f_reset
  output wire [1 - 1 : 0 ] h2f_rst
// h2f_user0_clock
 ,output wire [1 - 1 : 0 ] s2f_user_clk0_hio
// h2f_user1_clock
 ,output wire [1 - 1 : 0 ] s2f_user_clk1_hio
// hps_emif
 ,input wire [4096 - 1 : 0 ] hps_emif_emif_to_hps
 ,output wire [4096 - 1 : 0 ] hps_emif_hps_to_emif
 ,input wire [1 - 1 : 0 ] hps_emif_emif_to_gp
 ,output wire [2 - 1 : 0 ] hps_emif_gp_to_emif
// f2h_axi_clock
 ,input wire [1 - 1 : 0 ] f2h_axi_clk
// f2h_axi_reset
 ,input wire [1 - 1 : 0 ] f2h_axi_rst_n
// f2h_axi_slave
 ,input wire [4 - 1 : 0 ] f2h_AWCACHE
 ,input wire [4 - 1 : 0 ] f2h_ARCACHE
 ,input wire [5 - 1 : 0 ] f2h_AWID
 ,input wire [32 - 1 : 0 ] f2h_AWADDR
 ,input wire [8 - 1 : 0 ] f2h_AWLEN
 ,input wire [3 - 1 : 0 ] f2h_AWSIZE
 ,input wire [2 - 1 : 0 ] f2h_AWBURST
 ,input wire [1 - 1 : 0 ] f2h_AWLOCK
 ,input wire [3 - 1 : 0 ] f2h_AWPROT
 ,input wire [1 - 1 : 0 ] f2h_AWVALID
 ,output wire [1 - 1 : 0 ] f2h_AWREADY
 ,input wire [4 - 1 : 0 ] f2h_AWQOS
 ,input wire [512 - 1 : 0 ] f2h_WDATA
 ,input wire [64 - 1 : 0 ] f2h_WSTRB
 ,input wire [1 - 1 : 0 ] f2h_WLAST
 ,input wire [1 - 1 : 0 ] f2h_WVALID
 ,output wire [1 - 1 : 0 ] f2h_WREADY
 ,output wire [5 - 1 : 0 ] f2h_BID
 ,output wire [2 - 1 : 0 ] f2h_BRESP
 ,output wire [1 - 1 : 0 ] f2h_BVALID
 ,input wire [1 - 1 : 0 ] f2h_BREADY
 ,input wire [5 - 1 : 0 ] f2h_ARID
 ,input wire [32 - 1 : 0 ] f2h_ARADDR
 ,input wire [8 - 1 : 0 ] f2h_ARLEN
 ,input wire [3 - 1 : 0 ] f2h_ARSIZE
 ,input wire [2 - 1 : 0 ] f2h_ARBURST
 ,input wire [1 - 1 : 0 ] f2h_ARLOCK
 ,input wire [3 - 1 : 0 ] f2h_ARPROT
 ,input wire [1 - 1 : 0 ] f2h_ARVALID
 ,output wire [1 - 1 : 0 ] f2h_ARREADY
 ,input wire [4 - 1 : 0 ] f2h_ARQOS
 ,output wire [5 - 1 : 0 ] f2h_RID
 ,output wire [512 - 1 : 0 ] f2h_RDATA
 ,output wire [2 - 1 : 0 ] f2h_RRESP
 ,output wire [1 - 1 : 0 ] f2h_RLAST
 ,output wire [1 - 1 : 0 ] f2h_RVALID
 ,input wire [1 - 1 : 0 ] f2h_RREADY
 ,input wire [23 - 1 : 0 ] f2h_ARUSER
 ,input wire [23 - 1 : 0 ] f2h_AWUSER
// h2f_axi_clock
 ,input wire [1 - 1 : 0 ] h2f_axi_clk
// h2f_axi_reset
 ,input wire [1 - 1 : 0 ] h2f_axi_rst_n
// h2f_axi_master
 ,output wire [4 - 1 : 0 ] h2f_AWID
 ,output wire [32 - 1 : 0 ] h2f_AWADDR
 ,output wire [8 - 1 : 0 ] h2f_AWLEN
 ,output wire [3 - 1 : 0 ] h2f_AWSIZE
 ,output wire [2 - 1 : 0 ] h2f_AWBURST
 ,output wire [1 - 1 : 0 ] h2f_AWLOCK
 ,output wire [4 - 1 : 0 ] h2f_AWCACHE
 ,output wire [3 - 1 : 0 ] h2f_AWPROT
 ,output wire [1 - 1 : 0 ] h2f_AWVALID
 ,input wire [1 - 1 : 0 ] h2f_AWREADY
 ,output wire [32 - 1 : 0 ] h2f_WDATA
 ,output wire [4 - 1 : 0 ] h2f_WSTRB
 ,output wire [1 - 1 : 0 ] h2f_WLAST
 ,output wire [1 - 1 : 0 ] h2f_WVALID
 ,input wire [1 - 1 : 0 ] h2f_WREADY
 ,input wire [4 - 1 : 0 ] h2f_BID
 ,input wire [2 - 1 : 0 ] h2f_BRESP
 ,input wire [1 - 1 : 0 ] h2f_BVALID
 ,output wire [1 - 1 : 0 ] h2f_BREADY
 ,output wire [4 - 1 : 0 ] h2f_ARID
 ,output wire [32 - 1 : 0 ] h2f_ARADDR
 ,output wire [8 - 1 : 0 ] h2f_ARLEN
 ,output wire [3 - 1 : 0 ] h2f_ARSIZE
 ,output wire [2 - 1 : 0 ] h2f_ARBURST
 ,output wire [1 - 1 : 0 ] h2f_ARLOCK
 ,output wire [4 - 1 : 0 ] h2f_ARCACHE
 ,output wire [3 - 1 : 0 ] h2f_ARPROT
 ,output wire [1 - 1 : 0 ] h2f_ARVALID
 ,input wire [1 - 1 : 0 ] h2f_ARREADY
 ,input wire [4 - 1 : 0 ] h2f_RID
 ,input wire [32 - 1 : 0 ] h2f_RDATA
 ,input wire [2 - 1 : 0 ] h2f_RRESP
 ,input wire [1 - 1 : 0 ] h2f_RLAST
 ,input wire [1 - 1 : 0 ] h2f_RVALID
 ,output wire [1 - 1 : 0 ] h2f_RREADY
// f2h_irq0
 ,input wire [32 - 1 : 0 ] f2h_irq_p0
// f2h_irq1
 ,input wire [32 - 1 : 0 ] f2h_irq_p1
// hps_io
 ,output wire [1 - 1 : 0 ] EMAC1_TX_CLK
 ,output wire [1 - 1 : 0 ] EMAC1_TXD0
 ,output wire [1 - 1 : 0 ] EMAC1_TXD1
 ,output wire [1 - 1 : 0 ] EMAC1_TXD2
 ,output wire [1 - 1 : 0 ] EMAC1_TXD3
 ,input wire [1 - 1 : 0 ] EMAC1_RX_CTL
 ,output wire [1 - 1 : 0 ] EMAC1_TX_CTL
 ,input wire [1 - 1 : 0 ] EMAC1_RX_CLK
 ,input wire [1 - 1 : 0 ] EMAC1_RXD0
 ,input wire [1 - 1 : 0 ] EMAC1_RXD1
 ,input wire [1 - 1 : 0 ] EMAC1_RXD2
 ,input wire [1 - 1 : 0 ] EMAC1_RXD3
 ,inout wire [1 - 1 : 0 ] EMAC1_MDIO
 ,output wire [1 - 1 : 0 ] EMAC1_MDC
 ,inout wire [1 - 1 : 0 ] SDMMC_CMD
 ,inout wire [1 - 1 : 0 ] SDMMC_D0
 ,inout wire [1 - 1 : 0 ] SDMMC_D1
 ,inout wire [1 - 1 : 0 ] SDMMC_D2
 ,inout wire [1 - 1 : 0 ] SDMMC_D3
 ,inout wire [1 - 1 : 0 ] SDMMC_D4
 ,inout wire [1 - 1 : 0 ] SDMMC_D5
 ,inout wire [1 - 1 : 0 ] SDMMC_D6
 ,inout wire [1 - 1 : 0 ] SDMMC_D7
 ,output wire [1 - 1 : 0 ] SDMMC_CCLK
 ,output wire [1 - 1 : 0 ] SPIM0_CLK
 ,output wire [1 - 1 : 0 ] SPIM0_MOSI
 ,input wire [1 - 1 : 0 ] SPIM0_MISO
 ,output wire [1 - 1 : 0 ] SPIM0_SS0_N
 ,output wire [1 - 1 : 0 ] SPIM1_CLK
 ,output wire [1 - 1 : 0 ] SPIM1_MOSI
 ,input wire [1 - 1 : 0 ] SPIM1_MISO
 ,output wire [1 - 1 : 0 ] SPIM1_SS0_N
 ,output wire [1 - 1 : 0 ] SPIM1_SS1_N
 ,input wire [1 - 1 : 0 ] UART1_RX
 ,output wire [1 - 1 : 0 ] UART1_TX
 ,inout wire [1 - 1 : 0 ] I2C1_SDA
 ,inout wire [1 - 1 : 0 ] I2C1_SCL
 ,input wire [1 - 1 : 0 ] hps_osc_clk
 ,inout wire [1 - 1 : 0 ] gpio0_io11
 ,inout wire [1 - 1 : 0 ] gpio0_io12
 ,inout wire [1 - 1 : 0 ] gpio0_io13
 ,inout wire [1 - 1 : 0 ] gpio0_io14
 ,inout wire [1 - 1 : 0 ] gpio0_io15
 ,inout wire [1 - 1 : 0 ] gpio0_io16
 ,inout wire [1 - 1 : 0 ] gpio0_io17
 ,inout wire [1 - 1 : 0 ] gpio0_io18
 ,inout wire [1 - 1 : 0 ] gpio1_io16
 ,inout wire [1 - 1 : 0 ] gpio1_io17
);

wire [7:0] awuser_term;
wire [4:0] wsb_ssd_term;
wire [9:0] wsb_sid_term;

wire [7:0] aruser_term;
wire [4:0] rsb_ssd_term;
wire [9:0] rsb_sid_term;

wire [ 0:0] hps_mpfe_at_clock;
wire [ 0:0] hps_mpfe_at_reset;
wire [ 0:0] atb_clock;
wire [ 0:0] atb_reset;
wire [ 0:0] hps_afready;
wire [ 0:0] hps_afvalid;
wire [ 1:0] hps_atbytes;
wire [31:0] hps_atdata;
wire [ 6:0] hps_atid;
wire [ 0:0] hps_atready;
wire [ 0:0] hps_atvalid;
wire [ 0:0] hps_syncreq;
wire [ 0:0] mpfe_afready;
wire [ 0:0] mpfe_afvalid;
wire [ 1:0] mpfe_atbytes;
wire [31:0] mpfe_atdata;
wire [ 6:0] mpfe_atid;
wire [ 0:0] mpfe_atready;
wire [ 0:0] mpfe_atvalid;
wire [ 0:0] mpfe_syncreq;
wire [ 0:0] atb_afready_m;
wire [ 0:0] atb_afready_s;
wire [ 0:0] atb_afvalid_m;
wire [ 0:0] atb_afvalid_s;
wire [ 1:0] atb_atbytes_m;
wire [ 1:0] atb_atbytes_s;
wire [31:0] atb_atdata_m;
wire [31:0] atb_atdata_s;
wire [ 6:0] atb_atid_m;
wire [ 6:0] atb_atid_s;
wire [ 0:0] atb_atready_m;
wire [ 0:0] atb_atready_s;
wire [ 0:0] atb_atvalid_m;
wire [ 0:0] atb_atvalid_s;
wire [ 0:0] atb_syncreq_m;
wire [ 0:0] atb_syncreq_s;

wire [0:0] EMAC1_TX_CLK_out;
tennm_io_obuf hps_EMAC1_TX_CLK_obuf(
    .i(EMAC1_TX_CLK_out),
    .o(EMAC1_TX_CLK),
    .oe(1'b1)
);

wire [0:0] EMAC1_TXD0_out;
tennm_io_obuf hps_EMAC1_TXD0_obuf(
    .i(EMAC1_TXD0_out),
    .o(EMAC1_TXD0),
    .oe(1'b1)
);

wire [0:0] EMAC1_TXD1_out;
tennm_io_obuf hps_EMAC1_TXD1_obuf(
    .i(EMAC1_TXD1_out),
    .o(EMAC1_TXD1),
    .oe(1'b1)
);

wire [0:0] EMAC1_TXD2_out;
tennm_io_obuf hps_EMAC1_TXD2_obuf(
    .i(EMAC1_TXD2_out),
    .o(EMAC1_TXD2),
    .oe(1'b1)
);

wire [0:0] EMAC1_TXD3_out;
tennm_io_obuf hps_EMAC1_TXD3_obuf(
    .i(EMAC1_TXD3_out),
    .o(EMAC1_TXD3),
    .oe(1'b1)
);

wire [0:0] EMAC1_RX_CTL_in;
tennm_io_ibuf hps_EMAC1_RX_CTL_ibuf(
    .i(EMAC1_RX_CTL),
    .o(EMAC1_RX_CTL_in)
);

wire [0:0] EMAC1_TX_CTL_out;
tennm_io_obuf hps_EMAC1_TX_CTL_obuf(
    .i(EMAC1_TX_CTL_out),
    .o(EMAC1_TX_CTL),
    .oe(1'b1)
);

wire [0:0] EMAC1_RX_CLK_in;
tennm_io_ibuf hps_EMAC1_RX_CLK_ibuf(
    .i(EMAC1_RX_CLK),
    .o(EMAC1_RX_CLK_in)
);

wire [0:0] EMAC1_RXD0_in;
tennm_io_ibuf hps_EMAC1_RXD0_ibuf(
    .i(EMAC1_RXD0),
    .o(EMAC1_RXD0_in)
);

wire [0:0] EMAC1_RXD1_in;
tennm_io_ibuf hps_EMAC1_RXD1_ibuf(
    .i(EMAC1_RXD1),
    .o(EMAC1_RXD1_in)
);

wire [0:0] EMAC1_RXD2_in;
tennm_io_ibuf hps_EMAC1_RXD2_ibuf(
    .i(EMAC1_RXD2),
    .o(EMAC1_RXD2_in)
);

wire [0:0] EMAC1_RXD3_in;
tennm_io_ibuf hps_EMAC1_RXD3_ibuf(
    .i(EMAC1_RXD3),
    .o(EMAC1_RXD3_in)
);

wire [0:0] EMAC1_MDIO_in;
tennm_io_ibuf hps_EMAC1_MDIO_ibuf(
    .i(EMAC1_MDIO),
    .o(EMAC1_MDIO_in)
);

wire [0:0] EMAC1_MDIO_out;
tennm_io_obuf hps_EMAC1_MDIO_obuf(
    .i(EMAC1_MDIO_out),
    .o(EMAC1_MDIO),
    .oe(1'b1)
);

wire [0:0] EMAC1_MDC_out;
tennm_io_obuf hps_EMAC1_MDC_obuf(
    .i(EMAC1_MDC_out),
    .o(EMAC1_MDC),
    .oe(1'b1)
);

wire [0:0] SDMMC_CMD_in;
tennm_io_ibuf hps_SDMMC_CMD_ibuf(
    .i(SDMMC_CMD),
    .o(SDMMC_CMD_in)
);

wire [0:0] SDMMC_CMD_out;
tennm_io_obuf hps_SDMMC_CMD_obuf(
    .i(SDMMC_CMD_out),
    .o(SDMMC_CMD),
    .oe(1'b1)
);

wire [0:0] SDMMC_D0_in;
tennm_io_ibuf hps_SDMMC_D0_ibuf(
    .i(SDMMC_D0),
    .o(SDMMC_D0_in)
);

wire [0:0] SDMMC_D0_out;
tennm_io_obuf hps_SDMMC_D0_obuf(
    .i(SDMMC_D0_out),
    .o(SDMMC_D0),
    .oe(1'b1)
);

wire [0:0] SDMMC_D1_in;
tennm_io_ibuf hps_SDMMC_D1_ibuf(
    .i(SDMMC_D1),
    .o(SDMMC_D1_in)
);

wire [0:0] SDMMC_D1_out;
tennm_io_obuf hps_SDMMC_D1_obuf(
    .i(SDMMC_D1_out),
    .o(SDMMC_D1),
    .oe(1'b1)
);

wire [0:0] SDMMC_D2_in;
tennm_io_ibuf hps_SDMMC_D2_ibuf(
    .i(SDMMC_D2),
    .o(SDMMC_D2_in)
);

wire [0:0] SDMMC_D2_out;
tennm_io_obuf hps_SDMMC_D2_obuf(
    .i(SDMMC_D2_out),
    .o(SDMMC_D2),
    .oe(1'b1)
);

wire [0:0] SDMMC_D3_in;
tennm_io_ibuf hps_SDMMC_D3_ibuf(
    .i(SDMMC_D3),
    .o(SDMMC_D3_in)
);

wire [0:0] SDMMC_D3_out;
tennm_io_obuf hps_SDMMC_D3_obuf(
    .i(SDMMC_D3_out),
    .o(SDMMC_D3),
    .oe(1'b1)
);

wire [0:0] SDMMC_D4_in;
tennm_io_ibuf hps_SDMMC_D4_ibuf(
    .i(SDMMC_D4),
    .o(SDMMC_D4_in)
);

wire [0:0] SDMMC_D4_out;
tennm_io_obuf hps_SDMMC_D4_obuf(
    .i(SDMMC_D4_out),
    .o(SDMMC_D4),
    .oe(1'b1)
);

wire [0:0] SDMMC_D5_in;
tennm_io_ibuf hps_SDMMC_D5_ibuf(
    .i(SDMMC_D5),
    .o(SDMMC_D5_in)
);

wire [0:0] SDMMC_D5_out;
tennm_io_obuf hps_SDMMC_D5_obuf(
    .i(SDMMC_D5_out),
    .o(SDMMC_D5),
    .oe(1'b1)
);

wire [0:0] SDMMC_D6_in;
tennm_io_ibuf hps_SDMMC_D6_ibuf(
    .i(SDMMC_D6),
    .o(SDMMC_D6_in)
);

wire [0:0] SDMMC_D6_out;
tennm_io_obuf hps_SDMMC_D6_obuf(
    .i(SDMMC_D6_out),
    .o(SDMMC_D6),
    .oe(1'b1)
);

wire [0:0] SDMMC_D7_in;
tennm_io_ibuf hps_SDMMC_D7_ibuf(
    .i(SDMMC_D7),
    .o(SDMMC_D7_in)
);

wire [0:0] SDMMC_D7_out;
tennm_io_obuf hps_SDMMC_D7_obuf(
    .i(SDMMC_D7_out),
    .o(SDMMC_D7),
    .oe(1'b1)
);

wire [0:0] SDMMC_CCLK_out;
tennm_io_obuf hps_SDMMC_CCLK_obuf(
    .i(SDMMC_CCLK_out),
    .o(SDMMC_CCLK),
    .oe(1'b1)
);

wire [0:0] SPIM0_CLK_out;
tennm_io_obuf hps_SPIM0_CLK_obuf(
    .i(SPIM0_CLK_out),
    .o(SPIM0_CLK),
    .oe(1'b1)
);

wire [0:0] SPIM0_MOSI_out;
tennm_io_obuf hps_SPIM0_MOSI_obuf(
    .i(SPIM0_MOSI_out),
    .o(SPIM0_MOSI),
    .oe(1'b1)
);

wire [0:0] SPIM0_MISO_in;
tennm_io_ibuf hps_SPIM0_MISO_ibuf(
    .i(SPIM0_MISO),
    .o(SPIM0_MISO_in)
);

wire [0:0] SPIM0_SS0_N_out;
tennm_io_obuf hps_SPIM0_SS0_N_obuf(
    .i(SPIM0_SS0_N_out),
    .o(SPIM0_SS0_N),
    .oe(1'b1)
);

wire [0:0] SPIM1_CLK_out;
tennm_io_obuf hps_SPIM1_CLK_obuf(
    .i(SPIM1_CLK_out),
    .o(SPIM1_CLK),
    .oe(1'b1)
);

wire [0:0] SPIM1_MOSI_out;
tennm_io_obuf hps_SPIM1_MOSI_obuf(
    .i(SPIM1_MOSI_out),
    .o(SPIM1_MOSI),
    .oe(1'b1)
);

wire [0:0] SPIM1_MISO_in;
tennm_io_ibuf hps_SPIM1_MISO_ibuf(
    .i(SPIM1_MISO),
    .o(SPIM1_MISO_in)
);

wire [0:0] SPIM1_SS0_N_out;
tennm_io_obuf hps_SPIM1_SS0_N_obuf(
    .i(SPIM1_SS0_N_out),
    .o(SPIM1_SS0_N),
    .oe(1'b1)
);

wire [0:0] SPIM1_SS1_N_out;
tennm_io_obuf hps_SPIM1_SS1_N_obuf(
    .i(SPIM1_SS1_N_out),
    .o(SPIM1_SS1_N),
    .oe(1'b1)
);

wire [0:0] UART1_RX_in;
tennm_io_ibuf hps_UART1_RX_ibuf(
    .i(UART1_RX),
    .o(UART1_RX_in)
);

wire [0:0] UART1_TX_out;
tennm_io_obuf hps_UART1_TX_obuf(
    .i(UART1_TX_out),
    .o(UART1_TX),
    .oe(1'b1)
);

wire [0:0] I2C1_SDA_in;
tennm_io_ibuf hps_I2C1_SDA_ibuf(
    .i(I2C1_SDA),
    .o(I2C1_SDA_in)
);

wire [0:0] I2C1_SDA_out;
tennm_io_obuf hps_I2C1_SDA_obuf(
    .i(1'b0),
    .o(I2C1_SDA),
    .oe(I2C1_SDA_out)
);

wire [0:0] I2C1_SCL_in;
tennm_io_ibuf hps_I2C1_SCL_ibuf(
    .i(I2C1_SCL),
    .o(I2C1_SCL_in)
);

wire [0:0] I2C1_SCL_out;
tennm_io_obuf hps_I2C1_SCL_obuf(
    .i(1'b0),
    .o(I2C1_SCL),
    .oe(I2C1_SCL_out)
);

wire [0:0] hps_osc_clk_in;
tennm_io_ibuf hps_hps_osc_clk_ibuf(
    .i(hps_osc_clk),
    .o(hps_osc_clk_in)
);

wire [0:0] gpio0_io11_in;
tennm_io_ibuf hps_gpio0_io11_ibuf(
    .i(gpio0_io11),
    .o(gpio0_io11_in)
);

wire [0:0] gpio0_io11_out;
tennm_io_obuf hps_gpio0_io11_obuf(
    .i(gpio0_io11_out),
    .o(gpio0_io11),
    .oe(1'b1)
);

wire [0:0] gpio0_io12_in;
tennm_io_ibuf hps_gpio0_io12_ibuf(
    .i(gpio0_io12),
    .o(gpio0_io12_in)
);

wire [0:0] gpio0_io12_out;
tennm_io_obuf hps_gpio0_io12_obuf(
    .i(gpio0_io12_out),
    .o(gpio0_io12),
    .oe(1'b1)
);

wire [0:0] gpio0_io13_in;
tennm_io_ibuf hps_gpio0_io13_ibuf(
    .i(gpio0_io13),
    .o(gpio0_io13_in)
);

wire [0:0] gpio0_io13_out;
tennm_io_obuf hps_gpio0_io13_obuf(
    .i(gpio0_io13_out),
    .o(gpio0_io13),
    .oe(1'b1)
);

wire [0:0] gpio0_io14_in;
tennm_io_ibuf hps_gpio0_io14_ibuf(
    .i(gpio0_io14),
    .o(gpio0_io14_in)
);

wire [0:0] gpio0_io14_out;
tennm_io_obuf hps_gpio0_io14_obuf(
    .i(gpio0_io14_out),
    .o(gpio0_io14),
    .oe(1'b1)
);

wire [0:0] gpio0_io15_in;
tennm_io_ibuf hps_gpio0_io15_ibuf(
    .i(gpio0_io15),
    .o(gpio0_io15_in)
);

wire [0:0] gpio0_io15_out;
tennm_io_obuf hps_gpio0_io15_obuf(
    .i(gpio0_io15_out),
    .o(gpio0_io15),
    .oe(1'b1)
);

wire [0:0] gpio0_io16_in;
tennm_io_ibuf hps_gpio0_io16_ibuf(
    .i(gpio0_io16),
    .o(gpio0_io16_in)
);

wire [0:0] gpio0_io16_out;
tennm_io_obuf hps_gpio0_io16_obuf(
    .i(gpio0_io16_out),
    .o(gpio0_io16),
    .oe(1'b1)
);

wire [0:0] gpio0_io17_in;
tennm_io_ibuf hps_gpio0_io17_ibuf(
    .i(gpio0_io17),
    .o(gpio0_io17_in)
);

wire [0:0] gpio0_io17_out;
tennm_io_obuf hps_gpio0_io17_obuf(
    .i(gpio0_io17_out),
    .o(gpio0_io17),
    .oe(1'b1)
);

wire [0:0] gpio0_io18_in;
tennm_io_ibuf hps_gpio0_io18_ibuf(
    .i(gpio0_io18),
    .o(gpio0_io18_in)
);

wire [0:0] gpio0_io18_out;
tennm_io_obuf hps_gpio0_io18_obuf(
    .i(gpio0_io18_out),
    .o(gpio0_io18),
    .oe(1'b1)
);

wire [0:0] gpio1_io16_in;
tennm_io_ibuf hps_gpio1_io16_ibuf(
    .i(gpio1_io16),
    .o(gpio1_io16_in)
);

wire [0:0] gpio1_io16_out;
tennm_io_obuf hps_gpio1_io16_obuf(
    .i(gpio1_io16_out),
    .o(gpio1_io16),
    .oe(1'b1)
);

wire [0:0] gpio1_io17_in;
tennm_io_ibuf hps_gpio1_io17_ibuf(
    .i(gpio1_io17),
    .o(gpio1_io17_in)
);

wire [0:0] gpio1_io17_out;
tennm_io_obuf hps_gpio1_io17_obuf(
    .i(gpio1_io17_out),
    .o(gpio1_io17),
    .oe(1'b1)
);


assign wsb_ssd_term[4:0] = f2h_AWUSER[22:18];
assign rsb_sid_term[9:0] = f2h_ARUSER[17:8];
assign aruser_term[7:0] = f2h_ARUSER[7:0];
assign wsb_sid_term[9:0] = f2h_AWUSER[17:8];
assign awuser_term[7:0] = f2h_AWUSER[7:0];
assign rsb_ssd_term[4:0] = f2h_ARUSER[22:18];

tennm_hps_hps_wrapper hps_inst(
 .HPS_IOA_17_O({
    gpio0_io16_out[0:0] // 0:0
  })
,.HPS_IOA_1_O({
    SDMMC_CCLK_out[0:0] // 0:0
  })
,.HPS_IOB_7_I({
    EMAC1_RXD0_in[0:0] // 0:0
  })
,.tpiu_trace_ctl({
    1'b1 // 0:0
  })
,.HPS_IOA_9_I({
    SDMMC_D6_in[0:0] // 0:0
  })
,.s2f_rst({
    h2f_rst[0:0] // 0:0
  })
,.HPS_IOA_10_I({
    SDMMC_D7_in[0:0] // 0:0
  })
,.HPS_IOA_22_O({
    SPIM1_MOSI_out[0:0] // 0:0
  })
,.HPS_IOA_5_O({
    SDMMC_D2_out[0:0] // 0:0
  })
,.HPS_IOB_19_I({
    EMAC1_MDIO_in[0:0] // 0:0
  })
,.HPS_IOA_14_I({
    gpio0_io13_in[0:0] // 0:0
  })
,.soc2fpga_port_size_config_0({
    1'b0 // 0:0
  })
,.soc2fpga_aw_cache({
    h2f_AWCACHE[3:0] // 3:0
  })
,.HPS_IOB_15_O({
    UART1_TX_out[0:0] // 0:0
  })
,.soc2fpga_port_size_config_1({
    1'b0 // 0:0
  })
,.HPS_IOA_9_O({
    SDMMC_D6_out[0:0] // 0:0
  })
,.HPS_IOA_10_O({
    SDMMC_D7_out[0:0] // 0:0
  })
,.pclkendbg({
    1'b0 // 0:0
  })
,.soc2fpga_b_id({
    h2f_BID[3:0] // 3:0
  })
,.HPS_IOA_18_I({
    gpio0_io17_in[0:0] // 0:0
  })
,.HPS_IOB_20_O({
    EMAC1_MDC_out[0:0] // 0:0
  })
,.soc2fpga_aw_burst({
    h2f_AWBURST[1:0] // 1:0
  })
,.HPS_IOB_19_O({
    EMAC1_MDIO_out[0:0] // 0:0
  })
,.f2s_fpga_irq({
    f2h_irq_p1[31:0] // 63:32
   ,f2h_irq_p0[31:0] // 31:0
  })
,.HPS_IOA_2_I({
    SDMMC_CMD_in[0:0] // 0:0
  })
,.soc2fpga_w_data({
    h2f_WDATA[31:0] // 31:0
  })
,.HPS_IOA_14_O({
    gpio0_io13_out[0:0] // 0:0
  })
,.HPS_IOB_12_I({
    EMAC1_RXD3_in[0:0] // 0:0
  })
,.HPS_IOA_23_I({
    SPIM1_MISO_in[0:0] // 0:0
  })
,.HPS_IOB_24_O({
    SPIM0_SS0_N_out[0:0] // 0:0
  })
,.HPS_IOB_4_I({
    EMAC1_RX_CTL_in[0:0] // 0:0
  })
,.HPS_IOA_6_I({
    SDMMC_D3_in[0:0] // 0:0
  })
,.HPS_IOA_18_O({
    gpio0_io17_out[0:0] // 0:0
  })
,.soc2fpga_r_last({
    h2f_RLAST[0:0] // 0:0
  })
,.s2f_user_clk0_hio({
    s2f_user_clk0_hio[0:0] // 0:0
  })
,.HPS_IOA_2_O({
    SDMMC_CMD_out[0:0] // 0:0
  })
,.HPS_IOB_16_I({
    UART1_RX_in[0:0] // 0:0
  })
,.soc2fpga_ar_cache({
    h2f_ARCACHE[3:0] // 3:0
  })
,.HPS_IOB_8_I({
    EMAC1_RXD1_in[0:0] // 0:0
  })
,.HPS_IOA_11_I({
    hps_osc_clk_in[0:0] // 0:0
  })
,.HPS_IOA_6_O({
    SDMMC_D3_out[0:0] // 0:0
  })
,.soc2fpga_ar_burst({
    h2f_ARBURST[1:0] // 1:0
  })
,.soc2fpga_ar_lock({
    h2f_ARLOCK[0:0] // 0:0
  })
,.soc2fpga_b_resp({
    h2f_BRESP[1:0] // 1:0
  })
,.HPS_IOA_15_I({
    gpio0_io14_in[0:0] // 0:0
  })
,.soc2fpga_ar_addr({
    h2f_ARADDR[31:0] // 31:0
  })
,.soc2fpga_rst_n({
    h2f_axi_rst_n[0:0] // 0:0
  })
,.soc2fpga_r_id({
    h2f_RID[3:0] // 3:0
  })
,.soc2fpga_aw_valid({
    h2f_AWVALID[0:0] // 0:0
  })
,.HPS_IOA_19_I({
    gpio0_io18_in[0:0] // 0:0
  })
,.HPS_IOB_21_O({
    SPIM0_CLK_out[0:0] // 0:0
  })
,.soc2fpga_b_valid({
    h2f_BVALID[0:0] // 0:0
  })
,.HPS_IOA_3_I({
    SDMMC_D0_in[0:0] // 0:0
  })
,.soc2fpga_w_last({
    h2f_WLAST[0:0] // 0:0
  })
,.HPS_IOA_15_O({
    gpio0_io14_out[0:0] // 0:0
  })
,.HPS_IOB_13_I({
    I2C1_SDA_in[0:0] // 0:0
  })
,.HPS_IOA_7_I({
    SDMMC_D4_in[0:0] // 0:0
  })
,.soc2fpga_w_valid({
    h2f_WVALID[0:0] // 0:0
  })
,.HPS_IOA_20_O({
    SPIM1_SS1_N_out[0:0] // 0:0
  })
,.HPS_IOA_19_O({
    gpio0_io18_out[0:0] // 0:0
  })
,.HPS_IOB_1_O({
    EMAC1_TX_CLK_out[0:0] // 0:0
  })
,.soc2fpga_aw_len({
    h2f_AWLEN[7:0] // 7:0
  })
,.HPS_IOA_3_O({
    SDMMC_D0_out[0:0] // 0:0
  })
,.soc2fpga_ar_prot({
    h2f_ARPROT[2:0] // 2:0
  })
,.HPS_IOB_17_I({
    gpio1_io16_in[0:0] // 0:0
  })
,.soc2fpga_aw_lock({
    h2f_AWLOCK[0:0] // 0:0
  })
,.f2s_pending_rst_ack({
    1'b1 // 0:0
  })
,.HPS_IOB_13_O({
    I2C1_SDA_out[0:0] // 0:0
  })
,.HPS_IOA_12_I({
    gpio0_io11_in[0:0] // 0:0
  })
,.HPS_IOB_5_O({
    EMAC1_TXD0_out[0:0] // 0:0
  })
,.HPS_IOA_24_O({
    SPIM1_SS0_N_out[0:0] // 0:0
  })
,.soc2fpga_ar_valid({
    h2f_ARVALID[0:0] // 0:0
  })
,.soc2fpga_aw_addr({
    h2f_AWADDR[31:0] // 31:0
  })
,.HPS_IOA_7_O({
    SDMMC_D4_out[0:0] // 0:0
  })
,.soc2fpga_r_resp({
    h2f_RRESP[1:0] // 1:0
  })
,.soc2fpga_aw_ready({
    h2f_AWREADY[0:0] // 0:0
  })
,.HPS_IOA_16_I({
    gpio0_io15_in[0:0] // 0:0
  })
,.soc2fpga_ar_size({
    h2f_ARSIZE[2:0] // 2:0
  })
,.HPS_IOB_17_O({
    gpio1_io16_out[0:0] // 0:0
  })
,.soc2fpga_b_ready({
    h2f_BREADY[0:0] // 0:0
  })
,.HPS_IOB_9_O({
    EMAC1_TXD2_out[0:0] // 0:0
  })
,.HPS_IOA_12_O({
    gpio0_io11_out[0:0] // 0:0
  })
,.dbgapbdisable({
    1'b0 // 0:0
  })
,.soc2fpga_r_valid({
    h2f_RVALID[0:0] // 0:0
  })
,.HPS_IOB_22_O({
    SPIM0_MOSI_out[0:0] // 0:0
  })
,.HPS_IOA_4_I({
    SDMMC_D1_in[0:0] // 0:0
  })
,.HPS_IOA_16_O({
    gpio0_io15_out[0:0] // 0:0
  })
,.soc2fpga_w_ready({
    h2f_WREADY[0:0] // 0:0
  })
,.HPS_IOB_14_I({
    I2C1_SCL_in[0:0] // 0:0
  })
,.soc2fpga_aw_prot({
    h2f_AWPROT[2:0] // 2:0
  })
,.HPS_IOB_10_O({
    EMAC1_TXD3_out[0:0] // 0:0
  })
,.HPS_IOA_8_I({
    SDMMC_D5_in[0:0] // 0:0
  })
,.s2f_user_clk1_hio({
    s2f_user_clk1_hio[0:0] // 0:0
  })
,.soc2fpga_ar_ready({
    h2f_ARREADY[0:0] // 0:0
  })
,.HPS_IOA_21_O({
    SPIM1_CLK_out[0:0] // 0:0
  })
,.HPS_IOB_2_O({
    EMAC1_TX_CTL_out[0:0] // 0:0
  })
,.HPS_IOA_4_O({
    SDMMC_D1_out[0:0] // 0:0
  })
,.HPS_IOB_18_I({
    gpio1_io17_in[0:0] // 0:0
  })
,.soc2fpga_w_strb({
    h2f_WSTRB[3:0] // 3:0
  })
,.soc2fpga_aw_size({
    h2f_AWSIZE[2:0] // 2:0
  })
,.HPS_IOB_14_O({
    I2C1_SCL_out[0:0] // 0:0
  })
,.HPS_IOA_13_I({
    gpio0_io12_in[0:0] // 0:0
  })
,.HPS_IOB_6_O({
    EMAC1_TXD1_out[0:0] // 0:0
  })
,.HPS_IOB_23_I({
    SPIM0_MISO_in[0:0] // 0:0
  })
,.soc2fpga_aw_id({
    h2f_AWID[3:0] // 3:0
  })
,.HPS_IOA_8_O({
    SDMMC_D5_out[0:0] // 0:0
  })
,.soc2fpga_r_ready({
    h2f_RREADY[0:0] // 0:0
  })
,.HPS_IOA_17_I({
    gpio0_io16_in[0:0] // 0:0
  })
,.HPS_IOB_18_O({
    gpio1_io17_out[0:0] // 0:0
  })
,.soc2fpga_ar_id({
    h2f_ARID[3:0] // 3:0
  })
,.HPS_IOA_13_O({
    gpio0_io12_out[0:0] // 0:0
  })
,.HPS_IOB_11_I({
    EMAC1_RXD2_in[0:0] // 0:0
  })
,.soc2fpga_ar_len({
    h2f_ARLEN[7:0] // 7:0
  })
,.f2s_free_clk({
    1'b0 // 0:0
  })
,.HPS_IOB_3_I({
    EMAC1_RX_CLK_in[0:0] // 0:0
  })
,.soc2fpga_clk({
    h2f_axi_clk[0:0] // 0:0
  })
,.HPS_IOA_5_I({
    SDMMC_D2_in[0:0] // 0:0
  })
,.soc2fpga_r_data({
    96'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 // 127:32
   ,h2f_RDATA[31:0] // 31:0
  })
);

defparam hps_inst.SWDTH = 4;
defparam hps_inst.WDTH = 32;
defparam hps_inst.ADDR = 32;

one_hps_interface_ddr emif_interface(
 .io48_b_iod_pb0_out({
    hps_emif_hps_to_emif[4095:0] // 4095:0
  })
,.io48_b_cdata_pb0_in({
    hps_emif_emif_to_hps[4095:0] // 4095:0
  })
);


tennm_hps_mpfe_wrapper mpfe_inst(
 .f2s_0_awuser({
    8'b11100000 // 7:0
  })
,.f2s_0_awsnoop({
    3'b000 // 2:0
  })
,.f2s_0_bready({
    f2h_BREADY[0:0] // 0:0
  })
,.f2s_0_awlock({
    f2h_AWLOCK[0:0] // 0:0
  })
,.f2s_0_clk({
    f2h_axi_clk[0:0] // 0:0
  })
,.f2s_0_rvalid({
    f2h_RVALID[0:0] // 0:0
  })
,.f2s_0_awqos({
    f2h_AWQOS[3:0] // 3:0
  })
,.f2s_0_awaddr({
    8'b00000000 // 39:32
   ,f2h_AWADDR[31:0] // 31:0
  })
,.f2s_0_wsb_ssd({
    5'b00000 // 4:0
  })
,.f2s_0_awbar({
    2'b00 // 1:0
  })
,.f2s_0_arqos({
    f2h_ARQOS[3:0] // 3:0
  })
,.f2s_0_arcache({
    f2h_ARCACHE[3:0] // 3:0
  })
,.f2s_0_awdomain({
    2'b11 // 1:0
  })
,.f2s_0_arbar({
    2'b00 // 1:0
  })
,.f2s_0_wdata({
    f2h_WDATA[511:0] // 511:0
  })
,.f2s_0_arburst({
    f2h_ARBURST[1:0] // 1:0
  })
,.f2s_0_port_size_config({
    2'b10 // 1:0
  })
,.f2s_0_rresp({
    f2h_RRESP[1:0] // 1:0
  })
,.f2s_0_awprot({
    f2h_AWPROT[2:0] // 2:0
  })
,.f2s_0_awlen({
    f2h_AWLEN[7:0] // 7:0
  })
,.f2s_0_wvalid({
    f2h_WVALID[0:0] // 0:0
  })
,.f2s_0_bid({
    f2h_BID[4:0] // 4:0
  })
,.f2s_0_rready({
    f2h_RREADY[0:0] // 0:0
  })
,.f2s_0_rsb_ssd({
    5'b00000 // 4:0
  })
,.f2s_0_arlen({
    f2h_ARLEN[7:0] // 7:0
  })
,.f2s_0_awsize({
    f2h_AWSIZE[2:0] // 2:0
  })
,.f2s_0_ardomain({
    2'b11 // 1:0
  })
,.f2s_0_awcache({
    f2h_AWCACHE[3:0] // 3:0
  })
,.f2s_0_awburst({
    f2h_AWBURST[1:0] // 1:0
  })
,.f2s_0_aruser({
    8'b11100000 // 7:0
  })
,.f2s_0_wlast({
    f2h_WLAST[0:0] // 0:0
  })
,.f2s_0_arvalid({
    f2h_ARVALID[0:0] // 0:0
  })
,.f2s_0_wready({
    f2h_WREADY[0:0] // 0:0
  })
,.f2s_0_arlock({
    f2h_ARLOCK[0:0] // 0:0
  })
,.f2s_0_araddr({
    8'b00000000 // 39:32
   ,f2h_ARADDR[31:0] // 31:0
  })
,.f2s_0_rid({
    f2h_RID[4:0] // 4:0
  })
,.f2s_0_arid({
    f2h_ARID[4:0] // 4:0
  })
,.f2s_0_rdata({
    f2h_RDATA[511:0] // 511:0
  })
,.f2s_0_arready({
    f2h_ARREADY[0:0] // 0:0
  })
,.f2s_0_arprot({
    f2h_ARPROT[2:0] // 2:0
  })
,.f2s_0_awvalid({
    f2h_AWVALID[0:0] // 0:0
  })
,.f2s_0_wsb_sid({
    10'b0000000000 // 9:0
  })
,.f2s_0_rst_n({
    f2h_axi_rst_n[0:0] // 0:0
  })
,.f2s_0_arsize({
    f2h_ARSIZE[2:0] // 2:0
  })
,.f2s_0_wstrb({
    f2h_WSTRB[63:0] // 63:0
  })
,.f2s_0_bvalid({
    f2h_BVALID[0:0] // 0:0
  })
,.f2s_0_arsnoop({
    4'b0000 // 3:0
  })
,.f2s_0_awid({
    f2h_AWID[4:0] // 4:0
  })
,.f2s_0_awready({
    f2h_AWREADY[0:0] // 0:0
  })
,.f2s_0_rlast({
    f2h_RLAST[0:0] // 0:0
  })
,.f2s_0_rsb_sid({
    10'b0000000000 // 9:0
  })
,.f2s_0_bresp({
    f2h_BRESP[1:0] // 1:0
  })
);

defparam mpfe_inst.TILEC = "tilec_mpfe";
defparam mpfe_inst.WDTH = 512;
defparam mpfe_inst.ADDR = 32;
endmodule

