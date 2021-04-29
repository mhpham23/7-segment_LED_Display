////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Module:      buttonpress
// Author:      JST/KLC
// Created:     25 October 2019
// Modified:    10 March 2020
// Version:     1.1
// Description: This module maps the active-low level signal of the pushbutton to an active-high
//              one clock-period pulse. In your implementation, each button press enables one
//              change in the counter state.
//              ** Note that this modules uses Verilog constructs that you are NOT permitted ** 
//              ** to use in your code                                                       **
//
// *****************************************
// YOU MUST NOT MODIFY ANY PART OF THIS FILE
// *****************************************
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module buttonpress(clock, reset, in, out);
	input        clock;
	input        reset;
	input        in;
	output       out;
	
	reg    [1:0] state;
	
	parameter KEY_UNPRESSED = 2'b00, KEY_PRESSED = 2'b01, KEY_RELEASED = 2'b10;

	always@(posedge clock or negedge reset) begin
		if(reset == 1'b0)
			state <= KEY_UNPRESSED;
		else begin
			case(state)
				KEY_UNPRESSED: begin
					if(in == 1'b0)
						state <= KEY_PRESSED;
				end
				KEY_PRESSED: begin
					if(in == 1'b1)
						state <= KEY_RELEASED;
				end
				KEY_RELEASED: begin
					state <= KEY_UNPRESSED;
				end
			endcase
		end
	end
	
	assign out = (state == KEY_RELEASED);
	
endmodule
