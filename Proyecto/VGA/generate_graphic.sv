module generate_graphic (
  input logic [9:0] x, y,
  input logic [31:0] ReadData,
  output logic [7:0] red, green, blue
);

  logic inrectBGLeft;
  logic inrectBGRight;
  logic inrectImage;
	 
  generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
  generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
  generate_rectangle rectImage(x, y, x+80, y, 10'd560, 10'd480, inrectImage);

  always_comb begin
    red   = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? 8'b11111111 : ReadData[7:0]);
    green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? 8'b11111111 : ReadData[7:0]);
    blue  = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? 8'b11111111 : ReadData[7:0]);
  end

endmodule
