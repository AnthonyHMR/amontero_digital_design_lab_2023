module orN_tb();
    logic [3:0] A,B,S;

    orN DUT(A,B,S);

    initial begin
        #10 A = 4'b0000; B = 4'b0000;
        
        #10 A = 4'b0000; B = 4'b1111;
        
        #10 A = 4'b1101; B = 4'b1010;
        
        #10 A = 4'b1010; B = 4'b1011;
		  
        #10;
    end
    
endmodule