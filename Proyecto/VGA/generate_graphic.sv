module generate_graphic (
  input logic [9:0] x, y,
  input logic [7:0] ReadData,
  output logic [7:0] red, green, blue
);

  logic inrectBGLeft;
  logic inrectBGRight;
  logic inrectImage;
	 
  //generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
  //generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
  //generate_rectangle rectImage(x, y, x+80, y, 10'd560, 10'd480, inrectImage);

  generate_rectangle rectImage(x, y, x+100, y+100, 10'd256, 10'd256, inrectImage);
  
  always_comb begin
    //red   = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? ReadData[7:0] : 8'b11111111);
    //green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? ReadData[7:0] : 8'b11111111);
    //blue  = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectImage ? ReadData[7:0] : 8'b11111111);
	 red   = (inrectImage ? 8'b01010101 : ReadData);
    green = (inrectImage ? 8'b01010101 : ReadData);
    blue  = (inrectImage ? 8'b01010101 : ReadData);
  end

endmodule
