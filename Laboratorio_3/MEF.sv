module MEF (input logic btn_nxt, m, rst, clk, [2:0] bcs, 
				output logic [7:0] estado);

	logic [2:0] state, next_state;
	logic t0, lp;
	logic [7:0] mCounter;
	reg [24:0] up_pst;
	reg [24:0] nw_pst;
	
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
				3'b000: 
					if (x) next_state = 3'b001; 
					else next_state = 3'b000; //inicio
				3'b001: 
					begin
						regBarcos registroBarcos( bcs,nw_pst, clk, up_pst)
						if (x) next_state = 3'b010; 
						else next_state = 3'b001; //barco
					end
				3'b010: 
					begin//Jugador
						selecBarcos SeleccionarBarcos()
						if (t0) next_state = 3'b100; 
						else if (x) next_state = 3'b011;
						else next_state = 3'b010;
					end
				3'b011: 
					verifBarco verifDisparo()
					if (lp) next_state = 3'b110; 
					else next_state = 3'b100;//Revisa cuantos barcos quedan
				3'b100: 
					next_state = 3'b101;//PC
				3'b101:
					verifDisp verifDisparo()A
					if (lp) next_state = 3'b110; 
					else next_state = 3'b010;//Revision cuantos barcos quedan PC
				3'b110: 
					next_state = 3'b110;		
				default: next_state = 3'b000;
		endcase
	
endmodule