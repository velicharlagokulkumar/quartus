	component qsys_top_axi_conduit_merger_0 is
		generic (
			ID_WIDTH      : integer := 5;
			DATA_WIDTH    : integer := 32;
			ADDRESS_WIDTH : integer := 32;
			AXUSER_WIDTH  : integer := 5
		);
		port (
			clk       : in  std_logic                                   := 'X';             -- clk
			rst_n     : in  std_logic                                   := 'X';             -- reset_n
			m_awvalid : out std_logic;                                                      -- awvalid
			m_awlen   : out std_logic_vector(3 downto 0);                                   -- awlen
			m_awsize  : out std_logic_vector(2 downto 0);                                   -- awsize
			m_awburst : out std_logic_vector(1 downto 0);                                   -- awburst
			m_awlock  : out std_logic_vector(1 downto 0);                                   -- awlock
			m_awcache : out std_logic_vector(3 downto 0);                                   -- awcache
			m_awprot  : out std_logic_vector(2 downto 0);                                   -- awprot
			m_awready : in  std_logic                                   := 'X';             -- awready
			m_awuser  : out std_logic_vector(AXUSER_WIDTH-1 downto 0);                      -- awuser
			m_arvalid : out std_logic;                                                      -- arvalid
			m_arlen   : out std_logic_vector(3 downto 0);                                   -- arlen
			m_arsize  : out std_logic_vector(2 downto 0);                                   -- arsize
			m_arburst : out std_logic_vector(1 downto 0);                                   -- arburst
			m_arlock  : out std_logic_vector(1 downto 0);                                   -- arlock
			m_arcache : out std_logic_vector(3 downto 0);                                   -- arcache
			m_arprot  : out std_logic_vector(2 downto 0);                                   -- arprot
			m_arready : in  std_logic                                   := 'X';             -- arready
			m_aruser  : out std_logic_vector(AXUSER_WIDTH-1 downto 0);                      -- aruser
			m_rvalid  : in  std_logic                                   := 'X';             -- rvalid
			m_rlast   : in  std_logic                                   := 'X';             -- rlast
			m_rresp   : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- rresp
			m_rready  : out std_logic;                                                      -- rready
			m_wvalid  : out std_logic;                                                      -- wvalid
			m_wlast   : out std_logic;                                                      -- wlast
			m_wready  : in  std_logic                                   := 'X';             -- wready
			m_bvalid  : in  std_logic                                   := 'X';             -- bvalid
			m_bresp   : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- bresp
			m_bready  : out std_logic;                                                      -- bready
			m_awaddr  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);                     -- awaddr
			m_awid    : out std_logic_vector(ID_WIDTH-1 downto 0);                          -- awid
			m_araddr  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);                     -- araddr
			m_arid    : out std_logic_vector(ID_WIDTH-1 downto 0);                          -- arid
			m_rdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0)     := (others => 'X'); -- rdata
			m_rid     : in  std_logic_vector(ID_WIDTH-1 downto 0)       := (others => 'X'); -- rid
			m_wdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);                        -- wdata
			m_wstrb   : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);                    -- wstrb
			m_wid     : out std_logic_vector(ID_WIDTH-1 downto 0);                          -- wid
			m_bid     : in  std_logic_vector(ID_WIDTH-1 downto 0)       := (others => 'X'); -- bid
			s_awvalid : in  std_logic                                   := 'X';             -- awvalid
			s_awlen   : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- awlen
			s_awsize  : in  std_logic_vector(2 downto 0)                := (others => 'X'); -- awsize
			s_awburst : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- awburst
			s_awlock  : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- awlock
			s_awcache : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- awcache
			s_awprot  : in  std_logic_vector(2 downto 0)                := (others => 'X'); -- awprot
			s_awready : out std_logic;                                                      -- awready
			s_awuser  : in  std_logic_vector(AXUSER_WIDTH-1 downto 0)   := (others => 'X'); -- awuser
			s_arvalid : in  std_logic                                   := 'X';             -- arvalid
			s_arlen   : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- arlen
			s_arsize  : in  std_logic_vector(2 downto 0)                := (others => 'X'); -- arsize
			s_arburst : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- arburst
			s_arlock  : in  std_logic_vector(1 downto 0)                := (others => 'X'); -- arlock
			s_arcache : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- arcache
			s_arprot  : in  std_logic_vector(2 downto 0)                := (others => 'X'); -- arprot
			s_arready : out std_logic;                                                      -- arready
			s_aruser  : in  std_logic_vector(AXUSER_WIDTH-1 downto 0)   := (others => 'X'); -- aruser
			s_rvalid  : out std_logic;                                                      -- rvalid
			s_rlast   : out std_logic;                                                      -- rlast
			s_rresp   : out std_logic_vector(1 downto 0);                                   -- rresp
			s_rready  : in  std_logic                                   := 'X';             -- rready
			s_wvalid  : in  std_logic                                   := 'X';             -- wvalid
			s_wlast   : in  std_logic                                   := 'X';             -- wlast
			s_wready  : out std_logic;                                                      -- wready
			s_bvalid  : out std_logic;                                                      -- bvalid
			s_bresp   : out std_logic_vector(1 downto 0);                                   -- bresp
			s_bready  : in  std_logic                                   := 'X';             -- bready
			s_awaddr  : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0)  := (others => 'X'); -- awaddr
			s_awid    : in  std_logic_vector(ID_WIDTH-1 downto 0)       := (others => 'X'); -- awid
			s_araddr  : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0)  := (others => 'X'); -- araddr
			s_arid    : in  std_logic_vector(ID_WIDTH-1 downto 0)       := (others => 'X'); -- arid
			s_rdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);                        -- rdata
			s_rid     : out std_logic_vector(ID_WIDTH-1 downto 0);                          -- rid
			s_wdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0)     := (others => 'X'); -- wdata
			s_wstrb   : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0) := (others => 'X'); -- wstrb
			s_wid     : in  std_logic_vector(ID_WIDTH-1 downto 0)       := (others => 'X'); -- wid
			s_bid     : out std_logic_vector(ID_WIDTH-1 downto 0);                          -- bid
			c_awcache : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- awcache
			c_awprot  : in  std_logic_vector(2 downto 0)                := (others => 'X'); -- awprot
			c_awuser  : in  std_logic_vector(AXUSER_WIDTH-1 downto 0)   := (others => 'X'); -- awuser
			c_arcache : in  std_logic_vector(3 downto 0)                := (others => 'X'); -- arcache
			c_aruser  : in  std_logic_vector(AXUSER_WIDTH-1 downto 0)   := (others => 'X'); -- aruser
			c_arprot  : in  std_logic_vector(2 downto 0)                := (others => 'X')  -- arprot
		);
	end component qsys_top_axi_conduit_merger_0;

	u0 : component qsys_top_axi_conduit_merger_0
		generic map (
			ID_WIDTH      => INTEGER_VALUE_FOR_ID_WIDTH,
			DATA_WIDTH    => INTEGER_VALUE_FOR_DATA_WIDTH,
			ADDRESS_WIDTH => INTEGER_VALUE_FOR_ADDRESS_WIDTH,
			AXUSER_WIDTH  => INTEGER_VALUE_FOR_AXUSER_WIDTH
		)
		port map (
			clk       => CONNECTED_TO_clk,       --             clock.clk
			rst_n     => CONNECTED_TO_rst_n,     --        reset_sink.reset_n
			m_awvalid => CONNECTED_TO_m_awvalid, -- altera_axi_master.awvalid
			m_awlen   => CONNECTED_TO_m_awlen,   --                  .awlen
			m_awsize  => CONNECTED_TO_m_awsize,  --                  .awsize
			m_awburst => CONNECTED_TO_m_awburst, --                  .awburst
			m_awlock  => CONNECTED_TO_m_awlock,  --                  .awlock
			m_awcache => CONNECTED_TO_m_awcache, --                  .awcache
			m_awprot  => CONNECTED_TO_m_awprot,  --                  .awprot
			m_awready => CONNECTED_TO_m_awready, --                  .awready
			m_awuser  => CONNECTED_TO_m_awuser,  --                  .awuser
			m_arvalid => CONNECTED_TO_m_arvalid, --                  .arvalid
			m_arlen   => CONNECTED_TO_m_arlen,   --                  .arlen
			m_arsize  => CONNECTED_TO_m_arsize,  --                  .arsize
			m_arburst => CONNECTED_TO_m_arburst, --                  .arburst
			m_arlock  => CONNECTED_TO_m_arlock,  --                  .arlock
			m_arcache => CONNECTED_TO_m_arcache, --                  .arcache
			m_arprot  => CONNECTED_TO_m_arprot,  --                  .arprot
			m_arready => CONNECTED_TO_m_arready, --                  .arready
			m_aruser  => CONNECTED_TO_m_aruser,  --                  .aruser
			m_rvalid  => CONNECTED_TO_m_rvalid,  --                  .rvalid
			m_rlast   => CONNECTED_TO_m_rlast,   --                  .rlast
			m_rresp   => CONNECTED_TO_m_rresp,   --                  .rresp
			m_rready  => CONNECTED_TO_m_rready,  --                  .rready
			m_wvalid  => CONNECTED_TO_m_wvalid,  --                  .wvalid
			m_wlast   => CONNECTED_TO_m_wlast,   --                  .wlast
			m_wready  => CONNECTED_TO_m_wready,  --                  .wready
			m_bvalid  => CONNECTED_TO_m_bvalid,  --                  .bvalid
			m_bresp   => CONNECTED_TO_m_bresp,   --                  .bresp
			m_bready  => CONNECTED_TO_m_bready,  --                  .bready
			m_awaddr  => CONNECTED_TO_m_awaddr,  --                  .awaddr
			m_awid    => CONNECTED_TO_m_awid,    --                  .awid
			m_araddr  => CONNECTED_TO_m_araddr,  --                  .araddr
			m_arid    => CONNECTED_TO_m_arid,    --                  .arid
			m_rdata   => CONNECTED_TO_m_rdata,   --                  .rdata
			m_rid     => CONNECTED_TO_m_rid,     --                  .rid
			m_wdata   => CONNECTED_TO_m_wdata,   --                  .wdata
			m_wstrb   => CONNECTED_TO_m_wstrb,   --                  .wstrb
			m_wid     => CONNECTED_TO_m_wid,     --                  .wid
			m_bid     => CONNECTED_TO_m_bid,     --                  .bid
			s_awvalid => CONNECTED_TO_s_awvalid, --  altera_axi_slave.awvalid
			s_awlen   => CONNECTED_TO_s_awlen,   --                  .awlen
			s_awsize  => CONNECTED_TO_s_awsize,  --                  .awsize
			s_awburst => CONNECTED_TO_s_awburst, --                  .awburst
			s_awlock  => CONNECTED_TO_s_awlock,  --                  .awlock
			s_awcache => CONNECTED_TO_s_awcache, --                  .awcache
			s_awprot  => CONNECTED_TO_s_awprot,  --                  .awprot
			s_awready => CONNECTED_TO_s_awready, --                  .awready
			s_awuser  => CONNECTED_TO_s_awuser,  --                  .awuser
			s_arvalid => CONNECTED_TO_s_arvalid, --                  .arvalid
			s_arlen   => CONNECTED_TO_s_arlen,   --                  .arlen
			s_arsize  => CONNECTED_TO_s_arsize,  --                  .arsize
			s_arburst => CONNECTED_TO_s_arburst, --                  .arburst
			s_arlock  => CONNECTED_TO_s_arlock,  --                  .arlock
			s_arcache => CONNECTED_TO_s_arcache, --                  .arcache
			s_arprot  => CONNECTED_TO_s_arprot,  --                  .arprot
			s_arready => CONNECTED_TO_s_arready, --                  .arready
			s_aruser  => CONNECTED_TO_s_aruser,  --                  .aruser
			s_rvalid  => CONNECTED_TO_s_rvalid,  --                  .rvalid
			s_rlast   => CONNECTED_TO_s_rlast,   --                  .rlast
			s_rresp   => CONNECTED_TO_s_rresp,   --                  .rresp
			s_rready  => CONNECTED_TO_s_rready,  --                  .rready
			s_wvalid  => CONNECTED_TO_s_wvalid,  --                  .wvalid
			s_wlast   => CONNECTED_TO_s_wlast,   --                  .wlast
			s_wready  => CONNECTED_TO_s_wready,  --                  .wready
			s_bvalid  => CONNECTED_TO_s_bvalid,  --                  .bvalid
			s_bresp   => CONNECTED_TO_s_bresp,   --                  .bresp
			s_bready  => CONNECTED_TO_s_bready,  --                  .bready
			s_awaddr  => CONNECTED_TO_s_awaddr,  --                  .awaddr
			s_awid    => CONNECTED_TO_s_awid,    --                  .awid
			s_araddr  => CONNECTED_TO_s_araddr,  --                  .araddr
			s_arid    => CONNECTED_TO_s_arid,    --                  .arid
			s_rdata   => CONNECTED_TO_s_rdata,   --                  .rdata
			s_rid     => CONNECTED_TO_s_rid,     --                  .rid
			s_wdata   => CONNECTED_TO_s_wdata,   --                  .wdata
			s_wstrb   => CONNECTED_TO_s_wstrb,   --                  .wstrb
			s_wid     => CONNECTED_TO_s_wid,     --                  .wid
			s_bid     => CONNECTED_TO_s_bid,     --                  .bid
			c_awcache => CONNECTED_TO_c_awcache, --       conduit_end.awcache
			c_awprot  => CONNECTED_TO_c_awprot,  --                  .awprot
			c_awuser  => CONNECTED_TO_c_awuser,  --                  .awuser
			c_arcache => CONNECTED_TO_c_arcache, --                  .arcache
			c_aruser  => CONNECTED_TO_c_aruser,  --                  .aruser
			c_arprot  => CONNECTED_TO_c_arprot   --                  .arprot
		);

