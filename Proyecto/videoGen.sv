// 640x480 
module videoGen(input logic [9:0] x, y,
					input logic [7:0] q_b,
					input logic ramClk,
					output logic [7:0] r, g, b,
					output logic [9:0] address_b);
	logic [63:0] pixelLineArr [656:0]; // Parametrizable
	logic [7:0] pixelsArr [656:0][7:0]; // Parametrizable
	logic pixelOnArr [656:0]; // Parametrizable
	logic [656:0] txtArray;
	logic [7:0] tempMem[656:0];
	logic [656:0] subr = 0;
	logic [9:0] cursorS = 656;
	logic subrEn = 0;
	
	genvar i, j;
	logic [9:0] z = 0;
	logic [7:0] charCode;
	logic [7:0] pixels[7:0];

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

	assign address_b = z;
	assign charCode = q_b;

	always_ff @(posedge ramClk) begin
		if (z < 656) begin
			pixelLineArr[656-z][7:0] = pixels[0];
			pixelLineArr[656-z][15:8] = pixels[1];
			pixelLineArr[656-z][23:16] = pixels[2];
			pixelLineArr[656-z][31:24] = pixels[3];
			pixelLineArr[656-z][39:32] = pixels[4];
			pixelLineArr[656-z][47:40] = pixels[5];
			pixelLineArr[656-z][55:48] = pixels[6];
			pixelLineArr[656-z][63:56] = pixels[7];
			z = z+1;
		end
		else begin
			pixelLineArr[656-z][7:0] = pixels[0];
			pixelLineArr[656-z][15:8] = pixels[1];
			pixelLineArr[656-z][23:16] = pixels[2];
			pixelLineArr[656-z][31:24] = pixels[3];
			pixelLineArr[656-z][39:32] = pixels[4];
			pixelLineArr[656-z][47:40] = pixels[5];
			pixelLineArr[656-z][55:48] = pixels[6];
			pixelLineArr[656-z][63:56] = pixels[7];
			z = 0;
		end
		
		if (q_b == 'h24) begin
			subrEn = 1;
		end
		
		else begin
			subrEn = 0;
		end
		
		if (subrEn) begin
			if (q_b != 'h20) begin
				subr[z] = 1;
			end
			else begin
				subrEn = 0;
			end
		end
	end
	
	generate
		for (j=0; j < 657; j++) begin : gen
			assign pixelsArr[656-j][0] = pixelLineArr[656-j][7:0];
			assign pixelsArr[656-j][1] = pixelLineArr[656-j][15:8];
			assign pixelsArr[656-j][2] = pixelLineArr[656-j][23:16];
			assign pixelsArr[656-j][3] = pixelLineArr[656-j][31:24];
			assign pixelsArr[656-j][4] = pixelLineArr[656-j][39:32];
			assign pixelsArr[656-j][5] = pixelLineArr[656-j][47:40];
			assign pixelsArr[656-j][6] = pixelLineArr[656-j][55:48];
			assign pixelsArr[656-j][7] = pixelLineArr[656-j][63:56];
			assign pixelOnArr[656-j] = (pixelsArr[656-j][y[2:0]][~x[2:0]]);
		end
    endgenerate

	generate
			  for (i=0; i < 78; i++) begin : genPos
				assign txtArray[656-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 0 & y < 8); // Diferencia de 8
			  end
  
			  for (i=0; i < 78; i++) begin : genPos2
				assign txtArray[578-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 16 & y < 24); // Diferencia de 8
			  end
  
			  for (i=0; i < 78; i++) begin : genPos3
				assign txtArray[500-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 32 & y < 40); // Diferencia de 8
			  end
 

			  for (i=0; i < 78; i++) begin : genPos4
				assign txtArray[422-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 48 & y < 56); // Diferencia de 8
			  end

			  for (i=0; i < 78; i++) begin : genPos5
				assign txtArray[344-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 64 & y < 72); // Diferencia de 8
			  end
 
	
			  for (i=0; i < 78; i++) begin : genPos6
				assign txtArray[266-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 80 & y < 88); // Diferencia de 8
			  end


			  for (i=0; i < 78; i++) begin : genPos7
				assign txtArray[188-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 96 & y < 104); // Diferencia de 8
			  end

			  for (i=0; i < 78; i++) begin : genPos8
				assign txtArray[110-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 112 & y < 120); // Diferencia de 8
			  end
			  
			  for (i=0; i < 33; i++) begin : genPos9
				assign txtArray[32-i] = (x >= 16+(8*i) & x < 16+(8*(i+1)) & y >= 128 & y < 136); // Diferencia de 8
			  end
  endgenerate
  	

assign r = 
					txtArray[656] ? {8{pixelOnArr[656]}}:
					txtArray[655] ? {8{pixelOnArr[655]}}:
					txtArray[654] ? {8{pixelOnArr[654]}}:
					txtArray[653] ? {8{pixelOnArr[653]}}:
					txtArray[652] ? {8{pixelOnArr[652]}}:
					txtArray[651] ? {8{pixelOnArr[651]}}:
					txtArray[650] ? {8{pixelOnArr[650]}}:
					txtArray[649] ? {8{pixelOnArr[649]}}:
					txtArray[648] ? {8{pixelOnArr[648]}}:
					txtArray[647] ? {8{pixelOnArr[647]}}:
					txtArray[646] ? {8{pixelOnArr[646]}}:
					txtArray[645] ? {8{pixelOnArr[645]}}:
					txtArray[644] ? {8{pixelOnArr[644]}}:
					txtArray[643] ? {8{pixelOnArr[643]}}:
					txtArray[642] ? {8{pixelOnArr[642]}}:
					txtArray[641] ? {8{pixelOnArr[641]}}:
					txtArray[640] ? {8{pixelOnArr[640]}}:
					txtArray[639] ? {8{pixelOnArr[639]}}:
					txtArray[638] ? {8{pixelOnArr[638]}}:
					txtArray[637] ? {8{pixelOnArr[637]}}:
					txtArray[636] ? {8{pixelOnArr[636]}}:
					txtArray[635] ? {8{pixelOnArr[635]}}:
					txtArray[634] ? {8{pixelOnArr[634]}}:
					txtArray[633] ? {8{pixelOnArr[633]}}:
					txtArray[632] ? {8{pixelOnArr[632]}}:
					txtArray[631] ? {8{pixelOnArr[631]}}:
					txtArray[630] ? {8{pixelOnArr[630]}}:
					txtArray[629] ? {8{pixelOnArr[629]}}:
					txtArray[628] ? {8{pixelOnArr[628]}}:
					txtArray[627] ? {8{pixelOnArr[627]}}:
					txtArray[626] ? {8{pixelOnArr[626]}}:
					txtArray[625] ? {8{pixelOnArr[625]}}:
					txtArray[624] ? {8{pixelOnArr[624]}}:
					txtArray[623] ? {8{pixelOnArr[623]}}:
					txtArray[622] ? {8{pixelOnArr[622]}}:
					txtArray[621] ? {8{pixelOnArr[621]}}:
					txtArray[620] ? {8{pixelOnArr[620]}}:
					txtArray[619] ? {8{pixelOnArr[619]}}:
					txtArray[618] ? {8{pixelOnArr[618]}}:
					txtArray[617] ? {8{pixelOnArr[617]}}:
					txtArray[616] ? {8{pixelOnArr[616]}}:
					txtArray[615] ? {8{pixelOnArr[615]}}:
					txtArray[614] ? {8{pixelOnArr[614]}}:
					txtArray[613] ? {8{pixelOnArr[613]}}:
					txtArray[612] ? {8{pixelOnArr[612]}}:
					txtArray[611] ? {8{pixelOnArr[611]}}:
					txtArray[610] ? {8{pixelOnArr[610]}}:
					txtArray[609] ? {8{pixelOnArr[609]}}:
					txtArray[608] ? {8{pixelOnArr[608]}}:
					txtArray[607] ? {8{pixelOnArr[607]}}:
					txtArray[606] ? {8{pixelOnArr[606]}}:
					txtArray[605] ? {8{pixelOnArr[605]}}:
					txtArray[604] ? {8{pixelOnArr[604]}}:
					txtArray[603] ? {8{pixelOnArr[603]}}:
					txtArray[602] ? {8{pixelOnArr[602]}}:
					txtArray[601] ? {8{pixelOnArr[601]}}:
					txtArray[600] ? {8{pixelOnArr[600]}}:
					txtArray[599] ? {8{pixelOnArr[599]}}:
					txtArray[598] ? {8{pixelOnArr[598]}}:
					txtArray[597] ? {8{pixelOnArr[597]}}:
					txtArray[596] ? {8{pixelOnArr[596]}}:
					txtArray[595] ? {8{pixelOnArr[595]}}:
					txtArray[594] ? {8{pixelOnArr[594]}}:
					txtArray[593] ? {8{pixelOnArr[593]}}:
					txtArray[592] ? {8{pixelOnArr[592]}}:
					txtArray[591] ? {8{pixelOnArr[591]}}:
					txtArray[590] ? {8{pixelOnArr[590]}}:
					txtArray[589] ? {8{pixelOnArr[589]}}:
					txtArray[588] ? {8{pixelOnArr[588]}}:
					txtArray[587] ? {8{pixelOnArr[587]}}:
					txtArray[586] ? {8{pixelOnArr[586]}}:
					txtArray[585] ? {8{pixelOnArr[585]}}:
					txtArray[584] ? {8{pixelOnArr[584]}}:
					txtArray[583] ? {8{pixelOnArr[583]}}:
					txtArray[582] ? {8{pixelOnArr[582]}}:
					txtArray[581] ? {8{pixelOnArr[581]}}:
					txtArray[580] ? {8{pixelOnArr[580]}}:
					txtArray[579] ? {8{pixelOnArr[579]}}:
					txtArray[578] ? {8{pixelOnArr[578]}}:
					txtArray[577] ? {8{pixelOnArr[577]}}:
					txtArray[576] ? {8{pixelOnArr[576]}}:
					txtArray[575] ? {8{pixelOnArr[575]}}:
					txtArray[574] ? {8{pixelOnArr[574]}}:
					txtArray[573] ? {8{pixelOnArr[573]}}:
					txtArray[572] ? {8{pixelOnArr[572]}}:
					txtArray[571] ? {8{pixelOnArr[571]}}:
					txtArray[570] ? {8{pixelOnArr[570]}}:
					txtArray[569] ? {8{pixelOnArr[569]}}:
					txtArray[568] ? {8{pixelOnArr[568]}}:
					txtArray[567] ? {8{pixelOnArr[567]}}:
					txtArray[566] ? {8{pixelOnArr[566]}}:
					txtArray[565] ? {8{pixelOnArr[565]}}:
					txtArray[564] ? {8{pixelOnArr[564]}}:
					txtArray[563] ? {8{pixelOnArr[563]}}:
					txtArray[562] ? {8{pixelOnArr[562]}}:
					txtArray[561] ? {8{pixelOnArr[561]}}:
					txtArray[560] ? {8{pixelOnArr[560]}}:
					txtArray[559] ? {8{pixelOnArr[559]}}:
					txtArray[558] ? {8{pixelOnArr[558]}}:
					txtArray[557] ? {8{pixelOnArr[557]}}: 
					txtArray[556] ? {8{pixelOnArr[556]}}:
					txtArray[555] ? {8{pixelOnArr[555]}}:
					txtArray[554] ? {8{pixelOnArr[554]}}:
					txtArray[553] ? {8{pixelOnArr[553]}}:
					txtArray[552] ? {8{pixelOnArr[552]}}:
					txtArray[551] ? {8{pixelOnArr[551]}}:
					txtArray[550] ? {8{pixelOnArr[550]}}:
					txtArray[549] ? {8{pixelOnArr[549]}}:
					txtArray[548] ? {8{pixelOnArr[548]}}:
					txtArray[547] ? {8{pixelOnArr[547]}}:
					txtArray[546] ? {8{pixelOnArr[546]}}:
					txtArray[545] ? {8{pixelOnArr[545]}}:
					txtArray[544] ? {8{pixelOnArr[544]}}:
					txtArray[543] ? {8{pixelOnArr[543]}}:
					txtArray[542] ? {8{pixelOnArr[542]}}:
					txtArray[541] ? {8{pixelOnArr[541]}}:
					txtArray[540] ? {8{pixelOnArr[540]}}:
					txtArray[539] ? {8{pixelOnArr[539]}}:
					txtArray[538] ? {8{pixelOnArr[538]}}:
					txtArray[537] ? {8{pixelOnArr[537]}}:
					txtArray[536] ? {8{pixelOnArr[536]}}:
					txtArray[535] ? {8{pixelOnArr[535]}}:
					txtArray[534] ? {8{pixelOnArr[534]}}:
					txtArray[533] ? {8{pixelOnArr[533]}}:
					txtArray[532] ? {8{pixelOnArr[532]}}:
					txtArray[531] ? {8{pixelOnArr[531]}}:
					txtArray[530] ? {8{pixelOnArr[530]}}:
					txtArray[529] ? {8{pixelOnArr[529]}}:
					txtArray[528] ? {8{pixelOnArr[528]}}:
					txtArray[527] ? {8{pixelOnArr[527]}}:
					txtArray[526] ? {8{pixelOnArr[526]}}:
					txtArray[525] ? {8{pixelOnArr[525]}}:
					txtArray[524] ? {8{pixelOnArr[524]}}:
					txtArray[523] ? {8{pixelOnArr[523]}}:
					txtArray[522] ? {8{pixelOnArr[522]}}:
					txtArray[521] ? {8{pixelOnArr[521]}}:
					txtArray[520] ? {8{pixelOnArr[520]}}:
					txtArray[519] ? {8{pixelOnArr[519]}}:
					txtArray[518] ? {8{pixelOnArr[518]}}:
					txtArray[517] ? {8{pixelOnArr[517]}}:
					txtArray[516] ? {8{pixelOnArr[516]}}:
					txtArray[515] ? {8{pixelOnArr[515]}}:
					txtArray[514] ? {8{pixelOnArr[514]}}:
					txtArray[513] ? {8{pixelOnArr[513]}}:
					txtArray[512] ? {8{pixelOnArr[512]}}:
					txtArray[511] ? {8{pixelOnArr[511]}}:
					txtArray[510] ? {8{pixelOnArr[510]}}:
					txtArray[509] ? {8{pixelOnArr[509]}}:
					txtArray[508] ? {8{pixelOnArr[508]}}:
					txtArray[507] ? {8{pixelOnArr[507]}}:
					txtArray[506] ? {8{pixelOnArr[506]}}:
					txtArray[505] ? {8{pixelOnArr[505]}}:
					txtArray[504] ? {8{pixelOnArr[504]}}:
					txtArray[503] ? {8{pixelOnArr[503]}}:
					txtArray[502] ? {8{pixelOnArr[502]}}:
					txtArray[501] ? {8{pixelOnArr[501]}}:
					txtArray[500] ? {8{pixelOnArr[500]}}:
					txtArray[499] ? {8{pixelOnArr[499]}}:
					txtArray[498] ? {8{pixelOnArr[498]}}:
					txtArray[497] ? {8{pixelOnArr[497]}}:
					txtArray[496] ? {8{pixelOnArr[496]}}:
					txtArray[495] ? {8{pixelOnArr[495]}}:
					txtArray[494] ? {8{pixelOnArr[494]}}:
					txtArray[493] ? {8{pixelOnArr[493]}}:
					txtArray[492] ? {8{pixelOnArr[492]}}:
					txtArray[491] ? {8{pixelOnArr[491]}}:
					txtArray[490] ? {8{pixelOnArr[490]}}:
					txtArray[489] ? {8{pixelOnArr[489]}}:
					txtArray[488] ? {8{pixelOnArr[488]}}:
					txtArray[487] ? {8{pixelOnArr[487]}}:
					txtArray[486] ? {8{pixelOnArr[486]}}:
					txtArray[485] ? {8{pixelOnArr[485]}}:
					txtArray[484] ? {8{pixelOnArr[484]}}:
					txtArray[483] ? {8{pixelOnArr[483]}}:
					txtArray[482] ? {8{pixelOnArr[482]}}:
					txtArray[481] ? {8{pixelOnArr[481]}}:
					txtArray[480] ? {8{pixelOnArr[480]}}:
					txtArray[479] ? {8{pixelOnArr[479]}}:
					txtArray[478] ? {8{pixelOnArr[478]}}:
					txtArray[477] ? {8{pixelOnArr[477]}}:
					txtArray[476] ? {8{pixelOnArr[476]}}:
					txtArray[475] ? {8{pixelOnArr[475]}}:
					txtArray[474] ? {8{pixelOnArr[474]}}:
					txtArray[473] ? {8{pixelOnArr[473]}}:
					txtArray[472] ? {8{pixelOnArr[472]}}:
					txtArray[471] ? {8{pixelOnArr[471]}}:
					txtArray[470] ? {8{pixelOnArr[470]}}:
					txtArray[469] ? {8{pixelOnArr[469]}}:
					txtArray[468] ? {8{pixelOnArr[468]}}:
					txtArray[467] ? {8{pixelOnArr[467]}}:
					txtArray[466] ? {8{pixelOnArr[466]}}:
					txtArray[465] ? {8{pixelOnArr[465]}}:
					txtArray[464] ? {8{pixelOnArr[464]}}:
					txtArray[463] ? {8{pixelOnArr[463]}}:
					txtArray[462] ? {8{pixelOnArr[462]}}:
					txtArray[461] ? {8{pixelOnArr[461]}}:
					txtArray[460] ? {8{pixelOnArr[460]}}:
					txtArray[459] ? {8{pixelOnArr[459]}}:
					txtArray[458] ? {8{pixelOnArr[458]}}:
					txtArray[457] ? {8{pixelOnArr[457]}}:
					txtArray[456] ? {8{pixelOnArr[456]}}:
					txtArray[455] ? {8{pixelOnArr[455]}}:
					txtArray[454] ? {8{pixelOnArr[454]}}:
					txtArray[453] ? {8{pixelOnArr[453]}}:
					txtArray[452] ? {8{pixelOnArr[452]}}:
					txtArray[451] ? {8{pixelOnArr[451]}}:
					txtArray[450] ? {8{pixelOnArr[450]}}:
					txtArray[449] ? {8{pixelOnArr[449]}}:
					txtArray[448] ? {8{pixelOnArr[448]}}:
					txtArray[447] ? {8{pixelOnArr[447]}}:
					txtArray[446] ? {8{pixelOnArr[446]}}:
					txtArray[445] ? {8{pixelOnArr[445]}}:
					txtArray[444] ? {8{pixelOnArr[444]}}:
					txtArray[443] ? {8{pixelOnArr[443]}}:
					txtArray[442] ? {8{pixelOnArr[442]}}:
					txtArray[441] ? {8{pixelOnArr[441]}}:
					txtArray[440] ? {8{pixelOnArr[440]}}:
					txtArray[439] ? {8{pixelOnArr[439]}}:
					txtArray[438] ? {8{pixelOnArr[438]}}:
					txtArray[437] ? {8{pixelOnArr[437]}}:
					txtArray[436] ? {8{pixelOnArr[436]}}:
					txtArray[435] ? {8{pixelOnArr[435]}}:
					txtArray[434] ? {8{pixelOnArr[434]}}:
					txtArray[433] ? {8{pixelOnArr[433]}}:
					txtArray[432] ? {8{pixelOnArr[432]}}:
					txtArray[431] ? {8{pixelOnArr[431]}}:
					txtArray[430] ? {8{pixelOnArr[430]}}:
					txtArray[429] ? {8{pixelOnArr[429]}}:
					txtArray[428] ? {8{pixelOnArr[428]}}:
					txtArray[427] ? {8{pixelOnArr[427]}}:
					txtArray[426] ? {8{pixelOnArr[426]}}:
					txtArray[425] ? {8{pixelOnArr[425]}}:
					txtArray[424] ? {8{pixelOnArr[424]}}:
					txtArray[423] ? {8{pixelOnArr[423]}}:
					txtArray[422] ? {8{pixelOnArr[422]}}:
					txtArray[421] ? {8{pixelOnArr[421]}}:
					txtArray[420] ? {8{pixelOnArr[420]}}:
					txtArray[419] ? {8{pixelOnArr[419]}}:
					txtArray[418] ? {8{pixelOnArr[418]}}:
					txtArray[417] ? {8{pixelOnArr[417]}}:
					txtArray[416] ? {8{pixelOnArr[416]}}:
					txtArray[415] ? {8{pixelOnArr[415]}}:
					txtArray[414] ? {8{pixelOnArr[414]}}:
					txtArray[413] ? {8{pixelOnArr[413]}}:
					txtArray[412] ? {8{pixelOnArr[412]}}:
					txtArray[411] ? {8{pixelOnArr[411]}}:
					txtArray[410] ? {8{pixelOnArr[410]}}:
					txtArray[409] ? {8{pixelOnArr[409]}}:
					txtArray[408] ? {8{pixelOnArr[408]}}:
					txtArray[407] ? {8{pixelOnArr[407]}}:
					txtArray[406] ? {8{pixelOnArr[406]}}:
					txtArray[405] ? {8{pixelOnArr[405]}}:
					txtArray[404] ? {8{pixelOnArr[404]}}:
					txtArray[403] ? {8{pixelOnArr[403]}}:
					txtArray[402] ? {8{pixelOnArr[402]}}:
					txtArray[401] ? {8{pixelOnArr[401]}}:
					txtArray[400] ? {8{pixelOnArr[400]}}:
					txtArray[399] ? {8{pixelOnArr[399]}}:
					txtArray[398] ? {8{pixelOnArr[398]}}:
					txtArray[397] ? {8{pixelOnArr[397]}}:
					txtArray[396] ? {8{pixelOnArr[396]}}:
					txtArray[395] ? {8{pixelOnArr[395]}}:
					txtArray[394] ? {8{pixelOnArr[394]}}:
					txtArray[393] ? {8{pixelOnArr[393]}}:
					txtArray[392] ? {8{pixelOnArr[392]}}:
					txtArray[391] ? {8{pixelOnArr[391]}}:
					txtArray[390] ? {8{pixelOnArr[390]}}:
					txtArray[389] ? {8{pixelOnArr[389]}}:
					txtArray[388] ? {8{pixelOnArr[388]}}:
					txtArray[387] ? {8{pixelOnArr[387]}}:
					txtArray[386] ? {8{pixelOnArr[386]}}:
					txtArray[385] ? {8{pixelOnArr[385]}}:
					txtArray[384] ? {8{pixelOnArr[384]}}:
					txtArray[383] ? {8{pixelOnArr[383]}}:
					txtArray[382] ? {8{pixelOnArr[382]}}:
					txtArray[381] ? {8{pixelOnArr[381]}}:
					txtArray[380] ? {8{pixelOnArr[380]}}:
					txtArray[379] ? {8{pixelOnArr[379]}}:
					txtArray[378] ? {8{pixelOnArr[378]}}:
					txtArray[377] ? {8{pixelOnArr[377]}}:
					txtArray[376] ? {8{pixelOnArr[376]}}:
					txtArray[375] ? {8{pixelOnArr[375]}}:
					txtArray[374] ? {8{pixelOnArr[374]}}:
					txtArray[373] ? {8{pixelOnArr[373]}}:
					txtArray[372] ? {8{pixelOnArr[372]}}:
					txtArray[371] ? {8{pixelOnArr[371]}}:
					txtArray[370] ? {8{pixelOnArr[370]}}:
					txtArray[369] ? {8{pixelOnArr[369]}}:
					txtArray[368] ? {8{pixelOnArr[368]}}:
					txtArray[367] ? {8{pixelOnArr[367]}}:
					txtArray[366] ? {8{pixelOnArr[366]}}:
					txtArray[365] ? {8{pixelOnArr[365]}}:
					txtArray[364] ? {8{pixelOnArr[364]}}:
					txtArray[363] ? {8{pixelOnArr[363]}}:
					txtArray[362] ? {8{pixelOnArr[362]}}:
					txtArray[361] ? {8{pixelOnArr[361]}}:
					txtArray[360] ? {8{pixelOnArr[360]}}:
					txtArray[359] ? {8{pixelOnArr[359]}}:
					txtArray[358] ? {8{pixelOnArr[358]}}:
					txtArray[357] ? {8{pixelOnArr[357]}}:
					txtArray[356] ? {8{pixelOnArr[356]}}:
					txtArray[355] ? {8{pixelOnArr[355]}}:
					txtArray[354] ? {8{pixelOnArr[354]}}:
					txtArray[353] ? {8{pixelOnArr[353]}}:
					txtArray[352] ? {8{pixelOnArr[352]}}:
					txtArray[351] ? {8{pixelOnArr[351]}}:
					txtArray[350] ? {8{pixelOnArr[350]}}:
					txtArray[349] ? {8{pixelOnArr[349]}}:
					txtArray[348] ? {8{pixelOnArr[348]}}:
					txtArray[347] ? {8{pixelOnArr[347]}}:
					txtArray[346] ? {8{pixelOnArr[346]}}:
					txtArray[345] ? {8{pixelOnArr[345]}}:
					txtArray[344] ? {8{pixelOnArr[344]}}:
					txtArray[343] ? {8{pixelOnArr[343]}}:
					txtArray[342] ? {8{pixelOnArr[342]}}:
					txtArray[341] ? {8{pixelOnArr[341]}}:
					txtArray[340] ? {8{pixelOnArr[340]}}:
					txtArray[339] ? {8{pixelOnArr[339]}}:
					txtArray[338] ? {8{pixelOnArr[338]}}:
					txtArray[337] ? {8{pixelOnArr[337]}}:
					txtArray[336] ? {8{pixelOnArr[336]}}:
					txtArray[335] ? {8{pixelOnArr[335]}}:
					txtArray[334] ? {8{pixelOnArr[334]}}:
					txtArray[333] ? {8{pixelOnArr[333]}}:
					txtArray[332] ? {8{pixelOnArr[332]}}:
					txtArray[331] ? {8{pixelOnArr[331]}}:
					txtArray[330] ? {8{pixelOnArr[330]}}:
					txtArray[329] ? {8{pixelOnArr[329]}}:
					txtArray[328] ? {8{pixelOnArr[328]}}:
					txtArray[327] ? {8{pixelOnArr[327]}}:
					txtArray[326] ? {8{pixelOnArr[326]}}:
					txtArray[325] ? {8{pixelOnArr[325]}}:
					txtArray[324] ? {8{pixelOnArr[324]}}:
					txtArray[323] ? {8{pixelOnArr[323]}}:
					txtArray[322] ? {8{pixelOnArr[322]}}:
					txtArray[321] ? {8{pixelOnArr[321]}}:
					txtArray[320] ? {8{pixelOnArr[320]}}:
					txtArray[319] ? {8{pixelOnArr[319]}}:
					txtArray[318] ? {8{pixelOnArr[318]}}:
					txtArray[317] ? {8{pixelOnArr[317]}}:
					txtArray[316] ? {8{pixelOnArr[316]}}:
					txtArray[315] ? {8{pixelOnArr[315]}}:
					txtArray[314] ? {8{pixelOnArr[314]}}:
					txtArray[313] ? {8{pixelOnArr[313]}}:
					txtArray[312] ? {8{pixelOnArr[312]}}:
					txtArray[311] ? {8{pixelOnArr[311]}}:
					txtArray[310] ? {8{pixelOnArr[310]}}:
					txtArray[309] ? {8{pixelOnArr[309]}}:
					txtArray[308] ? {8{pixelOnArr[308]}}:
					txtArray[307] ? {8{pixelOnArr[307]}}:
					txtArray[306] ? {8{pixelOnArr[306]}}:
					txtArray[305] ? {8{pixelOnArr[305]}}:
					txtArray[304] ? {8{pixelOnArr[304]}}:
					txtArray[303] ? {8{pixelOnArr[303]}}:
					txtArray[302] ? {8{pixelOnArr[302]}}:
					txtArray[301] ? {8{pixelOnArr[301]}}:
					txtArray[300] ? {8{pixelOnArr[300]}}:
					txtArray[299] ? {8{pixelOnArr[299]}}:
					txtArray[298] ? {8{pixelOnArr[298]}}:
					txtArray[297] ? {8{pixelOnArr[297]}}:
					txtArray[296] ? {8{pixelOnArr[296]}}:
					txtArray[295] ? {8{pixelOnArr[295]}}:
					txtArray[294] ? {8{pixelOnArr[294]}}:
					txtArray[293] ? {8{pixelOnArr[293]}}:
					txtArray[292] ? {8{pixelOnArr[292]}}:
					txtArray[291] ? {8{pixelOnArr[291]}}:
					txtArray[290] ? {8{pixelOnArr[290]}}:
					txtArray[289] ? {8{pixelOnArr[289]}}:
					txtArray[288] ? {8{pixelOnArr[288]}}:
					txtArray[287] ? {8{pixelOnArr[287]}}:
					txtArray[286] ? {8{pixelOnArr[286]}}:
					txtArray[285] ? {8{pixelOnArr[285]}}:
					txtArray[284] ? {8{pixelOnArr[284]}}:
					txtArray[283] ? {8{pixelOnArr[283]}}:
					txtArray[282] ? {8{pixelOnArr[282]}}:
					txtArray[281] ? {8{pixelOnArr[281]}}:
					txtArray[280] ? {8{pixelOnArr[280]}}:
					txtArray[279] ? {8{pixelOnArr[279]}}:
					txtArray[278] ? {8{pixelOnArr[278]}}:
					txtArray[277] ? {8{pixelOnArr[277]}}:
					txtArray[276] ? {8{pixelOnArr[276]}}:
					txtArray[275] ? {8{pixelOnArr[275]}}:
					txtArray[274] ? {8{pixelOnArr[274]}}:
					txtArray[273] ? {8{pixelOnArr[273]}}:
					txtArray[272] ? {8{pixelOnArr[272]}}:
					txtArray[271] ? {8{pixelOnArr[271]}}:
					txtArray[270] ? {8{pixelOnArr[270]}}:
					txtArray[269] ? {8{pixelOnArr[269]}}:
					txtArray[268] ? {8{pixelOnArr[268]}}:
					txtArray[267] ? {8{pixelOnArr[267]}}:
					txtArray[266] ? {8{pixelOnArr[266]}}:
					txtArray[265] ? {8{pixelOnArr[265]}}:
					txtArray[264] ? {8{pixelOnArr[264]}}:
					txtArray[263] ? {8{pixelOnArr[263]}}:
					txtArray[262] ? {8{pixelOnArr[262]}}:
					txtArray[261] ? {8{pixelOnArr[261]}}:
					txtArray[260] ? {8{pixelOnArr[260]}}:
					txtArray[259] ? {8{pixelOnArr[259]}}:
					txtArray[258] ? {8{pixelOnArr[258]}}:
					txtArray[257] ? {8{pixelOnArr[257]}}:
					txtArray[256] ? {8{pixelOnArr[256]}}:
					txtArray[255] ? {8{pixelOnArr[255]}}:
					txtArray[254] ? {8{pixelOnArr[254]}}:
					txtArray[253] ? {8{pixelOnArr[253]}}:
					txtArray[252] ? {8{pixelOnArr[252]}}:
					txtArray[251] ? {8{pixelOnArr[251]}}:
					txtArray[250] ? {8{pixelOnArr[250]}}:
					txtArray[249] ? {8{pixelOnArr[249]}}:
					txtArray[248] ? {8{pixelOnArr[248]}}:
					txtArray[247] ? {8{pixelOnArr[247]}}:
					txtArray[246] ? {8{pixelOnArr[246]}}:
					txtArray[245] ? {8{pixelOnArr[245]}}:
					txtArray[244] ? {8{pixelOnArr[244]}}:
					txtArray[243] ? {8{pixelOnArr[243]}}:
					txtArray[242] ? {8{pixelOnArr[242]}}:
					txtArray[241] ? {8{pixelOnArr[241]}}:
					txtArray[240] ? {8{pixelOnArr[240]}}:
					txtArray[239] ? {8{pixelOnArr[239]}}:
					txtArray[238] ? {8{pixelOnArr[238]}}:
					txtArray[237] ? {8{pixelOnArr[237]}}:
					txtArray[236] ? {8{pixelOnArr[236]}}:
					txtArray[235] ? {8{pixelOnArr[235]}}:
					txtArray[234] ? {8{pixelOnArr[234]}}:
					txtArray[233] ? {8{pixelOnArr[233]}}:
					txtArray[232] ? {8{pixelOnArr[232]}}:
					txtArray[231] ? {8{pixelOnArr[231]}}:
					txtArray[230] ? {8{pixelOnArr[230]}}:
					txtArray[229] ? {8{pixelOnArr[229]}}:
					txtArray[228] ? {8{pixelOnArr[228]}}:
					txtArray[227] ? {8{pixelOnArr[227]}}:
					txtArray[226] ? {8{pixelOnArr[226]}}:
					txtArray[225] ? {8{pixelOnArr[225]}}:
					txtArray[224] ? {8{pixelOnArr[224]}}:
					txtArray[223] ? {8{pixelOnArr[223]}}:
					txtArray[222] ? {8{pixelOnArr[222]}}:
					txtArray[221] ? {8{pixelOnArr[221]}}:
					txtArray[220] ? {8{pixelOnArr[220]}}:
					txtArray[219] ? {8{pixelOnArr[219]}}:
					txtArray[218] ? {8{pixelOnArr[218]}}:
					txtArray[217] ? {8{pixelOnArr[217]}}:
					txtArray[216] ? {8{pixelOnArr[216]}}:
					txtArray[215] ? {8{pixelOnArr[215]}}:
					txtArray[214] ? {8{pixelOnArr[214]}}:
					txtArray[213] ? {8{pixelOnArr[213]}}:
					txtArray[212] ? {8{pixelOnArr[212]}}:
					txtArray[211] ? {8{pixelOnArr[211]}}:
					txtArray[210] ? {8{pixelOnArr[210]}}:
					txtArray[209] ? {8{pixelOnArr[209]}}:
					txtArray[208] ? {8{pixelOnArr[208]}}:
					txtArray[207] ? {8{pixelOnArr[207]}}:
					txtArray[206] ? {8{pixelOnArr[206]}}:
					txtArray[205] ? {8{pixelOnArr[205]}}:
					txtArray[204] ? {8{pixelOnArr[204]}}:
					txtArray[203] ? {8{pixelOnArr[203]}}:
					txtArray[202] ? {8{pixelOnArr[202]}}:
					txtArray[201] ? {8{pixelOnArr[201]}}:
					txtArray[200] ? {8{pixelOnArr[200]}}:
					txtArray[199] ? {8{pixelOnArr[199]}}:
					txtArray[198] ? {8{pixelOnArr[198]}}:
					txtArray[197] ? {8{pixelOnArr[197]}}:
					txtArray[196] ? {8{pixelOnArr[196]}}:
					txtArray[195] ? {8{pixelOnArr[195]}}:
					txtArray[194] ? {8{pixelOnArr[194]}}:
					txtArray[193] ? {8{pixelOnArr[193]}}:
					txtArray[192] ? {8{pixelOnArr[192]}}:
					txtArray[191] ? {8{pixelOnArr[191]}}:
					txtArray[190] ? {8{pixelOnArr[190]}}:
					txtArray[189] ? {8{pixelOnArr[189]}}:
					txtArray[188] ? {8{pixelOnArr[188]}}:
					txtArray[187] ? {8{pixelOnArr[187]}}:
					txtArray[186] ? {8{pixelOnArr[186]}}:
					txtArray[185] ? {8{pixelOnArr[185]}}:
					txtArray[184] ? {8{pixelOnArr[184]}}:
					txtArray[183] ? {8{pixelOnArr[183]}}:
					txtArray[182] ? {8{pixelOnArr[182]}}:
					txtArray[181] ? {8{pixelOnArr[181]}}:
					txtArray[180] ? {8{pixelOnArr[180]}}:
					txtArray[179] ? {8{pixelOnArr[179]}}:
					txtArray[178] ? {8{pixelOnArr[178]}}:
					txtArray[177] ? {8{pixelOnArr[177]}}:
					txtArray[176] ? {8{pixelOnArr[176]}}:
					txtArray[175] ? {8{pixelOnArr[175]}}:
					txtArray[174] ? {8{pixelOnArr[174]}}:
					txtArray[173] ? {8{pixelOnArr[173]}}:
					txtArray[172] ? {8{pixelOnArr[172]}}:
					txtArray[171] ? {8{pixelOnArr[171]}}:
					txtArray[170] ? {8{pixelOnArr[170]}}:
					txtArray[169] ? {8{pixelOnArr[169]}}:
					txtArray[168] ? {8{pixelOnArr[168]}}:
					txtArray[167] ? {8{pixelOnArr[167]}}:
					txtArray[166] ? {8{pixelOnArr[166]}}:
					txtArray[165] ? {8{pixelOnArr[165]}}:
					txtArray[164] ? {8{pixelOnArr[164]}}:
					txtArray[163] ? {8{pixelOnArr[163]}}:
					txtArray[162] ? {8{pixelOnArr[162]}}:
					txtArray[161] ? {8{pixelOnArr[161]}}:
					txtArray[160] ? {8{pixelOnArr[160]}}:
					txtArray[159] ? {8{pixelOnArr[159]}}:
					txtArray[158] ? {8{pixelOnArr[158]}}:
					txtArray[157] ? {8{pixelOnArr[157]}}:
					txtArray[156] ? {8{pixelOnArr[156]}}:
					txtArray[155] ? {8{pixelOnArr[155]}}:
					txtArray[154] ? {8{pixelOnArr[154]}}:
					txtArray[153] ? {8{pixelOnArr[153]}}:
					txtArray[152] ? {8{pixelOnArr[152]}}:
					txtArray[151] ? {8{pixelOnArr[151]}}:
					txtArray[150] ? {8{pixelOnArr[150]}}:
					txtArray[149] ? {8{pixelOnArr[149]}}:
					txtArray[148] ? {8{pixelOnArr[148]}}:
					txtArray[147] ? {8{pixelOnArr[147]}}:
					txtArray[146] ? {8{pixelOnArr[146]}}:
					txtArray[145] ? {8{pixelOnArr[145]}}:
					txtArray[144] ? {8{pixelOnArr[144]}}:
					txtArray[143] ? {8{pixelOnArr[143]}}:
					txtArray[142] ? {8{pixelOnArr[142]}}:
					txtArray[141] ? {8{pixelOnArr[141]}}:
					txtArray[140] ? {8{pixelOnArr[140]}}:
					txtArray[139] ? {8{pixelOnArr[139]}}:
					txtArray[138] ? {8{pixelOnArr[138]}}:
					txtArray[137] ? {8{pixelOnArr[137]}}:
					txtArray[136] ? {8{pixelOnArr[136]}}:
					txtArray[135] ? {8{pixelOnArr[135]}}:
					txtArray[134] ? {8{pixelOnArr[134]}}:
					txtArray[133] ? {8{pixelOnArr[133]}}:
					txtArray[132] ? {8{pixelOnArr[132]}}:
					txtArray[131] ? {8{pixelOnArr[131]}}:
					txtArray[130] ? {8{pixelOnArr[130]}}:
					txtArray[129] ? {8{pixelOnArr[129]}}:
					txtArray[128] ? {8{pixelOnArr[128]}}:
					txtArray[127] ? {8{pixelOnArr[127]}}:
					txtArray[126] ? {8{pixelOnArr[126]}}:
					txtArray[125] ? {8{pixelOnArr[125]}}:
					txtArray[124] ? {8{pixelOnArr[124]}}:
					txtArray[123] ? {8{pixelOnArr[123]}}:
					txtArray[122] ? {8{pixelOnArr[122]}}:
					txtArray[121] ? {8{pixelOnArr[121]}}:
					txtArray[120] ? {8{pixelOnArr[120]}}:
					txtArray[119] ? {8{pixelOnArr[119]}}:
					txtArray[118] ? {8{pixelOnArr[118]}}:
					txtArray[117] ? {8{pixelOnArr[117]}}:
					txtArray[116] ? {8{pixelOnArr[116]}}:
					txtArray[115] ? {8{pixelOnArr[115]}}:
					txtArray[114] ? {8{pixelOnArr[114]}}:
					txtArray[113] ? {8{pixelOnArr[113]}}:
					txtArray[112] ? {8{pixelOnArr[112]}}:
					txtArray[111] ? {8{pixelOnArr[111]}}:
					txtArray[110] ? {8{pixelOnArr[110]}}:
					txtArray[109] ? {8{pixelOnArr[109]}}:
					txtArray[108] ? {8{pixelOnArr[108]}}:
					txtArray[107] ? {8{pixelOnArr[107]}}:
					txtArray[106] ? {8{pixelOnArr[106]}}:
					txtArray[105] ? {8{pixelOnArr[105]}}:
					txtArray[104] ? {8{pixelOnArr[104]}}:
					txtArray[103] ? {8{pixelOnArr[103]}}:
					txtArray[102] ? {8{pixelOnArr[102]}}:
					txtArray[101] ? {8{pixelOnArr[101]}}:
					txtArray[100] ? {8{pixelOnArr[100]}}:
					txtArray[99] ? {8{pixelOnArr[99]}}:
					txtArray[98] ? {8{pixelOnArr[98]}}:
					txtArray[97] ? {8{pixelOnArr[97]}}:
					txtArray[96] ? {8{pixelOnArr[96]}}:
					txtArray[95] ? {8{pixelOnArr[95]}}:
					txtArray[94] ? {8{pixelOnArr[94]}}:
					txtArray[93] ? {8{pixelOnArr[93]}}:
					txtArray[92] ? {8{pixelOnArr[92]}}:
					txtArray[91] ? {8{pixelOnArr[91]}}:
					txtArray[90] ? {8{pixelOnArr[90]}}:
					txtArray[89] ? {8{pixelOnArr[89]}}:
					txtArray[88] ? {8{pixelOnArr[88]}}:
					txtArray[87] ? {8{pixelOnArr[87]}}:
					txtArray[86] ? {8{pixelOnArr[86]}}:
					txtArray[85] ? {8{pixelOnArr[85]}}:
					txtArray[84] ? {8{pixelOnArr[84]}}:
					txtArray[83] ? {8{pixelOnArr[83]}}:
					txtArray[82] ? {8{pixelOnArr[82]}}:
					txtArray[81] ? {8{pixelOnArr[81]}}:
					txtArray[80] ? {8{pixelOnArr[80]}}:
					txtArray[79] ? {8{pixelOnArr[79]}}:
					txtArray[78] ? {8{pixelOnArr[78]}}:
					txtArray[77] ? {8{pixelOnArr[77]}}:
					txtArray[76] ? {8{pixelOnArr[76]}}:
					txtArray[75] ? {8{pixelOnArr[75]}}:
					txtArray[74] ? {8{pixelOnArr[74]}}:
					txtArray[73] ? {8{pixelOnArr[73]}}:
					txtArray[72] ? {8{pixelOnArr[72]}}:
					txtArray[71] ? {8{pixelOnArr[71]}}:
					txtArray[70] ? {8{pixelOnArr[70]}}:
					txtArray[69] ? {8{pixelOnArr[69]}}:
					txtArray[68] ? {8{pixelOnArr[68]}}:
					txtArray[67] ? {8{pixelOnArr[67]}}:
					txtArray[66] ? {8{pixelOnArr[66]}}:
					txtArray[65] ? {8{pixelOnArr[65]}}:
					txtArray[64] ? {8{pixelOnArr[64]}}:
					txtArray[63] ? {8{pixelOnArr[63]}}:
					txtArray[62] ? {8{pixelOnArr[62]}}:
					txtArray[61] ? {8{pixelOnArr[61]}}:
					txtArray[60] ? {8{pixelOnArr[60]}}:
					txtArray[59] ? {8{pixelOnArr[59]}}:
					txtArray[58] ? {8{pixelOnArr[58]}}:
					txtArray[57] ? {8{pixelOnArr[57]}}:
					txtArray[56] ? {8{pixelOnArr[56]}}:
					txtArray[55] ? {8{pixelOnArr[55]}}:
					txtArray[54] ? {8{pixelOnArr[54]}}:
					txtArray[53] ? {8{pixelOnArr[53]}}:
					txtArray[52] ? {8{pixelOnArr[52]}}:
					txtArray[51] ? {8{pixelOnArr[51]}}:
					txtArray[50] ? {8{pixelOnArr[50]}}:
					txtArray[49] ? {8{pixelOnArr[49]}}:
					txtArray[48] ? {8{pixelOnArr[48]}}:
					txtArray[47] ? {8{pixelOnArr[47]}}:
					txtArray[46] ? {8{pixelOnArr[46]}}:
					txtArray[45] ? {8{pixelOnArr[45]}}:
					txtArray[44] ? {8{pixelOnArr[44]}}:
					txtArray[43] ? {8{pixelOnArr[43]}}:
					txtArray[42] ? {8{pixelOnArr[42]}}:
					txtArray[41] ? {8{pixelOnArr[41]}}:
					txtArray[40] ? {8{pixelOnArr[40]}}:
					txtArray[39] ? {8{pixelOnArr[39]}}:
					txtArray[38] ? {8{pixelOnArr[38]}}:
					txtArray[37] ? {8{pixelOnArr[37]}}:
					txtArray[36] ? {8{pixelOnArr[36]}}:
					txtArray[35] ? {8{pixelOnArr[35]}}:
					txtArray[34] ? {8{pixelOnArr[34]}}:
					txtArray[33] ? {8{pixelOnArr[33]}}:
					txtArray[32] ? {8{pixelOnArr[32]}}:
					txtArray[31] ? {8{pixelOnArr[31]}}:
					txtArray[30] ? {8{pixelOnArr[30]}}:
					txtArray[29] ? {8{pixelOnArr[29]}}:
					txtArray[28] ? {8{pixelOnArr[28]}}:
					txtArray[27] ? {8{pixelOnArr[27]}}:
					txtArray[26] ? {8{pixelOnArr[26]}}:
					txtArray[25] ? {8{pixelOnArr[25]}}:
					txtArray[24] ? {8{pixelOnArr[24]}}:
					txtArray[23] ? {8{pixelOnArr[23]}}:
					txtArray[22] ? {8{pixelOnArr[22]}}:
					txtArray[21] ? {8{pixelOnArr[21]}}:
					txtArray[20] ? {8{pixelOnArr[20]}}:
					txtArray[19] ? {8{pixelOnArr[19]}}:
					txtArray[18] ? {8{pixelOnArr[18]}}:
					txtArray[17] ? {8{pixelOnArr[17]}}:
					txtArray[16] ? {8{pixelOnArr[16]}}:
					txtArray[15] ? {8{pixelOnArr[15]}}:
					txtArray[14] ? {8{pixelOnArr[14]}}:
					txtArray[13] ? {8{pixelOnArr[13]}}:
					txtArray[12] ? {8{pixelOnArr[12]}}:
					txtArray[11] ? {8{pixelOnArr[11]}}:
					txtArray[10] ? {8{pixelOnArr[10]}}:
					txtArray[9] ? {8{pixelOnArr[9]}}:
					txtArray[8] ? {8{pixelOnArr[8]}}:
					txtArray[7] ? {8{pixelOnArr[7]}}:
					txtArray[6] ? {8{pixelOnArr[6]}}:
					txtArray[5] ? {8{pixelOnArr[5]}}:
					txtArray[4] ? {8{pixelOnArr[4]}}:
					txtArray[3] ? {8{pixelOnArr[3]}}:
					txtArray[2] ? {8{pixelOnArr[2]}}:
					txtArray[1] ? {8{pixelOnArr[1]}}:
					txtArray[0] ? {8{pixelOnArr[0]}}:8'h00;
					
assign g = 
					txtArray[656] & subr[656] ? {8{pixelOnArr[656]}}:
					txtArray[655] & subr[655] ? {8{pixelOnArr[655]}}:
					txtArray[654] & subr[654] ? {8{pixelOnArr[654]}}:
					txtArray[653] & subr[653] ? {8{pixelOnArr[653]}}:
					txtArray[652] & subr[652] ? {8{pixelOnArr[652]}}:
					txtArray[651] & subr[651] ? {8{pixelOnArr[651]}}:
					txtArray[650] & subr[650] ? {8{pixelOnArr[650]}}:
					txtArray[649] & subr[649] ? {8{pixelOnArr[649]}}:
					txtArray[648] & subr[648] ? {8{pixelOnArr[648]}}:
					txtArray[647] & subr[647] ? {8{pixelOnArr[647]}}:
					txtArray[646] & subr[646] ? {8{pixelOnArr[646]}}:
					txtArray[645] & subr[645] ? {8{pixelOnArr[645]}}:
					txtArray[644] & subr[644] ? {8{pixelOnArr[644]}}:
					txtArray[643] & subr[643] ? {8{pixelOnArr[643]}}:
					txtArray[642] & subr[642] ? {8{pixelOnArr[642]}}:
					txtArray[641] & subr[641] ? {8{pixelOnArr[641]}}:
					txtArray[640] & subr[640] ? {8{pixelOnArr[640]}}:
					txtArray[639] & subr[639] ? {8{pixelOnArr[639]}}:
					txtArray[638] & subr[638] ? {8{pixelOnArr[638]}}:
					txtArray[637] & subr[637] ? {8{pixelOnArr[637]}}:
					txtArray[636] & subr[636] ? {8{pixelOnArr[636]}}:
					txtArray[635] & subr[635] ? {8{pixelOnArr[635]}}:
					txtArray[634] & subr[634] ? {8{pixelOnArr[634]}}:
					txtArray[633] & subr[633] ? {8{pixelOnArr[633]}}:
					txtArray[632] & subr[632] ? {8{pixelOnArr[632]}}:
					txtArray[631] & subr[631] ? {8{pixelOnArr[631]}}:
					txtArray[630] & subr[630] ? {8{pixelOnArr[630]}}:
					txtArray[629] & subr[629] ? {8{pixelOnArr[629]}}:
					txtArray[628] & subr[628] ? {8{pixelOnArr[628]}}:
					txtArray[627] & subr[627] ? {8{pixelOnArr[627]}}:
					txtArray[626] & subr[626] ? {8{pixelOnArr[626]}}:
					txtArray[625] & subr[625] ? {8{pixelOnArr[625]}}:
					txtArray[624] & subr[624] ? {8{pixelOnArr[624]}}:
					txtArray[623] & subr[623] ? {8{pixelOnArr[623]}}:
					txtArray[622] & subr[622] ? {8{pixelOnArr[622]}}:
					txtArray[621] & subr[621] ? {8{pixelOnArr[621]}}:
					txtArray[620] & subr[620] ? {8{pixelOnArr[620]}}:
					txtArray[619] & subr[619] ? {8{pixelOnArr[619]}}:
					txtArray[618] & subr[618] ? {8{pixelOnArr[618]}}:
					txtArray[617] & subr[617] ? {8{pixelOnArr[617]}}:
					txtArray[616] & subr[616] ? {8{pixelOnArr[616]}}:
					txtArray[615] & subr[615] ? {8{pixelOnArr[615]}}:
					txtArray[614] & subr[614] ? {8{pixelOnArr[614]}}:
					txtArray[613] & subr[613] ? {8{pixelOnArr[613]}}:
					txtArray[612] & subr[612] ? {8{pixelOnArr[612]}}:
					txtArray[611] & subr[611] ? {8{pixelOnArr[611]}}:
					txtArray[610] & subr[610] ? {8{pixelOnArr[610]}}:
					txtArray[609] & subr[609] ? {8{pixelOnArr[609]}}:
					txtArray[608] & subr[608] ? {8{pixelOnArr[608]}}:
					txtArray[607] & subr[607] ? {8{pixelOnArr[607]}}:
					txtArray[606] & subr[606] ? {8{pixelOnArr[606]}}:
					txtArray[605] & subr[605] ? {8{pixelOnArr[605]}}:
					txtArray[604] & subr[604] ? {8{pixelOnArr[604]}}:
					txtArray[603] & subr[603] ? {8{pixelOnArr[603]}}:
					txtArray[602] & subr[602] ? {8{pixelOnArr[602]}}:
					txtArray[601] & subr[601] ? {8{pixelOnArr[601]}}:
					txtArray[600] & subr[600] ? {8{pixelOnArr[600]}}:
					txtArray[599] & subr[599] ? {8{pixelOnArr[599]}}:
					txtArray[598] & subr[598] ? {8{pixelOnArr[598]}}:
					txtArray[597] & subr[597] ? {8{pixelOnArr[597]}}:
					txtArray[596] & subr[596] ? {8{pixelOnArr[596]}}:
					txtArray[595] & subr[595] ? {8{pixelOnArr[595]}}:
					txtArray[594] & subr[594] ? {8{pixelOnArr[594]}}:
					txtArray[593] & subr[593] ? {8{pixelOnArr[593]}}:
					txtArray[592] & subr[592] ? {8{pixelOnArr[592]}}:
					txtArray[591] & subr[591] ? {8{pixelOnArr[591]}}:
					txtArray[590] & subr[590] ? {8{pixelOnArr[590]}}:
					txtArray[589] & subr[589] ? {8{pixelOnArr[589]}}:
					txtArray[588] & subr[588] ? {8{pixelOnArr[588]}}:
					txtArray[587] & subr[587] ? {8{pixelOnArr[587]}}:
					txtArray[586] & subr[586] ? {8{pixelOnArr[586]}}:
					txtArray[585] & subr[585] ? {8{pixelOnArr[585]}}:
					txtArray[584] & subr[584] ? {8{pixelOnArr[584]}}:
					txtArray[583] & subr[583] ? {8{pixelOnArr[583]}}:
					txtArray[582] & subr[582] ? {8{pixelOnArr[582]}}:
					txtArray[581] & subr[581] ? {8{pixelOnArr[581]}}:
					txtArray[580] & subr[580] ? {8{pixelOnArr[580]}}:
					txtArray[579] & subr[579] ? {8{pixelOnArr[579]}}:
					txtArray[578] & subr[578] ? {8{pixelOnArr[578]}}:
					txtArray[577] & subr[577] ? {8{pixelOnArr[577]}}:
					txtArray[576] & subr[576] ? {8{pixelOnArr[576]}}:
					txtArray[575] & subr[575] ? {8{pixelOnArr[575]}}:
					txtArray[574] & subr[574] ? {8{pixelOnArr[574]}}:
					txtArray[573] & subr[573] ? {8{pixelOnArr[573]}}:
					txtArray[572] & subr[572] ? {8{pixelOnArr[572]}}:
					txtArray[571] & subr[571] ? {8{pixelOnArr[571]}}:
					txtArray[570] & subr[570] ? {8{pixelOnArr[570]}}:
					txtArray[569] & subr[569] ? {8{pixelOnArr[569]}}:
					txtArray[568] & subr[568] ? {8{pixelOnArr[568]}}:
					txtArray[567] & subr[567] ? {8{pixelOnArr[567]}}:
					txtArray[566] & subr[566] ? {8{pixelOnArr[566]}}:
					txtArray[565] & subr[565] ? {8{pixelOnArr[565]}}:
					txtArray[564] & subr[564] ? {8{pixelOnArr[564]}}:
					txtArray[563] & subr[563] ? {8{pixelOnArr[563]}}:
					txtArray[562] & subr[562] ? {8{pixelOnArr[562]}}:
					txtArray[561] & subr[561] ? {8{pixelOnArr[561]}}:
					txtArray[560] & subr[560] ? {8{pixelOnArr[560]}}:
					txtArray[559] & subr[559] ? {8{pixelOnArr[559]}}:
					txtArray[558] & subr[558] ? {8{pixelOnArr[558]}}:
					txtArray[557] & subr[557] ? {8{pixelOnArr[557]}}:
					txtArray[556] & subr[556] ? {8{pixelOnArr[556]}}:
					txtArray[555] & subr[555] ? {8{pixelOnArr[555]}}:
					txtArray[554] & subr[554] ? {8{pixelOnArr[554]}}:
					txtArray[553] & subr[553] ? {8{pixelOnArr[553]}}:
					txtArray[552] & subr[552] ? {8{pixelOnArr[552]}}:
					txtArray[551] & subr[551] ? {8{pixelOnArr[551]}}:
					txtArray[550] & subr[550] ? {8{pixelOnArr[550]}}:
					txtArray[549] & subr[549] ? {8{pixelOnArr[549]}}:
					txtArray[548] & subr[548] ? {8{pixelOnArr[548]}}:
					txtArray[547] & subr[547] ? {8{pixelOnArr[547]}}:
					txtArray[546] & subr[546] ? {8{pixelOnArr[546]}}:
					txtArray[545] & subr[545] ? {8{pixelOnArr[545]}}:
					txtArray[544] & subr[544] ? {8{pixelOnArr[544]}}:
					txtArray[543] & subr[543] ? {8{pixelOnArr[543]}}:
					txtArray[542] & subr[542] ? {8{pixelOnArr[542]}}:
					txtArray[541] & subr[541] ? {8{pixelOnArr[541]}}:
					txtArray[540] & subr[540] ? {8{pixelOnArr[540]}}:
					txtArray[539] & subr[539] ? {8{pixelOnArr[539]}}:
					txtArray[538] & subr[538] ? {8{pixelOnArr[538]}}:
					txtArray[537] & subr[537] ? {8{pixelOnArr[537]}}:
					txtArray[536] & subr[536] ? {8{pixelOnArr[536]}}:
					txtArray[535] & subr[535] ? {8{pixelOnArr[535]}}:
					txtArray[534] & subr[534] ? {8{pixelOnArr[534]}}:
					txtArray[533] & subr[533] ? {8{pixelOnArr[533]}}:
					txtArray[532] & subr[532] ? {8{pixelOnArr[532]}}:
					txtArray[531] & subr[531] ? {8{pixelOnArr[531]}}:
					txtArray[530] & subr[530] ? {8{pixelOnArr[530]}}:
					txtArray[529] & subr[529] ? {8{pixelOnArr[529]}}:
					txtArray[528] & subr[528] ? {8{pixelOnArr[528]}}:
					txtArray[527] & subr[527] ? {8{pixelOnArr[527]}}:
					txtArray[526] & subr[526] ? {8{pixelOnArr[526]}}:
					txtArray[525] & subr[525] ? {8{pixelOnArr[525]}}:
					txtArray[524] & subr[524] ? {8{pixelOnArr[524]}}:
					txtArray[523] & subr[523] ? {8{pixelOnArr[523]}}:
					txtArray[522] & subr[522] ? {8{pixelOnArr[522]}}:
					txtArray[521] & subr[521] ? {8{pixelOnArr[521]}}:
					txtArray[520] & subr[520] ? {8{pixelOnArr[520]}}:
					txtArray[519] & subr[519] ? {8{pixelOnArr[519]}}:
					txtArray[518] & subr[518] ? {8{pixelOnArr[518]}}:
					txtArray[517] & subr[517] ? {8{pixelOnArr[517]}}:
					txtArray[516] & subr[516] ? {8{pixelOnArr[516]}}:
					txtArray[515] & subr[515] ? {8{pixelOnArr[515]}}:
					txtArray[514] & subr[514] ? {8{pixelOnArr[514]}}:
					txtArray[513] & subr[513] ? {8{pixelOnArr[513]}}:
					txtArray[512] & subr[512] ? {8{pixelOnArr[512]}}:
					txtArray[511] & subr[511] ? {8{pixelOnArr[511]}}:
					txtArray[510] & subr[510] ? {8{pixelOnArr[510]}}:
					txtArray[509] & subr[509] ? {8{pixelOnArr[509]}}:
					txtArray[508] & subr[508] ? {8{pixelOnArr[508]}}:
					txtArray[507] & subr[507] ? {8{pixelOnArr[507]}}:
					txtArray[506] & subr[506] ? {8{pixelOnArr[506]}}:
					txtArray[505] & subr[505] ? {8{pixelOnArr[505]}}:
					txtArray[504] & subr[504] ? {8{pixelOnArr[504]}}:
					txtArray[503] & subr[503] ? {8{pixelOnArr[503]}}:
					txtArray[502] & subr[502] ? {8{pixelOnArr[502]}}:
					txtArray[501] & subr[501] ? {8{pixelOnArr[501]}}:
					txtArray[500] & subr[500] ? {8{pixelOnArr[500]}}:
					txtArray[499] & subr[499] ? {8{pixelOnArr[499]}}:
					txtArray[498] & subr[498] ? {8{pixelOnArr[498]}}:
					txtArray[497] & subr[497] ? {8{pixelOnArr[497]}}:
					txtArray[496] & subr[496] ? {8{pixelOnArr[496]}}:
					txtArray[495] & subr[495] ? {8{pixelOnArr[495]}}:
					txtArray[494] & subr[494] ? {8{pixelOnArr[494]}}:
					txtArray[493] & subr[493] ? {8{pixelOnArr[493]}}:
					txtArray[492] & subr[492] ? {8{pixelOnArr[492]}}:
					txtArray[491] & subr[491] ? {8{pixelOnArr[491]}}:
					txtArray[490] & subr[490] ? {8{pixelOnArr[490]}}:
					txtArray[489] & subr[489] ? {8{pixelOnArr[489]}}:
					txtArray[488] & subr[488] ? {8{pixelOnArr[488]}}:
					txtArray[487] & subr[487] ? {8{pixelOnArr[487]}}:
					txtArray[486] & subr[486] ? {8{pixelOnArr[486]}}:
					txtArray[485] & subr[485] ? {8{pixelOnArr[485]}}:
					txtArray[484] & subr[484] ? {8{pixelOnArr[484]}}:
					txtArray[483] & subr[483] ? {8{pixelOnArr[483]}}:
					txtArray[482] & subr[482] ? {8{pixelOnArr[482]}}:
					txtArray[481] & subr[481] ? {8{pixelOnArr[481]}}:
					txtArray[480] & subr[480] ? {8{pixelOnArr[480]}}:
					txtArray[479] & subr[479] ? {8{pixelOnArr[479]}}:
					txtArray[478] & subr[478] ? {8{pixelOnArr[478]}}:
					txtArray[477] & subr[477] ? {8{pixelOnArr[477]}}:
					txtArray[476] & subr[476] ? {8{pixelOnArr[476]}}:
					txtArray[475] & subr[475] ? {8{pixelOnArr[475]}}:
					txtArray[474] & subr[474] ? {8{pixelOnArr[474]}}:
					txtArray[473] & subr[473] ? {8{pixelOnArr[473]}}:
					txtArray[472] & subr[472] ? {8{pixelOnArr[472]}}:
					txtArray[471] & subr[471] ? {8{pixelOnArr[471]}}:
					txtArray[470] & subr[470] ? {8{pixelOnArr[470]}}:
					txtArray[469] & subr[469] ? {8{pixelOnArr[469]}}:
					txtArray[468] & subr[468] ? {8{pixelOnArr[468]}}:
					txtArray[467] & subr[467] ? {8{pixelOnArr[467]}}:
					txtArray[466] & subr[466] ? {8{pixelOnArr[466]}}:
					txtArray[465] & subr[465] ? {8{pixelOnArr[465]}}:
					txtArray[464] & subr[464] ? {8{pixelOnArr[464]}}:
					txtArray[463] & subr[463] ? {8{pixelOnArr[463]}}:
					txtArray[462] & subr[462] ? {8{pixelOnArr[462]}}:
					txtArray[461] & subr[461] ? {8{pixelOnArr[461]}}:
					txtArray[460] & subr[460] ? {8{pixelOnArr[460]}}:
					txtArray[459] & subr[459] ? {8{pixelOnArr[459]}}:
					txtArray[458] & subr[458] ? {8{pixelOnArr[458]}}:
					txtArray[457] & subr[457] ? {8{pixelOnArr[457]}}:
					txtArray[456] & subr[456] ? {8{pixelOnArr[456]}}:
					txtArray[455] & subr[455] ? {8{pixelOnArr[455]}}:
					txtArray[454] & subr[454] ? {8{pixelOnArr[454]}}:
					txtArray[453] & subr[453] ? {8{pixelOnArr[453]}}:
					txtArray[452] & subr[452] ? {8{pixelOnArr[452]}}:
					txtArray[451] & subr[451] ? {8{pixelOnArr[451]}}:
					txtArray[450] & subr[450] ? {8{pixelOnArr[450]}}:
					txtArray[449] & subr[449] ? {8{pixelOnArr[449]}}:
					txtArray[448] & subr[448] ? {8{pixelOnArr[448]}}:
					txtArray[447] & subr[447] ? {8{pixelOnArr[447]}}:
					txtArray[446] & subr[446] ? {8{pixelOnArr[446]}}:
					txtArray[445] & subr[445] ? {8{pixelOnArr[445]}}:
					txtArray[444] & subr[444] ? {8{pixelOnArr[444]}}:
					txtArray[443] & subr[443] ? {8{pixelOnArr[443]}}:
					txtArray[442] & subr[442] ? {8{pixelOnArr[442]}}:
					txtArray[441] & subr[441] ? {8{pixelOnArr[441]}}:
					txtArray[440] & subr[440] ? {8{pixelOnArr[440]}}:
					txtArray[439] & subr[439] ? {8{pixelOnArr[439]}}:
					txtArray[438] & subr[438] ? {8{pixelOnArr[438]}}:
					txtArray[437] & subr[437] ? {8{pixelOnArr[437]}}:
					txtArray[436] & subr[436] ? {8{pixelOnArr[436]}}:
					txtArray[435] & subr[435] ? {8{pixelOnArr[435]}}:
					txtArray[434] & subr[434] ? {8{pixelOnArr[434]}}:
					txtArray[433] & subr[433] ? {8{pixelOnArr[433]}}:
					txtArray[432] & subr[432] ? {8{pixelOnArr[432]}}:
					txtArray[431] & subr[431] ? {8{pixelOnArr[431]}}:
					txtArray[430] & subr[430] ? {8{pixelOnArr[430]}}:
					txtArray[429] & subr[429] ? {8{pixelOnArr[429]}}:
					txtArray[428] & subr[428] ? {8{pixelOnArr[428]}}:
					txtArray[427] & subr[427] ? {8{pixelOnArr[427]}}:
					txtArray[426] & subr[426] ? {8{pixelOnArr[426]}}:
					txtArray[425] & subr[425] ? {8{pixelOnArr[425]}}:
					txtArray[424] & subr[424] ? {8{pixelOnArr[424]}}:
					txtArray[423] & subr[423] ? {8{pixelOnArr[423]}}:
					txtArray[422] & subr[422] ? {8{pixelOnArr[422]}}:
					txtArray[421] & subr[421] ? {8{pixelOnArr[421]}}:
					txtArray[420] & subr[420] ? {8{pixelOnArr[420]}}:
					txtArray[419] & subr[419] ? {8{pixelOnArr[419]}}:
					txtArray[418] & subr[418] ? {8{pixelOnArr[418]}}:
					txtArray[417] & subr[417] ? {8{pixelOnArr[417]}}:
					txtArray[416] & subr[416] ? {8{pixelOnArr[416]}}:
					txtArray[415] & subr[415] ? {8{pixelOnArr[415]}}:
					txtArray[414] & subr[414] ? {8{pixelOnArr[414]}}:
					txtArray[413] & subr[413] ? {8{pixelOnArr[413]}}:
					txtArray[412] & subr[412] ? {8{pixelOnArr[412]}}:
					txtArray[411] & subr[411] ? {8{pixelOnArr[411]}}:
					txtArray[410] & subr[410] ? {8{pixelOnArr[410]}}:
					txtArray[409] & subr[409] ? {8{pixelOnArr[409]}}:
					txtArray[408] & subr[408] ? {8{pixelOnArr[408]}}:
					txtArray[407] & subr[407] ? {8{pixelOnArr[407]}}:
					txtArray[406] & subr[406] ? {8{pixelOnArr[406]}}:
					txtArray[405] & subr[405] ? {8{pixelOnArr[405]}}:
					txtArray[404] & subr[404] ? {8{pixelOnArr[404]}}:
					txtArray[403] & subr[403] ? {8{pixelOnArr[403]}}:
					txtArray[402] & subr[402] ? {8{pixelOnArr[402]}}:
					txtArray[401] & subr[401] ? {8{pixelOnArr[401]}}:
					txtArray[400] & subr[400] ? {8{pixelOnArr[400]}}:
					txtArray[399] & subr[399] ? {8{pixelOnArr[399]}}:
					txtArray[398] & subr[398] ? {8{pixelOnArr[398]}}:
					txtArray[397] & subr[397] ? {8{pixelOnArr[397]}}:
					txtArray[396] & subr[396] ? {8{pixelOnArr[396]}}:
					txtArray[395] & subr[395] ? {8{pixelOnArr[395]}}:
					txtArray[394] & subr[394] ? {8{pixelOnArr[394]}}:
					txtArray[393] & subr[393] ? {8{pixelOnArr[393]}}:
					txtArray[392] & subr[392] ? {8{pixelOnArr[392]}}:
					txtArray[391] & subr[391] ? {8{pixelOnArr[391]}}:
					txtArray[390] & subr[390] ? {8{pixelOnArr[390]}}:
					txtArray[389] & subr[389] ? {8{pixelOnArr[389]}}:
					txtArray[388] & subr[388] ? {8{pixelOnArr[388]}}:
					txtArray[387] & subr[387] ? {8{pixelOnArr[387]}}:
					txtArray[386] & subr[386] ? {8{pixelOnArr[386]}}:
					txtArray[385] & subr[385] ? {8{pixelOnArr[385]}}:
					txtArray[384] & subr[384] ? {8{pixelOnArr[384]}}:
					txtArray[383] & subr[383] ? {8{pixelOnArr[383]}}:
					txtArray[382] & subr[382] ? {8{pixelOnArr[382]}}:
					txtArray[381] & subr[381] ? {8{pixelOnArr[381]}}:
					txtArray[380] & subr[380] ? {8{pixelOnArr[380]}}:
					txtArray[379] & subr[379] ? {8{pixelOnArr[379]}}:
					txtArray[378] & subr[378] ? {8{pixelOnArr[378]}}:
					txtArray[377] & subr[377] ? {8{pixelOnArr[377]}}:
					txtArray[376] & subr[376] ? {8{pixelOnArr[376]}}:
					txtArray[375] & subr[375] ? {8{pixelOnArr[375]}}:
					txtArray[374] & subr[374] ? {8{pixelOnArr[374]}}:
					txtArray[373] & subr[373] ? {8{pixelOnArr[373]}}:
					txtArray[372] & subr[372] ? {8{pixelOnArr[372]}}:
					txtArray[371] & subr[371] ? {8{pixelOnArr[371]}}:
					txtArray[370] & subr[370] ? {8{pixelOnArr[370]}}:
					txtArray[369] & subr[369] ? {8{pixelOnArr[369]}}:
					txtArray[368] & subr[368] ? {8{pixelOnArr[368]}}:
					txtArray[367] & subr[367] ? {8{pixelOnArr[367]}}:
					txtArray[366] & subr[366] ? {8{pixelOnArr[366]}}:
					txtArray[365] & subr[365] ? {8{pixelOnArr[365]}}:
					txtArray[364] & subr[364] ? {8{pixelOnArr[364]}}:
					txtArray[363] & subr[363] ? {8{pixelOnArr[363]}}:
					txtArray[362] & subr[362] ? {8{pixelOnArr[362]}}:
					txtArray[361] & subr[361] ? {8{pixelOnArr[361]}}:
					txtArray[360] & subr[360] ? {8{pixelOnArr[360]}}:
					txtArray[359] & subr[359] ? {8{pixelOnArr[359]}}:
					txtArray[358] & subr[358] ? {8{pixelOnArr[358]}}:
					txtArray[357] & subr[357] ? {8{pixelOnArr[357]}}:
					txtArray[356] & subr[356] ? {8{pixelOnArr[356]}}:
					txtArray[355] & subr[355] ? {8{pixelOnArr[355]}}:
					txtArray[354] & subr[354] ? {8{pixelOnArr[354]}}:
					txtArray[353] & subr[353] ? {8{pixelOnArr[353]}}:
					txtArray[352] & subr[352] ? {8{pixelOnArr[352]}}:
					txtArray[351] & subr[351] ? {8{pixelOnArr[351]}}:
					txtArray[350] & subr[350] ? {8{pixelOnArr[350]}}:
					txtArray[349] & subr[349] ? {8{pixelOnArr[349]}}:
					txtArray[348] & subr[348] ? {8{pixelOnArr[348]}}:
					txtArray[347] & subr[347] ? {8{pixelOnArr[347]}}:
					txtArray[346] & subr[346] ? {8{pixelOnArr[346]}}:
					txtArray[345] & subr[345] ? {8{pixelOnArr[345]}}:
					txtArray[344] & subr[344] ? {8{pixelOnArr[344]}}:
					txtArray[343] & subr[343] ? {8{pixelOnArr[343]}}:
					txtArray[342] & subr[342] ? {8{pixelOnArr[342]}}:
					txtArray[341] & subr[341] ? {8{pixelOnArr[341]}}:
					txtArray[340] & subr[340] ? {8{pixelOnArr[340]}}:
					txtArray[339] & subr[339] ? {8{pixelOnArr[339]}}:
					txtArray[338] & subr[338] ? {8{pixelOnArr[338]}}:
					txtArray[337] & subr[337] ? {8{pixelOnArr[337]}}:
					txtArray[336] & subr[336] ? {8{pixelOnArr[336]}}:
					txtArray[335] & subr[335] ? {8{pixelOnArr[335]}}:
					txtArray[334] & subr[334] ? {8{pixelOnArr[334]}}:
					txtArray[333] & subr[333] ? {8{pixelOnArr[333]}}:
					txtArray[332] & subr[332] ? {8{pixelOnArr[332]}}:
					txtArray[331] & subr[331] ? {8{pixelOnArr[331]}}:
					txtArray[330] & subr[330] ? {8{pixelOnArr[330]}}:
					txtArray[329] & subr[329] ? {8{pixelOnArr[329]}}:
					txtArray[328] & subr[328] ? {8{pixelOnArr[328]}}:
					txtArray[327] & subr[327] ? {8{pixelOnArr[327]}}:
					txtArray[326] & subr[326] ? {8{pixelOnArr[326]}}:
					txtArray[325] & subr[325] ? {8{pixelOnArr[325]}}:
					txtArray[324] & subr[324] ? {8{pixelOnArr[324]}}:
					txtArray[323] & subr[323] ? {8{pixelOnArr[323]}}:
					txtArray[322] & subr[322] ? {8{pixelOnArr[322]}}:
					txtArray[321] & subr[321] ? {8{pixelOnArr[321]}}:
					txtArray[320] & subr[320] ? {8{pixelOnArr[320]}}:
					txtArray[319] & subr[319] ? {8{pixelOnArr[319]}}:
					txtArray[318] & subr[318] ? {8{pixelOnArr[318]}}:
					txtArray[317] & subr[317] ? {8{pixelOnArr[317]}}:
					txtArray[316] & subr[316] ? {8{pixelOnArr[316]}}:
					txtArray[315] & subr[315] ? {8{pixelOnArr[315]}}:
					txtArray[314] & subr[314] ? {8{pixelOnArr[314]}}:
					txtArray[313] & subr[313] ? {8{pixelOnArr[313]}}:
					txtArray[312] & subr[312] ? {8{pixelOnArr[312]}}:
					txtArray[311] & subr[311] ? {8{pixelOnArr[311]}}:
					txtArray[310] & subr[310] ? {8{pixelOnArr[310]}}:
					txtArray[309] & subr[309] ? {8{pixelOnArr[309]}}:
					txtArray[308] & subr[308] ? {8{pixelOnArr[308]}}:
					txtArray[307] & subr[307] ? {8{pixelOnArr[307]}}:
					txtArray[306] & subr[306] ? {8{pixelOnArr[306]}}:
					txtArray[305] & subr[305] ? {8{pixelOnArr[305]}}:
					txtArray[304] & subr[304] ? {8{pixelOnArr[304]}}:
					txtArray[303] & subr[303] ? {8{pixelOnArr[303]}}:
					txtArray[302] & subr[302] ? {8{pixelOnArr[302]}}:
					txtArray[301] & subr[301] ? {8{pixelOnArr[301]}}:
					txtArray[300] & subr[300] ? {8{pixelOnArr[300]}}:
					txtArray[299] & subr[299] ? {8{pixelOnArr[299]}}:
					txtArray[298] & subr[298] ? {8{pixelOnArr[298]}}:
					txtArray[297] & subr[297] ? {8{pixelOnArr[297]}}:
					txtArray[296] & subr[296] ? {8{pixelOnArr[296]}}:
					txtArray[295] & subr[295] ? {8{pixelOnArr[295]}}:
					txtArray[294] & subr[294] ? {8{pixelOnArr[294]}}:
					txtArray[293] & subr[293] ? {8{pixelOnArr[293]}}:
					txtArray[292] & subr[292] ? {8{pixelOnArr[292]}}:
					txtArray[291] & subr[291] ? {8{pixelOnArr[291]}}:
					txtArray[290] & subr[290] ? {8{pixelOnArr[290]}}:
					txtArray[289] & subr[289] ? {8{pixelOnArr[289]}}:
					txtArray[288] & subr[288] ? {8{pixelOnArr[288]}}:
					txtArray[287] & subr[287] ? {8{pixelOnArr[287]}}:
					txtArray[286] & subr[286] ? {8{pixelOnArr[286]}}:
					txtArray[285] & subr[285] ? {8{pixelOnArr[285]}}:
					txtArray[284] & subr[284] ? {8{pixelOnArr[284]}}:
					txtArray[283] & subr[283] ? {8{pixelOnArr[283]}}:
					txtArray[282] & subr[282] ? {8{pixelOnArr[282]}}:
					txtArray[281] & subr[281] ? {8{pixelOnArr[281]}}:
					txtArray[280] & subr[280] ? {8{pixelOnArr[280]}}:
					txtArray[279] & subr[279] ? {8{pixelOnArr[279]}}:
					txtArray[278] & subr[278] ? {8{pixelOnArr[278]}}:
					txtArray[277] & subr[277] ? {8{pixelOnArr[277]}}:
					txtArray[276] & subr[276] ? {8{pixelOnArr[276]}}:
					txtArray[275] & subr[275] ? {8{pixelOnArr[275]}}:
					txtArray[274] & subr[274] ? {8{pixelOnArr[274]}}:
					txtArray[273] & subr[273] ? {8{pixelOnArr[273]}}:
					txtArray[272] & subr[272] ? {8{pixelOnArr[272]}}:
					txtArray[271] & subr[271] ? {8{pixelOnArr[271]}}:
					txtArray[270] & subr[270] ? {8{pixelOnArr[270]}}:
					txtArray[269] & subr[269] ? {8{pixelOnArr[269]}}:
					txtArray[268] & subr[268] ? {8{pixelOnArr[268]}}:
					txtArray[267] & subr[267] ? {8{pixelOnArr[267]}}:
					txtArray[266] & subr[266] ? {8{pixelOnArr[266]}}:
					txtArray[265] & subr[265] ? {8{pixelOnArr[265]}}:
					txtArray[264] & subr[264] ? {8{pixelOnArr[264]}}:
					txtArray[263] & subr[263] ? {8{pixelOnArr[263]}}:
					txtArray[262] & subr[262] ? {8{pixelOnArr[262]}}:
					txtArray[261] & subr[261] ? {8{pixelOnArr[261]}}:
					txtArray[260] & subr[260] ? {8{pixelOnArr[260]}}:
					txtArray[259] & subr[259] ? {8{pixelOnArr[259]}}:
					txtArray[258] & subr[258] ? {8{pixelOnArr[258]}}:
					txtArray[257] & subr[257] ? {8{pixelOnArr[257]}}:
					txtArray[256] & subr[256] ? {8{pixelOnArr[256]}}:
					txtArray[255] & subr[255] ? {8{pixelOnArr[255]}}:
					txtArray[254] & subr[254] ? {8{pixelOnArr[254]}}:
					txtArray[253] & subr[253] ? {8{pixelOnArr[253]}}:
					txtArray[252] & subr[252] ? {8{pixelOnArr[252]}}:
					txtArray[251] & subr[251] ? {8{pixelOnArr[251]}}:
					txtArray[250] & subr[250] ? {8{pixelOnArr[250]}}:
					txtArray[249] & subr[249] ? {8{pixelOnArr[249]}}:
					txtArray[248] & subr[248] ? {8{pixelOnArr[248]}}:
					txtArray[247] & subr[247] ? {8{pixelOnArr[247]}}:
					txtArray[246] & subr[246] ? {8{pixelOnArr[246]}}:
					txtArray[245] & subr[245] ? {8{pixelOnArr[245]}}:
					txtArray[244] & subr[244] ? {8{pixelOnArr[244]}}:
					txtArray[243] & subr[243] ? {8{pixelOnArr[243]}}:
					txtArray[242] & subr[242] ? {8{pixelOnArr[242]}}:
					txtArray[241] & subr[241] ? {8{pixelOnArr[241]}}:
					txtArray[240] & subr[240] ? {8{pixelOnArr[240]}}:
					txtArray[239] & subr[239] ? {8{pixelOnArr[239]}}:
					txtArray[238] & subr[238] ? {8{pixelOnArr[238]}}:
					txtArray[237] & subr[237] ? {8{pixelOnArr[237]}}:
					txtArray[236] & subr[236] ? {8{pixelOnArr[236]}}:
					txtArray[235] & subr[235] ? {8{pixelOnArr[235]}}:
					txtArray[234] & subr[234] ? {8{pixelOnArr[234]}}:
					txtArray[233] & subr[233] ? {8{pixelOnArr[233]}}:
					txtArray[232] & subr[232] ? {8{pixelOnArr[232]}}:
					txtArray[231] & subr[231] ? {8{pixelOnArr[231]}}:
					txtArray[230] & subr[230] ? {8{pixelOnArr[230]}}:
					txtArray[229] & subr[229] ? {8{pixelOnArr[229]}}:
					txtArray[228] & subr[228] ? {8{pixelOnArr[228]}}:
					txtArray[227] & subr[227] ? {8{pixelOnArr[227]}}:
					txtArray[226] & subr[226] ? {8{pixelOnArr[226]}}:
					txtArray[225] & subr[225] ? {8{pixelOnArr[225]}}:
					txtArray[224] & subr[224] ? {8{pixelOnArr[224]}}:
					txtArray[223] & subr[223] ? {8{pixelOnArr[223]}}:
					txtArray[222] & subr[222] ? {8{pixelOnArr[222]}}:
					txtArray[221] & subr[221] ? {8{pixelOnArr[221]}}:
					txtArray[220] & subr[220] ? {8{pixelOnArr[220]}}:
					txtArray[219] & subr[219] ? {8{pixelOnArr[219]}}:
					txtArray[218] & subr[218] ? {8{pixelOnArr[218]}}:
					txtArray[217] & subr[217] ? {8{pixelOnArr[217]}}:
					txtArray[216] & subr[216] ? {8{pixelOnArr[216]}}:
					txtArray[215] & subr[215] ? {8{pixelOnArr[215]}}:
					txtArray[214] & subr[214] ? {8{pixelOnArr[214]}}:
					txtArray[213] & subr[213] ? {8{pixelOnArr[213]}}:
					txtArray[212] & subr[212] ? {8{pixelOnArr[212]}}:
					txtArray[211] & subr[211] ? {8{pixelOnArr[211]}}:
					txtArray[210] & subr[210] ? {8{pixelOnArr[210]}}:
					txtArray[209] & subr[209] ? {8{pixelOnArr[209]}}:
					txtArray[208] & subr[208] ? {8{pixelOnArr[208]}}:
					txtArray[207] & subr[207] ? {8{pixelOnArr[207]}}:
					txtArray[206] & subr[206] ? {8{pixelOnArr[206]}}:
					txtArray[205] & subr[205] ? {8{pixelOnArr[205]}}:
					txtArray[204] & subr[204] ? {8{pixelOnArr[204]}}:
					txtArray[203] & subr[203] ? {8{pixelOnArr[203]}}:
					txtArray[202] & subr[202] ? {8{pixelOnArr[202]}}:
					txtArray[201] & subr[201] ? {8{pixelOnArr[201]}}:
					txtArray[200] & subr[200] ? {8{pixelOnArr[200]}}:
					txtArray[199] & subr[199] ? {8{pixelOnArr[199]}}:
					txtArray[198] & subr[198] ? {8{pixelOnArr[198]}}:
					txtArray[197] & subr[197] ? {8{pixelOnArr[197]}}:
					txtArray[196] & subr[196] ? {8{pixelOnArr[196]}}:
					txtArray[195] & subr[195] ? {8{pixelOnArr[195]}}:
					txtArray[194] & subr[194] ? {8{pixelOnArr[194]}}:
					txtArray[193] & subr[193] ? {8{pixelOnArr[193]}}:
					txtArray[192] & subr[192] ? {8{pixelOnArr[192]}}:
					txtArray[191] & subr[191] ? {8{pixelOnArr[191]}}:
					txtArray[190] & subr[190] ? {8{pixelOnArr[190]}}:
					txtArray[189] & subr[189] ? {8{pixelOnArr[189]}}:
					txtArray[188] & subr[188] ? {8{pixelOnArr[188]}}:
					txtArray[187] & subr[187] ? {8{pixelOnArr[187]}}:
					txtArray[186] & subr[186] ? {8{pixelOnArr[186]}}:
					txtArray[185] & subr[185] ? {8{pixelOnArr[185]}}:
					txtArray[184] & subr[184] ? {8{pixelOnArr[184]}}:
					txtArray[183] & subr[183] ? {8{pixelOnArr[183]}}:
					txtArray[182] & subr[182] ? {8{pixelOnArr[182]}}:
					txtArray[181] & subr[181] ? {8{pixelOnArr[181]}}:
					txtArray[180] & subr[180] ? {8{pixelOnArr[180]}}:
					txtArray[179] & subr[179] ? {8{pixelOnArr[179]}}:
					txtArray[178] & subr[178] ? {8{pixelOnArr[178]}}:
					txtArray[177] & subr[177] ? {8{pixelOnArr[177]}}:
					txtArray[176] & subr[176] ? {8{pixelOnArr[176]}}:
					txtArray[175] & subr[175] ? {8{pixelOnArr[175]}}:
					txtArray[174] & subr[174] ? {8{pixelOnArr[174]}}:
					txtArray[173] & subr[173] ? {8{pixelOnArr[173]}}:
					txtArray[172] & subr[172] ? {8{pixelOnArr[172]}}:
					txtArray[171] & subr[171] ? {8{pixelOnArr[171]}}:
					txtArray[170] & subr[170] ? {8{pixelOnArr[170]}}:
					txtArray[169] & subr[169] ? {8{pixelOnArr[169]}}:
					txtArray[168] & subr[168] ? {8{pixelOnArr[168]}}:
					txtArray[167] & subr[167] ? {8{pixelOnArr[167]}}:
					txtArray[166] & subr[166] ? {8{pixelOnArr[166]}}:
					txtArray[165] & subr[165] ? {8{pixelOnArr[165]}}:
					txtArray[164] & subr[164] ? {8{pixelOnArr[164]}}:
					txtArray[163] & subr[163] ? {8{pixelOnArr[163]}}:
					txtArray[162] & subr[162] ? {8{pixelOnArr[162]}}:
					txtArray[161] & subr[161] ? {8{pixelOnArr[161]}}:
					txtArray[160] & subr[160] ? {8{pixelOnArr[160]}}:
					txtArray[159] & subr[159] ? {8{pixelOnArr[159]}}:
					txtArray[158] & subr[158] ? {8{pixelOnArr[158]}}:
					txtArray[157] & subr[157] ? {8{pixelOnArr[157]}}:
					txtArray[156] & subr[156] ? {8{pixelOnArr[156]}}:
					txtArray[155] & subr[155] ? {8{pixelOnArr[155]}}:
					txtArray[154] & subr[154] ? {8{pixelOnArr[154]}}:
					txtArray[153] & subr[153] ? {8{pixelOnArr[153]}}:
					txtArray[152] & subr[152] ? {8{pixelOnArr[152]}}:
					txtArray[151] & subr[151] ? {8{pixelOnArr[151]}}:
					txtArray[150] & subr[150] ? {8{pixelOnArr[150]}}:
					txtArray[149] & subr[149] ? {8{pixelOnArr[149]}}:
					txtArray[148] & subr[148] ? {8{pixelOnArr[148]}}:
					txtArray[147] & subr[147] ? {8{pixelOnArr[147]}}:
					txtArray[146] & subr[146] ? {8{pixelOnArr[146]}}:
					txtArray[145] & subr[145] ? {8{pixelOnArr[145]}}:
					txtArray[144] & subr[144] ? {8{pixelOnArr[144]}}:
					txtArray[143] & subr[143] ? {8{pixelOnArr[143]}}:
					txtArray[142] & subr[142] ? {8{pixelOnArr[142]}}:
					txtArray[141] & subr[141] ? {8{pixelOnArr[141]}}:
					txtArray[140] & subr[140] ? {8{pixelOnArr[140]}}:
					txtArray[139] & subr[139] ? {8{pixelOnArr[139]}}:
					txtArray[138] & subr[138] ? {8{pixelOnArr[138]}}:
					txtArray[137] & subr[137] ? {8{pixelOnArr[137]}}:
					txtArray[136] & subr[136] ? {8{pixelOnArr[136]}}:
					txtArray[135] & subr[135] ? {8{pixelOnArr[135]}}:
					txtArray[134] & subr[134] ? {8{pixelOnArr[134]}}:
					txtArray[133] & subr[133] ? {8{pixelOnArr[133]}}:
					txtArray[132] & subr[132] ? {8{pixelOnArr[132]}}:
					txtArray[131] & subr[131] ? {8{pixelOnArr[131]}}:
					txtArray[130] & subr[130] ? {8{pixelOnArr[130]}}:
					txtArray[129] & subr[129] ? {8{pixelOnArr[129]}}:
					txtArray[128] & subr[128] ? {8{pixelOnArr[128]}}:
					txtArray[127] & subr[127] ? {8{pixelOnArr[127]}}:
					txtArray[126] & subr[126] ? {8{pixelOnArr[126]}}:
					txtArray[125] & subr[125] ? {8{pixelOnArr[125]}}:
					txtArray[124] & subr[124] ? {8{pixelOnArr[124]}}:
					txtArray[123] & subr[123] ? {8{pixelOnArr[123]}}:
					txtArray[122] & subr[122] ? {8{pixelOnArr[122]}}:
					txtArray[121] & subr[121] ? {8{pixelOnArr[121]}}:
					txtArray[120] & subr[120] ? {8{pixelOnArr[120]}}:
					txtArray[119] & subr[119] ? {8{pixelOnArr[119]}}:
					txtArray[118] & subr[118] ? {8{pixelOnArr[118]}}:
					txtArray[117] & subr[117] ? {8{pixelOnArr[117]}}:
					txtArray[116] & subr[116] ? {8{pixelOnArr[116]}}:
					txtArray[115] & subr[115] ? {8{pixelOnArr[115]}}:
					txtArray[114] & subr[114] ? {8{pixelOnArr[114]}}:
					txtArray[113] & subr[113] ? {8{pixelOnArr[113]}}:
					txtArray[112] & subr[112] ? {8{pixelOnArr[112]}}:
					txtArray[111] & subr[111] ? {8{pixelOnArr[111]}}:
					txtArray[110] & subr[110] ? {8{pixelOnArr[110]}}:
					txtArray[109] & subr[109] ? {8{pixelOnArr[109]}}:
					txtArray[108] & subr[108] ? {8{pixelOnArr[108]}}:
					txtArray[107] & subr[107] ? {8{pixelOnArr[107]}}:
					txtArray[106] & subr[106] ? {8{pixelOnArr[106]}}:
					txtArray[105] & subr[105] ? {8{pixelOnArr[105]}}:
					txtArray[104] & subr[104] ? {8{pixelOnArr[104]}}:
					txtArray[103] & subr[103] ? {8{pixelOnArr[103]}}:
					txtArray[102] & subr[102] ? {8{pixelOnArr[102]}}:
					txtArray[101] & subr[101] ? {8{pixelOnArr[101]}}:
					txtArray[100] & subr[100] ? {8{pixelOnArr[100]}}:
					txtArray[99] & subr[99] ? {8{pixelOnArr[99]}}:
					txtArray[98] & subr[98] ? {8{pixelOnArr[98]}}:
					txtArray[97] & subr[97] ? {8{pixelOnArr[97]}}:
					txtArray[96] & subr[96] ? {8{pixelOnArr[96]}}:
					txtArray[95] & subr[95] ? {8{pixelOnArr[95]}}:
					txtArray[94] & subr[94] ? {8{pixelOnArr[94]}}:
					txtArray[93] & subr[93] ? {8{pixelOnArr[93]}}:
					txtArray[92] & subr[92] ? {8{pixelOnArr[92]}}:
					txtArray[91] & subr[91] ? {8{pixelOnArr[91]}}:
					txtArray[90] & subr[90] ? {8{pixelOnArr[90]}}:
					txtArray[89] & subr[89] ? {8{pixelOnArr[89]}}:
					txtArray[88] & subr[88] ? {8{pixelOnArr[88]}}:
					txtArray[87] & subr[87] ? {8{pixelOnArr[87]}}:
					txtArray[86] & subr[86] ? {8{pixelOnArr[86]}}:
					txtArray[85] & subr[85] ? {8{pixelOnArr[85]}}:
					txtArray[84] & subr[84] ? {8{pixelOnArr[84]}}:
					txtArray[83] & subr[83] ? {8{pixelOnArr[83]}}:
					txtArray[82] & subr[82] ? {8{pixelOnArr[82]}}:
					txtArray[81] & subr[81] ? {8{pixelOnArr[81]}}:
					txtArray[80] & subr[80] ? {8{pixelOnArr[80]}}:
					txtArray[79] & subr[79] ? {8{pixelOnArr[79]}}:
					txtArray[78] & subr[78] ? {8{pixelOnArr[78]}}:
					txtArray[77] & subr[77] ? {8{pixelOnArr[77]}}:
					txtArray[76] & subr[76] ? {8{pixelOnArr[76]}}:
					txtArray[75] & subr[75] ? {8{pixelOnArr[75]}}:
					txtArray[74] & subr[74] ? {8{pixelOnArr[74]}}:
					txtArray[73] & subr[73] ? {8{pixelOnArr[73]}}:
					txtArray[72] & subr[72] ? {8{pixelOnArr[72]}}:
					txtArray[71] & subr[71] ? {8{pixelOnArr[71]}}:
					txtArray[70] & subr[70] ? {8{pixelOnArr[70]}}:
					txtArray[69] & subr[69] ? {8{pixelOnArr[69]}}:
					txtArray[68] & subr[68] ? {8{pixelOnArr[68]}}:
					txtArray[67] & subr[67] ? {8{pixelOnArr[67]}}:
					txtArray[66] & subr[66] ? {8{pixelOnArr[66]}}:
					txtArray[65] & subr[65] ? {8{pixelOnArr[65]}}:
					txtArray[64] & subr[64] ? {8{pixelOnArr[64]}}:
					txtArray[63] & subr[63] ? {8{pixelOnArr[63]}}:
					txtArray[62] & subr[62] ? {8{pixelOnArr[62]}}:
					txtArray[61] & subr[61] ? {8{pixelOnArr[61]}}:
					txtArray[60] & subr[60] ? {8{pixelOnArr[60]}}:
					txtArray[59] & subr[59] ? {8{pixelOnArr[59]}}:
					txtArray[58] & subr[58] ? {8{pixelOnArr[58]}}:
					txtArray[57] & subr[57] ? {8{pixelOnArr[57]}}:
					txtArray[56] & subr[56] ? {8{pixelOnArr[56]}}:
					txtArray[55] & subr[55] ? {8{pixelOnArr[55]}}:
					txtArray[54] & subr[54] ? {8{pixelOnArr[54]}}:
					txtArray[53] & subr[53] ? {8{pixelOnArr[53]}}:
					txtArray[52] & subr[52] ? {8{pixelOnArr[52]}}:
					txtArray[51] & subr[51] ? {8{pixelOnArr[51]}}:
					txtArray[50] & subr[50] ? {8{pixelOnArr[50]}}:
					txtArray[49] & subr[49] ? {8{pixelOnArr[49]}}:
					txtArray[48] & subr[48] ? {8{pixelOnArr[48]}}:
					txtArray[47] & subr[47] ? {8{pixelOnArr[47]}}:
					txtArray[46] & subr[46] ? {8{pixelOnArr[46]}}:
					txtArray[45] & subr[45] ? {8{pixelOnArr[45]}}:
					txtArray[44] & subr[44] ? {8{pixelOnArr[44]}}:
					txtArray[43] & subr[43] ? {8{pixelOnArr[43]}}:
					txtArray[42] & subr[42] ? {8{pixelOnArr[42]}}:
					txtArray[41] & subr[41] ? {8{pixelOnArr[41]}}:
					txtArray[40] & subr[40] ? {8{pixelOnArr[40]}}:
					txtArray[39] & subr[39] ? {8{pixelOnArr[39]}}:
					txtArray[38] & subr[38] ? {8{pixelOnArr[38]}}:
					txtArray[37] & subr[37] ? {8{pixelOnArr[37]}}:
					txtArray[36] & subr[36] ? {8{pixelOnArr[36]}}:
					txtArray[35] & subr[35] ? {8{pixelOnArr[35]}}:
					txtArray[34] & subr[34] ? {8{pixelOnArr[34]}}:
					txtArray[33] & subr[33] ? {8{pixelOnArr[33]}}:
					txtArray[32] & subr[32] ? {8{pixelOnArr[32]}}:
					txtArray[31] & subr[31] ? {8{pixelOnArr[31]}}:
					txtArray[30] & subr[30] ? {8{pixelOnArr[30]}}:
					txtArray[29] & subr[29] ? {8{pixelOnArr[29]}}:
					txtArray[28] & subr[28] ? {8{pixelOnArr[28]}}:
					txtArray[27] & subr[27] ? {8{pixelOnArr[27]}}:
					txtArray[26] & subr[26] ? {8{pixelOnArr[26]}}:
					txtArray[25] & subr[25] ? {8{pixelOnArr[25]}}:
					txtArray[24] & subr[24] ? {8{pixelOnArr[24]}}:
					txtArray[23] & subr[23] ? {8{pixelOnArr[23]}}:
					txtArray[22] & subr[22] ? {8{pixelOnArr[22]}}:
					txtArray[21] & subr[21] ? {8{pixelOnArr[21]}}:
					txtArray[20] & subr[20] ? {8{pixelOnArr[20]}}:
					txtArray[19] & subr[19] ? {8{pixelOnArr[19]}}:
					txtArray[18] & subr[18] ? {8{pixelOnArr[18]}}:
					txtArray[17] & subr[17] ? {8{pixelOnArr[17]}}:
					txtArray[16] & subr[16] ? {8{pixelOnArr[16]}}:
					txtArray[15] & subr[15] ? {8{pixelOnArr[15]}}:
					txtArray[14] & subr[14] ? {8{pixelOnArr[14]}}:
					txtArray[13] & subr[13] ? {8{pixelOnArr[13]}}:
					txtArray[12] & subr[12] ? {8{pixelOnArr[12]}}:
					txtArray[11] & subr[11] ? {8{pixelOnArr[11]}}:
					txtArray[10] & subr[10] ? {8{pixelOnArr[10]}}:
					txtArray[9] & subr[9] ? {8{pixelOnArr[9]}}:
					txtArray[8] & subr[8] ? {8{pixelOnArr[8]}}:
					txtArray[7] & subr[7] ? {8{pixelOnArr[7]}}:
					txtArray[6] & subr[6] ? {8{pixelOnArr[6]}}:
					txtArray[5] & subr[5] ? {8{pixelOnArr[5]}}:
					txtArray[4] & subr[4] ? {8{pixelOnArr[4]}}:
					txtArray[3] & subr[3] ? {8{pixelOnArr[3]}}:
					txtArray[2] & subr[2] ? {8{pixelOnArr[2]}}:
					txtArray[1] & subr[1] ? {8{pixelOnArr[1]}}:
					txtArray[0] & subr[0] ? {8{pixelOnArr[0]}}:8'h00;
endmodule