`timescale 1ns/1ps

module CPU_tb();
	logic clk = 0;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
		
	logic [31:0] PC, ReadData, Instruction, ReadDataRAM;
	
	logic [31:0] Instr = 32'b11100101100100010010000000000010;
	
	
	arm arm(clk, 
			  reset, 
			  PC, 
			  Instr, 
			  MemWrite, 
			  DataAdr,
			  WriteData, 
			  ReadData
	);
	
	
	RAM ram(.address(DataAdr),
			  .clock(clk),
			  .data(WriteData),
			  .wren(1'b0),
			  .q(ReadData)
	);
	
	// initialize test
	initial
	begin
		
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= ~clk; 
		# 5;
		
	end
	
	// check that 7 gets written to address 0x64
	// at end of program
	always @(negedge clk)
	begin
		reset = 1; 
		# 100; 
		reset = 0;
		#100;
		$display("Data RAM = %d", ReadData);
		#100;
		$finish;
	end
endmodule