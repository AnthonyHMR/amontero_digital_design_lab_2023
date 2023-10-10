module vga(
		input logic clk, rst,
		//input logic [11:0] matrix [3:0][3:0],
		//input logic [2:0] state,
		input logic up_button,   // Botón de arriba
		input logic down_button, // Botón de abajo
		input logic left_button, // Botón de izquierda
		input logic right_button,
		output logic vgaclk, // 25.175 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b // To video DAC
	); 
	
	logic [9:0] x, y;

	// logic [3:0] state = 3'b011;
	
	// Use a PLL to create the 25.175 MHz VGA pixel clock
	// 25.175 MHz clk period = 39.772 ns
	// Screen is 800 clocks wide by 525 tall, but only 640 x 480 used
	// HSync = 1/(39.772 ns *800) = 31.470 kHz
	// Vsync = 31.474 kHz / 525 = 59.94 Hz (~60 Hz refresh rate)
	// this clock dividers generates a 25MHz clock (difference with 25.175MHz will considered as negligible)from a 50MHz input. 
	clock_divider vga_pll(clk, rst, vgaclk);

	// Generate monitor timing signals
	vga_controller vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	// User-defined module to determine pixel color
	//video_gen videoGen(x, y, state, matrix, r, g, b);
	
	//chessboard_gen board(x, y, r, g, b);
	
	//assign r = 8'b00000000;
	//assign g = 8'b00000000;
	//assign b = 8'b00000000;
	
	always @ (posedge vgaclk) begin
		if(x > 220 && x < 420 && y >190 && y < 290) begin
			r <= 8'b11111111;
			g <= 8'b00000000;
			b <= 8'b00000000;
		end
		else begin
			r <= 8'b00000000;
			g <= 8'b00000000;
			b <= 8'b00000000;
		end
	end
	
	
	
endmodule