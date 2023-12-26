	component qsys_top_dma_0 is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			system_reset_n     : in  std_logic                     := 'X';             -- reset_n
			dma_ctl_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			dma_ctl_chipselect : in  std_logic                     := 'X';             -- chipselect
			dma_ctl_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			dma_ctl_write_n    : in  std_logic                     := 'X';             -- write_n
			dma_ctl_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			dma_ctl_irq        : out std_logic;                                        -- irq
			read_address       : out std_logic_vector(23 downto 0);                    -- address
			read_chipselect    : out std_logic;                                        -- chipselect
			read_read_n        : out std_logic;                                        -- read_n
			read_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			read_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			read_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			write_address      : out std_logic_vector(31 downto 0);                    -- address
			write_chipselect   : out std_logic;                                        -- chipselect
			write_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			write_write_n      : out std_logic;                                        -- write_n
			write_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			write_byteenable   : out std_logic_vector(3 downto 0)                      -- byteenable
		);
	end component qsys_top_dma_0;

	u0 : component qsys_top_dma_0
		port map (
			clk                => CONNECTED_TO_clk,                --                clk.clk
			system_reset_n     => CONNECTED_TO_system_reset_n,     --              reset.reset_n
			dma_ctl_address    => CONNECTED_TO_dma_ctl_address,    -- control_port_slave.address
			dma_ctl_chipselect => CONNECTED_TO_dma_ctl_chipselect, --                   .chipselect
			dma_ctl_readdata   => CONNECTED_TO_dma_ctl_readdata,   --                   .readdata
			dma_ctl_write_n    => CONNECTED_TO_dma_ctl_write_n,    --                   .write_n
			dma_ctl_writedata  => CONNECTED_TO_dma_ctl_writedata,  --                   .writedata
			dma_ctl_irq        => CONNECTED_TO_dma_ctl_irq,        --                irq.irq
			read_address       => CONNECTED_TO_read_address,       --        read_master.address
			read_chipselect    => CONNECTED_TO_read_chipselect,    --                   .chipselect
			read_read_n        => CONNECTED_TO_read_read_n,        --                   .read_n
			read_readdata      => CONNECTED_TO_read_readdata,      --                   .readdata
			read_readdatavalid => CONNECTED_TO_read_readdatavalid, --                   .readdatavalid
			read_waitrequest   => CONNECTED_TO_read_waitrequest,   --                   .waitrequest
			write_address      => CONNECTED_TO_write_address,      --       write_master.address
			write_chipselect   => CONNECTED_TO_write_chipselect,   --                   .chipselect
			write_waitrequest  => CONNECTED_TO_write_waitrequest,  --                   .waitrequest
			write_write_n      => CONNECTED_TO_write_write_n,      --                   .write_n
			write_writedata    => CONNECTED_TO_write_writedata,    --                   .writedata
			write_byteenable   => CONNECTED_TO_write_byteenable    --                   .byteenable
		);

