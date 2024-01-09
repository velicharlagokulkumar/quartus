module ram1 (
		input  wire [31:0] data,    //    data.datain
		output wire [31:0] q,       //       q.dataout
		input  wire [9:0]  address, // address.address
		input  wire        wren,    //    wren.wren
		input  wire        clock,   //   clock.clk
		input  wire        aclr,    //    aclr.reset
		input  wire        rden     //    rden.rden
	);
endmodule

