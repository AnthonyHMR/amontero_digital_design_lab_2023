module CPU(input logic clk, reset,
					  output logic [31:0] WriteData, DataAdr,
					  output logic MemWrite
);

	logic [31:0] PC, Instr, ReadData, ReadData1, ReadData2;

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
	
	ROM rom(.address(PC[4:0]),
			  .clock(clk),
			  .q(ReadData1)
	);
	
	RAM ram(.address(DataAdr[4:0]),
			  .clock(clk),
			  .data(WriteData),
			  .wren(1'b1),
			  .q(ReadData2)
	);
	
	

endmodule