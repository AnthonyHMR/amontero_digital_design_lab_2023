module CPU(input logic clk, vga_clk, reset, enable,
			  output logic [31:0] WriteData, DataAdr, ReadData,
			  output logic MemWrite,
			  output logic [31:0] pixel
			  //output logic [31:0] ins
);

	logic [31:0] Instr, PC;
	logic [31:0] memAddress;
		
		
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
	
	
	
	RAM ram(.address_a(DataAdr[15:0]),
			  .address_b(memAddress[15:0]),
			  .clock(clk),
			  .data_a(WriteData),
			  .data_b(WriteData),
			  .wren_a(MemWrite),
			  .wren_b(MemWrite),
			  .q_a(ReadData),
			  .q_b(pixel)
	);
	
	
	always_ff @(posedge vga_clk) begin
    if (reset) begin
      memAddress <= 0;
    end else if (enable) begin
      if (memAddress < 65536) begin
        memAddress <= memAddress + 1;
      end
    end
  end
	
	
	/*
	 memToVGA mtv(.clk(vga_clk),
					  .q_b(q_b),
					  .enable(enable),
					  .rst(reset),
					  .memAddress(memAddress),
					  .pixel(pixel)
	 );
	 */
	
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