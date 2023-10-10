module chessboard_gen(
    input logic [9:0] x, y,
    output logic [7:0] r, g, b
);

    // Define the dimensions of the chessboard
    parameter BOARD_WIDTH = 8;
    parameter BOARD_HEIGHT = 8;
    parameter SQUARE_SIZE = 80; // Adjust this to fit your screen resolution

    // Calculate the row and column within the chessboard
    logic [2:0] row, col;
    always_comb begin
        row = y / SQUARE_SIZE;
        col = x / SQUARE_SIZE;
    end

    // Determine the color of each square (alternating black and white)
    logic is_black_square;
    always_comb begin
        is_black_square = (row % 2 == 0) ? (col % 2 == 1) : (col % 2 == 0);
    end

    // Assign colors based on whether it's a black or white square
    always_comb begin
        if (is_black_square) begin
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