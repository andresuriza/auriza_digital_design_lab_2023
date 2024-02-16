module contador_regresivo(input clk, reset, dec, inc,
									output reg[5:0] out);
								  
//always @ (posedge clk) begin
//	if (!reset)
//		out <= 9;
//	
//	else begin
////		if (out == 0) begin
////		end
////		
////		else
////			out <= out - 1;
//	
//	end
//end

always @ (dec, inc) begin
	if (!dec)
		out <= out - 1;
		
	if (!inc)
		out <= out + 1;
	
end
	
endmodule