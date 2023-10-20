module RandomNumberGenerator (
  output reg [15:0] random_number // Número aleatorio de 16 bits
);

  reg [15:0] seed; // Semilla del generador

  always @(*) begin
      // Generador congruencial lineal (parámetros arbitrarios)
      seed <= (seed * 1103515245 + 12345) & 16'h7FFFFFFF; // & para mantener 31 bits
      random_number <= seed;
  end

endmodule