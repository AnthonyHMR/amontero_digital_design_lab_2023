module square_move(
	input logic vgaclk,
	input logic up_button, down_button, left_button, right_button, mark,
	input logic [9:0] x, y,
	output logic square_draw
);
//Ancho de bits en pantalla
	localparam CORDW = 10;	
	
	//tamaño de la pantalla
	localparam H_RES_FULL = 800;
	localparam V_RES_FULL = 525;
	localparam H_RES = 640;
	localparam V_RES = 480;
	
	logic animate; //Alto en 1 por cada clock tick en posición h o v
	always_comb animate = (y == V_RES && x == 0);
	
	//cuadro "ball"
	localparam B_SIZE = 80;			//16x16 pixels
	logic [CORDW-1:0] bx, by;  	//posición "ball"
	logic dx, dy;						//dirección: derecha/abajo
	logic flag = 1;
	logic [CORDW-1:0] spx = 80;  	//velocidad horizontal
	logic [CORDW-1:0] spy = 80;		//velocidad vertical
	
	//ball animation
	always_ff @(posedge vgaclk) begin
		if (animate) begin
			if (!left_button && (bx > 0) && flag) begin	//borde derecho pantalla
				dx <= 1;
				bx <= bx - spx;
				flag = 0;
			end else if (!right_button && (bx < H_RES - B_SIZE) && flag) begin					//borde izquierdao pantalla
				dx = 0;
				bx <= bx + spx;
				flag = 0;
			end else if (!up_button && (by > 0) && flag) begin	//borde superior pantalla
				dy <= 1;
				by <= by - spy;
				flag = 0;
			end else if (!down_button && (by < V_RES - B_SIZE) && flag) begin					//borde inferior pantalla
				dy = 0;
				by <= by + spy;
				flag = 0;
			end else if (left_button && right_button && up_button && down_button && !mark) begin
				flag = 1;
			end
		end		
	end
	
	//dibujamos "ball"
	always_comb begin
		square_draw = (x >= bx) && (x <= bx + B_SIZE) && (y >= by) && (y <= by + B_SIZE);
	end
endmodule