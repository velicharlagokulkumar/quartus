`timescale 1 ps / 1 ps

module read_control_logic
(
	input clk_i, reset_i, rdempty_i,
	input [31:0] data_i,
	output reg rdreq_o, wren_o, rden_o,
	output reg [9:0] addr_o,
	output [31:0] data_o,
	output reg [8:0] word_count_o
);
	
	reg	[1:0] state;

	// Declare states
	parameter IDLE = 0, INCADR = 1, WRITE = 2, WAIT = 3;
	parameter RAM_DEPTH = 255;
	parameter FIFO_DEPTH = 64;
	
	assign data_o = data_i;

	// Output depends only on the state
	always @ (state ) begin
		case (state )
			IDLE:
			begin
				rdreq_o = 1'b0;
				wren_o = 1'b0;
				rden_o = 1'b0;									
			end
			INCADR:
			begin
				rdreq_o = 1'b1;
				wren_o = 1'b0;				
				rden_o = 1'b0;													
			end
			WRITE:
			begin	
				rdreq_o = 1'b0;
				wren_o = 1'b1;							
				rden_o = 1'b1;									
			end
			WAIT:
			begin
				rdreq_o = 1'b0;
				wren_o = 1'b0;				
				rden_o = 1'b0;													
			end
			default:
			begin
				rdreq_o = 1'b0;
				wren_o = 1'b0;				
				rden_o = 1'b0;													
			end
		endcase
	end

	always @ (posedge clk_i or posedge reset_i) begin
		if (reset_i)
		begin
			state  <= IDLE;
			addr_o <= 8'hff;
			word_count_o <= 9'h0;
		end
		else
			case (state)
			    
				IDLE:
				begin
					if(!rdempty_i)
					begin
						state  <= INCADR; 
						addr_o <= addr_o + 8'h01;
					end
					else
					begin
						state  <= IDLE;
						addr_o <= 8'hff;
						word_count_o <= 9'h0;
					end
				end
				
				INCADR:
				begin
					state  <= WRITE;
					word_count_o <= word_count_o + 9'h1;
		      end
		      
				WRITE:
				begin
					if(rdempty_i)
						state  <= WAIT;
					else
						begin
							state  <= INCADR;
							addr_o <= addr_o + 8'h01;
						end
				end
						
				WAIT:
				begin
					if(!rdempty_i)
					begin	
						state  <= INCADR;
						addr_o <= addr_o + 8'h01;
					end
					else
						state  <= WAIT;
				end
				default:
				begin
					state  <= IDLE;
					addr_o <= 8'hff;
					word_count_o <= 9'h0;
				end
			endcase
	end

endmodule
