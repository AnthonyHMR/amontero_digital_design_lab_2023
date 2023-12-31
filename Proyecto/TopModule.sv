module TopModule(
			  input logic clk,
			  input logic rst,
			  input logic enable_switch,
			  output logic vga_clk,
			  output logic h_sync, v_sync,
			  output logic sync_b, blank_b,
			  output logic [7:0] red, green, blue,
			  output logic [31:0] memAddress, pixel,
			  output logic [9:0] x, y
);
			  
	//logic [9:0] x, y;
	logic [31:0] WriteData, DataAdr, ReadData;
	//logic [31:0] memAddress = 0;
	logic MemWrite;
	
	logic enable;
	
	assign enable = (x < 256 & x >= 0) & (y < 256 & y >= 0) && enable_switch;
	
	pll vga_pll(.clk(clk), .vga_clk(vga_clk));
	
	vga_controller vgaCont(vga_clk, h_sync, v_sync, sync_b, blank_b, x, y);
	
	generate_graphic gen_grid(x, y, pixel[7:0], red, green, blue);
	
	//vga_module vga_inst(.pixel(pixel[7:0]), .clk(clk), .vga_clk(vga_clk), .h_sync(h_sync), .v_sync(v_sync), .sync_b(sync_b), .blank_b(blank_b),  .red(red), .green(green), .blue(blue), .x(x), .y(y));
	
	CPU CPU_inst(.clk(clk), 
					 .vga_clk(vga_clk),
					 .reset(rst), 
					 .enable(enable),
					 .WriteData(WriteData), 
					 .DataAdr(DataAdr), 
					 .ReadData(ReadData), 
					 .MemWrite(MemWrite),
					 .pixel(pixel),
					 .x(memAddress)
	);	
	
endmodule
