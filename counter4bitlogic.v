///////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Module: counter4bitlogic.v
// Author: Hoan Pham
// Created: 3/25/2021
// Last Modified: 3/25/2021
// Description: This module creates a clock counter that starts at the value 0000
//   and count to the value of 1010 and cycles back to 0000. 
//
///////////////////////////////////////////////////////////////////////////////////////////////////////

// Insert a module header that describes your module appropriately.

module counter4bitlogic(present, next);
	input  [3:0] present;
	output [3:0] next;
	
// In LEARNING EXPERIENCE E.3, replace this continuous assignment with the logic that represents
// your counter logic. Your logic should either use a structural model and primitive logic gates or
// a continuous assignment model using PERMITTED dataflow operators.

// Since you wrote this logic in Learning Experience E.1, you may copy that logic from the previous
// assignment and paste it here to replace the continuous assignment. IF YOU HAVE CHOSEN TO MODIFY
// YOUR COUNTER LOGIC, USE YOUR NEW CODE IN THIS MODULE.
	
	//D3 = Y3Y2' + Y2Y1Y0
	assign next[3] = (present[3] & ~present[1]) | (present[2] & present[1] & present[0]);
	
	//D2 = Y2(Y1)’ + Y2(Y0)’ + (Y2)’Y1Y0
	assign next[2] = (present[2] & ~present[1]) | (present[2] & ~present[0]) | 
							(~present[2] & present[1] & present[0]);
							
	//D1 = D1 = (Y1)’Y0 + (Y3)’Y1(Y0)’
	assign next[1] = (~present[1] & present[0]) | (~present[3] & present[1] & ~present[0]);
	
	//D0 = (Y3)’(Y0)’ + (Y1)’(Y0)’
	assign next[0] = (~present[3] & ~present[0]) | (~present[1] & ~present[0]);
	
	
endmodule

// If your module required instances of other modules in Learning Experience E.1, remember to copy
// and place them into this module accordingly.

