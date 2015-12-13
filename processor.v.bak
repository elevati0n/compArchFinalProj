/****************************************************************************
 * processor.v
 ****************************************************************************/

/**
 * Module: processor
 * 
 * TODO: Add module documentation
 */
 
module processor(
	clk,
	reset,
    inst_addr,
    instr,
	data_addr,
	data_in,
	mem_read,
	mem_write,
	data_out
);
		
	// Interface
	input clk;
	input reset;
	output reg  [4*8:1]  inst_addr;
	input  [31:0]  instr;
	output reg  [4*8:1]  data_addr;
	output reg  [31:0]  data_in;
	output reg         mem_read;
	output reg          mem_write;
	input  [31:0]  data_out;

	pc_counter pc_counter (
		.clk      (clk     ), 	//	input 
		.reset    (reset   ), 	//	input
		.next     (next_addr    ), 	//  input [31:0]
		.current  (inst_addr));	//  output [31:0
	
	
	Memory Memory (
		.inst_addr  (inst_addr ), // input [31:0]
		.instr      (instr     ), // output [31:0]
		.data_addr  (data_addr ), // input [31:0]
		.data_in    (readData2 ), // input [31:0] 
		.mem_read   (mem_read  ), // input
		.mem_write  (mem_write ), // input 
		.data_out   (data_out  ));// output [31:0]
	
	// alu +4 to address, always adds 4 to address
	alu aluPLus4 (
		.aluresult  (jump_result ), //output 32:0
		.zero       (      ), 		//
		.operation  (4'b0010 ), 	//input 3:0
		.data_a     (inst_addr), 	//input 32:0
		.data_b     (4    ));		//input 32:0
	
	shiftleft2 shiftleft2_instr (
		.shiftMe  (instr ), //input 32:0
		.shifted  (jump_address )); //output 32:0s
	
	
	combineSLPC4 combineSLPC4 (
		.in0  (jump_result ), //input 32:0
		.in1  (jump_address ), //input 32:0
		.out  (jumpMux1 ));	//output 32:0
	
	mux32_2_1 mux32_2_1 (
		.s    (jump	), // input
		.in0  (in0 ), //input 32:0
		.in1  (jumpMux1), //input 32:0  FIX ME FIX ME
		.out  (next_addr ));//output 32:0
	
	controlunit controlunit (
		.regdest   (regdest  ), 
		.jump      (jump     ), 
		.branch    (branch   ), 
		.memread   (memread  ), 
		.memtoreg  (memtoreg ), 
		.memwrite  (memwrite ), 
		.alusrc    (alusrc   ), 
		.regwrite  (regWrite ), 
		.aluop     (aluop    ), 
		.opcode    (opcode   ));

	reg_file reg_file (
		.readReg1   (instr[25:21]), 
		.readReg2   (instr[20:16]), 
		.writeReg   (writeReg  ), 
		.writeData  (writeData ), 
		.regWrite   (regWrite  ), 
		.clk        (clk       ), 
		.readData1  (readData1 ), 
		.readData2  (readData2 ));
	
	//mux for write register
	mux4_2_1 mux4_2_1 (
		.in0  (instr[20:16]), 
		.in1  (instr[15:11]), 
		.s    (regdest), 
		.out  (writeReg));
	
	sign_extend sign_extend (
		.extendMe  (instr[15:0]), //input 15:0
		.extended  (shiftLeftIn)); //output 31:0
	
	shiftleft2 shiftleft2 (
		.shiftMe  (shiftLeftIn ),  //input 31:0
		.shifted  (aluAddB ));		//output 31:0
	
	alu aluAdd (
		//instr mux 0
		.aluresult  (aluAddresult ), //output 31:0
	
		.zero       (      ), //output
		//adder, same as jump + 4 
		.operation  (4'b0010 ), //output
		.data_a     (jump_result    ),  //input 31:0
		.data_b     (aluAddB    )); //input 31:0
		
	mux32_2_1 mux32_2_1_b (
		.s    (andGateOut   ), //input 
		.in0  (jump_result ),  //input 31:0
		.in1  (aluAddresult ), //input 31:0
		.out  (out )); //input 31:0
	
	
	//module alu_control
	// (input[1:0] aluop, input[5:0] funct, output reg[3:0] operation );
	alu_control alu_control (
		.aluop      (aluop),  //input [1:0]
		.funct      (instr[5:0]     ), //input[5:0]
		.operation  (operation )); //output [3:0]
	
	mux4_2_1 mux4_2_bottom (
		.in0  (readData2 ), //input 4:0
		.in1  (shiftLeftIn ),  //input 4:0
		.s    (alusrc   ),  //input 
		.out  (aluB )); //output 4:0 
	
	alu aluMain (
		.aluresult  (data_addr ),	 //output 32:0
		.zero       (zero      ),	 //output
		.operation  (andIn1 ), 		//input 3:0
		.data_a     (readData1    ),	 //input 32:0
		.data_b     (aluB    ));	//input 32:0
	
	andGate andGate (
		.in0  (branch ), //input 
		.in1  (andIn1),  //input
		.out  (andGateOut)); //output
	
	mux32_2_1 mux32_2_1data (
		.s    (memtoreg   ), //input
		.in0  (data_addr ),  //input [31:0]
		.in1  (data_out ), 	 //input [31:0]
		.out  (writeData )); //output [31:0]
	
endmodule


