module  multiplexor #(parameter N = 4)
(
		input logic [N:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9,
		input logic [3:0] ALUControl,
		output logic [N:0] Q
	);
	
    always_comb begin
		case(ALUControl)
			'b0000:Q <= I0;
			'b0001:Q <= I1;
			'b0010:Q <= I2;
			'b0011:Q <= I3;
			'b0100:Q <= I4;
			'b0101:Q <= I5;
			'b0110:Q <= I6;
			'b0111:Q <= I7;
			'b1000:Q <= I8;
			'b1001:Q <= I9;
			default:Q <= I0;
		endcase
	end
endmodule