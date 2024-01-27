	component qsys_top_prbs_generator_0 is
		generic (
			DATA_WIDTH : integer := 32
		);
		port (
			clk            : in  std_logic                                           := 'X';             -- clk
			reset          : in  std_logic                                           := 'X';             -- reset
			csr_address    : in  std_logic_vector(2 downto 0)                        := (others => 'X'); -- address
			csr_writedata  : in  std_logic_vector(31 downto 0)                       := (others => 'X'); -- writedata
			csr_write      : in  std_logic                                           := 'X';             -- write
			csr_readdata   : out std_logic_vector(31 downto 0);                                          -- readdata
			csr_read       : in  std_logic                                           := 'X';             -- read
			csr_byteenable : in  std_logic_vector(3 downto 0)                        := (others => 'X'); -- byteenable
			src_data       : out std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0);                    -- tdata
			src_valid      : out std_logic;                                                              -- tvalid
			src_ready      : in  std_logic                                           := 'X'              -- tready
		);
	end component qsys_top_prbs_generator_0;

	u0 : component qsys_top_prbs_generator_0
		generic map (
			DATA_WIDTH => INTEGER_VALUE_FOR_DATA_WIDTH
		)
		port map (
			clk            => CONNECTED_TO_clk,            --      clock.clk
			reset          => CONNECTED_TO_reset,          --      reset.reset
			csr_address    => CONNECTED_TO_csr_address,    --        csr.address
			csr_writedata  => CONNECTED_TO_csr_writedata,  --           .writedata
			csr_write      => CONNECTED_TO_csr_write,      --           .write
			csr_readdata   => CONNECTED_TO_csr_readdata,   --           .readdata
			csr_read       => CONNECTED_TO_csr_read,       --           .read
			csr_byteenable => CONNECTED_TO_csr_byteenable, --           .byteenable
			src_data       => CONNECTED_TO_src_data,       -- src_master.tdata
			src_valid      => CONNECTED_TO_src_valid,      --           .tvalid
			src_ready      => CONNECTED_TO_src_ready       --           .tready
		);

