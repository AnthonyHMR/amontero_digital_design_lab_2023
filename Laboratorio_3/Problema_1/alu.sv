module alu #(parameter N = 4)(A, B, ALUControl, Q, Ne, Z, V, C);

   input logic[N-1:0] A, B;
	input logic[3:0] ALUControl;
	output logic[N-1:0] Q;
	output logic Ne, Z, V, C;
	wire [N-1:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9;
	logic Co, Sign, MultV;
	
   adder4bits 		sumador				(A, B, I0, Co);
	sub4bits 		restador				(A, B, I1, Sign);
	multiplicacion	#(N) mult			(A, B, I2, MultV);
	division 		#(N) div				(A, B, I3);
	modulo 			#(N) residuo		(A, B, I4);
	andN 				#(N) andGate		(A, B, I5);
	orN 				#(N) orGate			(A, B, I6);
	xorN 				#(N) xorG			(A, B, I7);
	sll 				#(N) sll_module	(A, B, I8);
	srl 				#(N) srl_module	(A, B, I9);
	multiplexor 	#(N) muxGate		(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, ALUControl, Q);
	flagGenerator 	#(N) flags			(Q, ALUControl, Co, Sign, MultV, Ne, Z, V, C);
	
endmodule 