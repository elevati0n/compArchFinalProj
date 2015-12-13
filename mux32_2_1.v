/****************************************************************************
 * mux32_2_1.v
 ****************************************************************************/

/**
 * Module: mux32_2_1
 * 
 * TODO: Add module documentation
 */
module mux32_2_1(
	input s,
	input [32:0] in0,
	input [32:0] in1,
	output reg [32:0] out
	);

	always@(s or in0 or in1)
		if (s=1) begin
			out = in1;
		end
		else if (s=0) begin
			out = in0;
		end
		
endmodule



