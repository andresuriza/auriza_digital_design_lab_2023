module contador_regresivo(input logic[5:0]num,
									input logic reset, 
									input logic dec,
								   output logic[5:0] out,
								   output logic[6:0] seg);

always_comb begin
	case (out)
			0 : seg = 7'b0000001;
			1 : seg = 7'b1001111;
			2 : seg = 7'b0010010;
			3 : seg = 7'b0000110;
			4 : seg = 7'b1001100;
			5 : seg = 7'b0100100;
			6 : seg = 7'b0100000;
			7 : seg = 7'b0001111;
			8 : seg = 7'b0000000;
			9 : seg = 7'b0000100;
			10 : seg = 7'b0001000;
			11 : seg = 7'b1100000;
			12 : seg = 7'b0110001;
			13 : seg = 7'b1000010;
			14 : seg = 7'b0110000;
			15 : seg = 7'b0111000;
			default: seg = 7'b1111111;
	endcase
end
									
always @ (reset, dec) begin

		
	if (reset == 0)
		out = num;

	if (dec == 0) begin
		//if (out >= 0)
		out <= out -1;
	end
end
	
endmodule