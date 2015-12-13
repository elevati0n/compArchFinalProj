/****************************************************************************
 * cpu_tb.v
 ****************************************************************************/

/**
 * Module: cpu_tb
 * 
 * TODO: Add module documentation
 */
 
`timescale 1 ns /100 ps 

module cpu_tb;

	reg clk, reset;
	/*
	 * The memory module has a set of 7 ports, the input ports are
	inst_addr (instruction memory read address), data_addr (data memory read/write address), mem_write
	(data memory write enable), mem_read (data memory read enable), data_in (data memory write value)
	and the output ports are instr (instruction memory read-out), data_out (data memory read-out).
	 */
	
	  
	wire [31:0] inst_addr, instr, data_addr, data_in, data_out;
	wire mem_read, mem_write;
	
	Memory memory(
			.inst_addr  (inst_addr ), // input   	[4*8:1]
			.instr      (instr     ), // output  	[31:0]  
			.data_addr  (data_addr ), // input   	[4*8:1] 
			.data_in    (data_in   ), // input  	[31:0]
			.mem_read   (mem_read  ), // input	
			.mem_write  (mem_write ), // input
			.data_out   (data_out  ));// output 	[31:0]


	processor proj1(
	  .reset (reset), //input 
	  .clk (clk), //input 
		.inst_addr  (inst_addr ), // input [31:0]
		.instr      (instr     ), // input [31:0]
		.data_addr  (data_addr ), // input [31:0]
		.data_in    (data_in   ), // input [31:0]
		.mem_read   (mem_read  ), // output
		.mem_write  (mem_write ), // output 
		.data_out   (data_out  ));// input [31:0]

	initial begin
		clk = 0;
		reset = 1;
		#5 reset = 1;
		#21 reset = 0; 
	end
	
	always 
		#10 clk =~clk;
		
endmodule


