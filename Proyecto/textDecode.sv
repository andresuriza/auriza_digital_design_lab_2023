module textDecode(input logic [7:0] charCode, output logic [63:0] pixelsExternal);
	logic [7:0] pixels[7:0];
	
	assign pixelsExternal[7:0] = pixels[0];
	assign pixelsExternal[15:8] = pixels[1];
	assign pixelsExternal[23:16] = pixels[2];
	assign pixelsExternal[31:24] = pixels[3];
	assign pixelsExternal[39:32] = pixels[4];
	assign pixelsExternal[47:40] = pixels[5];
	assign pixelsExternal[55:48] = pixels[6];
	assign pixelsExternal[63:56] = pixels[7];
	
	always_comb begin
		case(charCode[7:0])
			// A
			 8'h61: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b10000100;
			 end
			 // B
			 8'h62: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11110000;
				pixels[2] = 8'b10001000;
				pixels[3] = 8'b10001000;
				pixels[4] = 8'b11111000;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			 end
			 // C
			 8'h63: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b01111110;
			 end
			 // D
			 8'h64: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111000;
				pixels[2] = 8'b10000100;
				pixels[3] = 8'b10000100;
				pixels[4] = 8'b10000100;
				pixels[5] = 8'b10000100;
				pixels[6] = 8'b10000100;
				pixels[7] = 8'b11111000;
			 end
			 // E
			 8'h65: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			 end
			 // F
			  8'h66: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			 end
			 // G
			 8'h67: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 // H
			 8'h68: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111110;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			 end
			 // I
			 8'h69: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b11111110;
			 end
			 // J
			 8'h6A: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00001000;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00001000;
				pixels[5] = 8'b10001000;
				pixels[6] = 8'b10001000;
				pixels[7] = 8'b01110000;
			 end
			 // K
			 8'h6B: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10010000;
				pixels[2] = 8'b10100000;
				pixels[3] = 8'b11000000;
				pixels[4] = 8'b11000000;
				pixels[5] = 8'b10100000;
				pixels[6] = 8'b10010000;
				pixels[7] = 8'b10001000;
			 end
			 // L
			 8'h6C: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000000;
				pixels[2] = 8'b10000000;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b10000000;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b11111110;
			 end
			 // M
			 8'h6D: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000110;
				pixels[3] = 8'b10101010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b10000010;
			 end
			 // N
			 8'h6E: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b11000010;
				pixels[3] = 8'b10100010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b10000010;
			 end
			 // O
			 8'h6F: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 // P
			8'h70: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10000000;
				pixels[6] = 8'b10000000;
				pixels[7] = 8'b10000000;
			 end
			 // Q
			 8'h71: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111110;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b10001010;
				pixels[6] = 8'b10000110;
				pixels[7] = 8'b01111110;
			 end
			 // R
			 8'h72: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b11111100;
				pixels[5] = 8'b10011000;
				pixels[6] = 8'b10001100;
				pixels[7] = 8'b10000110;
			 end
			 // S
			 8'h73: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000000;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b00000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b01111100;
			 end
			 // T
			 8'h74: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00010000;
				pixels[3] = 8'b00010000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00010000;
				pixels[6] = 8'b00010000;
				pixels[7] = 8'b00010000;
			 end
			 // U
			 8'h75: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10000010;
				pixels[5] = 8'b10000010;
				pixels[6] = 8'b10000010;
				pixels[7] = 8'b11111110;
			 end
			 // V
			 8'h76: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b01000100;
				pixels[4] = 8'b01000100;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b00101000;
				pixels[7] = 8'b00010000;
			 end
			 // W
			 8'h77: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b10000010;
				pixels[3] = 8'b10000010;
				pixels[4] = 8'b10010010;
				pixels[5] = 8'b01010100;
				pixels[6] = 8'b01010100;
				pixels[7] = 8'b00101000;
			 end
			 // X
			 8'h78: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00101000;
				pixels[6] = 8'b01000100;
				pixels[7] = 8'b10000010;
			 end
			 // Y
			 8'h79: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b10000010;
				pixels[2] = 8'b01000100;
				pixels[3] = 8'b00101000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b10000000;
			 end
			 // Z
			 8'h7A: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000100;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11111110;
			end
			// Blank
			8'h20: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
			// Simbolo
			8'h24: begin
				pixels[0] = 8'b00010000;
				pixels[1] = 8'b01111100;
				pixels[2] = 8'b10010010;
				pixels[3] = 8'b10010000;
				pixels[4] = 8'b01111100;
				pixels[5] = 8'b00010010;
				pixels[6] = 8'b10010010;
				pixels[7] = 8'b01111100;
			end
			default: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
			end
		endcase
	end
		
endmodule