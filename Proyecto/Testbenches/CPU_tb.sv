`timescale 1ns/1ps

module CPU_tb();
	logic clk = 0;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
		
	logic [31:0] PC, ReadData, Instruction, ReadDataRAM, Instr;
	
	//logic [31:0] Instr = 32'b11100101100100010010000000000010;
	
	// LDR R2, [R1, #2]
	logic [31:0] LDR = 32'b11100101100100010010000000000010;
	
	// STR R5, [R1, #1]
	logic [31:0] STR = 32'b11100101101000010101000000000001;
	
	// ADDi R5, R1, #3
	logic [31:0] ADD = 32'b11100010100000010101000000000011;
	
	
	
	
	
	
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
		
		Instr = ADD;
		
		#100;
		
		$display("WriteData = %d", WriteData);
		$display("DataAdr = %d", DataAdr);
		$display("MemWrite = %d", MemWrite);
		$display("PC = %d", PC);
		$display("ReadData = %d", ReadData);
		$display("-------------------------------------------------------");
		
		#100;
		
		Instr = STR;
		
		#100;
		
		$display("WriteData = %d", WriteData);
		$display("DataAdr = %d", DataAdr);
		$display("MemWrite = %d", MemWrite);
		$display("PC = %d", PC);
		$display("ReadData = %d", ReadData);
		$display("-------------------------------------------------------");
		
		Instr = LDR;
		
		#100;
		
		$display("WriteData = %d", WriteData);
		$display("DataAdr = %d", DataAdr);
		$display("MemWrite = %d", MemWrite);
		$display("PC = %d", PC);
		$display("ReadData = %d", ReadData);
		$display("-------------------------------------------------------");
		
		
		
		
		$display("Data RAM = %d", ReadData);
		#100;
		$finish;
	end
endmodule