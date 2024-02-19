module seven_seg_decoder6b(input logic a,
								 output logic [6:0] seg_high, seg_low);
	always_comb
		case (a)
				0 : begin
						seg_low = 7'b0000001;
						seg_high = 7'b0111000; 
					 end
				1 : begin
						seg_low = 7'b1001111;
						seg_high = 7'b0111000; 
					 end
				2 : begin
						seg_low = 7'b0010010;
						seg_high = 7'b0111000; 
					 end
				3 : begin
						seg_low = 7'b0000110;
						seg_high = 7'b0111000; 
					 end
				4 : begin
						seg_low = 7'b1001100;
						seg_high = 7'b0111000; 
					 end
				5 : begin
						seg_low = 7'b0100100;
						seg_high = 7'b0111000; 
					 end
				6 : begin
						seg_low = 7'b0100000;
						seg_high = 7'b0111000; 
					 end
				7 : begin
						seg_low = 7'b0001111;
						seg_high = 7'b0111000; 
					 end
				8 : begin 
						seg_low = 7'b0000000;
						seg_high = 7'b0111000; 
					 end
				9 : begin
						seg_low = 7'b0000100;
						seg_high = 7'b0111000; 
					 end
				10 : begin
						seg_low = 7'b0001000;
						seg_high = 7'b0111000; 
					  end
				11 : begin
						seg_low = 7'b1100000;
						seg_high = 7'b0111000; 
					  end
				12 : begin
						seg_low = 7'b0110001;
						seg_high = 7'b0111000; 
					  end
				13 : begin
						seg_low = 7'b1000010;
						seg_high = 7'b0111000; 
					  end
				14 : begin
						seg_low = 7'b0110000;
						seg_high = 7'b0111000; 
					  end
				15 : begin
						seg_low = 7'b0111000;
						seg_high = 7'b0111000; 
					  end
				16 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				17 :  begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				18 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				19 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				20 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				21 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				22 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				23 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				24 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				25 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				26 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				27 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				28 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				29 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				30 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				31 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				32 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				33 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				34 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				35 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				36 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				37 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				38 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				39 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				40 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				41 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				42 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				43 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				44 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				45 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				46 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				47 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				48 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				49 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				50 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				51 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				52 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				53 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				54 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				56	: begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				57 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				58 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				59 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				60 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				61 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				62 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				63 : begin 
						seg_low = 7'b0111000; 
						seg_high = 7'b0111000; 
					end
				default: begin
					seg_low = 7'b1111111;
					seg_high = 7'b1111111;
					end
		endcase
		
endmodule