module CPU(input logic clk, reset,
			  output logic [31:0] WriteData, DataAdr,
			  output logic MemWrite
);

	logic [31:0] PC, ReadData, Instruction, ReadDataRAM;
	
	logic [31:0] Instr = 32'b11100101100100010010000000000010;
	
	
	// instantiate processor and memories	
	
	arm arm(clk, 
			  reset, 
			  PC, 
			  Instr, 
			  MemWrite, 
			  DataAdr,
			  WriteData, 
			  ReadData
	);
	
	ROM rom(.address(PC[4:0]),
			  .clock(clk),
			  .q(Instruction)
	);
	
	RAM ram(.address(DataAdr[4:0]),
			  .clock(clk),
			  .data(WriteData),
			  .wren(1'b0),
			  .q(ReadDataRAM)
	);
	
	
	

endmodule















/*
	arm arm(clk, 
			  reset, 
			  PC, 
			  Instr, 
			  MemWrite, 
			  DataAdr,
			  WriteData, 
			  ReadData
	);
	*/
		
	
	/*
	imem imem(PC, 
				 Instr);

	
	dmem dmem(clk, 
				 MemWrite, 
				 DataAdr, 
				 WriteData, 
				 ReadData
	);
	*/