module topLevel
(
	input logic[3:0] A, B,
	input logic[3:0] S,
	output logic[6:0] Disp1, Disp2,
	output logic N, Z, V, C
);
	
   logic [3:0] Q;// Resultado Binario
	wire [3:0] w1,w2; //Decenas y Unidades del resultado
	logic Co;

	alu 			#(4) 	alu_module	(A, B, S, Q, N, Z, V, C);
	division 	#(4) 	div_module	(Q, 4'b1010, w1);				//Calcular Decenas
	modulo 		#(4) 	mod_module	(Q, 4'b1010, w2);				//Calcular unidades
	decoderBCD 	decodificador1		(w1, Disp1);					// Decodificador para Decenas
	decoderBCD 	decodificador2		(w2, Disp2);					// Decodificador para Unidades
    
endmodule 