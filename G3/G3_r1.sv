module G3_r1(

// Clock and Reset
input    wire   fpga_clk_100,
input    wire   fpga_reset_n,
input    wire   hps_ref_clk,

//Debug
output   wire [1:0]  fpga_led_pio,

//HPS
// HPS EMIF
output   wire [0:0]    emif_hps_mem_mem_ck,
output   wire [0:0]    emif_hps_mem_mem_ck_n,
output   wire [16:0]   emif_hps_mem_mem_a,
output   wire [0:0]    emif_hps_mem_mem_act_n,
output   wire [1:0]    emif_hps_mem_mem_ba,
output   wire [1-1:0]    emif_hps_mem_mem_bg,
output   wire [0:0]    emif_hps_mem_mem_cke,
output   wire [1:0]    emif_hps_mem_mem_cs_n,
output   wire [0:0]    emif_hps_mem_mem_odt,
output   wire [0:0]    emif_hps_mem_mem_reset_n,
output   wire [0:0]    emif_hps_mem_mem_par,
input    wire [0:0]    emif_hps_mem_mem_alert_n,
input    wire          emif_hps_oct_oct_rzqin,
input    wire          emif_hps_pll_ref_clk,
inout    wire [9-1:0]   emif_hps_mem_mem_dbi_n,
inout    wire [72-1:0]   emif_hps_mem_mem_dq,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs_n,

inout  logic        SDMMC_CMD,
inout  logic        SDMMC_D0,
inout  logic        SDMMC_D1,
inout  logic        SDMMC_D2,
inout  logic        SDMMC_D3,
inout  logic        SDMMC_D4,
inout  logic        SDMMC_D5,
inout  logic        SDMMC_D6,
inout  logic        SDMMC_D7,
output logic        SDMMC_CCLK,

output logic        EMAC1_TX_CLK,
output logic        EMAC1_TXD0,
output logic        EMAC1_TXD1,
output logic        EMAC1_TXD2,
output logic        EMAC1_TXD3,
input  logic        EMAC1_RX_CTL,
output logic        EMAC1_TX_CTL,
input  logic        EMAC1_RX_CLK,
input  logic        EMAC1_RXD0,
input  logic        EMAC1_RXD1,
input  logic        EMAC1_RXD2,
input  logic        EMAC1_RXD3,
inout  logic        EMAC1_MDIO,
output logic        EMAC1_MDC,

inout  logic        gpio0_io11,
inout  logic        gpio0_io12,
inout  logic        gpio0_io13,
inout  logic        gpio0_io14,
inout  logic        gpio0_io15,
inout  logic        gpio0_io16,
inout  logic        gpio0_io17,
inout  logic        gpio0_io18,
inout  logic        gpio1_io16,
inout  logic        gpio1_io17,

output logic        SPIM0_CLK,
output logic        SPIM0_MOSI,
input  logic        SPIM0_MISO,
output logic        SPIM0_SS0_N,
output logic        SPIM1_CLK,
output logic        SPIM1_MOSI,
input  logic        SPIM1_MISO,
output logic        SPIM1_SS0_N,
output logic        SPIM1_SS1_N,

input  logic        UART1_RX,
output logic        UART1_TX,
inout  logic        I2C1_SDA,
inout  logic        I2C1_SCL
);

wire         system_clk_100;
wire         system_clk_100_internal;
wire         ninit_done;
wire         fpga_reset_n_debounced_wire;
reg          fpga_reset_n_debounced;
wire         src_reset_n;
wire         system_reset_n;
wire         h2f_reset;


assign system_reset_n = fpga_reset_n_debounced & src_reset_n & ~h2f_reset & ~ninit_done;

assign system_clk_100   = fpga_clk_100;

assign system_clk_100_internal  = system_clk_100;


//Temporary disable src_reset_n
assign src_reset_n = 1'b1;

