module generate_graphic(input logic [9:0] x, y,
					 output logic [7:0] red, green, blue
);
logic inrectBGLeft;
logic inrectBGRight;
logic inrectPlayer;
	 
generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
generate_rectangle rectPlayer(x, y, x+80, y, x+140, y+60, inrectPlayer);
	 
	
assign red = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectPlayer ? 8'b10101010 : 8'b00000000);
assign green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectPlayer ? 8'b10101010 : 8'b00000000);
assign blue = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectPlayer ? 8'b10101010 : 8'b00000000);

endmodule