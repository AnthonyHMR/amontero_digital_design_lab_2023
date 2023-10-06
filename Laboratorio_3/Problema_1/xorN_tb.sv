module xorN_tb();
    logic [3:0] a, b, c;

    xorN DUT(a, b, c);

    initial begin
        #10 a = 4'b1111; b = 4'b1111;
        
        #10 a = 4'b0000; b = 4'b1111;
        
        #10 a = 4'b1010; b = 4'b1111;
        
        #10 a = 4'b0101; b = 4'b1111;
		  
        #10;
    end
endmodule 