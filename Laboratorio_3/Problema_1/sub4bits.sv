module sub4bits
(
	input logic[3:0] A, B,
	output logic [3:0] S,
	output logic Sign
);

   wire [4:1] C;
	logic [3:0] Q, Temp; //Complemento y resultado temporal de la suma
	
   adder1bit Bit0(A[0], ~B[0], 1'b1, C[1], Temp[0]);
	adder1bit Bit1(A[1], ~B[1], C[1], C[2], Temp[1]);
	adder1bit Bit2(A[2], ~B[2], C[2], C[3], Temp[2]);
	adder1bit Bit3(A[3], ~B[3], C[3], Sign, Temp[3]);
	
    compA2 compl(Temp, Q);
	
    always_comb begin
		if(Sign == 0)//Si es negativo
			begin
				S <= Q;//Al resultado se le aplica complemento A2 
			end
		else
			S <= Temp;//Resultado Positivo
	end
	
endmodule 