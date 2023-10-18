module MatrixGenerator_bombs (
  input [3:0] input_value, // Valor de entrada de 4 bits
  output reg [7:0][7:0] matrix
);
  integer i, j, k;
  integer random_value=1;
  integer ones_generated = 0;
  wire [15:0] random_number;
  
  // Módulo del generador de números aleatorios
  RandomNumberGenerator RNG (
    .random_number(random_number)
  );


	always @(posedge input_value) begin
		// Generar la matriz en función del valor de entrada
		for (i = 0; i < 8; i = i + 1) begin
		  for (j = 0; j < 8; j = j + 1) begin
			 if (ones_generated < input_value) begin
				if (random_number <= (ones_generated * 65535) / input_value) begin
					matrix[i][j] = 1; // Poner 1 si el valor aleatorio es menor que el valor de entrada
					ones_generated = ones_generated + 1;
				end else begin
					matrix[i][j] = 0; // De lo contrario, poner 0
				end
			 end else begin
				matrix[i][j] = 0; // De lo contrario, poner 0
			 end
		  end
		end
	end
	 
endmodule