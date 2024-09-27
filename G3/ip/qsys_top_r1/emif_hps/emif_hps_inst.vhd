	component emif_hps is
		port (
			pll_ref_clk          : in    std_logic                       := 'X';             -- clk
			oct_rzqin            : in    std_logic                       := 'X';             -- oct_rzqin
			mem_ck               : out   std_logic_vector(0 downto 0);                       -- mem_ck
			mem_ck_n             : out   std_logic_vector(0 downto 0);                       -- mem_ck_n
			mem_a                : out   std_logic_vector(16 downto 0);                      -- mem_a
			mem_act_n            : out   std_logic_vector(0 downto 0);                       -- mem_act_n
			mem_ba               : out   std_logic_vector(1 downto 0);                       -- mem_ba
			mem_bg               : out   std_logic_vector(0 downto 0);                       -- mem_bg
			mem_cke              : out   std_logic_vector(0 downto 0);                       -- mem_cke
			mem_cs_n             : out   std_logic_vector(1 downto 0);                       -- mem_cs_n
			mem_odt              : out   std_logic_vector(0 downto 0);                       -- mem_odt
			mem_reset_n          : out   std_logic_vector(0 downto 0);                       -- mem_reset_n
			mem_par              : out   std_logic_vector(0 downto 0);                       -- mem_par
			mem_alert_n          : in    std_logic_vector(0 downto 0)    := (others => 'X'); -- mem_alert_n
			mem_dqs              : inout std_logic_vector(8 downto 0)    := (others => 'X'); -- mem_dqs
			mem_dqs_n            : inout std_logic_vector(8 downto 0)    := (others => 'X'); -- mem_dqs_n
			mem_dq               : inout std_logic_vector(71 downto 0)   := (others => 'X'); -- mem_dq
			mem_dbi_n            : inout std_logic_vector(8 downto 0)    := (others => 'X'); -- mem_dbi_n
			hps_to_emif          : in    std_logic_vector(4095 downto 0) := (others => 'X'); -- hps_to_emif
			emif_to_hps          : out   std_logic_vector(4095 downto 0);                    -- emif_to_hps
			hps_to_emif_gp       : in    std_logic_vector(1 downto 0)    := (others => 'X'); -- gp_to_emif
			emif_to_hps_gp       : out   std_logic_vector(0 downto 0);                       -- emif_to_gp
			calbus_read          : in    std_logic                       := 'X';             -- calbus_read
			calbus_write         : in    std_logic                       := 'X';             -- calbus_write
			calbus_address       : in    std_logic_vector(19 downto 0)   := (others => 'X'); -- calbus_address
			calbus_wdata         : in    std_logic_vector(31 downto 0)   := (others => 'X'); -- calbus_wdata
			calbus_rdata         : out   std_logic_vector(31 downto 0);                      -- calbus_rdata
			calbus_seq_param_tbl : out   std_logic_vector(4095 downto 0);                    -- calbus_seq_param_tbl
			calbus_clk           : in    std_logic                       := 'X'              -- clk
		);
	end component emif_hps;

	u0 : component emif_hps
		port map (
			pll_ref_clk          => CONNECTED_TO_pll_ref_clk,          --     pll_ref_clk.clk
			oct_rzqin            => CONNECTED_TO_oct_rzqin,            --             oct.oct_rzqin
			mem_ck               => CONNECTED_TO_mem_ck,               --             mem.mem_ck
			mem_ck_n             => CONNECTED_TO_mem_ck_n,             --                .mem_ck_n
			mem_a                => CONNECTED_TO_mem_a,                --                .mem_a
			mem_act_n            => CONNECTED_TO_mem_act_n,            --                .mem_act_n
			mem_ba               => CONNECTED_TO_mem_ba,               --                .mem_ba
			mem_bg               => CONNECTED_TO_mem_bg,               --                .mem_bg
			mem_cke              => CONNECTED_TO_mem_cke,              --                .mem_cke
			mem_cs_n             => CONNECTED_TO_mem_cs_n,             --                .mem_cs_n
			mem_odt              => CONNECTED_TO_mem_odt,              --                .mem_odt
			mem_reset_n          => CONNECTED_TO_mem_reset_n,          --                .mem_reset_n
			mem_par              => CONNECTED_TO_mem_par,              --                .mem_par
			mem_alert_n          => CONNECTED_TO_mem_alert_n,          --                .mem_alert_n
			mem_dqs              => CONNECTED_TO_mem_dqs,              --                .mem_dqs
			mem_dqs_n            => CONNECTED_TO_mem_dqs_n,            --                .mem_dqs_n
			mem_dq               => CONNECTED_TO_mem_dq,               --                .mem_dq
			mem_dbi_n            => CONNECTED_TO_mem_dbi_n,            --                .mem_dbi_n
			hps_to_emif          => CONNECTED_TO_hps_to_emif,          --        hps_emif.hps_to_emif
			emif_to_hps          => CONNECTED_TO_emif_to_hps,          --                .emif_to_hps
			hps_to_emif_gp       => CONNECTED_TO_hps_to_emif_gp,       --                .gp_to_emif
			emif_to_hps_gp       => CONNECTED_TO_emif_to_hps_gp,       --                .emif_to_gp
			calbus_read          => CONNECTED_TO_calbus_read,          --     emif_calbus.calbus_read
			calbus_write         => CONNECTED_TO_calbus_write,         --                .calbus_write
			calbus_address       => CONNECTED_TO_calbus_address,       --                .calbus_address
			calbus_wdata         => CONNECTED_TO_calbus_wdata,         --                .calbus_wdata
			calbus_rdata         => CONNECTED_TO_calbus_rdata,         --                .calbus_rdata
			calbus_seq_param_tbl => CONNECTED_TO_calbus_seq_param_tbl, --                .calbus_seq_param_tbl
			calbus_clk           => CONNECTED_TO_calbus_clk            -- emif_calbus_clk.clk
		);

