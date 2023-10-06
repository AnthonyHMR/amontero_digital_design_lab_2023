module multiplicacion_tb();
    logic [3:0] a, b; 
	logic [3:0]c;
	logic co;

    multiplicacion DUT(a, b, c, co);

    initial begin
        #10 a = 4'b1101; b = 4'b0001;
        
        #10 a = 4'b0100; b = 4'b0010;
        
        #10 a = 4'b0011; b = 4'b0011;
        
        #10 a = 4'b1000; b = 4'b0111;
        
		  #10;
		  
    end
    
endmodule 