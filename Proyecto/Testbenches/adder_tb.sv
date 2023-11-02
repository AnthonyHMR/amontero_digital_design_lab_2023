module adder_tb;

  // Parameters
  parameter WIDTH = 8;
  
  // Inputs
  logic [WIDTH-1:0] a, b;
  
  // Outputs
  logic [WIDTH-1:0] y;
  
  // Instantiate the adder module
  adder #(WIDTH) u_adder (
    .a(a),
    .b(b),
    .y(y)
  );

  always begin
    #5 a = $random;
    #5 b = $random;
  end

  // Monitor the output
  always @(posedge y) begin
    $display("a = %d, b = %d, y = (a+b) = %d", a, b, y);
  end

  initial begin
    #200 $finish;
  end

endmodule