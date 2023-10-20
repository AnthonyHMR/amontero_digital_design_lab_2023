module sub_tb();
    logic [3:0] A, B; 
	 logic [3:0] S;
	 logic Sign;

    sub4bits DUT(A, B, S,Sign);

    initial begin
        #10 A = 4'b1101; B = 4'b0001;
        
        #10 A = 4'b1000; B = 4'b0010;
        
        #10 A = 4'b1001; B = 4'b0011;
        
        #10 A = 4'b0011; B = 4'b1111;
		  
        #10; 
    end

endmodule 