///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Module:      clockdivider
// Author:      JST/KLC
// Created:     25 October 2019
// Modified:    10 March 2020
// Version:     1.1
// Description: This module generates a 5 Hz enable signal from the 50 MHz system clock.
//              In your implementation, you can use this signal to replace button presses.
//              ** Note that this modules uses Verilog operators and constructs that you ** 
//              ** are NOT permittedto use in your code                                  **
//
// *****************************************
// YOU MUST NOT MODIFY ANY PART OF THIS FILE
// *****************************************
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module clockdivider(clock, reset, enable);
	input        clock, reset;
	output       enable;

	reg   [23:0] count;

	always@(posedge clock or negedge reset) begin
		if(reset == 1'b0)
			count <= 24'd0;
		else begin
			if(count == 24'd9999999)
				count <= 24'd0;
			else
				count <= count + 24'd1;
		end
	end
	
	assign enable = (count == 24'd9999999);
	
endmodule
