module main(
		input logic clk, rst, play, replay, select, mark,
		//input logic [11:0] matrix [3:0][3:0],
		//input logic [2:0] state,
		input logic up_button, down_button, left_button, right_button,
		input logic [3:0] switch_bomb,
		output logic [6:0] bombs1, bombs2, p_bombs1, p_bombs2,
		output logic vgaclk, // 25.175 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b // To video DAC
	); 
	
	logic [9:0] x, y;
	logic b_draw, b_square, is_black_square, square_draw;
	reg is_marked, is_selected;
	logic inicio, start_game, loser, winner;
	logic [3:0] count;
	
	BCDDecoder d_bombs1(switch_bomb % 4'b1010, bombs1);
	BCDDecoder d_bombs2(switch_bomb / 4'b1010, bombs2);
	
	Contador counter(mark, rst, count);
	
	BCDDecoder d_p_bombs1(count % 4'b1010, p_bombs1);
	BCDDecoder d_p_bombs2(count / 4'b1010, p_bombs2);
	
	MaquinaSF FSMachine(clk, rst, play, 0, 0, 0, inicio, start_game, loser, winner);

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
	
	chessboard_gen board(x, y, is_black_square);
	
	Start_screen start_s(vgaclk, x, y, b_draw, b_square);
	
	Selector selector(vgaclk, up_button, down_button, left_button, right_button, mark, select, is_marked, is_selected, x, y, square_draw, is_marked, is_selected);
	
	Drawings draw(	vgaclk,
						b_draw, 
						b_square,
						is_black_square,
						square_draw,
						start_game,
						is_marked,
						is_selected,
						r, g, b);
	
endmodule