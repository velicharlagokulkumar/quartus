`timescale 1 ps / 1 ps

module write_control_logic
(
	input clk_i, reset_i, wrfull_i,
	input [31:0] data_i,
	output reg wrreq_o,
	output reg [9:0] addr_o,
	output [31:0] data_o
);
	
	reg	[2:0] state;

	// Declare states
	parameter IDLE = 0, WRITE = 1, INCADR = 2, WAIT= 3, DONE = 4;
	
	assign data_o = data_i;
	
	always @ (state) begin
		case (state)
			IDLE:
			begin
				wrreq_o = 1'b0;
			end
			WRITE:
			begin
				wrreq_o = 1'b1;
			end
			INCADR:
			begin	
				wrreq_o = 1'b0;
			end
			WAIT:
			begin
				wrreq_o = 1'b0;
			end			
			DONE:
			begin
				wrreq_o = 1'b0;
			end
			default:
			begin
				wrreq_o = 1'b0;
			end
		endcase
	end

	always @ (posedge clk_i or posedge reset_i) begin
		if (reset_i)
		begin	
			state <= IDLE;
			addr_o <= 8'h00;
		end
		else
			case (state)
				IDLE:
				begin
					if(!wrfull_i)
						state <= WRITE;
					else	
					begin
						state <= IDLE;			
						addr_o <= 8'h00;
					end
				end
				WRITE:
				begin
					if(addr_o!= 8'hff)
					begin	
						state <= INCADR;
						addr_o <= addr_o + 8'h01;
					end
					else
						state <= DONE;
				end
				INCADR:
				begin
					if(!wrfull_i)
						state <= WRITE;
					else
						state <= WAIT;
				end
				WAIT:
				begin
					if(!wrfull_i)
						state <= WRITE;
					else
						state <= WAIT;
				end
				DONE:
					state <= DONE;
				default:
				begin
					state <= IDLE;
					addr_o <= 8'h00;
				end	
			endcase
		end
endmodule
