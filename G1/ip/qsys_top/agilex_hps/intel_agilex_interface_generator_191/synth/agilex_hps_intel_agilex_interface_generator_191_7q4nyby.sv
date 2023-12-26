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


module agilex_hps_intel_agilex_interface_generator_191_7q4nyby #(
	parameter F2S_DATA_WIDTH = 512 ,
	parameter F2S_ADDRESS_WIDTH = 32 ,
	parameter S2F_DATA_WIDTH = 0 ,
	parameter S2F_ADDRESS_WIDTH = 32 ,
	parameter LWH2S_DATA_WIDTH = 32 ,
	parameter LWH2S_ADDRESS_WIDTH = 21  
) (
// h2f_reset
  output wire [1 - 1 : 0 ] h2f_rst
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
// h2f_lw_axi_clock
 ,input wire [1 - 1 : 0 ] h2f_lw_axi_clk
// h2f_lw_axi_reset
 ,input wire [1 - 1 : 0 ] h2f_lw_axi_rst_n
// h2f_lw_axi_master
 ,output wire [4 - 1 : 0 ] h2f_lw_AWID
 ,output wire [21 - 1 : 0 ] h2f_lw_AWADDR
 ,output wire [8 - 1 : 0 ] h2f_lw_AWLEN
 ,output wire [3 - 1 : 0 ] h2f_lw_AWSIZE
 ,output wire [2 - 1 : 0 ] h2f_lw_AWBURST
 ,output wire [1 - 1 : 0 ] h2f_lw_AWLOCK
 ,output wire [4 - 1 : 0 ] h2f_lw_AWCACHE
 ,output wire [3 - 1 : 0 ] h2f_lw_AWPROT
 ,output wire [1 - 1 : 0 ] h2f_lw_AWVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_AWREADY
 ,output wire [32 - 1 : 0 ] h2f_lw_WDATA
 ,output wire [4 - 1 : 0 ] h2f_lw_WSTRB
 ,output wire [1 - 1 : 0 ] h2f_lw_WLAST
 ,output wire [1 - 1 : 0 ] h2f_lw_WVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_WREADY
 ,input wire [4 - 1 : 0 ] h2f_lw_BID
 ,input wire [2 - 1 : 0 ] h2f_lw_BRESP
 ,input wire [1 - 1 : 0 ] h2f_lw_BVALID
 ,output wire [1 - 1 : 0 ] h2f_lw_BREADY
 ,output wire [4 - 1 : 0 ] h2f_lw_ARID
 ,output wire [21 - 1 : 0 ] h2f_lw_ARADDR
 ,output wire [8 - 1 : 0 ] h2f_lw_ARLEN
 ,output wire [3 - 1 : 0 ] h2f_lw_ARSIZE
 ,output wire [2 - 1 : 0 ] h2f_lw_ARBURST
 ,output wire [1 - 1 : 0 ] h2f_lw_ARLOCK
 ,output wire [4 - 1 : 0 ] h2f_lw_ARCACHE
 ,output wire [3 - 1 : 0 ] h2f_lw_ARPROT
 ,output wire [1 - 1 : 0 ] h2f_lw_ARVALID
 ,input wire [1 - 1 : 0 ] h2f_lw_ARREADY
 ,input wire [4 - 1 : 0 ] h2f_lw_RID
 ,input wire [32 - 1 : 0 ] h2f_lw_RDATA
 ,input wire [2 - 1 : 0 ] h2f_lw_RRESP
 ,input wire [1 - 1 : 0 ] h2f_lw_RLAST
 ,input wire [1 - 1 : 0 ] h2f_lw_RVALID
 ,output wire [1 - 1 : 0 ] h2f_lw_RREADY
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
 ,output wire [128 - 1 : 0 ] h2f_WDATA
 ,output wire [16 - 1 : 0 ] h2f_WSTRB
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
 ,input wire [128 - 1 : 0 ] h2f_RDATA
 ,input wire [2 - 1 : 0 ] h2f_RRESP
 ,input wire [1 - 1 : 0 ] h2f_RLAST
 ,input wire [1 - 1 : 0 ] h2f_RVALID
 ,output wire [1 - 1 : 0 ] h2f_RREADY
// f2h_irq0
 ,input wire [32 - 1 : 0 ] f2h_irq_p0
// f2h_irq1
 ,input wire [32 - 1 : 0 ] f2h_irq_p1
// hps_io
 ,output wire [1 - 1 : 0 ] EMAC0_TX_CLK
 ,output wire [1 - 1 : 0 ] EMAC0_TXD0
 ,output wire [1 - 1 : 0 ] EMAC0_TXD1
 ,output wire [1 - 1 : 0 ] EMAC0_TXD2
 ,output wire [1 - 1 : 0 ] EMAC0_TXD3
 ,input wire [1 - 1 : 0 ] EMAC0_RX_CTL
 ,output wire [1 - 1 : 0 ] EMAC0_TX_CTL
 ,input wire [1 - 1 : 0 ] EMAC0_RX_CLK
 ,input wire [1 - 1 : 0 ] EMAC0_RXD0
 ,input wire [1 - 1 : 0 ] EMAC0_RXD1
 ,input wire [1 - 1 : 0 ] EMAC0_RXD2
 ,input wire [1 - 1 : 0 ] EMAC0_RXD3
 ,inout wire [1 - 1 : 0 ] EMAC0_MDIO
 ,output wire [1 - 1 : 0 ] EMAC0_MDC
 ,inout wire [1 - 1 : 0 ] SDMMC_CMD
 ,inout wire [1 - 1 : 0 ] SDMMC_D0
 ,inout wire [1 - 1 : 0 ] SDMMC_D1
 ,inout wire [1 - 1 : 0 ] SDMMC_D2
 ,inout wire [1 - 1 : 0 ] SDMMC_D3
 ,output wire [1 - 1 : 0 ] SDMMC_CCLK
 ,inout wire [1 - 1 : 0 ] USB0_DATA0
 ,inout wire [1 - 1 : 0 ] USB0_DATA1
 ,inout wire [1 - 1 : 0 ] USB0_DATA2
 ,inout wire [1 - 1 : 0 ] USB0_DATA3
 ,inout wire [1 - 1 : 0 ] USB0_DATA4
 ,inout wire [1 - 1 : 0 ] USB0_DATA5
 ,inout wire [1 - 1 : 0 ] USB0_DATA6
 ,inout wire [1 - 1 : 0 ] USB0_DATA7
 ,input wire [1 - 1 : 0 ] USB0_CLK
 ,output wire [1 - 1 : 0 ] USB0_STP
 ,input wire [1 - 1 : 0 ] USB0_DIR
 ,input wire [1 - 1 : 0 ] USB0_NXT
 ,input wire [1 - 1 : 0 ] UART0_RX
 ,output wire [1 - 1 : 0 ] UART0_TX
 ,inout wire [1 - 1 : 0 ] I2C1_SDA
 ,inout wire [1 - 1 : 0 ] I2C1_SCL
 ,inout wire [1 - 1 : 0 ] gpio1_io0
 ,inout wire [1 - 1 : 0 ] gpio1_io1
 ,inout wire [1 - 1 : 0 ] gpio1_io4
 ,inout wire [1 - 1 : 0 ] gpio1_io5
 ,input wire [1 - 1 : 0 ] jtag_tck
 ,input wire [1 - 1 : 0 ] jtag_tms
 ,output wire [1 - 1 : 0 ] jtag_tdo
 ,input wire [1 - 1 : 0 ] jtag_tdi
 ,input wire [1 - 1 : 0 ] hps_osc_clk
 ,inout wire [1 - 1 : 0 ] gpio1_io19
 ,inout wire [1 - 1 : 0 ] gpio1_io20
 ,inout wire [1 - 1 : 0 ] gpio1_io21
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

wire [0:0] EMAC0_TX_CLK_out;
tennm_io_obuf hps_EMAC0_TX_CLK_obuf(
    .i(EMAC0_TX_CLK_out),
    .o(EMAC0_TX_CLK),
    .oe(1'b1)
);

wire [0:0] EMAC0_TXD0_out;
tennm_io_obuf hps_EMAC0_TXD0_obuf(
    .i(EMAC0_TXD0_out),
    .o(EMAC0_TXD0),
    .oe(1'b1)
);

wire [0:0] EMAC0_TXD1_out;
tennm_io_obuf hps_EMAC0_TXD1_obuf(
    .i(EMAC0_TXD1_out),
    .o(EMAC0_TXD1),
    .oe(1'b1)
);

wire [0:0] EMAC0_TXD2_out;
tennm_io_obuf hps_EMAC0_TXD2_obuf(
    .i(EMAC0_TXD2_out),
    .o(EMAC0_TXD2),
    .oe(1'b1)
);

wire [0:0] EMAC0_TXD3_out;
tennm_io_obuf hps_EMAC0_TXD3_obuf(
    .i(EMAC0_TXD3_out),
    .o(EMAC0_TXD3),
    .oe(1'b1)
);

wire [0:0] EMAC0_RX_CTL_in;
tennm_io_ibuf hps_EMAC0_RX_CTL_ibuf(
    .i(EMAC0_RX_CTL),
    .o(EMAC0_RX_CTL_in)
);

wire [0:0] EMAC0_TX_CTL_out;
tennm_io_obuf hps_EMAC0_TX_CTL_obuf(
    .i(EMAC0_TX_CTL_out),
    .o(EMAC0_TX_CTL),
    .oe(1'b1)
);

wire [0:0] EMAC0_RX_CLK_in;
tennm_io_ibuf hps_EMAC0_RX_CLK_ibuf(
    .i(EMAC0_RX_CLK),
    .o(EMAC0_RX_CLK_in)
);

wire [0:0] EMAC0_RXD0_in;
tennm_io_ibuf hps_EMAC0_RXD0_ibuf(
    .i(EMAC0_RXD0),
    .o(EMAC0_RXD0_in)
);

wire [0:0] EMAC0_RXD1_in;
tennm_io_ibuf hps_EMAC0_RXD1_ibuf(
    .i(EMAC0_RXD1),
    .o(EMAC0_RXD1_in)
);

wire [0:0] EMAC0_RXD2_in;
tennm_io_ibuf hps_EMAC0_RXD2_ibuf(
    .i(EMAC0_RXD2),
    .o(EMAC0_RXD2_in)
);

wire [0:0] EMAC0_RXD3_in;
tennm_io_ibuf hps_EMAC0_RXD3_ibuf(
    .i(EMAC0_RXD3),
    .o(EMAC0_RXD3_in)
);

wire [0:0] EMAC0_MDIO_in;
tennm_io_ibuf hps_EMAC0_MDIO_ibuf(
    .i(EMAC0_MDIO),
    .o(EMAC0_MDIO_in)
);

wire [0:0] EMAC0_MDIO_out;
tennm_io_obuf hps_EMAC0_MDIO_obuf(
    .i(EMAC0_MDIO_out),
    .o(EMAC0_MDIO),
    .oe(1'b1)
);

wire [0:0] EMAC0_MDC_out;
tennm_io_obuf hps_EMAC0_MDC_obuf(
    .i(EMAC0_MDC_out),
    .o(EMAC0_MDC),
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

wire [0:0] SDMMC_CCLK_out;
tennm_io_obuf hps_SDMMC_CCLK_obuf(
    .i(SDMMC_CCLK_out),
    .o(SDMMC_CCLK),
    .oe(1'b1)
);

wire [0:0] USB0_DATA0_in;
tennm_io_ibuf hps_USB0_DATA0_ibuf(
    .i(USB0_DATA0),
    .o(USB0_DATA0_in)
);

wire [0:0] USB0_DATA0_out;
tennm_io_obuf hps_USB0_DATA0_obuf(
    .i(USB0_DATA0_out),
    .o(USB0_DATA0),
    .oe(1'b1)
);

wire [0:0] USB0_DATA1_in;
tennm_io_ibuf hps_USB0_DATA1_ibuf(
    .i(USB0_DATA1),
    .o(USB0_DATA1_in)
);

wire [0:0] USB0_DATA1_out;
tennm_io_obuf hps_USB0_DATA1_obuf(
    .i(USB0_DATA1_out),
    .o(USB0_DATA1),
    .oe(1'b1)
);

wire [0:0] USB0_DATA2_in;
tennm_io_ibuf hps_USB0_DATA2_ibuf(
    .i(USB0_DATA2),
    .o(USB0_DATA2_in)
);

wire [0:0] USB0_DATA2_out;
tennm_io_obuf hps_USB0_DATA2_obuf(
    .i(USB0_DATA2_out),
    .o(USB0_DATA2),
    .oe(1'b1)
);

wire [0:0] USB0_DATA3_in;
tennm_io_ibuf hps_USB0_DATA3_ibuf(
    .i(USB0_DATA3),
    .o(USB0_DATA3_in)
);

wire [0:0] USB0_DATA3_out;
tennm_io_obuf hps_USB0_DATA3_obuf(
    .i(USB0_DATA3_out),
    .o(USB0_DATA3),
    .oe(1'b1)
);

wire [0:0] USB0_DATA4_in;
tennm_io_ibuf hps_USB0_DATA4_ibuf(
    .i(USB0_DATA4),
    .o(USB0_DATA4_in)
);

wire [0:0] USB0_DATA4_out;
tennm_io_obuf hps_USB0_DATA4_obuf(
    .i(USB0_DATA4_out),
    .o(USB0_DATA4),
    .oe(1'b1)
);

wire [0:0] USB0_DATA5_in;
tennm_io_ibuf hps_USB0_DATA5_ibuf(
    .i(USB0_DATA5),
    .o(USB0_DATA5_in)
);

wire [0:0] USB0_DATA5_out;
tennm_io_obuf hps_USB0_DATA5_obuf(
    .i(USB0_DATA5_out),
    .o(USB0_DATA5),
    .oe(1'b1)
);

wire [0:0] USB0_DATA6_in;
tennm_io_ibuf hps_USB0_DATA6_ibuf(
    .i(USB0_DATA6),
    .o(USB0_DATA6_in)
);

wire [0:0] USB0_DATA6_out;
tennm_io_obuf hps_USB0_DATA6_obuf(
    .i(USB0_DATA6_out),
    .o(USB0_DATA6),
    .oe(1'b1)
);

wire [0:0] USB0_DATA7_in;
tennm_io_ibuf hps_USB0_DATA7_ibuf(
    .i(USB0_DATA7),
    .o(USB0_DATA7_in)
);

wire [0:0] USB0_DATA7_out;
tennm_io_obuf hps_USB0_DATA7_obuf(
    .i(USB0_DATA7_out),
    .o(USB0_DATA7),
    .oe(1'b1)
);

wire [0:0] USB0_CLK_in;
tennm_io_ibuf hps_USB0_CLK_ibuf(
    .i(USB0_CLK),
    .o(USB0_CLK_in)
);

wire [0:0] USB0_STP_out;
tennm_io_obuf hps_USB0_STP_obuf(
    .i(USB0_STP_out),
    .o(USB0_STP),
    .oe(1'b1)
);

wire [0:0] USB0_DIR_in;
tennm_io_ibuf hps_USB0_DIR_ibuf(
    .i(USB0_DIR),
    .o(USB0_DIR_in)
);

wire [0:0] USB0_NXT_in;
tennm_io_ibuf hps_USB0_NXT_ibuf(
    .i(USB0_NXT),
    .o(USB0_NXT_in)
);

wire [0:0] UART0_RX_in;
tennm_io_ibuf hps_UART0_RX_ibuf(
    .i(UART0_RX),
    .o(UART0_RX_in)
);

wire [0:0] UART0_TX_out;
tennm_io_obuf hps_UART0_TX_obuf(
    .i(UART0_TX_out),
    .o(UART0_TX),
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

wire [0:0] gpio1_io0_in;
tennm_io_ibuf hps_gpio1_io0_ibuf(
    .i(gpio1_io0),
    .o(gpio1_io0_in)
);

wire [0:0] gpio1_io0_out;
tennm_io_obuf hps_gpio1_io0_obuf(
    .i(gpio1_io0_out),
    .o(gpio1_io0),
    .oe(1'b1)
);

wire [0:0] gpio1_io1_in;
tennm_io_ibuf hps_gpio1_io1_ibuf(
    .i(gpio1_io1),
    .o(gpio1_io1_in)
);

wire [0:0] gpio1_io1_out;
tennm_io_obuf hps_gpio1_io1_obuf(
    .i(gpio1_io1_out),
    .o(gpio1_io1),
    .oe(1'b1)
);

wire [0:0] gpio1_io4_in;
tennm_io_ibuf hps_gpio1_io4_ibuf(
    .i(gpio1_io4),
    .o(gpio1_io4_in)
);

wire [0:0] gpio1_io4_out;
tennm_io_obuf hps_gpio1_io4_obuf(
    .i(gpio1_io4_out),
    .o(gpio1_io4),
    .oe(1'b1)
);

wire [0:0] gpio1_io5_in;
tennm_io_ibuf hps_gpio1_io5_ibuf(
    .i(gpio1_io5),
    .o(gpio1_io5_in)
);

wire [0:0] gpio1_io5_out;
tennm_io_obuf hps_gpio1_io5_obuf(
    .i(gpio1_io5_out),
    .o(gpio1_io5),
    .oe(1'b1)
);

wire [0:0] jtag_tck_in;
tennm_io_ibuf hps_jtag_tck_ibuf(
    .i(jtag_tck),
    .o(jtag_tck_in)
);

wire [0:0] jtag_tms_in;
tennm_io_ibuf hps_jtag_tms_ibuf(
    .i(jtag_tms),
    .o(jtag_tms_in)
);

wire [0:0] jtag_tdo_out;
tennm_io_obuf hps_jtag_tdo_obuf(
    .i(jtag_tdo_out),
    .o(jtag_tdo),
    .oe(1'b1)
);

wire [0:0] jtag_tdi_in;
tennm_io_ibuf hps_jtag_tdi_ibuf(
    .i(jtag_tdi),
    .o(jtag_tdi_in)
);

wire [0:0] hps_osc_clk_in;
tennm_io_ibuf hps_hps_osc_clk_ibuf(
    .i(hps_osc_clk),
    .o(hps_osc_clk_in)
);

wire [0:0] gpio1_io19_in;
tennm_io_ibuf hps_gpio1_io19_ibuf(
    .i(gpio1_io19),
    .o(gpio1_io19_in)
);

wire [0:0] gpio1_io19_out;
tennm_io_obuf hps_gpio1_io19_obuf(
    .i(gpio1_io19_out),
    .o(gpio1_io19),
    .oe(1'b1)
);

wire [0:0] gpio1_io20_in;
tennm_io_ibuf hps_gpio1_io20_ibuf(
    .i(gpio1_io20),
    .o(gpio1_io20_in)
);

wire [0:0] gpio1_io20_out;
tennm_io_obuf hps_gpio1_io20_obuf(
    .i(gpio1_io20_out),
    .o(gpio1_io20),
    .oe(1'b1)
);

wire [0:0] gpio1_io21_in;
tennm_io_ibuf hps_gpio1_io21_ibuf(
    .i(gpio1_io21),
    .o(gpio1_io21_in)
);

wire [0:0] gpio1_io21_out;
tennm_io_obuf hps_gpio1_io21_obuf(
    .i(gpio1_io21_out),
    .o(gpio1_io21),
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
    EMAC0_TXD0_out[0:0] // 0:0
  })
,.lwsoc2fpga_ar_valid({
    h2f_lw_ARVALID[0:0] // 0:0
  })
,.lwsoc2fpga_b_resp({
    h2f_lw_BRESP[1:0] // 1:0
  })
,.HPS_IOB_7_I({
    I2C1_SDA_in[0:0] // 0:0
  })
,.tpiu_trace_ctl({
    1'b1 // 0:0
  })
,.HPS_IOA_9_I({
    USB0_DATA4_in[0:0] // 0:0
  })
,.HPS_IOB_11_O({
    jtag_tdo_out[0:0] // 0:0
  })
,.lwsoc2fpga_aw_ready({
    h2f_lw_AWREADY[0:0] // 0:0
  })
,.s2f_rst({
    h2f_rst[0:0] // 0:0
  })
,.HPS_IOA_10_I({
    USB0_DATA5_in[0:0] // 0:0
  })
,.HPS_IOB_3_O({
    UART0_TX_out[0:0] // 0:0
  })
,.HPS_IOA_22_O({
    EMAC0_TXD3_out[0:0] // 0:0
  })
,.HPS_IOA_5_O({
    USB0_DATA1_out[0:0] // 0:0
  })
,.lwsoc2fpga_b_id({
    h2f_lw_BID[3:0] // 3:0
  })
,.HPS_IOB_19_I({
    hps_osc_clk_in[0:0] // 0:0
  })
,.HPS_IOB_20_I({
    gpio1_io19_in[0:0] // 0:0
  })
,.soc2fpga_port_size_config_0({
    1'b0 // 0:0
  })
,.HPS_IOB_15_O({
    SDMMC_CCLK_out[0:0] // 0:0
  })
,.soc2fpga_aw_cache({
    h2f_AWCACHE[3:0] // 3:0
  })
,.soc2fpga_port_size_config_1({
    1'b1 // 0:0
  })
,.HPS_IOB_7_O({
    I2C1_SDA_out[0:0] // 0:0
  })
,.HPS_IOA_9_O({
    USB0_DATA4_out[0:0] // 0:0
  })
,.HPS_IOA_10_O({
    USB0_DATA5_out[0:0] // 0:0
  })
,.lwsoc2fpga_w_last({
    h2f_lw_WLAST[0:0] // 0:0
  })
,.pclkendbg({
    1'b0 // 0:0
  })
,.soc2fpga_b_id({
    h2f_BID[3:0] // 3:0
  })
,.HPS_IOB_20_O({
    gpio1_io19_out[0:0] // 0:0
  })
,.soc2fpga_aw_burst({
    h2f_AWBURST[1:0] // 1:0
  })
,.f2s_fpga_irq({
    f2h_irq_p1[31:0] // 63:32
   ,f2h_irq_p0[31:0] // 31:0
  })
,.lwsoc2fpga_aw_id({
    h2f_lw_AWID[3:0] // 3:0
  })
,.soc2fpga_w_data({
    h2f_WDATA[127:0] // 127:0
  })
,.HPS_IOA_14_O({
    EMAC0_TX_CTL_out[0:0] // 0:0
  })
,.lwsoc2fpga_aw_len({
    h2f_lw_AWLEN[7:0] // 7:0
  })
,.HPS_IOB_12_I({
    jtag_tdi_in[0:0] // 0:0
  })
,.lwsoc2fpga_ar_ready({
    h2f_lw_ARREADY[0:0] // 0:0
  })
,.lwsoc2fpga_ar_id({
    h2f_lw_ARID[3:0] // 3:0
  })
,.HPS_IOB_4_I({
    UART0_RX_in[0:0] // 0:0
  })
,.HPS_IOB_24_O({
    EMAC0_MDC_out[0:0] // 0:0
  })
,.HPS_IOA_23_I({
    EMAC0_RXD2_in[0:0] // 0:0
  })
,.HPS_IOA_6_I({
    USB0_NXT_in[0:0] // 0:0
  })
,.HPS_IOA_18_O({
    EMAC0_TXD1_out[0:0] // 0:0
  })
,.soc2fpga_r_last({
    h2f_RLAST[0:0] // 0:0
  })
,.lwsoc2fpga_port_size_config_0({
    1'b0 // 0:0
  })
,.HPS_IOB_16_I({
    SDMMC_D1_in[0:0] // 0:0
  })
,.HPS_IOA_2_O({
    USB0_STP_out[0:0] // 0:0
  })
,.soc2fpga_ar_cache({
    h2f_ARCACHE[3:0] // 3:0
  })
,.lwsoc2fpga_r_resp({
    h2f_lw_RRESP[1:0] // 1:0
  })
,.HPS_IOB_8_I({
    I2C1_SCL_in[0:0] // 0:0
  })
,.HPS_IOA_11_I({
    USB0_DATA6_in[0:0] // 0:0
  })
,.lwsoc2fpga_r_id({
    h2f_lw_RID[3:0] // 3:0
  })
,.soc2fpga_ar_burst({
    h2f_ARBURST[1:0] // 1:0
  })
,.HPS_IOB_21_I({
    gpio1_io20_in[0:0] // 0:0
  })
,.soc2fpga_b_resp({
    h2f_BRESP[1:0] // 1:0
  })
,.soc2fpga_ar_lock({
    h2f_ARLOCK[0:0] // 0:0
  })
,.HPS_IOB_16_O({
    SDMMC_D1_out[0:0] // 0:0
  })
,.HPS_IOA_15_I({
    EMAC0_RX_CLK_in[0:0] // 0:0
  })
,.soc2fpga_ar_addr({
    h2f_ARADDR[31:0] // 31:0
  })
,.HPS_IOB_8_O({
    I2C1_SCL_out[0:0] // 0:0
  })
,.HPS_IOA_11_O({
    USB0_DATA6_out[0:0] // 0:0
  })
,.lwsoc2fpga_ar_lock({
    h2f_lw_ARLOCK[0:0] // 0:0
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
,.HPS_IOB_1_I({
    gpio1_io0_in[0:0] // 0:0
  })
,.HPS_IOA_20_I({
    EMAC0_RXD1_in[0:0] // 0:0
  })
,.HPS_IOB_21_O({
    gpio1_io20_out[0:0] // 0:0
  })
,.lwsoc2fpga_ar_addr({
    h2f_lw_ARADDR[20:0] // 20:0
  })
,.HPS_IOA_19_I({
    EMAC0_RXD0_in[0:0] // 0:0
  })
,.soc2fpga_b_valid({
    h2f_BVALID[0:0] // 0:0
  })
,.HPS_IOA_3_I({
    USB0_DIR_in[0:0] // 0:0
  })
,.soc2fpga_w_last({
    h2f_WLAST[0:0] // 0:0
  })
,.HPS_IOB_13_I({
    SDMMC_D0_in[0:0] // 0:0
  })
,.lwsoc2fpga_w_strb({
    h2f_lw_WSTRB[3:0] // 3:0
  })
,.HPS_IOB_5_I({
    gpio1_io4_in[0:0] // 0:0
  })
,.lwsoc2fpga_b_valid({
    h2f_lw_BVALID[0:0] // 0:0
  })
,.HPS_IOA_24_I({
    EMAC0_RXD3_in[0:0] // 0:0
  })
,.HPS_IOA_7_I({
    USB0_DATA2_in[0:0] // 0:0
  })
,.lwsoc2fpga_clk({
    h2f_lw_axi_clk[0:0] // 0:0
  })
,.HPS_IOB_1_O({
    gpio1_io0_out[0:0] // 0:0
  })
,.lwsoc2fpga_aw_cache({
    h2f_lw_AWCACHE[3:0] // 3:0
  })
,.soc2fpga_w_valid({
    h2f_WVALID[0:0] // 0:0
  })
,.soc2fpga_aw_len({
    h2f_AWLEN[7:0] // 7:0
  })
,.soc2fpga_ar_prot({
    h2f_ARPROT[2:0] // 2:0
  })
,.HPS_IOB_17_I({
    SDMMC_D2_in[0:0] // 0:0
  })
,.soc2fpga_aw_lock({
    h2f_AWLOCK[0:0] // 0:0
  })
,.HPS_IOB_9_I({
    jtag_tck_in[0:0] // 0:0
  })
,.f2s_pending_rst_ack({
    1'b1 // 0:0
  })
,.HPS_IOA_12_I({
    USB0_DATA7_in[0:0] // 0:0
  })
,.lwsoc2fpga_w_valid({
    h2f_lw_WVALID[0:0] // 0:0
  })
,.HPS_IOB_13_O({
    SDMMC_D0_out[0:0] // 0:0
  })
,.soc2fpga_aw_addr({
    h2f_AWADDR[31:0] // 31:0
  })
,.soc2fpga_ar_valid({
    h2f_ARVALID[0:0] // 0:0
  })
,.lwsoc2fpga_ar_prot({
    h2f_lw_ARPROT[2:0] // 2:0
  })
,.lwsoc2fpga_aw_burst({
    h2f_lw_AWBURST[1:0] // 1:0
  })
,.HPS_IOB_5_O({
    gpio1_io4_out[0:0] // 0:0
  })
,.lwsoc2fpga_aw_lock({
    h2f_lw_AWLOCK[0:0] // 0:0
  })
,.soc2fpga_r_resp({
    h2f_RRESP[1:0] // 1:0
  })
,.HPS_IOA_7_O({
    USB0_DATA2_out[0:0] // 0:0
  })
,.HPS_IOB_22_I({
    gpio1_io21_in[0:0] // 0:0
  })
,.lwsoc2fpga_ar_len({
    h2f_lw_ARLEN[7:0] // 7:0
  })
,.soc2fpga_aw_ready({
    h2f_AWREADY[0:0] // 0:0
  })
,.HPS_IOA_16_I({
    EMAC0_RX_CTL_in[0:0] // 0:0
  })
,.soc2fpga_ar_size({
    h2f_ARSIZE[2:0] // 2:0
  })
,.lwsoc2fpga_aw_addr({
    h2f_lw_AWADDR[20:0] // 20:0
  })
,.HPS_IOB_17_O({
    SDMMC_D2_out[0:0] // 0:0
  })
,.soc2fpga_b_ready({
    h2f_BREADY[0:0] // 0:0
  })
,.lwsoc2fpga_r_data({
    h2f_lw_RDATA[31:0] // 31:0
  })
,.HPS_IOA_12_O({
    USB0_DATA7_out[0:0] // 0:0
  })
,.HPS_IOB_10_I({
    jtag_tms_in[0:0] // 0:0
  })
,.lwsoc2fpga_ar_size({
    h2f_lw_ARSIZE[2:0] // 2:0
  })
,.dbgapbdisable({
    1'b0 // 0:0
  })
,.HPS_IOB_22_O({
    gpio1_io21_out[0:0] // 0:0
  })
,.HPS_IOB_2_I({
    gpio1_io1_in[0:0] // 0:0
  })
,.soc2fpga_r_valid({
    h2f_RVALID[0:0] // 0:0
  })
,.lwsoc2fpga_rst_n({
    h2f_lw_axi_rst_n[0:0] // 0:0
  })
,.lwsoc2fpga_ar_cache({
    h2f_lw_ARCACHE[3:0] // 3:0
  })
,.lwsoc2fpga_b_ready({
    h2f_lw_BREADY[0:0] // 0:0
  })
,.HPS_IOA_4_I({
    USB0_DATA0_in[0:0] // 0:0
  })
,.soc2fpga_w_ready({
    h2f_WREADY[0:0] // 0:0
  })
,.soc2fpga_aw_prot({
    h2f_AWPROT[2:0] // 2:0
  })
,.lwsoc2fpga_r_valid({
    h2f_lw_RVALID[0:0] // 0:0
  })
,.HPS_IOB_14_I({
    SDMMC_CMD_in[0:0] // 0:0
  })
,.lwsoc2fpga_ar_burst({
    h2f_lw_ARBURST[1:0] // 1:0
  })
,.HPS_IOB_6_I({
    gpio1_io5_in[0:0] // 0:0
  })
,.HPS_IOA_8_I({
    USB0_DATA3_in[0:0] // 0:0
  })
,.lwsoc2fpga_w_ready({
    h2f_lw_WREADY[0:0] // 0:0
  })
,.lwsoc2fpga_aw_prot({
    h2f_lw_AWPROT[2:0] // 2:0
  })
,.soc2fpga_ar_ready({
    h2f_ARREADY[0:0] // 0:0
  })
,.HPS_IOB_2_O({
    gpio1_io1_out[0:0] // 0:0
  })
,.HPS_IOA_21_O({
    EMAC0_TXD2_out[0:0] // 0:0
  })
,.HPS_IOB_18_I({
    SDMMC_D3_in[0:0] // 0:0
  })
,.HPS_IOA_4_O({
    USB0_DATA0_out[0:0] // 0:0
  })
,.soc2fpga_w_strb({
    h2f_WSTRB[15:0] // 15:0
  })
,.soc2fpga_aw_size({
    h2f_AWSIZE[2:0] // 2:0
  })
,.lwsoc2fpga_aw_valid({
    h2f_lw_AWVALID[0:0] // 0:0
  })
,.HPS_IOB_14_O({
    SDMMC_CMD_out[0:0] // 0:0
  })
,.lwsoc2fpga_w_data({
    h2f_lw_WDATA[31:0] // 31:0
  })
,.HPS_IOB_6_O({
    gpio1_io5_out[0:0] // 0:0
  })
,.HPS_IOB_23_I({
    EMAC0_MDIO_in[0:0] // 0:0
  })
,.soc2fpga_aw_id({
    h2f_AWID[3:0] // 3:0
  })
,.HPS_IOA_8_O({
    USB0_DATA3_out[0:0] // 0:0
  })
,.lwsoc2fpga_aw_size({
    h2f_lw_AWSIZE[2:0] // 2:0
  })
,.soc2fpga_r_ready({
    h2f_RREADY[0:0] // 0:0
  })
,.HPS_IOB_18_O({
    SDMMC_D3_out[0:0] // 0:0
  })
,.HPS_IOA_1_I({
    USB0_CLK_in[0:0] // 0:0
  })
,.soc2fpga_ar_id({
    h2f_ARID[3:0] // 3:0
  })
,.lwsoc2fpga_r_last({
    h2f_lw_RLAST[0:0] // 0:0
  })
,.HPS_IOA_13_O({
    EMAC0_TX_CLK_out[0:0] // 0:0
  })
,.soc2fpga_ar_len({
    h2f_ARLEN[7:0] // 7:0
  })
,.lwsoc2fpga_r_ready({
    h2f_lw_RREADY[0:0] // 0:0
  })
,.f2s_free_clk({
    1'b0 // 0:0
  })
,.HPS_IOB_23_O({
    EMAC0_MDIO_out[0:0] // 0:0
  })
,.soc2fpga_clk({
    h2f_axi_clk[0:0] // 0:0
  })
,.HPS_IOA_5_I({
    USB0_DATA1_in[0:0] // 0:0
  })
,.soc2fpga_r_data({
    h2f_RDATA[127:0] // 127:0
  })
);

defparam hps_inst.SWDTH = 16;
defparam hps_inst.WDTH = 128;
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

