module fpga(
     output reg  LED, 
     input  wire BUTTON 
    );        
	 
    always @ (BUTTON)
    begin
        LED=BUTTON;      
    end
 
endmodule