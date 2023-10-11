module drawings(
	input logic vgaclk,
	input logic b_draw, b_square, is_black_square, square_draw,
	output logic [7:0] r, g, b
);
	always_ff @ (posedge vgaclk) begin
		if (b_draw || square_draw) begin
			r <= 8'b11111111;
			g <= 8'b00000000;
			b <= 8'b11111111;
		end else if(b_square) begin
			r <= 8'b11111111;
			g <= 8'b00000000;
			b <= 8'b00000000;
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