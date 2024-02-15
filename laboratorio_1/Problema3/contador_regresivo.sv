module contador_regresivo(output reg [3:0] Count,
								  input wire clock, reset);
								  
always @ (posedge clock or negedge reset)
	begin: COUNTER
		if (!reset)
			Count <= 0;
		else
			Count <= Count+1;
	end
	
endmodule