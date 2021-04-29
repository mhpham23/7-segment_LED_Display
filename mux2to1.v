////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Module:      mux2to1
// Author:      JST
// Created:     25 October 2019
// Version:     1
// Description: This is a 2-to-1 multiplexer. In the implementation, the multiplexer chooses
//              between the buttonpress output and the clock divider as the register enable.
//
// *****************************************
// YOU MUST NOT MODIFY ANY PART OF THIS FILE
// *****************************************
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module mux2to1(select, in0, in1, out);
	input  select, in0, in1;
	output out;
	
	assign out = (select == 1'b0) ? in0 :
                (select == 1'b1) ? in1 : 1'bx;
	
endmodule
