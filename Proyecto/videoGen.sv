// 640x480 
module videoGen(input logic [9:0] x, y, input logic clkRam, clk, output logic [7:0] r, g, b);
	logic [63:0] pixelLineArr [656:0]; // Parametrizable
	logic [7:0] pixelsArr [656:0][7:0]; // Parametrizable
	logic pixelOnArr [656:0]; // Parametrizable
	logic [656:0] txtArray;
	logic [7:0] charCode;
	logic [7:0] pixels[7:0];
	
	genvar i, j;

	logic [9:0] z = 0;
	
	logic [9:0] address_a, address_b;
	logic [7:0] data_a, data_b, q_a, q_b;
	logic wren_a, wren_b;
	
	// q_b trae datos en base a address_b
	ram2 mem(address_a, address_b, clkRam, data_a, data_b, wren_a, wren_b, q_a, q_b);
	
	always_comb begin
		case(charCode[7:0])
			// A
			 0: begin
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
			 1: begin
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
			 2: begin
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
			 3: begin
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
			 4: begin
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
			  5: begin
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
			 6: begin
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
			 7: begin
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
			 8: begin
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
			 9: begin
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
			 10: begin
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
			 11: begin
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
			 12: begin
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
			 13: begin
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
			 14: begin
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
			 15: begin
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
			 16: begin
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
			 17: begin
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
			 18: begin
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
			 19: begin
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
			 20: begin
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
			 21: begin
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
			 22: begin
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
			 23: begin
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
			 24: begin
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
			 25: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b11111110;
				pixels[2] = 8'b00000100;
				pixels[3] = 8'b00001000;
				pixels[4] = 8'b00010000;
				pixels[5] = 8'b00100000;
				pixels[6] = 8'b01000000;
				pixels[7] = 8'b11111110;
			end
			26: begin
				pixels[0] = 8'b00000000;
				pixels[1] = 8'b00000000;
				pixels[2] = 8'b00000000;
				pixels[3] = 8'b00000000;
				pixels[4] = 8'b00000000;
				pixels[5] = 8'b00000000;
				pixels[6] = 8'b00000000;
				pixels[7] = 8'b00000000;
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

	always_ff @(negedge clk) begin
			if (z < 657) begin
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
endmodule