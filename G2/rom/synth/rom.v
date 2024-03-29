// rom.v

// Generated using ACDS version 22.4 94

`timescale 1 ps / 1 ps
module rom (
		output wire [31:0] q,       //       q.dataout
		input  wire [9:0]  address, // address.address
		input  wire        clock    //   clock.clk
	);

	rom_rom_1port_2010_5hpb5ia rom_1port_0 (
		.q       (q),       //  output,  width = 32,       q.dataout
		.address (address), //   input,  width = 10, address.address
		.clock   (clock)    //   input,   width = 1,   clock.clk
	);

endmodule
