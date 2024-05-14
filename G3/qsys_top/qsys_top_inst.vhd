	component qsys_top is
		port (
			agilex_hps_h2f_user0_clock_clk        : out   std_logic;                                        -- clk
			agilex_hps_h2f_user1_clock_clk        : out   std_logic;                                        -- clk
			hps_io_EMAC1_TX_CLK                   : out   std_logic;                                        -- EMAC1_TX_CLK
			hps_io_EMAC1_TXD0                     : out   std_logic;                                        -- EMAC1_TXD0
			hps_io_EMAC1_TXD1                     : out   std_logic;                                        -- EMAC1_TXD1
			hps_io_EMAC1_TXD2                     : out   std_logic;                                        -- EMAC1_TXD2
			hps_io_EMAC1_TXD3                     : out   std_logic;                                        -- EMAC1_TXD3
			hps_io_EMAC1_RX_CTL                   : in    std_logic                     := 'X';             -- EMAC1_RX_CTL
			hps_io_EMAC1_TX_CTL                   : out   std_logic;                                        -- EMAC1_TX_CTL
			hps_io_EMAC1_RX_CLK                   : in    std_logic                     := 'X';             -- EMAC1_RX_CLK
			hps_io_EMAC1_RXD0                     : in    std_logic                     := 'X';             -- EMAC1_RXD0
			hps_io_EMAC1_RXD1                     : in    std_logic                     := 'X';             -- EMAC1_RXD1
			hps_io_EMAC1_RXD2                     : in    std_logic                     := 'X';             -- EMAC1_RXD2
			hps_io_EMAC1_RXD3                     : in    std_logic                     := 'X';             -- EMAC1_RXD3
			hps_io_EMAC1_MDIO                     : inout std_logic                     := 'X';             -- EMAC1_MDIO
			hps_io_EMAC1_MDC                      : out   std_logic;                                        -- EMAC1_MDC
			hps_io_SDMMC_CMD                      : inout std_logic                     := 'X';             -- SDMMC_CMD
			hps_io_SDMMC_D0                       : inout std_logic                     := 'X';             -- SDMMC_D0
			hps_io_SDMMC_D1                       : inout std_logic                     := 'X';             -- SDMMC_D1
			hps_io_SDMMC_D2                       : inout std_logic                     := 'X';             -- SDMMC_D2
			hps_io_SDMMC_D3                       : inout std_logic                     := 'X';             -- SDMMC_D3
			hps_io_SDMMC_D4                       : inout std_logic                     := 'X';             -- SDMMC_D4
			hps_io_SDMMC_D5                       : inout std_logic                     := 'X';             -- SDMMC_D5
			hps_io_SDMMC_D6                       : inout std_logic                     := 'X';             -- SDMMC_D6
			hps_io_SDMMC_D7                       : inout std_logic                     := 'X';             -- SDMMC_D7
			hps_io_SDMMC_CCLK                     : out   std_logic;                                        -- SDMMC_CCLK
			hps_io_SPIM0_CLK                      : out   std_logic;                                        -- SPIM0_CLK
			hps_io_SPIM0_MOSI                     : out   std_logic;                                        -- SPIM0_MOSI
			hps_io_SPIM0_MISO                     : in    std_logic                     := 'X';             -- SPIM0_MISO
			hps_io_SPIM0_SS0_N                    : out   std_logic;                                        -- SPIM0_SS0_N
			hps_io_SPIM1_CLK                      : out   std_logic;                                        -- SPIM1_CLK
			hps_io_SPIM1_MOSI                     : out   std_logic;                                        -- SPIM1_MOSI
			hps_io_SPIM1_MISO                     : in    std_logic                     := 'X';             -- SPIM1_MISO
			hps_io_SPIM1_SS0_N                    : out   std_logic;                                        -- SPIM1_SS0_N
			hps_io_SPIM1_SS1_N                    : out   std_logic;                                        -- SPIM1_SS1_N
			hps_io_UART1_RX                       : in    std_logic                     := 'X';             -- UART1_RX
			hps_io_UART1_TX                       : out   std_logic;                                        -- UART1_TX
			hps_io_I2C1_SDA                       : inout std_logic                     := 'X';             -- I2C1_SDA
			hps_io_I2C1_SCL                       : inout std_logic                     := 'X';             -- I2C1_SCL
			hps_io_hps_osc_clk                    : in    std_logic                     := 'X';             -- hps_osc_clk
			hps_io_gpio0_io11                     : inout std_logic                     := 'X';             -- gpio0_io11
			hps_io_gpio0_io12                     : inout std_logic                     := 'X';             -- gpio0_io12
			hps_io_gpio0_io13                     : inout std_logic                     := 'X';             -- gpio0_io13
			hps_io_gpio0_io14                     : inout std_logic                     := 'X';             -- gpio0_io14
			hps_io_gpio0_io15                     : inout std_logic                     := 'X';             -- gpio0_io15
			hps_io_gpio0_io16                     : inout std_logic                     := 'X';             -- gpio0_io16
			hps_io_gpio0_io17                     : inout std_logic                     := 'X';             -- gpio0_io17
			hps_io_gpio0_io18                     : inout std_logic                     := 'X';             -- gpio0_io18
			hps_io_gpio1_io16                     : inout std_logic                     := 'X';             -- gpio1_io16
			hps_io_gpio1_io17                     : inout std_logic                     := 'X';             -- gpio1_io17
			h2f_reset_reset                       : out   std_logic;                                        -- reset
			f2h_irq1_irq                          : in    std_logic_vector(31 downto 0) := (others => 'X'); -- irq
			clk_100_clk                           : in    std_logic                     := 'X';             -- clk
			emif_hps_pll_ref_clk_clk              : in    std_logic                     := 'X';             -- clk
			emif_hps_oct_oct_rzqin                : in    std_logic                     := 'X';             -- oct_rzqin
			emif_hps_mem_mem_ck                   : out   std_logic_vector(0 downto 0);                     -- mem_ck
			emif_hps_mem_mem_ck_n                 : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			emif_hps_mem_mem_a                    : out   std_logic_vector(16 downto 0);                    -- mem_a
			emif_hps_mem_mem_act_n                : out   std_logic_vector(0 downto 0);                     -- mem_act_n
			emif_hps_mem_mem_ba                   : out   std_logic_vector(1 downto 0);                     -- mem_ba
			emif_hps_mem_mem_bg                   : out   std_logic_vector(0 downto 0);                     -- mem_bg
			emif_hps_mem_mem_cke                  : out   std_logic_vector(0 downto 0);                     -- mem_cke
			emif_hps_mem_mem_cs_n                 : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			emif_hps_mem_mem_odt                  : out   std_logic_vector(0 downto 0);                     -- mem_odt
			emif_hps_mem_mem_reset_n              : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			emif_hps_mem_mem_par                  : out   std_logic_vector(0 downto 0);                     -- mem_par
			emif_hps_mem_mem_alert_n              : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_alert_n
			emif_hps_mem_mem_dqs                  : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dqs
			emif_hps_mem_mem_dqs_n                : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dqs_n
			emif_hps_mem_mem_dq                   : inout std_logic_vector(71 downto 0) := (others => 'X'); -- mem_dq
			emif_hps_mem_mem_dbi_n                : inout std_logic_vector(8 downto 0)  := (others => 'X'); -- mem_dbi_n
			pio_0_external_connection_export      : out   std_logic_vector(1 downto 0);                     -- export
			ram_controller_1_src_write_cmd_tready : in    std_logic                     := 'X';             -- tready
			ram_controller_1_src_write_cmd_tdata  : out   std_logic_vector(95 downto 0);                    -- tdata
			ram_controller_1_src_write_cmd_tvalid : out   std_logic;                                        -- tvalid
			ram_controller_1_src_read_cmd_tready  : in    std_logic                     := 'X';             -- tready
			ram_controller_1_src_read_cmd_tdata   : out   std_logic_vector(96 downto 0);                    -- tdata
			ram_controller_1_src_read_cmd_tvalid  : out   std_logic;                                        -- tvalid
			reset_reset_n                         : in    std_logic                     := 'X';             -- reset_n
			ninit_done_ninit_done                 : out   std_logic                                         -- ninit_done
		);
	end component qsys_top;

	u0 : component qsys_top
		port map (
			agilex_hps_h2f_user0_clock_clk        => CONNECTED_TO_agilex_hps_h2f_user0_clock_clk,        --     agilex_hps_h2f_user0_clock.clk
			agilex_hps_h2f_user1_clock_clk        => CONNECTED_TO_agilex_hps_h2f_user1_clock_clk,        --     agilex_hps_h2f_user1_clock.clk
			hps_io_EMAC1_TX_CLK                   => CONNECTED_TO_hps_io_EMAC1_TX_CLK,                   --                         hps_io.EMAC1_TX_CLK
			hps_io_EMAC1_TXD0                     => CONNECTED_TO_hps_io_EMAC1_TXD0,                     --                               .EMAC1_TXD0
			hps_io_EMAC1_TXD1                     => CONNECTED_TO_hps_io_EMAC1_TXD1,                     --                               .EMAC1_TXD1
			hps_io_EMAC1_TXD2                     => CONNECTED_TO_hps_io_EMAC1_TXD2,                     --                               .EMAC1_TXD2
			hps_io_EMAC1_TXD3                     => CONNECTED_TO_hps_io_EMAC1_TXD3,                     --                               .EMAC1_TXD3
			hps_io_EMAC1_RX_CTL                   => CONNECTED_TO_hps_io_EMAC1_RX_CTL,                   --                               .EMAC1_RX_CTL
			hps_io_EMAC1_TX_CTL                   => CONNECTED_TO_hps_io_EMAC1_TX_CTL,                   --                               .EMAC1_TX_CTL
			hps_io_EMAC1_RX_CLK                   => CONNECTED_TO_hps_io_EMAC1_RX_CLK,                   --                               .EMAC1_RX_CLK
			hps_io_EMAC1_RXD0                     => CONNECTED_TO_hps_io_EMAC1_RXD0,                     --                               .EMAC1_RXD0
			hps_io_EMAC1_RXD1                     => CONNECTED_TO_hps_io_EMAC1_RXD1,                     --                               .EMAC1_RXD1
			hps_io_EMAC1_RXD2                     => CONNECTED_TO_hps_io_EMAC1_RXD2,                     --                               .EMAC1_RXD2
			hps_io_EMAC1_RXD3                     => CONNECTED_TO_hps_io_EMAC1_RXD3,                     --                               .EMAC1_RXD3
			hps_io_EMAC1_MDIO                     => CONNECTED_TO_hps_io_EMAC1_MDIO,                     --                               .EMAC1_MDIO
			hps_io_EMAC1_MDC                      => CONNECTED_TO_hps_io_EMAC1_MDC,                      --                               .EMAC1_MDC
			hps_io_SDMMC_CMD                      => CONNECTED_TO_hps_io_SDMMC_CMD,                      --                               .SDMMC_CMD
			hps_io_SDMMC_D0                       => CONNECTED_TO_hps_io_SDMMC_D0,                       --                               .SDMMC_D0
			hps_io_SDMMC_D1                       => CONNECTED_TO_hps_io_SDMMC_D1,                       --                               .SDMMC_D1
			hps_io_SDMMC_D2                       => CONNECTED_TO_hps_io_SDMMC_D2,                       --                               .SDMMC_D2
			hps_io_SDMMC_D3                       => CONNECTED_TO_hps_io_SDMMC_D3,                       --                               .SDMMC_D3
			hps_io_SDMMC_D4                       => CONNECTED_TO_hps_io_SDMMC_D4,                       --                               .SDMMC_D4
			hps_io_SDMMC_D5                       => CONNECTED_TO_hps_io_SDMMC_D5,                       --                               .SDMMC_D5
			hps_io_SDMMC_D6                       => CONNECTED_TO_hps_io_SDMMC_D6,                       --                               .SDMMC_D6
			hps_io_SDMMC_D7                       => CONNECTED_TO_hps_io_SDMMC_D7,                       --                               .SDMMC_D7
			hps_io_SDMMC_CCLK                     => CONNECTED_TO_hps_io_SDMMC_CCLK,                     --                               .SDMMC_CCLK
			hps_io_SPIM0_CLK                      => CONNECTED_TO_hps_io_SPIM0_CLK,                      --                               .SPIM0_CLK
			hps_io_SPIM0_MOSI                     => CONNECTED_TO_hps_io_SPIM0_MOSI,                     --                               .SPIM0_MOSI
			hps_io_SPIM0_MISO                     => CONNECTED_TO_hps_io_SPIM0_MISO,                     --                               .SPIM0_MISO
			hps_io_SPIM0_SS0_N                    => CONNECTED_TO_hps_io_SPIM0_SS0_N,                    --                               .SPIM0_SS0_N
			hps_io_SPIM1_CLK                      => CONNECTED_TO_hps_io_SPIM1_CLK,                      --                               .SPIM1_CLK
			hps_io_SPIM1_MOSI                     => CONNECTED_TO_hps_io_SPIM1_MOSI,                     --                               .SPIM1_MOSI
			hps_io_SPIM1_MISO                     => CONNECTED_TO_hps_io_SPIM1_MISO,                     --                               .SPIM1_MISO
			hps_io_SPIM1_SS0_N                    => CONNECTED_TO_hps_io_SPIM1_SS0_N,                    --                               .SPIM1_SS0_N
			hps_io_SPIM1_SS1_N                    => CONNECTED_TO_hps_io_SPIM1_SS1_N,                    --                               .SPIM1_SS1_N
			hps_io_UART1_RX                       => CONNECTED_TO_hps_io_UART1_RX,                       --                               .UART1_RX
			hps_io_UART1_TX                       => CONNECTED_TO_hps_io_UART1_TX,                       --                               .UART1_TX
			hps_io_I2C1_SDA                       => CONNECTED_TO_hps_io_I2C1_SDA,                       --                               .I2C1_SDA
			hps_io_I2C1_SCL                       => CONNECTED_TO_hps_io_I2C1_SCL,                       --                               .I2C1_SCL
			hps_io_hps_osc_clk                    => CONNECTED_TO_hps_io_hps_osc_clk,                    --                               .hps_osc_clk
			hps_io_gpio0_io11                     => CONNECTED_TO_hps_io_gpio0_io11,                     --                               .gpio0_io11
			hps_io_gpio0_io12                     => CONNECTED_TO_hps_io_gpio0_io12,                     --                               .gpio0_io12
			hps_io_gpio0_io13                     => CONNECTED_TO_hps_io_gpio0_io13,                     --                               .gpio0_io13
			hps_io_gpio0_io14                     => CONNECTED_TO_hps_io_gpio0_io14,                     --                               .gpio0_io14
			hps_io_gpio0_io15                     => CONNECTED_TO_hps_io_gpio0_io15,                     --                               .gpio0_io15
			hps_io_gpio0_io16                     => CONNECTED_TO_hps_io_gpio0_io16,                     --                               .gpio0_io16
			hps_io_gpio0_io17                     => CONNECTED_TO_hps_io_gpio0_io17,                     --                               .gpio0_io17
			hps_io_gpio0_io18                     => CONNECTED_TO_hps_io_gpio0_io18,                     --                               .gpio0_io18
			hps_io_gpio1_io16                     => CONNECTED_TO_hps_io_gpio1_io16,                     --                               .gpio1_io16
			hps_io_gpio1_io17                     => CONNECTED_TO_hps_io_gpio1_io17,                     --                               .gpio1_io17
			h2f_reset_reset                       => CONNECTED_TO_h2f_reset_reset,                       --                      h2f_reset.reset
			f2h_irq1_irq                          => CONNECTED_TO_f2h_irq1_irq,                          --                       f2h_irq1.irq
			clk_100_clk                           => CONNECTED_TO_clk_100_clk,                           --                        clk_100.clk
			emif_hps_pll_ref_clk_clk              => CONNECTED_TO_emif_hps_pll_ref_clk_clk,              --           emif_hps_pll_ref_clk.clk
			emif_hps_oct_oct_rzqin                => CONNECTED_TO_emif_hps_oct_oct_rzqin,                --                   emif_hps_oct.oct_rzqin
			emif_hps_mem_mem_ck                   => CONNECTED_TO_emif_hps_mem_mem_ck,                   --                   emif_hps_mem.mem_ck
			emif_hps_mem_mem_ck_n                 => CONNECTED_TO_emif_hps_mem_mem_ck_n,                 --                               .mem_ck_n
			emif_hps_mem_mem_a                    => CONNECTED_TO_emif_hps_mem_mem_a,                    --                               .mem_a
			emif_hps_mem_mem_act_n                => CONNECTED_TO_emif_hps_mem_mem_act_n,                --                               .mem_act_n
			emif_hps_mem_mem_ba                   => CONNECTED_TO_emif_hps_mem_mem_ba,                   --                               .mem_ba
			emif_hps_mem_mem_bg                   => CONNECTED_TO_emif_hps_mem_mem_bg,                   --                               .mem_bg
			emif_hps_mem_mem_cke                  => CONNECTED_TO_emif_hps_mem_mem_cke,                  --                               .mem_cke
			emif_hps_mem_mem_cs_n                 => CONNECTED_TO_emif_hps_mem_mem_cs_n,                 --                               .mem_cs_n
			emif_hps_mem_mem_odt                  => CONNECTED_TO_emif_hps_mem_mem_odt,                  --                               .mem_odt
			emif_hps_mem_mem_reset_n              => CONNECTED_TO_emif_hps_mem_mem_reset_n,              --                               .mem_reset_n
			emif_hps_mem_mem_par                  => CONNECTED_TO_emif_hps_mem_mem_par,                  --                               .mem_par
			emif_hps_mem_mem_alert_n              => CONNECTED_TO_emif_hps_mem_mem_alert_n,              --                               .mem_alert_n
			emif_hps_mem_mem_dqs                  => CONNECTED_TO_emif_hps_mem_mem_dqs,                  --                               .mem_dqs
			emif_hps_mem_mem_dqs_n                => CONNECTED_TO_emif_hps_mem_mem_dqs_n,                --                               .mem_dqs_n
			emif_hps_mem_mem_dq                   => CONNECTED_TO_emif_hps_mem_mem_dq,                   --                               .mem_dq
			emif_hps_mem_mem_dbi_n                => CONNECTED_TO_emif_hps_mem_mem_dbi_n,                --                               .mem_dbi_n
			pio_0_external_connection_export      => CONNECTED_TO_pio_0_external_connection_export,      --      pio_0_external_connection.export
			ram_controller_1_src_write_cmd_tready => CONNECTED_TO_ram_controller_1_src_write_cmd_tready, -- ram_controller_1_src_write_cmd.tready
			ram_controller_1_src_write_cmd_tdata  => CONNECTED_TO_ram_controller_1_src_write_cmd_tdata,  --                               .tdata
			ram_controller_1_src_write_cmd_tvalid => CONNECTED_TO_ram_controller_1_src_write_cmd_tvalid, --                               .tvalid
			ram_controller_1_src_read_cmd_tready  => CONNECTED_TO_ram_controller_1_src_read_cmd_tready,  --  ram_controller_1_src_read_cmd.tready
			ram_controller_1_src_read_cmd_tdata   => CONNECTED_TO_ram_controller_1_src_read_cmd_tdata,   --                               .tdata
			ram_controller_1_src_read_cmd_tvalid  => CONNECTED_TO_ram_controller_1_src_read_cmd_tvalid,  --                               .tvalid
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                          reset.reset_n
			ninit_done_ninit_done                 => CONNECTED_TO_ninit_done_ninit_done                  --                     ninit_done.ninit_done
		);

