/****************************************************************************
 * mux4_2_1.v
 ****************************************************************************/

/**
 * Module: mux4_2_1
 * 
 * TODO: Add module documentation
 */
module mux4_2_1(
		input in0 [3:0],
		input in1 [3:0],
		input s,
		output reg out [3:0]);
	
	always@(s or in0 or in1)
		if (s=1) begin
			out = in1;
		end
	else if (s=0) begin
			out = in0;
		end
		
endmodule


