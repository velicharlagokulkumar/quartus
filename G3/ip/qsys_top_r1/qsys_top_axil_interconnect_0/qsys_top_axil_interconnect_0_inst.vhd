	component qsys_top_axil_interconnect_0 is
		generic (
			S_COUNT         : integer := 1;
			M_COUNT         : integer := 2;
			DATA_WIDTH      : integer := 32;
			ADDR_WIDTH      : integer := 12;
			STRB_WIDTH      : integer := 4;
			M_REGIONS       : integer := 1;
			M_BASE_ADDR     : integer := 0;
			M_ADDR_WIDTH    : integer := 0;
			M_CONNECT_READ  : integer := 0;
			M_CONNECT_WRITE : integer := 0;
			M_SECURE        : integer := 0
		);
		port (
			clk            : in  std_logic                     := 'X';             -- clk
			rst            : in  std_logic                     := 'X';             -- reset
			s_axil_awprot  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			s_axil_awaddr  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- awaddr
			s_axil_awvalid : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- awvalid
			s_axil_awready : out std_logic_vector(0 downto 0);                     -- awready
			s_axil_wdata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			s_axil_wstrb   : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- wstrb
			s_axil_wvalid  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- wvalid
			s_axil_wready  : out std_logic_vector(0 downto 0);                     -- wready
			s_axil_bresp   : out std_logic_vector(1 downto 0);                     -- bresp
			s_axil_bvalid  : out std_logic_vector(0 downto 0);                     -- bvalid
			s_axil_bready  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- bready
			s_axil_araddr  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- araddr
			s_axil_arprot  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			s_axil_arvalid : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- arvalid
			s_axil_arready : out std_logic_vector(0 downto 0);                     -- arready
			s_axil_rdata   : out std_logic_vector(31 downto 0);                    -- rdata
			s_axil_rresp   : out std_logic_vector(1 downto 0);                     -- rresp
			s_axil_rvalid  : out std_logic_vector(0 downto 0);                     -- rvalid
			s_axil_rready  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rready
			m_axil_bready  : out std_logic;                                        -- bready
			m_axil_araddr  : out std_logic_vector(31 downto 0);                    -- araddr
			m_axil_arprot  : out std_logic_vector(2 downto 0);                     -- arprot
			m_axil_arvalid : out std_logic;                                        -- arvalid
			m_axil_arready : in  std_logic                     := 'X';             -- arready
			m_axil_rdata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			m_axil_rresp   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			m_axil_rvalid  : in  std_logic                     := 'X';             -- rvalid
			m_axil_rready  : out std_logic;                                        -- rready
			m_axil_awaddr  : out std_logic_vector(31 downto 0);                    -- awaddr
			m_axil_awprot  : out std_logic_vector(2 downto 0);                     -- awprot
			m_axil_awvalid : out std_logic;                                        -- awvalid
			m_axil_awready : in  std_logic                     := 'X';             -- awready
			m_axil_wdata   : out std_logic_vector(31 downto 0);                    -- wdata
			m_axil_wstrb   : out std_logic_vector(3 downto 0);                     -- wstrb
			m_axil_wvalid  : out std_logic;                                        -- wvalid
			m_axil_wready  : in  std_logic                     := 'X';             -- wready
			m_axil_bresp   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			m_axil_bvalid  : in  std_logic                     := 'X'              -- bvalid
		);
	end component qsys_top_axil_interconnect_0;

	u0 : component qsys_top_axil_interconnect_0
		generic map (
			S_COUNT         => INTEGER_VALUE_FOR_S_COUNT,
			M_COUNT         => INTEGER_VALUE_FOR_M_COUNT,
			DATA_WIDTH      => INTEGER_VALUE_FOR_DATA_WIDTH,
			ADDR_WIDTH      => INTEGER_VALUE_FOR_ADDR_WIDTH,
			STRB_WIDTH      => INTEGER_VALUE_FOR_STRB_WIDTH,
			M_REGIONS       => INTEGER_VALUE_FOR_M_REGIONS,
			M_BASE_ADDR     => INTEGER_VALUE_FOR_M_BASE_ADDR,
			M_ADDR_WIDTH    => INTEGER_VALUE_FOR_M_ADDR_WIDTH,
			M_CONNECT_READ  => INTEGER_VALUE_FOR_M_CONNECT_READ,
			M_CONNECT_WRITE => INTEGER_VALUE_FOR_M_CONNECT_WRITE,
			M_SECURE        => INTEGER_VALUE_FOR_M_SECURE
		)
		port map (
			clk            => CONNECTED_TO_clk,            --                  clock.clk
			rst            => CONNECTED_TO_rst,            --             reset_sink.reset
			s_axil_awprot  => CONNECTED_TO_s_axil_awprot,  --  altera_axi4lite_slave.awprot
			s_axil_awaddr  => CONNECTED_TO_s_axil_awaddr,  --                       .awaddr
			s_axil_awvalid => CONNECTED_TO_s_axil_awvalid, --                       .awvalid
			s_axil_awready => CONNECTED_TO_s_axil_awready, --                       .awready
			s_axil_wdata   => CONNECTED_TO_s_axil_wdata,   --                       .wdata
			s_axil_wstrb   => CONNECTED_TO_s_axil_wstrb,   --                       .wstrb
			s_axil_wvalid  => CONNECTED_TO_s_axil_wvalid,  --                       .wvalid
			s_axil_wready  => CONNECTED_TO_s_axil_wready,  --                       .wready
			s_axil_bresp   => CONNECTED_TO_s_axil_bresp,   --                       .bresp
			s_axil_bvalid  => CONNECTED_TO_s_axil_bvalid,  --                       .bvalid
			s_axil_bready  => CONNECTED_TO_s_axil_bready,  --                       .bready
			s_axil_araddr  => CONNECTED_TO_s_axil_araddr,  --                       .araddr
			s_axil_arprot  => CONNECTED_TO_s_axil_arprot,  --                       .arprot
			s_axil_arvalid => CONNECTED_TO_s_axil_arvalid, --                       .arvalid
			s_axil_arready => CONNECTED_TO_s_axil_arready, --                       .arready
			s_axil_rdata   => CONNECTED_TO_s_axil_rdata,   --                       .rdata
			s_axil_rresp   => CONNECTED_TO_s_axil_rresp,   --                       .rresp
			s_axil_rvalid  => CONNECTED_TO_s_axil_rvalid,  --                       .rvalid
			s_axil_rready  => CONNECTED_TO_s_axil_rready,  --                       .rready
			m_axil_bready  => CONNECTED_TO_m_axil_bready,  -- altera_axi4lite_master.bready
			m_axil_araddr  => CONNECTED_TO_m_axil_araddr,  --                       .araddr
			m_axil_arprot  => CONNECTED_TO_m_axil_arprot,  --                       .arprot
			m_axil_arvalid => CONNECTED_TO_m_axil_arvalid, --                       .arvalid
			m_axil_arready => CONNECTED_TO_m_axil_arready, --                       .arready
			m_axil_rdata   => CONNECTED_TO_m_axil_rdata,   --                       .rdata
			m_axil_rresp   => CONNECTED_TO_m_axil_rresp,   --                       .rresp
			m_axil_rvalid  => CONNECTED_TO_m_axil_rvalid,  --                       .rvalid
			m_axil_rready  => CONNECTED_TO_m_axil_rready,  --                       .rready
			m_axil_awaddr  => CONNECTED_TO_m_axil_awaddr,  --                       .awaddr
			m_axil_awprot  => CONNECTED_TO_m_axil_awprot,  --                       .awprot
			m_axil_awvalid => CONNECTED_TO_m_axil_awvalid, --                       .awvalid
			m_axil_awready => CONNECTED_TO_m_axil_awready, --                       .awready
			m_axil_wdata   => CONNECTED_TO_m_axil_wdata,   --                       .wdata
			m_axil_wstrb   => CONNECTED_TO_m_axil_wstrb,   --                       .wstrb
			m_axil_wvalid  => CONNECTED_TO_m_axil_wvalid,  --                       .wvalid
			m_axil_wready  => CONNECTED_TO_m_axil_wready,  --                       .wready
			m_axil_bresp   => CONNECTED_TO_m_axil_bresp,   --                       .bresp
			m_axil_bvalid  => CONNECTED_TO_m_axil_bvalid   --                       .bvalid
		);

