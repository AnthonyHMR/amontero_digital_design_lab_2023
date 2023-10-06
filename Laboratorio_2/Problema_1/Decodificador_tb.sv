module Decodificador_tb;

    reg [3:0] bcd_input;
    wire [6:0] segment_output;

    Decodificador decoder (
        .bcd_in(bcd_input),
        .seg_out(segment_output)
    );

    initial begin
        
        for (int i = 0; i < 16; i = i + 1) begin
            bcd_input = i;
            #10;
        end
    end

endmodule