// 640x480 
module videoGen(input logic [9:0] x, y, output logic [7:0] r, g, b);
	logic pixel, inrect;
	logic [63:0] pixelLineA, pixelLineH, pixelLineO, pixelLineL;
	logic [63:0] pixelLineArr [6:0]; // Parametrizable
	logic [7:0] pixelsArr [6:0][7:0]; // Parametrizable
	logic pixelOnArr [6:0]; // Parametrizable
	logic txtH, txtO, txtL, txtA,pixelOnA, pixelOnH, pixelOnL, pixelOnO;
	logic [7:0] fakeMem[6:0] = '{21, 6, 0, 19, 4, 18, 19};
	
	genvar i;
	
	generate
        for (i=0; i < 7; i++) begin : gen
				textDecode td(fakeMem[6-i], pixelLineArr[6-i]);
				assign pixelsArr[6-i][0] = pixelLineArr[6-i][7:0];
				assign pixelsArr[6-i][1] = pixelLineArr[6-i][15:8];
				assign pixelsArr[6-i][2] = pixelLineArr[6-i][23:16];
				assign pixelsArr[6-i][3] = pixelLineArr[6-i][31:24];
				assign pixelsArr[6-i][4] = pixelLineArr[6-i][39:32];
				assign pixelsArr[6-i][5] = pixelLineArr[6-i][47:40];
				assign pixelsArr[6-i][6] = pixelLineArr[6-i][55:48];
				assign pixelsArr[6-i][7] = pixelLineArr[6-i][63:56];
				assign pixelOnArr[6-i] = (pixelsArr[6-i][y[2:0]][~x[2:0]]);
        end
    endgenerate
	
	assign txt1 = (x >= 16 & x < 24 & y >= 0 & y < 8); // Diferencia de 8
	assign txt2 = (x >= 24 & x < 32 & y >= 0 & y < 8); // Diferencia de 8
	assign txt3 = (x >= 32 & x < 40 & y >= 0 & y < 8); // Diferencia de 8
	assign txt4 = (x >= 40 & x < 48 & y >= 0 & y < 8); // Diferencia de 8
	assign txt5 = (x >= 48 & x < 56 & y >= 0 & y < 8); // Diferencia de 8
	assign txt6 = (x >= 56 & x < 64 & y >= 0 & y < 8); // Diferencia de 8
	assign txt7 = (x >= 64 & x < 72 & y >= 0 & y < 8); // Diferencia de 8

	assign r = txt1 ? {8{pixelOnArr[6]}}:
				  txt2 ? {8{pixelOnArr[5]}}:
				  txt3 ? {8{pixelOnArr[4]}}:
				  txt4 ? {8{pixelOnArr[3]}}:
				  txt5 ? {8{pixelOnArr[2]}}:
				  txt6 ? {8{pixelOnArr[1]}}:
				  txt7 ? {8{pixelOnArr[0]}}: 8'h00;
endmodule