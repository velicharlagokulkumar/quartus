module DMA_1 (
//Additional refclk_bti to preserve Etile XCVR
input    wire          refclk_bti,
// Clock and Reset
input    wire   fpga_clk_100,

//HPS
// HPS EMIF
output   wire [0:0]    emif_hps_mem_mem_ck,
output   wire [0:0]    emif_hps_mem_mem_ck_n,
output   wire [16:0]   emif_hps_mem_mem_a,
output   wire [0:0]    emif_hps_mem_mem_act_n,
output   wire [1:0]    emif_hps_mem_mem_ba,
output   wire [1-1:0]    emif_hps_mem_mem_bg,
output   wire [0:0]    emif_hps_mem_mem_cke,
output   wire [0:0]    emif_hps_mem_mem_cs_n,
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
input    wire        hps_jtag_tck,
input    wire        hps_jtag_tms,
output   wire        hps_jtag_tdo,
input    wire        hps_jtag_tdi,
output   wire        hps_sdmmc_CCLK, 
inout    wire        hps_sdmmc_CMD,          
inout    wire        hps_sdmmc_D0,          
inout    wire        hps_sdmmc_D1,          
inout    wire        hps_sdmmc_D2,        
inout    wire        hps_sdmmc_D3,        
inout    wire        hps_usb0_DATA0,         
inout    wire        hps_usb0_DATA1,      
inout    wire        hps_usb0_DATA2,        
inout    wire        hps_usb0_DATA3,       
inout    wire        hps_usb0_DATA4,        
inout    wire        hps_usb0_DATA5,      
inout    wire        hps_usb0_DATA6,      
inout    wire        hps_usb0_DATA7,         
input    wire        hps_usb0_CLK,         
output   wire        hps_usb0_STP,       
input    wire        hps_usb0_DIR,        
input    wire        hps_usb0_NXT, 
output   wire        hps_emac0_TX_CLK,       //TODO: may need to change RMII TX CLK to be input instead, check
input    wire        hps_emac0_RX_CLK,      
output   wire        hps_emac0_TX_CTL,
input    wire        hps_emac0_RX_CTL,      
output   wire        hps_emac0_TXD0,       
output   wire        hps_emac0_TXD1,
input    wire        hps_emac0_RXD0,     
input    wire        hps_emac0_RXD1,                
output   wire        hps_emac0_TXD2,        
output   wire        hps_emac0_TXD3,
input    wire        hps_emac0_RXD2,        
input    wire        hps_emac0_RXD3, 
inout    wire        hps_emac0_MDIO,         
output   wire        hps_emac0_MDC,
input    wire        hps_uart0_RX,       
output   wire        hps_uart0_TX, 
inout    wire        hps_i2c1_SDA,        
inout    wire        hps_i2c1_SCL, 
inout    wire        hps_gpio1_io0,
inout    wire        hps_gpio1_io1,
inout    wire        hps_gpio1_io4,
inout    wire        hps_gpio1_io5,
inout    wire        hps_gpio1_io19,
inout    wire        hps_gpio1_io20,
inout    wire        hps_gpio1_io21,
input    wire        hps_ref_clk,
input    wire [1-1:0]   fpga_reset_n,
output   wire [1:0]   led,
output   wire         led2
);

wire         system_clk_100;
wire         system_clk_100_internal;
wire         ninit_done;
wire         fpga_reset_n_debounced_wire;
reg          fpga_reset_n_debounced;
wire         src_reset_n;
wire         system_reset_n;
wire         h2f_reset;

/*
reg [2:0]ocm_s2_address;                   //   input,   width = 3,                    ocm_s2.address
reg ocm_s2_chipselect;            //   input,   width = 1,                          .chipselect
reg ocm_s2_clken;                     //   input,   width = 1,                          .clken
reg ocm_s2_write;                //   input,   width = 1,                          .write
wire ocm_s2_readdata;                 //  output,  width = 32,                          .readdata
reg [31:0]ocm_s2_writedata;               //   input,  width = 32,                          .writedata
reg [31:0]ocm_s2_byteenable;
*/

assign system_reset_n = fpga_reset_n_debounced & src_reset_n & ~h2f_reset & ~ninit_done;

assign system_clk_100   = fpga_clk_100;

assign system_clk_100_internal  = system_clk_100;

wire [4-1:0]     fpga_debounced_buttons;


//Temporary disable src_reset_n
assign src_reset_n = 1'b1;

