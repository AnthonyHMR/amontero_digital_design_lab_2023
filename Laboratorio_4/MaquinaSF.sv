module MaquinaSF(input clk, rst, start, bomb, win, play, output incio, start_game, loser, winner);

logic [1:0] state, next_state;

//actual state logic
always_ff @(posedge clk or posedge rst)
	if (rst) state = 2'b00;
	else
		state = next_state;

//next state logic
always_comb
	case(state)
		2'b00: if (start) next_state = 2'b01;else next_state = 2'b00;
		2'b01: if (bomb) next_state = 2'b10;else if (win) next_state = 2'b11; else next_state = 2'b01;
		2'b10: if (play) next_state = 2'b00; else next_state = 2'b10;
		2'b11: if (play) next_state = 2'b00; else next_state = 2'b11;
		default: next_state = 2'b00;
	endcase

//output logic

assign inicio = (state == 2'b00);
assign start_game = (state == 2'b01);
assign loser = (state == 2'b10);	
assign winner = (state == 2'b11);


endmodule