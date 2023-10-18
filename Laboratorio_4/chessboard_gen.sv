module chessboard_gen(
    input logic [9:0] x, y,
	 output logic is_black_square
);

    // Define the dimensions of the chessboard
    parameter BOARD_WIDTH = 8;
    parameter BOARD_HEIGHT = 8;
    parameter SQUARE_SIZE_X = 80; // Adjust this to fit your screen resolution
	 parameter SQUARE_SIZE_Y = 60;

    // Calculate the row and column within the chessboard
    logic [2:0] row, col;
    always_comb begin
        row = y / SQUARE_SIZE_Y;
        col = x / SQUARE_SIZE_X;
    end

    // Determine the color of each square (alternating black and white);
    always_comb begin
        is_black_square = (row % 2 == 0) ? (col % 2 == 1) : (col % 2 == 0);
    end

endmodule