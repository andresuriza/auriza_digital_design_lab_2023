module to_7seg (input logic [7:0]num,
					 output logic [6:0]seg1, seg2);
	
	
	always_comb
		case (num)
				0 : begin 
					seg1 = 7'b0000001;
					seg2 = 7'b0000001;
					end
				1 : begin 
					seg1 = 7'b1001111;
					seg2 = 7'b0000001;	
					end
				2 : begin 
					seg1 = 7'b0010010;
					seg2 = 7'b0000001;
					end
				3 : begin 
					seg1 = 7'b0000110; 
					seg2 = 7'b0000001;
					end
				4 : begin 
					seg1 = 7'b1001100; 
					seg2 = 7'b0000001;
					end
				5 : begin 
					seg1 = 7'b0100100; 
					seg2 = 7'b0000001;
					end
				6 : begin 
					seg1 = 7'b0100000; 
					seg2 = 7'b0000001;
					end
				7 : begin 
					seg1 = 7'b0001111; 
					seg2 = 7'b0000001;
					end
				8 : begin 
					seg1 = 7'b0000000; 
					seg2 = 7'b0000001;
					end
				9 : begin 
					seg1 = 7'b0000100; 
					seg2 = 7'b0000001;
					end
				10 : begin 
					seg1 = 7'b0001000; 
					seg2 = 7'b0000001;
					end
				11 : begin 
					seg1 = 7'b1100000; 
					seg2 = 7'b0000001;
					end
				12 : begin 
					seg1 = 7'b0110001; 
					seg2 = 7'b0000001;
					end
				13 : begin 
					seg1 = 7'b1000010; 
					seg2 = 7'b0000001;
					end
				14 : begin 
					seg1 = 7'b0110000; 
					seg2 = 7'b0000001;
					end
				15 : begin 
					seg1 = 7'b0111000; 
					seg2 = 7'b0000001;
					end
				16 : begin 
					seg1 = 7'b0000001;
					seg2 = 7'b1001111;
					end
				17 : begin 
					seg1 = 7'b1001111;
					seg2 = 7'b1001111;
					end
				18 : begin 
					seg1 = 7'b0010010;
					seg2 = 7'b1001111;
					end
				19 : begin 
					seg1 = 7'b0000110;
					seg2 = 7'b1001111;
					end
				20 : begin 
					seg1 = 7'b1001100;
					seg2 = 7'b1001111;
					end
				21 : begin 
					seg1 = 7'b0100100;
					seg2 = 7'b1001111;
					end
				22 : begin 
					seg1 = 7'b0100000;
					seg2 = 7'b1001111;
					end
				23 : begin 
					seg1 = 7'b0001111;
					seg2 = 7'b1001111;
					end
				24 : begin 
					seg1 = 7'b0000000;
					seg2 = 7'b1001111;
					end
				25 : begin 
					seg1 = 7'b0000100;
					seg2 = 7'b1001111;
					end
				26 : begin 
					seg1 = 7'b0001000;
					seg2 = 7'b1001111;
					end
				27 : begin 
					seg1 = 7'b1100000;
					seg2 = 7'b1001111;
					end
				28 : begin 
					seg1 = 7'b0110001;
					seg2 = 7'b1001111;
					end
				29 : begin 
					seg1 = 7'b1000010;
					seg2 = 7'b1001111;
					end
				30 : begin 
					seg1 = 7'b0110000;
					seg2 = 7'b1001111;
					end
				31 : begin 
					seg1 = 7'b0111000;
					seg2 = 7'b1001111;
					end

				32 : begin 
					seg1 = 7'b0000001;
					seg2 = 7'b0010010;
					end
				33 : begin 
					seg1 = 7'b1001111;
					seg2 = 7'b0010010;
					end
				34 : begin 
					seg1 = 7'b0010010;
					seg2 = 7'b0010010;
					end
				35 : begin 
					seg1 = 7'b0000110;
					seg2 = 7'b0010010;
					end
				36 : begin 
					seg1 = 7'b1001100;
					seg2 = 7'b0010010;
					end
				37 : begin 
					seg1 = 7'b0100100;
					seg2 = 7'b0010010;
					end
				38 : begin 
					seg1 = 7'b0100000;
					seg2 = 7'b0010010;
					end
				39 : begin 
					seg1 = 7'b0001111; 
					seg2 = 7'b0010010;
					end
				40 : begin 
					seg1 = 7'b0000000;
					seg2 = 7'b0010010;
					end
				41 : begin 
					seg1 = 7'b0000100; 
					seg2 = 7'b0010010;
					end
				42 : begin 
					seg1 = 7'b0001000;
					seg2 = 7'b0010010;
					end
				43 : begin 
					seg1 = 7'b1100000;
					seg2 = 7'b0010010;
					end
				44 : begin 
					seg1 = 7'b0110001;
					seg2 = 7'b0010010;
					end
				45 : begin 
					seg1 = 7'b1000010;
					seg2 = 7'b0010010;
					end
				46 : begin 
					seg1 = 7'b0110000;
					seg2 = 7'b0010010;
					end
				47 : begin 
					seg1 = 7'b0111000;
					seg2 = 7'b0010010;
					end

				48 : begin 
					seg1 = 7'b0000001; 
					seg2 = 7'b0000110;
					end
				49 : begin 
					seg1 = 7'b1001111;
					seg2 = 7'b0000110;
					end
				50 : begin 
					seg1 = 7'b0010010; 
					seg2 = 7'b0000110;
					end
				51 : begin 
					seg1 = 7'b0000110;
					seg2 = 7'b0000110;
					end
				52 : begin 
					seg1 = 7'b1001100; 
					seg2 = 7'b0000110;
					end
				53 : begin 
					seg1 = 7'b0100100;
					seg2 = 7'b0000110;
					end
				54 : begin 
					seg1 = 7'b0100000;
					seg2 = 7'b0000110;
					end
				55 : begin 
					seg1 = 7'b0001111;
					seg2 = 7'b0000110;
					end
				56 : begin 
					seg1 = 7'b0000000;
					seg2 = 7'b0000110;
					end
				57 : begin 
					seg1 = 7'b0000100;
					seg2 = 7'b0000110;
					end
				58 : begin 
					seg1 = 7'b0001000;
					seg2 = 7'b0000110;
					end
				59 : begin 
					seg1 = 7'b1100000;
					seg2 = 7'b0000110;
					end
				60 : begin 
					seg1 = 7'b0110001;
					seg2 = 7'b0000110;
					end
				61 : begin 
					seg1 = 7'b1000010;
					seg2 = 7'b0000110;
					end
				62 : begin 
					seg1 = 7'b0110000;
					seg2 = 7'b0000110;
					end
				63 : begin 
					seg1 = 7'b0111000;
					seg2 = 7'b0000110;
					end
				default: begin
						seg1 = 7'b1111111;
						seg2 = 7'b0000001;
		end
	endcase

endmodule