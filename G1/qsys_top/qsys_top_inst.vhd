	component qsys_top is
		port (
			hps_io_EMAC0_TX_CLK              : out   std_logic;                                        -- EMAC0_TX_CLK
			hps_io_EMAC0_TXD0                : out   std_logic;                                        -- EMAC0_TXD0
			hps_io_EMAC0_TXD1                : out   std_logic;                                        -- EMAC0_TXD1
			hps_io_EMAC0_TXD2                : out   std_logic;                                        -- EMAC0_TXD2
			hps_io_EMAC0_TXD3                : out   std_logic;                                        -- EMAC0_TXD3
			hps_io_EMAC0_RX_CTL              : in    std_logic                     := 'X';             -- EMAC0_RX_CTL
			hps_io_EMAC0_TX_CTL              : out   std_logic;                                        -- EMAC0_TX_CTL
			hps_io_EMAC0_RX_CLK              : in    std_logic                     := 'X';             -- EMAC0_RX_CLK
			hps_io_EMAC0_RXD0                : in    std_logic                     := 'X';             -- EMAC0_RXD0
			hps_io_EMAC0_RXD1                : in    std_logic                     := 'X';             -- EMAC0_RXD1
			hps_io_EMAC0_RXD2                : in    std_logic                     := 'X';             -- EMAC0_RXD2
			hps_io_EMAC0_RXD3                : in    std_logic                     := 'X';             -- EMAC0_RXD3
			hps_io_EMAC0_MDIO                : inout std_logic                     := 'X';             -- EMAC0_MDIO
			hps_io_EMAC0_MDC                 : out   std_logic;                                        -- EMAC0_MDC
			hps_io_SDMMC_CMD                 : inout std_logic                     := 'X';             -- SDMMC_CMD
			hps_io_SDMMC_D0                  : inout std_logic                     := 'X';             -- SDMMC_D0
			hps_io_SDMMC_D1                  : inout std_logic                     := 'X';             -- SDMMC_D1
			hps_io_SDMMC_D2                  : inout std_logic                     := 'X';             -- SDMMC_D2
			hps_io_SDMMC_D3                  : inout std_logic                     := 'X';             -- SDMMC_D3
			hps_io_SDMMC_CCLK                : out   std_logic;                                        -- SDMMC_CCLK
			hps_io_USB0_DATA0                : inout std_logic                     := 'X';             -- USB0_DATA0
			hps_io_USB0_DATA1                : inout std_logic                     := 'X';             -- USB0_DATA1
			hps_io_USB0_DATA2                : inout std_logic                     := 'X';             -- USB0_DATA2
			hps_io_USB0_DATA3                : inout std_logic                     := 'X';             -- USB0_DATA3
			hps_io_USB0_DATA4                : inout std_logic                     := 'X';             -- USB0_DATA4
			hps_io_USB0_DATA5                : inout std_logic                     := 'X';             -- USB0_DATA5
			hps_io_USB0_DATA6                : inout std_logic                     := 'X';             -- USB0_DATA6
			hps_io_USB0_DATA7                : inout std_logic                     := 'X';             -- USB0_DATA7
			hps_io_USB0_CLK                  : in    std_logic                     := 'X';             -- USB0_CLK
			hps_io_USB0_STP                  : out   std_logic;                                        -- USB0_STP
			hps_io_USB0_DIR                  : in    std_logic                     := 'X';             -- USB0_DIR
			hps_io_USB0_NXT                  : in    std_logic                     := 'X';             -- USB0_NXT
			hps_io_UART0_RX                  : in    std_logic                     := 'X';             -- UART0_RX
			hps_io_UART0_TX                  : out   std_logic;                                        -- UART0_TX
			hps_io_I2C1_SDA                  : inout std_logic                     := 'X';             -- I2C1_SDA
			hps_io_I2C1_SCL                  : inout std_logic                     := 'X';             -- I2C1_SCL
			hps_io_gpio1_io0                 : inout std_logic                     := 'X';             -- gpio1_io0
			hps_io_gpio1_io1                 : inout std_logic                     := 'X';             -- gpio1_io1
			hps_io_gpio1_io4                 : inout std_logic                     := 'X';             -- gpio1_io4
			hps_io_gpio1_io5                 : inout std_logic                     := 'X';             -- gpio1_io5
			hps_io_jtag_tck                  : in    std_logic                     := 'X';             -- jtag_tck
			hps_io_jtag_tms                  : in    std_logic                     := 'X';             -- jtag_tms
			hps_io_jtag_tdo                  : out   std_logic;                                        -- jtag_tdo
			hps_io_jtag_tdi                  : in    std_logic                     := 'X';             -- jtag_tdi
			hps_io_hps_osc_clk               : in    std_logic                     := 'X';             -- hps_osc_clk
			hps_io_gpio1_io19                : inout std_logic                     := 'X';             -- gpio1_io19
			hps_io_gpio1_io20                : inout std_logic                     := 'X';             -- gpio1_io20
			hps_io_gpio1_io21                : inout std_logic                     := 'X';             -- gpio1_io21
			h2f_reset_reset                  : out   std_logic;                                        -- reset
			mm2s_awcache                     : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- awcache
			mm2s_awprot                      : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			mm2s_awuser                      : in    std_logic_vector(4 downto 0)  := (others => 'X'); -- awuser
			mm2s_arcache                     : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- arcache
			mm2s_aruser                      : in    std_logic_vector(4 downto 0)  := (others => 'X'); -- aruser
			mm2s_arprot                      : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			clk_100_clk                      : in    std_logic                     := 'X';             -- clk
			emif_hps_pll_ref_clk_clk         : in    std_logic                     := 'X';             -- clk
			emif_hps_oct_oct_rzqin           : in    std_logic                     := 'X';             -- oct_rzqin
			emif_hps_mem_mem_ck              : out   std_logic_vector(0 downto 0);                     -- mem_ck
			emif_hps_mem_mem_ck_n            : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			emif_hps_mem_mem_a               : out   std_logic_vector(16 downto 0);                    -- mem_a
			emif_hps_mem_mem_act_n           : out   std_logic_vector(0 downto 0);                     -- mem_act_n
			emif_hps_mem_mem_ba              : out   std_logic_vector(1 downto 0);                     -- mem_ba
			emif_hps_mem_mem_bg              : out   std_logic_vector(0 downto 0);                     -- mem_bg
			emif_hps_mem_mem_cke             : out   std_logic_vector(0 downto 0);                     -- mem_cke
			emif_hps_mem_mem_cs_n            : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			emif_hps_mem_mem_odt             : out   std_logic_vector(0 downto 0);                     -- mem_odt
			emif_hps_mem_mem_reset_n         : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			emif_hps_mem_mem_par             : out   std_logic_vector(0 downto 0);                     -- mem_par
			emif_hps_mem_mem_alert_n         : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_alert_n
			emif_hps_mem_mem_dqs             : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dqs
			emif_hps_mem_mem_dqs_n           : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dqs_n
			emif_hps_mem_mem_dq              : inout std_logic_vector(71 downto 0) := (others => 'X'); -- mem_dq
			emif_hps_mem_mem_dbi_n           : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dbi_n
			ila_source                       : out   std_logic_vector(0 downto 0);                     -- source
			pio_0_external_connection_export : out   std_logic_vector(1 downto 0);                     -- export
			reset_reset_n                    : in    std_logic                     := 'X';             -- reset_n
			ninit_done_ninit_done            : out   std_logic                                         -- ninit_done
		);
	end component qsys_top;

	u0 : component qsys_top
		port map (
			hps_io_EMAC0_TX_CLK              => CONNECTED_TO_hps_io_EMAC0_TX_CLK,              --                    hps_io.EMAC0_TX_CLK
			hps_io_EMAC0_TXD0                => CONNECTED_TO_hps_io_EMAC0_TXD0,                --                          .EMAC0_TXD0
			hps_io_EMAC0_TXD1                => CONNECTED_TO_hps_io_EMAC0_TXD1,                --                          .EMAC0_TXD1
			hps_io_EMAC0_TXD2                => CONNECTED_TO_hps_io_EMAC0_TXD2,                --                          .EMAC0_TXD2
			hps_io_EMAC0_TXD3                => CONNECTED_TO_hps_io_EMAC0_TXD3,                --                          .EMAC0_TXD3
			hps_io_EMAC0_RX_CTL              => CONNECTED_TO_hps_io_EMAC0_RX_CTL,              --                          .EMAC0_RX_CTL
			hps_io_EMAC0_TX_CTL              => CONNECTED_TO_hps_io_EMAC0_TX_CTL,              --                          .EMAC0_TX_CTL
			hps_io_EMAC0_RX_CLK              => CONNECTED_TO_hps_io_EMAC0_RX_CLK,              --                          .EMAC0_RX_CLK
			hps_io_EMAC0_RXD0                => CONNECTED_TO_hps_io_EMAC0_RXD0,                --                          .EMAC0_RXD0
			hps_io_EMAC0_RXD1                => CONNECTED_TO_hps_io_EMAC0_RXD1,                --                          .EMAC0_RXD1
			hps_io_EMAC0_RXD2                => CONNECTED_TO_hps_io_EMAC0_RXD2,                --                          .EMAC0_RXD2
			hps_io_EMAC0_RXD3                => CONNECTED_TO_hps_io_EMAC0_RXD3,                --                          .EMAC0_RXD3
			hps_io_EMAC0_MDIO                => CONNECTED_TO_hps_io_EMAC0_MDIO,                --                          .EMAC0_MDIO
			hps_io_EMAC0_MDC                 => CONNECTED_TO_hps_io_EMAC0_MDC,                 --                          .EMAC0_MDC
			hps_io_SDMMC_CMD                 => CONNECTED_TO_hps_io_SDMMC_CMD,                 --                          .SDMMC_CMD
			hps_io_SDMMC_D0                  => CONNECTED_TO_hps_io_SDMMC_D0,                  --                          .SDMMC_D0
			hps_io_SDMMC_D1                  => CONNECTED_TO_hps_io_SDMMC_D1,                  --                          .SDMMC_D1
			hps_io_SDMMC_D2                  => CONNECTED_TO_hps_io_SDMMC_D2,                  --                          .SDMMC_D2
			hps_io_SDMMC_D3                  => CONNECTED_TO_hps_io_SDMMC_D3,                  --                          .SDMMC_D3
			hps_io_SDMMC_CCLK                => CONNECTED_TO_hps_io_SDMMC_CCLK,                --                          .SDMMC_CCLK
			hps_io_USB0_DATA0                => CONNECTED_TO_hps_io_USB0_DATA0,                --                          .USB0_DATA0
			hps_io_USB0_DATA1                => CONNECTED_TO_hps_io_USB0_DATA1,                --                          .USB0_DATA1
			hps_io_USB0_DATA2                => CONNECTED_TO_hps_io_USB0_DATA2,                --                          .USB0_DATA2
			hps_io_USB0_DATA3                => CONNECTED_TO_hps_io_USB0_DATA3,                --                          .USB0_DATA3
			hps_io_USB0_DATA4                => CONNECTED_TO_hps_io_USB0_DATA4,                --                          .USB0_DATA4
			hps_io_USB0_DATA5                => CONNECTED_TO_hps_io_USB0_DATA5,                --                          .USB0_DATA5
			hps_io_USB0_DATA6                => CONNECTED_TO_hps_io_USB0_DATA6,                --                          .USB0_DATA6
			hps_io_USB0_DATA7                => CONNECTED_TO_hps_io_USB0_DATA7,                --                          .USB0_DATA7
			hps_io_USB0_CLK                  => CONNECTED_TO_hps_io_USB0_CLK,                  --                          .USB0_CLK
			hps_io_USB0_STP                  => CONNECTED_TO_hps_io_USB0_STP,                  --                          .USB0_STP
			hps_io_USB0_DIR                  => CONNECTED_TO_hps_io_USB0_DIR,                  --                          .USB0_DIR
			hps_io_USB0_NXT                  => CONNECTED_TO_hps_io_USB0_NXT,                  --                          .USB0_NXT
			hps_io_UART0_RX                  => CONNECTED_TO_hps_io_UART0_RX,                  --                          .UART0_RX
			hps_io_UART0_TX                  => CONNECTED_TO_hps_io_UART0_TX,                  --                          .UART0_TX
			hps_io_I2C1_SDA                  => CONNECTED_TO_hps_io_I2C1_SDA,                  --                          .I2C1_SDA
			hps_io_I2C1_SCL                  => CONNECTED_TO_hps_io_I2C1_SCL,                  --                          .I2C1_SCL
			hps_io_gpio1_io0                 => CONNECTED_TO_hps_io_gpio1_io0,                 --                          .gpio1_io0
			hps_io_gpio1_io1                 => CONNECTED_TO_hps_io_gpio1_io1,                 --                          .gpio1_io1
			hps_io_gpio1_io4                 => CONNECTED_TO_hps_io_gpio1_io4,                 --                          .gpio1_io4
			hps_io_gpio1_io5                 => CONNECTED_TO_hps_io_gpio1_io5,                 --                          .gpio1_io5
			hps_io_jtag_tck                  => CONNECTED_TO_hps_io_jtag_tck,                  --                          .jtag_tck
			hps_io_jtag_tms                  => CONNECTED_TO_hps_io_jtag_tms,                  --                          .jtag_tms
			hps_io_jtag_tdo                  => CONNECTED_TO_hps_io_jtag_tdo,                  --                          .jtag_tdo
			hps_io_jtag_tdi                  => CONNECTED_TO_hps_io_jtag_tdi,                  --                          .jtag_tdi
			hps_io_hps_osc_clk               => CONNECTED_TO_hps_io_hps_osc_clk,               --                          .hps_osc_clk
			hps_io_gpio1_io19                => CONNECTED_TO_hps_io_gpio1_io19,                --                          .gpio1_io19
			hps_io_gpio1_io20                => CONNECTED_TO_hps_io_gpio1_io20,                --                          .gpio1_io20
			hps_io_gpio1_io21                => CONNECTED_TO_hps_io_gpio1_io21,                --                          .gpio1_io21
			h2f_reset_reset                  => CONNECTED_TO_h2f_reset_reset,                  --                 h2f_reset.reset
			mm2s_awcache                     => CONNECTED_TO_mm2s_awcache,                     --                      mm2s.awcache
			mm2s_awprot                      => CONNECTED_TO_mm2s_awprot,                      --                          .awprot
			mm2s_awuser                      => CONNECTED_TO_mm2s_awuser,                      --                          .awuser
			mm2s_arcache                     => CONNECTED_TO_mm2s_arcache,                     --                          .arcache
			mm2s_aruser                      => CONNECTED_TO_mm2s_aruser,                      --                          .aruser
			mm2s_arprot                      => CONNECTED_TO_mm2s_arprot,                      --                          .arprot
			clk_100_clk                      => CONNECTED_TO_clk_100_clk,                      --                   clk_100.clk
			emif_hps_pll_ref_clk_clk         => CONNECTED_TO_emif_hps_pll_ref_clk_clk,         --      emif_hps_pll_ref_clk.clk
			emif_hps_oct_oct_rzqin           => CONNECTED_TO_emif_hps_oct_oct_rzqin,           --              emif_hps_oct.oct_rzqin
			emif_hps_mem_mem_ck              => CONNECTED_TO_emif_hps_mem_mem_ck,              --              emif_hps_mem.mem_ck
			emif_hps_mem_mem_ck_n            => CONNECTED_TO_emif_hps_mem_mem_ck_n,            --                          .mem_ck_n
			emif_hps_mem_mem_a               => CONNECTED_TO_emif_hps_mem_mem_a,               --                          .mem_a
			emif_hps_mem_mem_act_n           => CONNECTED_TO_emif_hps_mem_mem_act_n,           --                          .mem_act_n
			emif_hps_mem_mem_ba              => CONNECTED_TO_emif_hps_mem_mem_ba,              --                          .mem_ba
			emif_hps_mem_mem_bg              => CONNECTED_TO_emif_hps_mem_mem_bg,              --                          .mem_bg
			emif_hps_mem_mem_cke             => CONNECTED_TO_emif_hps_mem_mem_cke,             --                          .mem_cke
			emif_hps_mem_mem_cs_n            => CONNECTED_TO_emif_hps_mem_mem_cs_n,            --                          .mem_cs_n
			emif_hps_mem_mem_odt             => CONNECTED_TO_emif_hps_mem_mem_odt,             --                          .mem_odt
			emif_hps_mem_mem_reset_n         => CONNECTED_TO_emif_hps_mem_mem_reset_n,         --                          .mem_reset_n
			emif_hps_mem_mem_par             => CONNECTED_TO_emif_hps_mem_mem_par,             --                          .mem_par
			emif_hps_mem_mem_alert_n         => CONNECTED_TO_emif_hps_mem_mem_alert_n,         --                          .mem_alert_n
			emif_hps_mem_mem_dqs             => CONNECTED_TO_emif_hps_mem_mem_dqs,             --                          .mem_dqs
			emif_hps_mem_mem_dqs_n           => CONNECTED_TO_emif_hps_mem_mem_dqs_n,           --                          .mem_dqs_n
			emif_hps_mem_mem_dq              => CONNECTED_TO_emif_hps_mem_mem_dq,              --                          .mem_dq
			emif_hps_mem_mem_dbi_n           => CONNECTED_TO_emif_hps_mem_mem_dbi_n,           --                          .mem_dbi_n
			ila_source                       => CONNECTED_TO_ila_source,                       --                       ila.source
			pio_0_external_connection_export => CONNECTED_TO_pio_0_external_connection_export, -- pio_0_external_connection.export
			reset_reset_n                    => CONNECTED_TO_reset_reset_n,                    --                     reset.reset_n
			ninit_done_ninit_done            => CONNECTED_TO_ninit_done_ninit_done             --                ninit_done.ninit_done
		);

