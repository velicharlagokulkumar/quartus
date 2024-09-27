	component agilex_hps is
		port (
			s2f_user_clk0_hio    : out   std_logic;                                          -- clk
			s2f_user_clk1_hio    : out   std_logic;                                          -- clk
			hps_emif_emif_to_hps : in    std_logic_vector(4095 downto 0) := (others => 'X'); -- emif_to_hps
			hps_emif_hps_to_emif : out   std_logic_vector(4095 downto 0);                    -- hps_to_emif
			hps_emif_emif_to_gp  : in    std_logic                       := 'X';             -- emif_to_gp
			hps_emif_gp_to_emif  : out   std_logic_vector(1 downto 0);                       -- gp_to_emif
			EMAC1_TX_CLK         : out   std_logic;                                          -- EMAC1_TX_CLK
			EMAC1_TXD0           : out   std_logic;                                          -- EMAC1_TXD0
			EMAC1_TXD1           : out   std_logic;                                          -- EMAC1_TXD1
			EMAC1_TXD2           : out   std_logic;                                          -- EMAC1_TXD2
			EMAC1_TXD3           : out   std_logic;                                          -- EMAC1_TXD3
			EMAC1_RX_CTL         : in    std_logic                       := 'X';             -- EMAC1_RX_CTL
			EMAC1_TX_CTL         : out   std_logic;                                          -- EMAC1_TX_CTL
			EMAC1_RX_CLK         : in    std_logic                       := 'X';             -- EMAC1_RX_CLK
			EMAC1_RXD0           : in    std_logic                       := 'X';             -- EMAC1_RXD0
			EMAC1_RXD1           : in    std_logic                       := 'X';             -- EMAC1_RXD1
			EMAC1_RXD2           : in    std_logic                       := 'X';             -- EMAC1_RXD2
			EMAC1_RXD3           : in    std_logic                       := 'X';             -- EMAC1_RXD3
			EMAC1_MDIO           : inout std_logic                       := 'X';             -- EMAC1_MDIO
			EMAC1_MDC            : out   std_logic;                                          -- EMAC1_MDC
			SDMMC_CMD            : inout std_logic                       := 'X';             -- SDMMC_CMD
			SDMMC_D0             : inout std_logic                       := 'X';             -- SDMMC_D0
			SDMMC_D1             : inout std_logic                       := 'X';             -- SDMMC_D1
			SDMMC_D2             : inout std_logic                       := 'X';             -- SDMMC_D2
			SDMMC_D3             : inout std_logic                       := 'X';             -- SDMMC_D3
			SDMMC_D4             : inout std_logic                       := 'X';             -- SDMMC_D4
			SDMMC_D5             : inout std_logic                       := 'X';             -- SDMMC_D5
			SDMMC_D6             : inout std_logic                       := 'X';             -- SDMMC_D6
			SDMMC_D7             : inout std_logic                       := 'X';             -- SDMMC_D7
			SDMMC_CCLK           : out   std_logic;                                          -- SDMMC_CCLK
			SPIM0_CLK            : out   std_logic;                                          -- SPIM0_CLK
			SPIM0_MOSI           : out   std_logic;                                          -- SPIM0_MOSI
			SPIM0_MISO           : in    std_logic                       := 'X';             -- SPIM0_MISO
			SPIM0_SS0_N          : out   std_logic;                                          -- SPIM0_SS0_N
			SPIM1_CLK            : out   std_logic;                                          -- SPIM1_CLK
			SPIM1_MOSI           : out   std_logic;                                          -- SPIM1_MOSI
			SPIM1_MISO           : in    std_logic                       := 'X';             -- SPIM1_MISO
			SPIM1_SS0_N          : out   std_logic;                                          -- SPIM1_SS0_N
			SPIM1_SS1_N          : out   std_logic;                                          -- SPIM1_SS1_N
			UART1_RX             : in    std_logic                       := 'X';             -- UART1_RX
			UART1_TX             : out   std_logic;                                          -- UART1_TX
			I2C1_SDA             : inout std_logic                       := 'X';             -- I2C1_SDA
			I2C1_SCL             : inout std_logic                       := 'X';             -- I2C1_SCL
			hps_osc_clk          : in    std_logic                       := 'X';             -- hps_osc_clk
			gpio0_io11           : inout std_logic                       := 'X';             -- gpio0_io11
			gpio0_io12           : inout std_logic                       := 'X';             -- gpio0_io12
			gpio0_io13           : inout std_logic                       := 'X';             -- gpio0_io13
			gpio0_io14           : inout std_logic                       := 'X';             -- gpio0_io14
			gpio0_io15           : inout std_logic                       := 'X';             -- gpio0_io15
			gpio0_io16           : inout std_logic                       := 'X';             -- gpio0_io16
			gpio0_io17           : inout std_logic                       := 'X';             -- gpio0_io17
			gpio0_io18           : inout std_logic                       := 'X';             -- gpio0_io18
			gpio1_io16           : inout std_logic                       := 'X';             -- gpio1_io16
			gpio1_io17           : inout std_logic                       := 'X';             -- gpio1_io17
			h2f_rst              : out   std_logic;                                          -- reset
			h2f_axi_clk          : in    std_logic                       := 'X';             -- clk
			h2f_axi_rst_n        : in    std_logic                       := 'X';             -- reset_n
			h2f_AWID             : out   std_logic_vector(3 downto 0);                       -- awid
			h2f_AWADDR           : out   std_logic_vector(31 downto 0);                      -- awaddr
			h2f_AWLEN            : out   std_logic_vector(7 downto 0);                       -- awlen
			h2f_AWSIZE           : out   std_logic_vector(2 downto 0);                       -- awsize
			h2f_AWBURST          : out   std_logic_vector(1 downto 0);                       -- awburst
			h2f_AWLOCK           : out   std_logic;                                          -- awlock
			h2f_AWCACHE          : out   std_logic_vector(3 downto 0);                       -- awcache
			h2f_AWPROT           : out   std_logic_vector(2 downto 0);                       -- awprot
			h2f_AWVALID          : out   std_logic;                                          -- awvalid
			h2f_AWREADY          : in    std_logic                       := 'X';             -- awready
			h2f_WDATA            : out   std_logic_vector(31 downto 0);                      -- wdata
			h2f_WSTRB            : out   std_logic_vector(3 downto 0);                       -- wstrb
			h2f_WLAST            : out   std_logic;                                          -- wlast
			h2f_WVALID           : out   std_logic;                                          -- wvalid
			h2f_WREADY           : in    std_logic                       := 'X';             -- wready
			h2f_BID              : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- bid
			h2f_BRESP            : in    std_logic_vector(1 downto 0)    := (others => 'X'); -- bresp
			h2f_BVALID           : in    std_logic                       := 'X';             -- bvalid
			h2f_BREADY           : out   std_logic;                                          -- bready
			h2f_ARID             : out   std_logic_vector(3 downto 0);                       -- arid
			h2f_ARADDR           : out   std_logic_vector(31 downto 0);                      -- araddr
			h2f_ARLEN            : out   std_logic_vector(7 downto 0);                       -- arlen
			h2f_ARSIZE           : out   std_logic_vector(2 downto 0);                       -- arsize
			h2f_ARBURST          : out   std_logic_vector(1 downto 0);                       -- arburst
			h2f_ARLOCK           : out   std_logic;                                          -- arlock
			h2f_ARCACHE          : out   std_logic_vector(3 downto 0);                       -- arcache
			h2f_ARPROT           : out   std_logic_vector(2 downto 0);                       -- arprot
			h2f_ARVALID          : out   std_logic;                                          -- arvalid
			h2f_ARREADY          : in    std_logic                       := 'X';             -- arready
			h2f_RID              : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- rid
			h2f_RDATA            : in    std_logic_vector(31 downto 0)   := (others => 'X'); -- rdata
			h2f_RRESP            : in    std_logic_vector(1 downto 0)    := (others => 'X'); -- rresp
			h2f_RLAST            : in    std_logic                       := 'X';             -- rlast
			h2f_RVALID           : in    std_logic                       := 'X';             -- rvalid
			h2f_RREADY           : out   std_logic;                                          -- rready
			f2h_axi_clk          : in    std_logic                       := 'X';             -- clk
			f2h_axi_rst_n        : in    std_logic                       := 'X';             -- reset_n
			f2h_AWID             : in    std_logic_vector(4 downto 0)    := (others => 'X'); -- awid
			f2h_AWADDR           : in    std_logic_vector(31 downto 0)   := (others => 'X'); -- awaddr
			f2h_AWLEN            : in    std_logic_vector(7 downto 0)    := (others => 'X'); -- awlen
			f2h_AWSIZE           : in    std_logic_vector(2 downto 0)    := (others => 'X'); -- awsize
			f2h_AWBURST          : in    std_logic_vector(1 downto 0)    := (others => 'X'); -- awburst
			f2h_AWLOCK           : in    std_logic                       := 'X';             -- awlock
			f2h_AWCACHE          : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- awcache
			f2h_AWPROT           : in    std_logic_vector(2 downto 0)    := (others => 'X'); -- awprot
			f2h_AWVALID          : in    std_logic                       := 'X';             -- awvalid
			f2h_AWREADY          : out   std_logic;                                          -- awready
			f2h_AWQOS            : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- awqos
			f2h_WDATA            : in    std_logic_vector(511 downto 0)  := (others => 'X'); -- wdata
			f2h_WSTRB            : in    std_logic_vector(63 downto 0)   := (others => 'X'); -- wstrb
			f2h_WLAST            : in    std_logic                       := 'X';             -- wlast
			f2h_WVALID           : in    std_logic                       := 'X';             -- wvalid
			f2h_WREADY           : out   std_logic;                                          -- wready
			f2h_BID              : out   std_logic_vector(4 downto 0);                       -- bid
			f2h_BRESP            : out   std_logic_vector(1 downto 0);                       -- bresp
			f2h_BVALID           : out   std_logic;                                          -- bvalid
			f2h_BREADY           : in    std_logic                       := 'X';             -- bready
			f2h_ARID             : in    std_logic_vector(4 downto 0)    := (others => 'X'); -- arid
			f2h_ARADDR           : in    std_logic_vector(31 downto 0)   := (others => 'X'); -- araddr
			f2h_ARLEN            : in    std_logic_vector(7 downto 0)    := (others => 'X'); -- arlen
			f2h_ARSIZE           : in    std_logic_vector(2 downto 0)    := (others => 'X'); -- arsize
			f2h_ARBURST          : in    std_logic_vector(1 downto 0)    := (others => 'X'); -- arburst
			f2h_ARLOCK           : in    std_logic                       := 'X';             -- arlock
			f2h_ARCACHE          : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- arcache
			f2h_ARPROT           : in    std_logic_vector(2 downto 0)    := (others => 'X'); -- arprot
			f2h_ARVALID          : in    std_logic                       := 'X';             -- arvalid
			f2h_ARREADY          : out   std_logic;                                          -- arready
			f2h_ARQOS            : in    std_logic_vector(3 downto 0)    := (others => 'X'); -- arqos
			f2h_RID              : out   std_logic_vector(4 downto 0);                       -- rid
			f2h_RDATA            : out   std_logic_vector(511 downto 0);                     -- rdata
			f2h_RRESP            : out   std_logic_vector(1 downto 0);                       -- rresp
			f2h_RLAST            : out   std_logic;                                          -- rlast
			f2h_RVALID           : out   std_logic;                                          -- rvalid
			f2h_RREADY           : in    std_logic                       := 'X';             -- rready
			f2h_ARUSER           : in    std_logic_vector(22 downto 0)   := (others => 'X'); -- aruser
			f2h_AWUSER           : in    std_logic_vector(22 downto 0)   := (others => 'X'); -- awuser
			f2h_irq_p0           : in    std_logic_vector(31 downto 0)   := (others => 'X'); -- irq
			f2h_irq_p1           : in    std_logic_vector(31 downto 0)   := (others => 'X')  -- irq
		);
	end component agilex_hps;

	u0 : component agilex_hps
		port map (
			s2f_user_clk0_hio    => CONNECTED_TO_s2f_user_clk0_hio,    -- h2f_user0_clock.clk
			s2f_user_clk1_hio    => CONNECTED_TO_s2f_user_clk1_hio,    -- h2f_user1_clock.clk
			hps_emif_emif_to_hps => CONNECTED_TO_hps_emif_emif_to_hps, --        hps_emif.emif_to_hps
			hps_emif_hps_to_emif => CONNECTED_TO_hps_emif_hps_to_emif, --                .hps_to_emif
			hps_emif_emif_to_gp  => CONNECTED_TO_hps_emif_emif_to_gp,  --                .emif_to_gp
			hps_emif_gp_to_emif  => CONNECTED_TO_hps_emif_gp_to_emif,  --                .gp_to_emif
			EMAC1_TX_CLK         => CONNECTED_TO_EMAC1_TX_CLK,         --          hps_io.EMAC1_TX_CLK
			EMAC1_TXD0           => CONNECTED_TO_EMAC1_TXD0,           --                .EMAC1_TXD0
			EMAC1_TXD1           => CONNECTED_TO_EMAC1_TXD1,           --                .EMAC1_TXD1
			EMAC1_TXD2           => CONNECTED_TO_EMAC1_TXD2,           --                .EMAC1_TXD2
			EMAC1_TXD3           => CONNECTED_TO_EMAC1_TXD3,           --                .EMAC1_TXD3
			EMAC1_RX_CTL         => CONNECTED_TO_EMAC1_RX_CTL,         --                .EMAC1_RX_CTL
			EMAC1_TX_CTL         => CONNECTED_TO_EMAC1_TX_CTL,         --                .EMAC1_TX_CTL
			EMAC1_RX_CLK         => CONNECTED_TO_EMAC1_RX_CLK,         --                .EMAC1_RX_CLK
			EMAC1_RXD0           => CONNECTED_TO_EMAC1_RXD0,           --                .EMAC1_RXD0
			EMAC1_RXD1           => CONNECTED_TO_EMAC1_RXD1,           --                .EMAC1_RXD1
			EMAC1_RXD2           => CONNECTED_TO_EMAC1_RXD2,           --                .EMAC1_RXD2
			EMAC1_RXD3           => CONNECTED_TO_EMAC1_RXD3,           --                .EMAC1_RXD3
			EMAC1_MDIO           => CONNECTED_TO_EMAC1_MDIO,           --                .EMAC1_MDIO
			EMAC1_MDC            => CONNECTED_TO_EMAC1_MDC,            --                .EMAC1_MDC
			SDMMC_CMD            => CONNECTED_TO_SDMMC_CMD,            --                .SDMMC_CMD
			SDMMC_D0             => CONNECTED_TO_SDMMC_D0,             --                .SDMMC_D0
			SDMMC_D1             => CONNECTED_TO_SDMMC_D1,             --                .SDMMC_D1
			SDMMC_D2             => CONNECTED_TO_SDMMC_D2,             --                .SDMMC_D2
			SDMMC_D3             => CONNECTED_TO_SDMMC_D3,             --                .SDMMC_D3
			SDMMC_D4             => CONNECTED_TO_SDMMC_D4,             --                .SDMMC_D4
			SDMMC_D5             => CONNECTED_TO_SDMMC_D5,             --                .SDMMC_D5
			SDMMC_D6             => CONNECTED_TO_SDMMC_D6,             --                .SDMMC_D6
			SDMMC_D7             => CONNECTED_TO_SDMMC_D7,             --                .SDMMC_D7
			SDMMC_CCLK           => CONNECTED_TO_SDMMC_CCLK,           --                .SDMMC_CCLK
			SPIM0_CLK            => CONNECTED_TO_SPIM0_CLK,            --                .SPIM0_CLK
			SPIM0_MOSI           => CONNECTED_TO_SPIM0_MOSI,           --                .SPIM0_MOSI
			SPIM0_MISO           => CONNECTED_TO_SPIM0_MISO,           --                .SPIM0_MISO
			SPIM0_SS0_N          => CONNECTED_TO_SPIM0_SS0_N,          --                .SPIM0_SS0_N
			SPIM1_CLK            => CONNECTED_TO_SPIM1_CLK,            --                .SPIM1_CLK
			SPIM1_MOSI           => CONNECTED_TO_SPIM1_MOSI,           --                .SPIM1_MOSI
			SPIM1_MISO           => CONNECTED_TO_SPIM1_MISO,           --                .SPIM1_MISO
			SPIM1_SS0_N          => CONNECTED_TO_SPIM1_SS0_N,          --                .SPIM1_SS0_N
			SPIM1_SS1_N          => CONNECTED_TO_SPIM1_SS1_N,          --                .SPIM1_SS1_N
			UART1_RX             => CONNECTED_TO_UART1_RX,             --                .UART1_RX
			UART1_TX             => CONNECTED_TO_UART1_TX,             --                .UART1_TX
			I2C1_SDA             => CONNECTED_TO_I2C1_SDA,             --                .I2C1_SDA
			I2C1_SCL             => CONNECTED_TO_I2C1_SCL,             --                .I2C1_SCL
			hps_osc_clk          => CONNECTED_TO_hps_osc_clk,          --                .hps_osc_clk
			gpio0_io11           => CONNECTED_TO_gpio0_io11,           --                .gpio0_io11
			gpio0_io12           => CONNECTED_TO_gpio0_io12,           --                .gpio0_io12
			gpio0_io13           => CONNECTED_TO_gpio0_io13,           --                .gpio0_io13
			gpio0_io14           => CONNECTED_TO_gpio0_io14,           --                .gpio0_io14
			gpio0_io15           => CONNECTED_TO_gpio0_io15,           --                .gpio0_io15
			gpio0_io16           => CONNECTED_TO_gpio0_io16,           --                .gpio0_io16
			gpio0_io17           => CONNECTED_TO_gpio0_io17,           --                .gpio0_io17
			gpio0_io18           => CONNECTED_TO_gpio0_io18,           --                .gpio0_io18
			gpio1_io16           => CONNECTED_TO_gpio1_io16,           --                .gpio1_io16
			gpio1_io17           => CONNECTED_TO_gpio1_io17,           --                .gpio1_io17
			h2f_rst              => CONNECTED_TO_h2f_rst,              --       h2f_reset.reset
			h2f_axi_clk          => CONNECTED_TO_h2f_axi_clk,          --   h2f_axi_clock.clk
			h2f_axi_rst_n        => CONNECTED_TO_h2f_axi_rst_n,        --   h2f_axi_reset.reset_n
			h2f_AWID             => CONNECTED_TO_h2f_AWID,             --  h2f_axi_master.awid
			h2f_AWADDR           => CONNECTED_TO_h2f_AWADDR,           --                .awaddr
			h2f_AWLEN            => CONNECTED_TO_h2f_AWLEN,            --                .awlen
			h2f_AWSIZE           => CONNECTED_TO_h2f_AWSIZE,           --                .awsize
			h2f_AWBURST          => CONNECTED_TO_h2f_AWBURST,          --                .awburst
			h2f_AWLOCK           => CONNECTED_TO_h2f_AWLOCK,           --                .awlock
			h2f_AWCACHE          => CONNECTED_TO_h2f_AWCACHE,          --                .awcache
			h2f_AWPROT           => CONNECTED_TO_h2f_AWPROT,           --                .awprot
			h2f_AWVALID          => CONNECTED_TO_h2f_AWVALID,          --                .awvalid
			h2f_AWREADY          => CONNECTED_TO_h2f_AWREADY,          --                .awready
			h2f_WDATA            => CONNECTED_TO_h2f_WDATA,            --                .wdata
			h2f_WSTRB            => CONNECTED_TO_h2f_WSTRB,            --                .wstrb
			h2f_WLAST            => CONNECTED_TO_h2f_WLAST,            --                .wlast
			h2f_WVALID           => CONNECTED_TO_h2f_WVALID,           --                .wvalid
			h2f_WREADY           => CONNECTED_TO_h2f_WREADY,           --                .wready
			h2f_BID              => CONNECTED_TO_h2f_BID,              --                .bid
			h2f_BRESP            => CONNECTED_TO_h2f_BRESP,            --                .bresp
			h2f_BVALID           => CONNECTED_TO_h2f_BVALID,           --                .bvalid
			h2f_BREADY           => CONNECTED_TO_h2f_BREADY,           --                .bready
			h2f_ARID             => CONNECTED_TO_h2f_ARID,             --                .arid
			h2f_ARADDR           => CONNECTED_TO_h2f_ARADDR,           --                .araddr
			h2f_ARLEN            => CONNECTED_TO_h2f_ARLEN,            --                .arlen
			h2f_ARSIZE           => CONNECTED_TO_h2f_ARSIZE,           --                .arsize
			h2f_ARBURST          => CONNECTED_TO_h2f_ARBURST,          --                .arburst
			h2f_ARLOCK           => CONNECTED_TO_h2f_ARLOCK,           --                .arlock
			h2f_ARCACHE          => CONNECTED_TO_h2f_ARCACHE,          --                .arcache
			h2f_ARPROT           => CONNECTED_TO_h2f_ARPROT,           --                .arprot
			h2f_ARVALID          => CONNECTED_TO_h2f_ARVALID,          --                .arvalid
			h2f_ARREADY          => CONNECTED_TO_h2f_ARREADY,          --                .arready
			h2f_RID              => CONNECTED_TO_h2f_RID,              --                .rid
			h2f_RDATA            => CONNECTED_TO_h2f_RDATA,            --                .rdata
			h2f_RRESP            => CONNECTED_TO_h2f_RRESP,            --                .rresp
			h2f_RLAST            => CONNECTED_TO_h2f_RLAST,            --                .rlast
			h2f_RVALID           => CONNECTED_TO_h2f_RVALID,           --                .rvalid
			h2f_RREADY           => CONNECTED_TO_h2f_RREADY,           --                .rready
			f2h_axi_clk          => CONNECTED_TO_f2h_axi_clk,          --   f2h_axi_clock.clk
			f2h_axi_rst_n        => CONNECTED_TO_f2h_axi_rst_n,        --   f2h_axi_reset.reset_n
			f2h_AWID             => CONNECTED_TO_f2h_AWID,             --   f2h_axi_slave.awid
			f2h_AWADDR           => CONNECTED_TO_f2h_AWADDR,           --                .awaddr
			f2h_AWLEN            => CONNECTED_TO_f2h_AWLEN,            --                .awlen
			f2h_AWSIZE           => CONNECTED_TO_f2h_AWSIZE,           --                .awsize
			f2h_AWBURST          => CONNECTED_TO_f2h_AWBURST,          --                .awburst
			f2h_AWLOCK           => CONNECTED_TO_f2h_AWLOCK,           --                .awlock
			f2h_AWCACHE          => CONNECTED_TO_f2h_AWCACHE,          --                .awcache
			f2h_AWPROT           => CONNECTED_TO_f2h_AWPROT,           --                .awprot
			f2h_AWVALID          => CONNECTED_TO_f2h_AWVALID,          --                .awvalid
			f2h_AWREADY          => CONNECTED_TO_f2h_AWREADY,          --                .awready
			f2h_AWQOS            => CONNECTED_TO_f2h_AWQOS,            --                .awqos
			f2h_WDATA            => CONNECTED_TO_f2h_WDATA,            --                .wdata
			f2h_WSTRB            => CONNECTED_TO_f2h_WSTRB,            --                .wstrb
			f2h_WLAST            => CONNECTED_TO_f2h_WLAST,            --                .wlast
			f2h_WVALID           => CONNECTED_TO_f2h_WVALID,           --                .wvalid
			f2h_WREADY           => CONNECTED_TO_f2h_WREADY,           --                .wready
			f2h_BID              => CONNECTED_TO_f2h_BID,              --                .bid
			f2h_BRESP            => CONNECTED_TO_f2h_BRESP,            --                .bresp
			f2h_BVALID           => CONNECTED_TO_f2h_BVALID,           --                .bvalid
			f2h_BREADY           => CONNECTED_TO_f2h_BREADY,           --                .bready
			f2h_ARID             => CONNECTED_TO_f2h_ARID,             --                .arid
			f2h_ARADDR           => CONNECTED_TO_f2h_ARADDR,           --                .araddr
			f2h_ARLEN            => CONNECTED_TO_f2h_ARLEN,            --                .arlen
			f2h_ARSIZE           => CONNECTED_TO_f2h_ARSIZE,           --                .arsize
			f2h_ARBURST          => CONNECTED_TO_f2h_ARBURST,          --                .arburst
			f2h_ARLOCK           => CONNECTED_TO_f2h_ARLOCK,           --                .arlock
			f2h_ARCACHE          => CONNECTED_TO_f2h_ARCACHE,          --                .arcache
			f2h_ARPROT           => CONNECTED_TO_f2h_ARPROT,           --                .arprot
			f2h_ARVALID          => CONNECTED_TO_f2h_ARVALID,          --                .arvalid
			f2h_ARREADY          => CONNECTED_TO_f2h_ARREADY,          --                .arready
			f2h_ARQOS            => CONNECTED_TO_f2h_ARQOS,            --                .arqos
			f2h_RID              => CONNECTED_TO_f2h_RID,              --                .rid
			f2h_RDATA            => CONNECTED_TO_f2h_RDATA,            --                .rdata
			f2h_RRESP            => CONNECTED_TO_f2h_RRESP,            --                .rresp
			f2h_RLAST            => CONNECTED_TO_f2h_RLAST,            --                .rlast
			f2h_RVALID           => CONNECTED_TO_f2h_RVALID,           --                .rvalid
			f2h_RREADY           => CONNECTED_TO_f2h_RREADY,           --                .rready
			f2h_ARUSER           => CONNECTED_TO_f2h_ARUSER,           --                .aruser
			f2h_AWUSER           => CONNECTED_TO_f2h_AWUSER,           --                .awuser
			f2h_irq_p0           => CONNECTED_TO_f2h_irq_p0,           --        f2h_irq0.irq
			f2h_irq_p1           => CONNECTED_TO_f2h_irq_p1            --        f2h_irq1.irq
		);
