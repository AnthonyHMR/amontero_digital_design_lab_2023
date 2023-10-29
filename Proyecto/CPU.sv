module CPU(input logic clk, reset,
					  output logic [31:0] WriteData, DataAdr,
					  output logic MemWrite
);

	logic [31:0] PC, Instr, ReadData;

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
	
	ROM rom(.address(PC),
			  .clock(clk),
			  .q(ReadData)
	);
	
	RAM ram(.address(DataAdr),
			  .clock(clk),
			  .data(WriteData),
			  .wren(1'b1),
			  .q(ReadData)
	);
	
	

endmodule