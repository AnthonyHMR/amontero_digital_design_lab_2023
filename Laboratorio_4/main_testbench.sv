module main_testbench;

  // Definir los cables (wire) y registros (reg) necesarios
  reg clk, rst, play, replay, select, mark;
  //reg [11:0] matrix [3:0][3:0];
  //reg [2:0] state;
  reg up_button, down_button, left_button, right_button;
  reg [3:0] switch_bomb;
  wire [6:0] bombs1, bombs2, p_bombs1, p_bombs2;
  wire vgaclk, hsync, vsync, sync_b, blank_b;
  wire [7:0] r, g, b;

  // Instanciar el módulo bajo prueba
  main uut (
    .clk(clk),
    .rst(rst),
    .play(play),
    .replay(replay),
    .select(select),
    .mark(mark),
    //.matrix(matrix),
    //.state(state),
    .up_button(up_button),
    .down_button(down_button),
    .left_button(left_button),
    .right_button(right_button),
    .switch_bomb(switch_bomb),
    .bombs1(bombs1),
    .bombs2(bombs2),
    .p_bombs1(p_bombs1),
    .p_bombs2(p_bombs2),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .sync_b(sync_b),
    .blank_b(blank_b),
    .r(r),
    .g(g),
    .b(b)
  );

  // Generar un reloj de simulación
  always begin
    #5 clk = ~clk;
  end

  // Inicializar señales de entrada
  initial begin
    clk = 0;
    rst = 0;
    play = 0;
    replay = 0;
    select = 0;
    mark = 0;
    // Inicializa las demás señales de entrada según sea necesario

    // Realizar una secuencia de prueba
    // Puedes cambiar los valores de las señales de entrada aquí para simular diferentes condiciones
    // Aquí hay un ejemplo de una secuencia de prueba simple
    #10 rst = 1;
    #10 rst = 0;
    #10 play = 1;
    #10 play = 0;
    // Repite o agrega más acciones según sea necesario

    // Terminar la simulación
    $finish;
  end

  // Agregar visualización de las señales de salida si es necesario
  // Puedes usar $display o $monitor para observar las señales de salida

endmodule