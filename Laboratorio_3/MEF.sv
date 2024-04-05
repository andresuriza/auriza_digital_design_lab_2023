module MEF (input logic m, rst, clk, x, y, 
					output logic [7:0] estado);

	logic [2:0] state, next_state;
	logic t0, jgdr, pc;
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
			
		end
	end
		
	//next state logic
	always_comb 
		case(state)
				3'b000: if (x) next_state = 3'b001; else next_state = 3'b000; //inicio
				3'b001: if (x) next_state = 3'b001; else next_state = 3'b010; //barco
				3'b010: if (x) next_state = 3'b011; else next_state = 3'b010; // Posicion
				3'b011: begin 
							if (t0) next_state = 3'b101; 
							else if (x) next_state=3'b100;
							else next_state = 3'b011; 
						  end // Jugador
				3'b100: 
							if (jgdr) next_state = 3'b011; 
							else if (pc) next_state = 3'b101;
							else next_state = 3'b110;
						  //Revision
				3'b101: begin 
							if (t0) next_state = 3'b011; 
							else if (x) next_state=3'b100;
							else next_state = 3'b101; 
						  end // PC
				3'b110: next_state = 3'b110;
				default: next_state = 3'b000;
		endcase
	
endmodule