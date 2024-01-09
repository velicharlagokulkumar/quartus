	component ram1 is
		port (
			data    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);                    -- dataout
			address : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			wren    : in  std_logic                     := 'X';             -- wren
			clock   : in  std_logic                     := 'X';             -- clk
			aclr    : in  std_logic                     := 'X';             -- reset
			rden    : in  std_logic                     := 'X'              -- rden
		);
	end component ram1;

	u0 : component ram1
		port map (
			data    => CONNECTED_TO_data,    --    data.datain
			q       => CONNECTED_TO_q,       --       q.dataout
			address => CONNECTED_TO_address, -- address.address
			wren    => CONNECTED_TO_wren,    --    wren.wren
			clock   => CONNECTED_TO_clock,   --   clock.clk
			aclr    => CONNECTED_TO_aclr,    --    aclr.reset
			rden    => CONNECTED_TO_rden     --    rden.rden
		);

