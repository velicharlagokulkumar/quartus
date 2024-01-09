`timescale 1ns / 1ps
 module dcfifo_tb();

reg	clk;
reg	reset;
wire [31:0] q;
wire  [8:0] word_count;

 dcfifo_de_top in1(
	.trclk(clk),
	.reset(reset),
	.word_count(word_count),
	.q(q)
);

initial
begin
clk=0;
reset=0;
#5 reset=1;    
end

always #5 clk=~clk;

 endmodule