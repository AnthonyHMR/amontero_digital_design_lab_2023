module MaquinaSF_tb;

  // Definir los cables (wire) y registros (reg) necesarios
  reg clk;
  reg rst;
  reg start;
  reg bomb;
  reg win;
  reg play;

  wire inicio;
  wire start_game;
  wire loser;
  wire winner;

  // Instanciar la máquina de estados bajo prueba
  MaquinaSF uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .bomb(bomb),
    .win(win),
    .play(play),
    .inicio(inicio),
    .start_game(start_game),
    .loser(loser),
    .winner(winner)
  );

  // Generar un reloj de simulación
  always begin
    #5 clk = ~clk;
  end

  // Inicializar señales de entrada
  initial begin
    clk = 0;
    rst = 0;
    start = 0;
    bomb = 0;
    win = 0;
    play = 0;

    // Realizar una secuencia de prueba
    // Puedes cambiar los valores de las señales de entrada aquí para simular diferentes condiciones
    // Aquí hay un ejemplo de una secuencia de prueba simple
    #10 rst = 1;
    #10 rst = 0;
    #10 start = 1;
    #10 bomb = 1;
    #10 start = 0;
    #10 win = 1;
    #10 win = 0;
    #10 bomb = 1;
    #10 play = 1;
    #10 play = 0;

    // Terminar la simulación
    $finish;
  end

  // Agregar visualización de las señales de salida si es necesario
  // Puedes usar $display o $monitor para observar las señales de salida

endmodule