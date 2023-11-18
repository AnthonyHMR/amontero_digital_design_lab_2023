module TopModule(
			  input logic clk,
			  input logic rst,
			  input logic enable,
			  output logic vga_clk,
			  output logic h_sync, v_sync,
			  output logic sync_b, blank_b,
			  output logic [7:0] red, green, blue
);
			  
	logic [9:0] x, y;
	logic [31:0] WriteData, DataAdr, ReadData, pixel;
	logic [31:0] memAddress = 0;
	logic MemWrite;
	
	pll vga_pll(.clk(clk), .vga_clk(vga_clk));
	
	vga_controller_2 vgaCont(vga_clk, h_sync, v_sync, sync_b, blank_b, x, y);
	
	generate_graphic gen_grid(x, y, pixel, red, green, blue);
	
	
	
	RAM ram(.address_a(15'b0),
			  .address_b(memAddress[15:0]),
			  .clock(clk),
			  .data_a(WriteData),
			  .data_b(WriteData),
			  .wren_a(1'b0),
			  .wren_b(1'b0),
			  .q_a(ReadData),
			  .q_b(pixel)
	);
	
	
	always_ff @(posedge clk) begin
		if (memAddress < 65536) begin
				memAddress <= memAddress + 1;
		end
	end
	
	/*
	CPU CPU_inst(.clk(clk), 
					 .vga_clk(vga_clk),
					 .reset(rst), 
					 .enable(1'b1),
					 .WriteData(WriteData), 
					 .DataAdr(DataAdr), 
					 .ReadData(ReadData), 
					 .MemWrite(MemWrite),
					 .pixel(pixel),
					 .x(memAddress)
	);	
	*/
	
endmodule
