module  compA2
(
	input logic[3:0] A,
	output logic [3:0] S
);

	wire Co;
	adder4bits Bit0(~A, 4'b0001, S, Co);

endmodule