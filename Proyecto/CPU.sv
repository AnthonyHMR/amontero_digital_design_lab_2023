module CPU(input logic clk, reset,
			  output logic [31:0] WriteData, DataAdr, ReadData,
			  output logic MemWrite
			  //output logic [31:0] ins
);

	logic [31:0] Instr, PC;
		
		
	ROM rom(.address(PC[7:0]),
			  .clock(clk),
			  .q(Instr)
	);
	
	
	arm arm(clk, 
			  reset, 
			  PC, 
			  Instr, 
			  MemWrite, 
			  DataAdr,
			  WriteData, 
			  ReadData
	);
	
	
	
	RAM ram(.address(DataAdr[13:0]),
			  .clock(clk),
			  .data(WriteData),
			  .wren(MemWrite),
			  .q(ReadData)
	);
	
	//assign ins = Instr;
	
	

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