module modulo #(parameter N = 4)
(
	input logic [N-1:0] A, B,
	output logic [N-1:0] C
);
	
	always_comb begin
		C = A % B;
	end
	
endmodule