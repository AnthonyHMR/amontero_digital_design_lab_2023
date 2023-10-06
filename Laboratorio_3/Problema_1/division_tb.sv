module division_tb();
    logic [3:0] a, b, c;

    division DUT(a, b, c);

    initial begin
        #10 a = 4'b1101; b = 4'b1010;
        
        #10 a = 4'b1000; b = 4'b0010;
        
        #10 a = 4'b1001; b = 4'b0011;
        
        #10 a = 4'b1111; b = 4'b0011;
        
		  #10;
    end

endmodule 