module flagGenerator #(parameter M = 4)
(
	input logic [M-1:0] Q,
	input logic [3:0] ALUControl,
	input logic Cout, Sign, Mult,
	output logic Z, N, V, C
);

    always_comb begin
      Z<=1'b0;
		N<=1'b0;
		C<=1'b0;
		V<=1'b0;
		
      if(ALUControl==4'b0001)
			N <= ~(Sign);
      else if(ALUControl==4'b0000)
         begin
				C<=Cout;
				V<=Cout;
		end
		else if(ALUControl==4'b0010)
            V<=Mult;
		else if(Q==4'b0000)
            Z<=1'b1;
    end

endmodule