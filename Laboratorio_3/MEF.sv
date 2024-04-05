module MEF_Tarea2(input logic m, rst, clk, 
					output logic [7:0] estado);

	logic [2:0] state, next_state;
	logic t0;	
	logic [7:0] mCounter;
	
	clkCounter counter(clk, rst, t0);

	//actual state logic
	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			state = 3'b000;
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
			
			if (next_state == 3'b001) begin
				mCounter = mCounter + 1;
			end
		end
	end
		
	//next state logic
	always_comb begin
		case(state)
			3'b000: if (m) next_state = 3'b001; else next_state = 3'b000; //inicio
			3'b001: if (m) next_state = 3'b010; else next_state = 3'b011; //barco
			3'b010: if (m) next_state = 3'b011; else next_state = 3'b010; // Posicion
			3'b011: if (t0) next_state = 3'b011; else if (m) next_state = 3'b100; // Jugador
			3'b100: if (m) next_state = 3'b101; else next_state = 3'b011; //Revision
			3'b101: next_state = 3'b000; //Fin
			default: next_state = 3'b000;
		endcase
	end
endmodule