module srl #(parameter N=4)
(
	input logic [N-1:0] A, B,
	output logic [N-1:0] S
);

	always_comb begin
        S = A >> B;
   end
	
endmodule