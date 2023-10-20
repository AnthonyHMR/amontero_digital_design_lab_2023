module Drawings(
	input logic vgaclk,
	input logic b_draw, b_square, is_black_square, square_draw, start_game, is_marked, is_selected,
	output logic [7:0] r, g, b
);
	always_ff @ (posedge vgaclk) begin
		if (!start_game && b_draw) begin
			r <= 8'b00000000;
			g <= 8'b00000000;
			b <= 8'b11111111;
		end else if (!start_game && b_square) begin
			r <= 8'b11111111;
			g <= 8'b00000000;
			b <= 8'b00000000;
		end else if (!start_game) begin
			r <= 8'b00000000;
			g <= 8'b00000000;
			b <= 8'b00000000;
		end else if (square_draw) begin
			r <= 8'b00000000;
			g <= 8'b00000000;
			b <= 8'b11111111;
		end else if (is_selected) begin
			r <= 8'b11111111;
			g <= 8'b11111111;
			b <= 8'b00000000;
		end else if (is_marked) begin
			r <= 8'b11111111;
			g <= 8'b00000000;
			b <= 8'b11111111;
		end else if (is_black_square) begin
         r = 8'b00000000; // Black
         g = 8'b00000000;
         b = 8'b00000000;
      end else begin
         r = 8'b11111111; // White
         g = 8'b11111111;
         b = 8'b11111111;
      end
	end
endmodule