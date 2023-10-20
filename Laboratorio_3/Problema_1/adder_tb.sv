module adder_tb();

    logic [3:0] A, B; 
    logic [4:0] S;

    adder4bits DUT(A, B, S);

    initial begin
        #10 A = 4'b0000; B = 4'b0001;
        
        #10 A = 4'b1101; B = 4'b0001;
        
        #10 A = 4'b1000; B = 4'b0010;
        
        #10 A = 4'b1001; B = 4'b0011;
		
		  #10;
    end
    
endmodule 