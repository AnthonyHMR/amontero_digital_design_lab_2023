module multiplicacion #(parameter N = 4)
(
	input logic [N-1:0] A, B,
	output logic [3:0] C,
	output logic Co
);
	
	logic [(2*N)-1:0]tem;

	assign tem = A * B;

	assign C = tem[3:0];
	
	always_comb begin
		if(tem > 4'b1111)
			begin
				Co<=1'b1;
			end			
		else
			Co<=1'b0;
	end
			
endmodule