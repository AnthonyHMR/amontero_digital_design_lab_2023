module Contador (
  input clk,      // Reloj del sistema
  input rst,      // Señal de reinicio
  output reg [3:0] count // Valor del contador
);

  // Registro para almacenar el valor del contador
  always @(posedge clk, posedge rst) begin
    if (rst)
      count <= 4'b0000; // Reiniciar el contador en caso de reinicio
    else
      count <= count + 4'b0001; // Incrementar el contador cuando se presiona el botón
  end

endmodule