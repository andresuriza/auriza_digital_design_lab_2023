module MEF (input logic btn_nxt, m, rst, clk, 
				input logic [2:0] bcs, 
				output logic [7:0] estado);

	logic [2:0] state, next_state;
	logic t0, lpj, lppc;
	logic [7:0] mCounter;
	reg [24:0] up_pst_pc, up_pst_j, dspr_j, tblr_j, dspr_pc, tblr_pc;
	reg [24:0] nw_ps_pc, nw_pst_j, nw_tblr_j, nw_tblr_pc;
	registroBarcos regBarcosJ(bcs,nw_pst_j, clk, up_pst_j);
	clkCounter counter(clk, rst, t0);
	verifDisparo verifBarcoJgdr(dspr_j, tblr_j, clk, nw_tblr_j);
	registroBarcos regBarcosPC(bcs,nw_pst_pc, clk, up_pst_pc);
	verifDisparo verifBarcoPC(dspr_pc, tblr_pc, clk, nw_tblr_pc);
	vidaBarco vdaJgdr(nw_tblr_pc, clk, lpj);
	vidaBarco vdaBrcJ(nw_tblr_j, clk, lppc);
	

	

	//actual state logic
	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			state = 3'b000;
		end
		
		else begin
			//output logic
			
			state = next_state;	
			
		end
	end
		
	//next state logic
	always_comb 
		case(state)
				3'b000: 
					if (btn_nxt) next_state = 3'b001; 
					else next_state = 3'b000; //inicio
				3'b001:
					begin
					  if (btn_nxt) 
							next_state = 3'b010; 
					  else 
							next_state = 3'b001; //barco
					end	
				3'b010: 
					begin//Jugador
						if (t0) next_state = 3'b100; 
						else if (btn_nxt) next_state = 3'b011;
						else next_state = 3'b010;
					end
				3'b011: 
					begin
						if (lpj) next_state = 3'b110; 
						else next_state = 3'b100;//Revisa barcos 
					end
				3'b100: 
					begin
						next_state = 3'b101;//PC
					end
				3'b101:
					begin
						if (lppc) next_state = 3'b111; 
						else next_state = 3'b010;//Revision cuantos barcos quedan PC
					end
				3'b110: 
					next_state = 3'b110;//Gano Jugador
				3'b111: 
					next_state = 3'b111;//Gano PC
				default: next_state = 3'b000;
		endcase
	
endmodule