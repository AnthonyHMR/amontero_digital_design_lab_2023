module Decodificador (
    input [3:0] bcd_in,
    output reg [6:0] seg_out
);

    always @(*)
        case (bcd_in)
														 //Representación hexadecimal
            4'b0000: seg_out = 7'b1000000; // 0
            4'b0001: seg_out = 7'b1111001; // 1
            4'b0010: seg_out = 7'b0100100; // 2
            4'b0011: seg_out = 7'b0110000; // 3
            4'b0100: seg_out = 7'b0011001; // 4
            4'b0101: seg_out = 7'b0010010; // 5
            4'b0110: seg_out = 7'b0000010; // 6
            4'b0111: seg_out = 7'b1111000; // 7
            4'b1000: seg_out = 7'b0000000; // 8
            4'b1001: seg_out = 7'b0010000; // 9
				4'b1010: seg_out = 7'b0001000; // A
            4'b1011: seg_out = 7'b0000011; // b
            4'b1100: seg_out = 7'b1000110; // C
            4'b1101: seg_out = 7'b0100001; // d
            4'b1110: seg_out = 7'b0000110; // E
            4'b1111: seg_out = 7'b0001110; // F
        endcase

endmodule

module top_module (
    input wire [3:0] bcd_input,
    output wire [6:0] segment_output
);

    wire [6:0] bcd_to_7seg_output;

    Decodificador decoder (
        .bcd_in(bcd_input),
        .seg_out(bcd_to_7seg_output)
    );

    assign segment_output = bcd_to_7seg_output;

endmodule