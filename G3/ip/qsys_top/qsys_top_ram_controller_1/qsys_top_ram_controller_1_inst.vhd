	component qsys_top_ram_controller_1 is
		generic (
			DEFAULT_TIMER_RESOLUTION : integer := 10;
			DEFAULT_BLOCK_SIZE       : integer := 1024;
			DEFAULT_TRAIL_DISTANCE   : integer := 1
		);
		port (
			clk                     : in  std_logic                     := 'X';             -- clk
			reset                   : in  std_logic                     := 'X';             -- reset
			csr_address             : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			csr_read                : in  std_logic                     := 'X';             -- read
			csr_write               : in  std_logic                     := 'X';             -- write
			csr_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			csr_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			csr_waitrequest         : out std_logic;                                        -- waitrequest
			src_write_command_ready : in  std_logic                     := 'X';             -- tready
			src_write_command_data  : out std_logic_vector(95 downto 0);                    -- tdata
			src_write_command_valid : out std_logic;                                        -- tvalid
			src_read_command_ready  : in  std_logic                     := 'X';             -- tready
			src_read_command_data   : out std_logic_vector(96 downto 0);                    -- tdata
			src_read_command_valid  : out std_logic                                         -- tvalid
		);
	end component qsys_top_ram_controller_1;

	u0 : component qsys_top_ram_controller_1
		generic map (
			DEFAULT_TIMER_RESOLUTION => INTEGER_VALUE_FOR_DEFAULT_TIMER_RESOLUTION,
			DEFAULT_BLOCK_SIZE       => INTEGER_VALUE_FOR_DEFAULT_BLOCK_SIZE,
			DEFAULT_TRAIL_DISTANCE   => INTEGER_VALUE_FOR_DEFAULT_TRAIL_DISTANCE
		)
		port map (
			clk                     => CONNECTED_TO_clk,                     --         clock.clk
			reset                   => CONNECTED_TO_reset,                   --         reset.reset
			csr_address             => CONNECTED_TO_csr_address,             --           csr.address
			csr_read                => CONNECTED_TO_csr_read,                --              .read
			csr_write               => CONNECTED_TO_csr_write,               --              .write
			csr_readdata            => CONNECTED_TO_csr_readdata,            --              .readdata
			csr_writedata           => CONNECTED_TO_csr_writedata,           --              .writedata
			csr_byteenable          => CONNECTED_TO_csr_byteenable,          --              .byteenable
			csr_waitrequest         => CONNECTED_TO_csr_waitrequest,         --              .waitrequest
			src_write_command_ready => CONNECTED_TO_src_write_command_ready, -- src_write_cmd.tready
			src_write_command_data  => CONNECTED_TO_src_write_command_data,  --              .tdata
			src_write_command_valid => CONNECTED_TO_src_write_command_valid, --              .tvalid
			src_read_command_ready  => CONNECTED_TO_src_read_command_ready,  --  src_read_cmd.tready
			src_read_command_data   => CONNECTED_TO_src_read_command_data,   --              .tdata
			src_read_command_valid  => CONNECTED_TO_src_read_command_valid   --              .tvalid
		);

