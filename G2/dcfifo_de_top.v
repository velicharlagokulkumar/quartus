module dcfifo_de_top(
	trclk,
	reset,
	word_count,
	q
);

input	trclk;
input	reset;
output	[31:0] q;
output  [8:0] word_count;

wire	[9:0] rom_addr;
wire	fifo_rdempty;
wire	[31:0] fifo_in;
wire	fifo_rdreq;
wire	[31:0] rom_out;
wire	fifo_wrfull;
wire	fifo_wrreq;
wire	[31:0] fifo_out;
wire	ram_wren, ram_rden;
wire	[9:0] ram_addr;
wire	[31:0] ram_in;
reg	rvclk;


  always @(posedge trclk or posedge reset) begin
    if (reset) begin
      rvclk <= 0;
    end
    else begin
      rvclk <= ~rvclk;
    end
  end

//ROM at transmitting domain
 rom myrom (
  .q       (rom_out),       //  output,  width = 32,       q.dataout
  .address (rom_addr), //   input,  width = 10, address.address
  .clock   (trclk)    //   input,   width = 1,   clock.clk
);

//Read data from ROM and write into the DCFIFO at transmitting domain
write_control_logic wrctrl_logic(
	.clk_i(trclk),
	.reset_i(reset),
	.wrfull_i(fifo_wrfull),
	.data_i(rom_out),
	.wrreq_o(fifo_wrreq),
	//.transfer_done_o(transfer_done),
	.addr_o(rom_addr),
	.data_o(fifo_in));

//DCFIFO acts as the interface between the transmitting domain and receiving domain

	    fifo dcfifo (
        .data    (fifo_in),    //   input,  width = 32,  fifo_input.datain
        .wrreq   (fifo_wrreq),   //   input,   width = 1,            .wrreq
        .rdreq   (fifo_rdreq),   //   input,   width = 1,            .rdreq
        .wrclk   (trclk),   //   input,   width = 1,            .wrclk
        .rdclk   (rvclk),   //   input,   width = 1,            .rdclk
        .aclr    (reset),    //   input,   width = 1,            .aclr
        .q       (fifo_out),       //  output,  width = 32, fifo_output.dataout
        .rdempty (fifo_rdempty), //  output,   width = 1,            .rdempty
        .wrfull  (fifo_wrfull)   //  output,   width = 1,            .wrfull
    );
	
	
	
//Read data from DCFIFO and writes into the RAM at receiving domain
read_control_logic	rdctrl_logic(
	.clk_i(rvclk),
	.reset_i(reset),
	.rdempty_i(fifo_rdempty),
	.data_i(fifo_out),
	.rdreq_o(fifo_rdreq),
	.wren_o(ram_wren),
	.rden_o(ram_rden),
	.addr_o(ram_addr),
	.word_count_o(word_count),
	.data_o(ram_in));
	
//Ram at recieving domain	
 ram1 ram (
  .data    (ram_in),    //   input,  width = 32,    data.datain
  .q       (q),       //  output,  width = 32,       q.dataout
  .address (ram_addr), //   input,  width = 10, address.address
  .wren    (ram_wren),    //   input,   width = 1,    wren.wren
  .clock   (rvclk),   //   input,   width = 1,   clock.clk
  .aclr    (reset),    //   input,   width = 1,    aclr.reset
  .rden    (ram_rden)     //   input,   width = 1,    rden.rden
);

endmodule
