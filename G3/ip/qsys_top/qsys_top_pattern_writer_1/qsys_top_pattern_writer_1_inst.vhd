	component qsys_top_pattern_writer_1 is
		generic (
			ADDRESS_WIDTH          : integer := 32;
			LENGTH_WIDTH           : integer := 32;
			DATA_WIDTH             : integer := 32;
			BYTE_ENABLE_WIDTH      : integer := 4;
			BYTE_ENABLE_WIDTH_LOG2 : integer := 2;
			BURST_ENABLE           : integer := 1;
			MAX_BURST_COUNT        : integer := 2;
			BURST_WIDTH            : integer := 2;
			FIFO_DEPTH             : integer := 128;
			FIFO_DEPTH_LOG2        : integer := 7;
			BURST_REALIGN_ENABLE   : integer := 1
		);
		port (
			clk                : in  std_logic                                                  := 'X';             -- clk
			reset              : in  std_logic                                                  := 'X';             -- reset
			snk_data           : in  std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0)        := (others => 'X'); -- tdata
			snk_valid          : in  std_logic                                                  := 'X';             -- tvalid
			snk_ready          : out std_logic;                                                                     -- tready
			snk_command_data   : in  std_logic_vector(95 downto 0)                              := (others => 'X'); -- tdata
			snk_command_valid  : in  std_logic                                                  := 'X';             -- tvalid
			snk_command_ready  : out std_logic;                                                                     -- tready
			master_address     : out std_logic_vector((((ADDRESS_WIDTH-1)-0)+1)-1 downto 0);                        -- address
			master_write       : out std_logic;                                                                     -- write
			master_writedata   : out std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0);                           -- writedata
			master_burstcount  : out std_logic_vector((((BURST_WIDTH-1)-0)+1)-1 downto 0);                          -- burstcount
			master_byteenable  : out std_logic_vector((((BYTE_ENABLE_WIDTH-1)-0)+1)-1 downto 0);                    -- byteenable
			master_waitrequest : in  std_logic                                                  := 'X'              -- waitrequest
		);
	end component qsys_top_pattern_writer_1;

	u0 : component qsys_top_pattern_writer_1
		generic map (
			ADDRESS_WIDTH          => INTEGER_VALUE_FOR_ADDRESS_WIDTH,
			LENGTH_WIDTH           => INTEGER_VALUE_FOR_LENGTH_WIDTH,
			DATA_WIDTH             => INTEGER_VALUE_FOR_DATA_WIDTH,
			BYTE_ENABLE_WIDTH      => INTEGER_VALUE_FOR_BYTE_ENABLE_WIDTH,
			BYTE_ENABLE_WIDTH_LOG2 => INTEGER_VALUE_FOR_BYTE_ENABLE_WIDTH_LOG2,
			BURST_ENABLE           => INTEGER_VALUE_FOR_BURST_ENABLE,
			MAX_BURST_COUNT        => INTEGER_VALUE_FOR_MAX_BURST_COUNT,
			BURST_WIDTH            => INTEGER_VALUE_FOR_BURST_WIDTH,
			FIFO_DEPTH             => INTEGER_VALUE_FOR_FIFO_DEPTH,
			FIFO_DEPTH_LOG2        => INTEGER_VALUE_FOR_FIFO_DEPTH_LOG2,
			BURST_REALIGN_ENABLE   => INTEGER_VALUE_FOR_BURST_REALIGN_ENABLE
		)
		port map (
			clk                => CONNECTED_TO_clk,                --          clock.clk
			reset              => CONNECTED_TO_reset,              --          reset.reset
			snk_data           => CONNECTED_TO_snk_data,           -- snk_data_slave.tdata
			snk_valid          => CONNECTED_TO_snk_valid,          --               .tvalid
			snk_ready          => CONNECTED_TO_snk_ready,          --               .tready
			snk_command_data   => CONNECTED_TO_snk_command_data,   --  snk_cmd_slave.tdata
			snk_command_valid  => CONNECTED_TO_snk_command_valid,  --               .tvalid
			snk_command_ready  => CONNECTED_TO_snk_command_ready,  --               .tready
			master_address     => CONNECTED_TO_master_address,     --  avalon_master.address
			master_write       => CONNECTED_TO_master_write,       --               .write
			master_writedata   => CONNECTED_TO_master_writedata,   --               .writedata
			master_burstcount  => CONNECTED_TO_master_burstcount,  --               .burstcount
			master_byteenable  => CONNECTED_TO_master_byteenable,  --               .byteenable
			master_waitrequest => CONNECTED_TO_master_waitrequest  --               .waitrequest
		);

