module adder1bit
(
	input logic A, B, Ci, //Entradas a sumar y bit de acarrreo de entrada
	output logic Co, S    //Salida y bit de acarreo de salida
);
    
    wire w1, w2, w3;
    xor G1(w1, A, B);
    xor G2(S, w1, Ci);
    and G3(w2, w1, Ci);
    and G4(w3, A, B);
    or G5(Co, w2, w3);

endmodule 