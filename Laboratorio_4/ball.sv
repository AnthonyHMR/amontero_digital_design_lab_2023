module ball(
	input logic vgaclk,
	input logic [9:0] x, y,
	output logic b_draw, b_square
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
	localparam B_SIZE = 16;			//16x16 pixels
	logic [CORDW-1:0] bx, by;  	//posición "ball"
	logic dx, dy;						//dirección: derecha/abajo
	logic [CORDW-1:0] spx = 1;  	//velocidad horizontal
	logic [CORDW-1:0] spy = 1;		//velocidad vertical
	
	//ball animation
	always_ff @(posedge vgaclk) begin
		if (animate) begin
			if (bx >= H_RES - (spx + B_SIZE)) begin	//borde derecho pantalla
				dx <= 1;
				bx <= bx - spx;
			end else if ((bx < spx)) begin					//borde izquierdao pantalla
				dx = 0;
				bx <= bx + spx;
			end else bx <= (dx) ? bx - spx : bx + spx;
			
			if (by >= V_RES - (spy + B_SIZE)) begin	//borde superior pantalla
				dy <= 1;
				by <= by - spy;
			end else if (by < spy) begin					//borde izquierdao pantalla
				dy = 0;
				by <= by + spy;
			end else by <= (dy) ? by - spy : by + spy;
		end		
	end
	
	//dibujamos "ball"
	always_comb begin
		b_draw = (x >= bx) && (x < bx + B_SIZE) && (y >= by) && (y < by + B_SIZE);
		b_square = (x > 220) && (x < 420) && (y > 190) && (y < 290);
	end
endmodule