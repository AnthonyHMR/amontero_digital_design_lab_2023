module MatrixGenerator_bombs_tb;
  reg [3:0] input_value = 4'b1111;
  wire [7:0][7:0] matrix;

  MatrixGenerator UUT (
    .input_value(input_value),
    .matrix(matrix)
  );

  // Inicialización
  initial begin
    $dumpfile("matrix_generator_tb.vcd");
    $dumpvars(0, MatrixGenerator_tb);

    #10; // Esperar un tiempo para el cambio en el reloj
    $display("Input Value: %d", input_value);
    $display("Matrix:");

    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $display("%d", matrix[i][j]);
      end
    end

    $finish;
  end

  // Simular el reloj
  always begin
    #5 input_value = input_value + 1;
  end

endmodule