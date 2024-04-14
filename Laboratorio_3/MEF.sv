module MEF (input logic m, rst, clk, x, y, 
					output logic [7:0] estado);

	logic [3:0] state, next_state;
	logic t0, lp;
	logic [7:0] mCounter;
	
	clkCounter counter(clk, rst, t0);

	//actual state logic
	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			state = 4'b0000;
			mCounter = 'h0;
		end
		
		else begin
			//output logic 
			case(t0)
			  0 : estado = mCounter;
			  1 : estado = 'hFF;
			  default: estado = 0;
			endcase
			
			state = next_state;	
			
		end
	end
		
	//next state logic
	always_comb 
		case(state)
				4'b0000: if (x) next_state = 4'b0001; else next_state = 4'b0000; //inicio
				4'b0001: if (x) next_state = 4'b0001; else next_state = 4'b0010; //barco
				4'b0010: if (x) next_state = 4'b00011; else next_state = 4'b0010; // Posicion
				4'b0011: begin//Jugador
								if (t0) next_state = 4'b0111; 
								else if (x) next_state = 4'b0100;
								else next_state = 4'b0011;
							end
				4'b0100: next_state = 4'b0101;//Revisa casilla
				4'b0101: next_state = 4'b0110;//Revisa si pego barco
				4'b0110: if (lp) next_state = 4'b1100; else next_state = 4'b0111;//Revisa cuantos barcos quedan
				4'b0111: next_state = 4'b1000;//PC
				4'b1000: next_state = 4'b1001;//Casilla PC
				4'b1001: next_state = 4'b1010;//Revision barco PC
				4'b1011: if (lp) next_state = 4'b1100; else next_state = 4'b0011;//Revision cuantos barcos quedan PC
				4'b1100: next_state = 4'b1100;		
				default: next_state = 4'b0000;
		endcase
	
endmodule