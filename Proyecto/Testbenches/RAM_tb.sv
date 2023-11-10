`timescale 1ps/1ps

module RAM_tb;
  // Parámetros
  parameter N = 32;  // Tamaño de datos de 32 bits
  parameter M = 32;  // Tamaño de direcciones de 5 bits
  parameter MEM_DEPTH = 32;  // Profundidad de memoria de 32 palabras

  // Señales de prueba
  reg [M-1:0] address;
  reg clock = 0;
  reg [N-1:0] data;
  reg wren;
  wire [N-1:0] q;

  // Instancia del módulo RAM
  RAM ram_inst (
    .address(address),
    .clock(clock),
    .data(data),
    .wren(wren),
    .q(q)
  );
  
  // Clock generation
  always #5 clock = ~clock;

  // Inicialización
  initial begin	 
	 #100;
	 
	 address = 0;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;

	 address = 1;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 2;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 3;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 4;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 5;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 6;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 7;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;

	 $display("_________________________________________________");
	 $display("_________________________________________________");
	 
	 address = 0;
    data = 32'd369;
    wren = 1'b1;
	 #100;
	 $display("Guarda dato: data = %d", data);
	 $display("En la direccion: address = %d", address);

    #100;
	 
	 address = 0;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 1;
    data = 32'd123;
    wren = 1'b1;
	 #100;
	 $display("Guarda dato: data = %d", data);
	 $display("En la direccion: address = %d", address);

    #100;
	 
	 address = 1;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 2;
    data = 32'd999;
    wren = 1'b1;
	 #100;
	 $display("Guarda dato: data = %d", data);
	 $display("En la direccion: address = %d", address);

    #100;
	 
	 address = 2;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);


	 $display("_________________________________________________");
	 $display("_________________________________________________");
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 0;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;

	 address = 1;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");
	 
	 #100;
	 
	 address = 2;
    wren = 1'b0;
	 #100;
	 $display("Dato de salida: q = %d", q);
	 $display("En la direccion: address = %d", address);
	 
	 
	 $display("_________________________________________________");

    
    $finish;
  end
endmodule
