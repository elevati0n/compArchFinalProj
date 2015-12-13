/****************************************************************************
 * combine_SL_PC_4.sv
 ****************************************************************************/

/**
 * Module: combine_SL_PC_4
 * 
 * TODO: Add module documentation
 */

module combineSLPC4(
	input [4:0] aluPlus4,
	input [25:0] instr,
	output reg [31:0] out
	); 

	always @ (aluPlus4 or shiftout) begin 
		out = {aluPlus4, instr, 2'b00};
	end
endmodule
