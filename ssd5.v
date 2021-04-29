///////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Module: ssd5.v
// Author: Hoan Pham
// Created: 3/29/2021
// Last Modified: 3/29/2021
// Description: This module creates a decoder that takes in counter state at the value 0000
//   and count to the value of 1010 and display correct behavior on HEX5 LED. 
//
///////////////////////////////////////////////////////////////////////////////////////////////////////
// Insert a module header that describes your module appropriately.

module ssd5(in, out);
	input  [3:0] in;
	output [6:0] out;

// In LEARNING EXPERIENCE E.3, replace this continuous assignment with the logic that drives HEX5.
// You may use a structural model and primitive logic gates or a continuous assignment model using
// PERMITTED dataflow operators.

// If you do not use HEX5 in LE E.3, leave the continuous assignment as it is.	

   //H[6] =  IN[3] + IN[2] IN[1]’ IN[0]
	assign out[6] = in[3] | (in[2] & ~in[1] & in[0]);
	
	//H[5] = IN[2] IN[1]’ + IN[2] IN[0]’ + IN[2]’ IN[1] IN[0]
	assign out[5] = (in[2] & ~in[1]) | (in[2] & ~in[0]) | (~in[2] & in[1] & in[0]);
	
	//H[4] = IN[3]’ IN[2]’ + IN[3]’ IN[1]’ IN[0]
	assign out[4] = (~in[3] & ~in[2]) | (~in[3] & ~in[1] & in[0]);
	
	//H[3] = IN[3]’ IN[2]’ IN[0]’ + IN[2] IN[1]’ IN[0]
	assign out[3] = (~in[3] & ~in[2] & ~in[0]) | (in[2] & ~in[1] & in[0]);
	
	//H[2] = IN[3]’ IN[1]’ IN[0]’
	assign out[2] = (~in[3] & ~in[1] & ~in[0]);
	
	//H[1] = IN[2] IN[1] + IN[3]’ IN[2]’ IN[1]’ IN[0]
	assign out[1] = (in[2] & in[1]) | (~in[3] & ~in[2] & ~in[1] & in[0]);
	
	//H[0] = IN[3]’ IN[1] IN[0]’ + IN[2] IN[1]’ IN[0]
	assign out[0] = (~in[3] & in[1] & ~in[0]) | (in[2] & ~in[1] & in[0]);
	
endmodule

// If your module requires instances of other modules, you may write them here and instantiate
// them in the ssd5 module accordingly.