// Qsys Top module
qsys_top soc_inst (
//.src_prb_rst_sources_source             (src_reset_n),
.clk_100_clk                            (system_clk_100_internal),
.ninit_done_ninit_done                  (ninit_done),    
.emif_hps_pll_ref_clk_clk               (emif_hps_pll_ref_clk),   
.emif_hps_mem_mem_ck                    (emif_hps_mem_mem_ck),   
.emif_hps_mem_mem_ck_n                  (emif_hps_mem_mem_ck_n),  
.emif_hps_mem_mem_a                     (emif_hps_mem_mem_a),       
.emif_hps_mem_mem_act_n                 (emif_hps_mem_mem_act_n),   
.emif_hps_mem_mem_ba                    (emif_hps_mem_mem_ba),      
.emif_hps_mem_mem_bg                    (emif_hps_mem_mem_bg),      
.emif_hps_mem_mem_cke                   (emif_hps_mem_mem_cke),    
.emif_hps_mem_mem_cs_n                  (emif_hps_mem_mem_cs_n),    
.emif_hps_mem_mem_odt                   (emif_hps_mem_mem_odt),     
.emif_hps_mem_mem_reset_n               (emif_hps_mem_mem_reset_n),
.emif_hps_mem_mem_par                   (emif_hps_mem_mem_par),          
.emif_hps_mem_mem_alert_n               (emif_hps_mem_mem_alert_n),    
.emif_hps_mem_mem_dqs                   (emif_hps_mem_mem_dqs),       
.emif_hps_mem_mem_dqs_n                 (emif_hps_mem_mem_dqs_n),     
.emif_hps_mem_mem_dq                    (emif_hps_mem_mem_dq), 
.emif_hps_mem_mem_dbi_n                 (emif_hps_mem_mem_dbi_n), 
.emif_hps_oct_oct_rzqin                 (emif_hps_oct_oct_rzqin), 
.hps_io_jtag_tck                 (hps_jtag_tck),                
.hps_io_jtag_tms                 (hps_jtag_tms),                
.hps_io_jtag_tdo                 (hps_jtag_tdo),                 
.hps_io_jtag_tdi                 (hps_jtag_tdi),    
.hps_io_EMAC0_TX_CLK       (hps_emac0_TX_CLK),     
.hps_io_EMAC0_RX_CLK       (hps_emac0_RX_CLK),     
.hps_io_EMAC0_TX_CTL       (hps_emac0_TX_CTL),    
.hps_io_EMAC0_RX_CTL       (hps_emac0_RX_CTL),    
.hps_io_EMAC0_TXD0         (hps_emac0_TXD0),     
.hps_io_EMAC0_TXD1         (hps_emac0_TXD1),
.hps_io_EMAC0_RXD0         (hps_emac0_RXD0),       
.hps_io_EMAC0_RXD1         (hps_emac0_RXD1),        
.hps_io_EMAC0_TXD2         (hps_emac0_TXD2),      
.hps_io_EMAC0_TXD3         (hps_emac0_TXD3),   
.hps_io_EMAC0_RXD2         (hps_emac0_RXD2),        
.hps_io_EMAC0_RXD3         (hps_emac0_RXD3),
.hps_io_EMAC0_MDIO         (hps_emac0_MDIO),       
.hps_io_EMAC0_MDC          (hps_emac0_MDC), 
.hps_io_SDMMC_CCLK         (hps_sdmmc_CCLK),   
.hps_io_SDMMC_CMD          (hps_sdmmc_CMD), 
.hps_io_SDMMC_D0           (hps_sdmmc_D0),          
.hps_io_SDMMC_D1           (hps_sdmmc_D1),          
.hps_io_SDMMC_D2           (hps_sdmmc_D2),         
.hps_io_SDMMC_D3           (hps_sdmmc_D3),        
.hps_io_I2C1_SDA           (hps_i2c1_SDA),     
.hps_io_I2C1_SCL           (hps_i2c1_SCL),
.hps_io_UART0_RX           (hps_uart0_RX),          
.hps_io_UART0_TX           (hps_uart0_TX), 
.hps_io_USB0_CLK           (hps_usb0_CLK), 
.hps_io_USB0_STP           (hps_usb0_STP), 
.hps_io_USB0_DIR           (hps_usb0_DIR),
.hps_io_USB0_NXT           (hps_usb0_NXT),
.hps_io_USB0_DATA0         (hps_usb0_DATA0),
.hps_io_USB0_DATA1         (hps_usb0_DATA1), 
.hps_io_USB0_DATA2         (hps_usb0_DATA2), 
.hps_io_USB0_DATA3         (hps_usb0_DATA3), 
.hps_io_USB0_DATA4         (hps_usb0_DATA4), 
.hps_io_USB0_DATA5         (hps_usb0_DATA5),
.hps_io_USB0_DATA6         (hps_usb0_DATA6), 
.hps_io_USB0_DATA7         (hps_usb0_DATA7),
.hps_io_gpio1_io0           (hps_gpio1_io0),
.hps_io_gpio1_io1           (hps_gpio1_io1),
.hps_io_gpio1_io4           (hps_gpio1_io4),
.hps_io_gpio1_io5           (hps_gpio1_io5),
.hps_io_gpio1_io19           (hps_gpio1_io19),
.hps_io_gpio1_io20           (hps_gpio1_io20),
.hps_io_gpio1_io21           (hps_gpio1_io21),
.hps_io_hps_osc_clk                     (hps_ref_clk),
.h2f_reset_reset                        (h2f_reset),
.reset_reset_n                          (system_reset_n),
.mm2s_awcache                     (4'b0111),                     //   input,   width = 4,                      mm2s.awcache
.mm2s_awprot                      (3'b000),                      //   input,   width = 3,                          .awprot
.mm2s_awuser                      (5'b00001),                      //   input,   width = 5,                          .awuser
.mm2s_arcache                     (4'b0111),                     //   input,   width = 4,                          .arcache
.mm2s_aruser                      (5'b00001),                      //   input,   width = 5,                          .aruser
.mm2s_arprot                      (3'b000),
.pio_0_external_connection_export (led),/*,
.ocm_s2_address                   (ocm_s2_address),                   //   input,   width = 3,                    ocm_s2.address
.ocm_s2_chipselect                (ocm_s2_chipselect),                //   input,   width = 1,                          .chipselect
.ocm_s2_clken                     (ocm_s2_clken),                     //   input,   width = 1,                          .clken
.ocm_s2_write                     (ocm_s2_write),                     //   input,   width = 1,                          .write
.ocm_s2_readdata                  (ocm_s2_readdata),                  //  output,  width = 32,                          .readdata
.ocm_s2_writedata                 (ocm_s2_writedata),                 //   input,  width = 32,                          .writedata
.ocm_s2_byteenable                (ocm_s2_byteenable) */
.ila_source (led2)  //  output,   width = 1, in_system_sources_probes_0_sources.source
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

endmodule


