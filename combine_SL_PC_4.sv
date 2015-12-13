/****************************************************************************
 * combine_SL_PC_4.sv
 ****************************************************************************/

/**
 * Module: combine_SL_PC_4
 * 
 * TODO: Add module documentation
 */

module combineSLPC4(
	input [31:0] in0,
	input [31:0] in1,
	output reg [31:0] out
	); 

	always @ (in0 or in1) begin 
		out = {in0[29:0], 2'b00};
	end
endmodule