// Qsys Top module
qsys_top_r1 soc_inst_r1 (

    .agilex_hps_h2f_user0_clock_clk        (),        //  output,   width = 1,     agilex_hps_h2f_user0_clock.clk
    .agilex_hps_h2f_user1_clock_clk        (),        //  output,   width = 1,     agilex_hps_h2f_user1_clock.clk

    .hps_io_EMAC1_TX_CLK                   (EMAC1_TX_CLK),                   //  output,   width = 1,                         hps_io.EMAC1_TX_CLK
    .hps_io_EMAC1_TXD0                     (EMAC1_TXD0),                     //  output,   width = 1,                               .EMAC1_TXD0
    .hps_io_EMAC1_TXD1                     (EMAC1_TXD1),                     //  output,   width = 1,                               .EMAC1_TXD1
    .hps_io_EMAC1_TXD2                     (EMAC1_TXD2),                     //  output,   width = 1,                               .EMAC1_TXD2
    .hps_io_EMAC1_TXD3                     (EMAC1_TXD3),                     //  output,   width = 1,                               .EMAC1_TXD3
    .hps_io_EMAC1_RX_CTL                   (EMAC1_RX_CTL),                   //   input,   width = 1,                               .EMAC1_RX_CTL
    .hps_io_EMAC1_TX_CTL                   (EMAC1_TX_CTL),                   //  output,   width = 1,                               .EMAC1_TX_CTL
    .hps_io_EMAC1_RX_CLK                   (EMAC1_RX_CLK),                   //   input,   width = 1,                               .EMAC1_RX_CLK
    .hps_io_EMAC1_RXD0                     (EMAC1_RXD0),                     //   input,   width = 1,                               .EMAC1_RXD0
    .hps_io_EMAC1_RXD1                     (EMAC1_RXD1),                     //   input,   width = 1,                               .EMAC1_RXD1
    .hps_io_EMAC1_RXD2                     (EMAC1_RXD2),                     //   input,   width = 1,                               .EMAC1_RXD2
    .hps_io_EMAC1_RXD3                     (EMAC1_RXD3),                     //   input,   width = 1,                               .EMAC1_RXD3
    .hps_io_EMAC1_MDIO                     (EMAC1_MDIO),                     //   inout,   width = 1,                               .EMAC1_MDIO
    .hps_io_EMAC1_MDC                      (EMAC1_MDC),                      //  output,   width = 1,                               .EMAC1_MDC

    .hps_io_SDMMC_CMD                       (SDMMC_CMD), //   inout,     width = 1,                                .SDMMC_CMD
    .hps_io_SDMMC_D0                        (SDMMC_D0), //   inout,     width = 1,                                .SDMMC_D0
    .hps_io_SDMMC_D1                        (SDMMC_D1), //   inout,     width = 1,                                .SDMMC_D1
    .hps_io_SDMMC_D2                        (SDMMC_D2), //   inout,     width = 1,                                .SDMMC_D2
    .hps_io_SDMMC_D3                        (SDMMC_D3), //   inout,     width = 1,                                .SDMMC_D3
    .hps_io_SDMMC_D4                        (SDMMC_D4), //   inout,     width = 1,                                .SDMMC_D4
    .hps_io_SDMMC_D5                        (SDMMC_D5), //   inout,     width = 1,                                .SDMMC_D5
    .hps_io_SDMMC_D6                        (SDMMC_D6), //   inout,     width = 1,                                .SDMMC_D6
    .hps_io_SDMMC_D7                        (SDMMC_D7), //   inout,     width = 1,                                .SDMMC_D7
    .hps_io_SDMMC_CCLK                      (SDMMC_CCLK), //  output,     width = 1,                                .SDMMC_CCLK

    .hps_io_SPIM0_CLK                      (SPIM0_CLK),                      //  output,   width = 1,                               .SPIM0_CLK
    .hps_io_SPIM0_MOSI                     (SPIM0_MOSI),                     //  output,   width = 1,                               .SPIM0_MOSI
    .hps_io_SPIM0_MISO                     (SPIM0_MISO),                     //   input,   width = 1,                               .SPIM0_MISO
    .hps_io_SPIM0_SS0_N                    (SPIM0_SS0_N),                    //  output,   width = 1,                               .SPIM0_SS0_N
    .hps_io_SPIM1_CLK                      (SPIM1_CLK),                      //  output,   width = 1,                               .SPIM1_CLK
    .hps_io_SPIM1_MOSI                     (SPIM1_MOSI),                     //  output,   width = 1,                               .SPIM1_MOSI
    .hps_io_SPIM1_MISO                     (SPIM1_MISO),                     //   input,   width = 1,                               .SPIM1_MISO
    .hps_io_SPIM1_SS0_N                    (SPIM1_SS0_N),                    //  output,   width = 1,                               .SPIM1_SS0_N
    .hps_io_SPIM1_SS1_N                    (SPIM1_SS1_N),                    //  output,   width = 1,                               .SPIM1_SS1_N

    .hps_io_UART1_RX                       (UART1_RX),                       //   input,   width = 1,                               .UART1_RX
    .hps_io_UART1_TX                       (UART1_TX),                       //  output,   width = 1,                               .UART1_TX

    .hps_io_I2C1_SDA                       (I2C1_SDA),                       //   inout,   width = 1,                               .I2C1_SDA
    .hps_io_I2C1_SCL                       (I2C1_SCL),                       //   inout,   width = 1,                               .I2C1_SCL
    
    .hps_io_hps_osc_clk                    (hps_ref_clk),                    //   input,   width = 1,                               .hps_osc_clk

    .hps_io_gpio0_io11                     (gpio0_io11),                     //   inout,   width = 1,                               .gpio0_io11
    .hps_io_gpio0_io12                     (gpio0_io12),                     //   inout,   width = 1,                               .gpio0_io12
    .hps_io_gpio0_io13                     (gpio0_io13),                     //   inout,   width = 1,                               .gpio0_io13
    .hps_io_gpio0_io14                     (gpio0_io14),                     //   inout,   width = 1,                               .gpio0_io14
    .hps_io_gpio0_io15                     (gpio0_io15),                     //   inout,   width = 1,                               .gpio0_io15
    .hps_io_gpio0_io16                     (gpio0_io16),                     //   inout,   width = 1,                               .gpio0_io16
    .hps_io_gpio0_io17                     (gpio0_io17),                     //   inout,   width = 1,                               .gpio0_io17
    .hps_io_gpio0_io18                     (gpio0_io18),                     //   inout,   width = 1,                               .gpio0_io18
    .hps_io_gpio1_io16                     (gpio1_io16),                     //   inout,   width = 1,                               .gpio1_io16
    .hps_io_gpio1_io17                     (gpio1_io17),                     //   inout,   width = 1,                               .gpio1_io17

    .h2f_reset_reset                  (h2f_reset),                  //  output,   width = 1,                 h2f_reset.reset
    .clk_100_clk                      (system_clk_100_internal),                      //   input,   width = 1,                   clk_100.clk
    .emif_hps_pll_ref_clk_clk         (emif_hps_pll_ref_clk),         //   input,   width = 1,      emif_hps_pll_ref_clk.clk
    .emif_hps_oct_oct_rzqin           (emif_hps_oct_oct_rzqin),           //   input,   width = 1,              emif_hps_oct.oct_rzqin
    .emif_hps_mem_mem_ck              (emif_hps_mem_mem_ck),              //  output,   width = 1,              emif_hps_mem.mem_ck
    .emif_hps_mem_mem_ck_n            (emif_hps_mem_mem_ck_n),            //  output,   width = 1,                          .mem_ck_n
    .emif_hps_mem_mem_a               (emif_hps_mem_mem_a),               //  output,  width = 17,                          .mem_a
    .emif_hps_mem_mem_act_n           (emif_hps_mem_mem_act_n),           //  output,   width = 1,                          .mem_act_n
    .emif_hps_mem_mem_ba              (emif_hps_mem_mem_ba),              //  output,   width = 2,                          .mem_ba
    .emif_hps_mem_mem_bg              (emif_hps_mem_mem_bg),              //  output,   width = 1,                          .mem_bg
    .emif_hps_mem_mem_cke             (emif_hps_mem_mem_cke),             //  output,   width = 1,                          .mem_cke
    .emif_hps_mem_mem_cs_n            (emif_hps_mem_mem_cs_n),            //  output,   width = 1,                          .mem_cs_n
    .emif_hps_mem_mem_odt             (emif_hps_mem_mem_odt),             //  output,   width = 1,                          .mem_odt
    .emif_hps_mem_mem_reset_n         (emif_hps_mem_mem_reset_n),         //  output,   width = 1,                          .mem_reset_n
    .emif_hps_mem_mem_par             (emif_hps_mem_mem_par),             //  output,   width = 1,                          .mem_par
    .emif_hps_mem_mem_alert_n         (emif_hps_mem_mem_alert_n),         //   input,   width = 1,                          .mem_alert_n
    .emif_hps_mem_mem_dqs             (emif_hps_mem_mem_dqs),             //   inout,   width = 9,                          .mem_dqs
    .emif_hps_mem_mem_dqs_n           (emif_hps_mem_mem_dqs_n),           //   inout,   width = 9,                          .mem_dqs_n
    .emif_hps_mem_mem_dq              (emif_hps_mem_mem_dq),              //   inout,  width = 72,                          .mem_dq
    .emif_hps_mem_mem_dbi_n           (emif_hps_mem_mem_dbi_n),           //   inout,   width = 9,                          .mem_dbi_n
    .pio_0_external_connection_export (fpga_led_pio), //  output,   width = 2, pio_0_external_connection.export
    .reset_reset_n                    (system_reset_n),                    //   input,   width = 1,                     reset.reset_n
    .ninit_done_ninit_done            (ninit_done)             //  output,   width = 1,                ninit_done.ninit_done
);

// debounce fpga_reset_n
debounce fpga_reset_n_debounce_inst (
.clk          (system_clk_100_internal),
.reset_n      (~ninit_done),
.data_in      (fpga_reset_n),
.data_out     (fpga_reset_n_debounced_wire)
);
defparam fpga_reset_n_debounce_inst.WIDTH = 1;
defparam fpga_reset_n_debounce_inst.POLARITY = "LOW";
defparam fpga_reset_n_debounce_inst.TIMEOUT = 10000;               // at 100Mhz this is a debounce time of 1ms
defparam fpga_reset_n_debounce_inst.TIMEOUT_WIDTH = 32;            // ceil(log2(TIMEOUT))

always @ (posedge system_clk_100_internal or posedge ninit_done)
begin
    if (ninit_done == 1'b1)
        fpga_reset_n_debounced <= 1'b0;
    else
        fpga_reset_n_debounced <= fpga_reset_n_debounced_wire;  
end

// Debounce logic to clean out glitches within 1ms

endmodule


