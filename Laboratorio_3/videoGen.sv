//640X480
module videoGen(input clk, input logic [9:0] x, y, 
					input moveX, moveY, dirX, dirY, shoot,
					output logic [7:0] r, g, b);
logic pixel, rect, rect2, rect3, rect4, rect5, rect6, rect7, rect8,
rect9, rect10, rect11, rect12, rect13, rect14, rect15, rect16;

logic boats [0:25]; // boats[0] corresponde a cursor, el resto a barcos
logic [9:0] leftC = 10'd360;
logic [9:0] rightC = 10'd411;
logic [9:0] topC = 10'd76;
logic [9:0] botC = 10'd126;

logic [9:0] boatDimensions [0:15]; // [0:4*cantidad de barcos-1]
logic [9:0] initialBD [0:3]  = '{10'd19, 10'd70, 10'd76, 10'd126};

logic [9:0] boatsPos [0:99];
logic [6:0] i = 0;
logic [6:0] offset = 0;

genvar k;
genvar j;

rectgen rectgen1(x, y, 10'd20, 10'd279, 10'd76, 10'd336, rect); // Tablero jugador
rectgen rectgen2(x, y, 10'd361, 10'd620, 10'd76, 10'd336, rect2); // Tablero COM

rectgen rectgen3(x, y, 10'd70, 10'd73, 10'd76, 10'd336, rect3); // Linea divisora vertical jugador
rectgen rectgen4(x, y, 10'd123, 10'd126, 10'd76, 10'd336, rect4); // Linea divisora vertical jugador
rectgen rectgen5(x, y, 10'd176, 10'd179, 10'd76, 10'd336, rect5); // Linea divisora vertical jugador
rectgen rectgen6(x, y, 10'd229, 10'd232, 10'd76, 10'd336, rect6); // Linea divisora vertical jugador
rectgen rectgen7(x, y, 10'd282, 10'd285, 10'd76, 10'd336, rect7); // Linea divisora vertical jugador

rectgen rectgen8(x, y, 10'd0, 10'd640, 10'd126, 10'd129, rect8); // Linea divisora horizontal
rectgen rectgen9(x, y, 10'd0, 10'd640, 10'd179, 10'd182, rect9); // Linea divisora horizontal
rectgen rectgen10(x, y, 10'd0, 10'd640, 10'd232, 10'd235, rect10); // Linea divisora horizontal
rectgen rectgen11(x, y, 10'd0, 10'd640, 10'd285, 10'd288, rect11); // Linea divisora horizontal
rectgen rectgen12(x, y, 10'd0, 10'd640, 10'd338, 10'd341, rect12); // Linea divisora horizontal

rectgen rectgen13(x, y, 10'd411, 10'd414, 10'd76, 10'd336, rect13); // Linea divisora vertical jugador
rectgen rectgen14(x, y, 10'd464, 10'd467, 10'd76, 10'd336, rect14); // Linea divisora vertical jugador
rectgen rectgen15(x, y, 10'd517, 10'd520, 10'd76, 10'd336, rect15); // Linea divisora vertical jugador
rectgen rectgen16(x, y, 10'd570, 10'd573, 10'd76, 10'd336, rect16); // Linea divisora vertical jugador

rectgen squareSel(x, y, leftC, rightC, topC, botC, boats[0]);
rectgen boat1(x, y, boatsPos[0], boatsPos[1], boatsPos[2], boatsPos[3], boats[1]);
rectgen boat2(x, y, boatsPos[4], boatsPos[5], boatsPos[6], boatsPos[7], boats[2]);
rectgen boat3(x, y, boatsPos[8], boatsPos[9], boatsPos[10], boatsPos[11], boats[3]);
rectgen boat4(x, y, boatsPos[12], boatsPos[13], boatsPos[14], boatsPos[15], boats[4]);
rectgen boat5(x, y, boatsPos[16], boatsPos[17], boatsPos[18], boatsPos[19], boats[5]);
rectgen boat6(x, y, boatsPos[20], boatsPos[21], boatsPos[22], boatsPos[23], boats[6]);
rectgen boat7(x, y, boatsPos[24], boatsPos[25], boatsPos[26], boatsPos[27], boats[7]);
rectgen boat8(x, y, boatsPos[28], boatsPos[29], boatsPos[30], boatsPos[31], boats[8]);
rectgen boat9(x, y, boatsPos[32], boatsPos[33], boatsPos[34], boatsPos[35], boats[9]);
rectgen boat10(x, y, boatsPos[36], boatsPos[37], boatsPos[38], boatsPos[39], boats[10]);
rectgen boat11(x, y, boatsPos[40], boatsPos[41], boatsPos[42], boatsPos[43], boats[11]);
rectgen boat12(x, y, boatsPos[44], boatsPos[45], boatsPos[46], boatsPos[47], boats[12]);
rectgen boat13(x, y, boatsPos[48], boatsPos[49], boatsPos[50], boatsPos[51], boats[13]);
rectgen boat14(x, y, boatsPos[52], boatsPos[53], boatsPos[54], boatsPos[55], boats[14]);
rectgen boat15(x, y, boatsPos[56], boatsPos[57], boatsPos[58], boatsPos[59], boats[15]);
rectgen boat16(x, y, boatsPos[60], boatsPos[61], boatsPos[62], boatsPos[63], boats[16]);
rectgen boat17(x, y, boatsPos[64], boatsPos[65], boatsPos[66], boatsPos[67], boats[17]);
rectgen boat18(x, y, boatsPos[68], boatsPos[69], boatsPos[70], boatsPos[71], boats[18]);
rectgen boat19(x, y, boatsPos[72], boatsPos[73], boatsPos[74], boatsPos[75], boats[19]);
rectgen boat20(x, y, boatsPos[76], boatsPos[77], boatsPos[78], boatsPos[79], boats[20]);
rectgen boat21(x, y, boatsPos[80], boatsPos[81], boatsPos[82], boatsPos[83], boats[21]);
rectgen boat22(x, y, boatsPos[84], boatsPos[85], boatsPos[86], boatsPos[87], boats[22]);
rectgen boat23(x, y, boatsPos[88], boatsPos[89], boatsPos[90], boatsPos[91], boats[23]);
rectgen boat24(x, y, boatsPos[92], boatsPos[93], boatsPos[94], boatsPos[95], boats[24]);
rectgen boat25(x, y, boatsPos[96], boatsPos[97], boatsPos[98], boatsPos[99], boats[25]);

assign r = (boats[0] || boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10]
|| boats[12] || boats[13] || boats[14] || boats[15] || boats[16] || boats[17]
|| boats[18] || boats[19] || boats[20] || boats[21] || boats[22] || boats[23]
|| boats[24] || boats[25]) ? 8'hFF:8'h00;
assign g = (boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10]
|| boats[12] || boats[13] || boats[14] || boats[15] || boats[16] || boats[17]
|| boats[18] || boats[19] || boats[20] || boats[21] || boats[22] || boats[23]
|| boats[24] || boats[25]) & ~(boats[0]) ? 8'hFF:8'h00;
assign b = ((rect || rect2) & ~(rect3 || rect4 || rect5 || rect6 || rect7
|| rect8 || rect9 || rect10 || rect11 || rect12 || rect13 || rect14 || rect15
|| rect16 || boats[0] || boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10]
|| boats[12] || boats[13] || boats[14] || boats[15] || boats[16] || boats[17]
|| boats[18] || boats[19] || boats[20] || boats[21] || boats[22] || boats[23]
|| boats[24] || boats[25])) ? 8'hFF:8'h00;

//generate
//    for(j = 0; j < 4; j++) begin : horizontal_boat_creator			
//			assign boatDimensions[4 * j] = initialBD[0] + (53 * j);
//			assign boatDimensions[(4 * j) + 1] = initialBD[1] + (53 * j);
//			assign boatDimensions[(4 * j) + 2] = initialBD[2];
//			assign boatDimensions[(4 * j) +3] = initialBD[3];
//	 end
//endgenerate

generate
    for(j = 0; j < 4; j++) begin : vertical_boat_creator			
			assign boatDimensions[4 * j] = initialBD[0];
			assign boatDimensions[(4 * j) + 1] = initialBD[1];
			assign boatDimensions[(4 * j) + 2] = initialBD[2] + (53 * j);
			assign boatDimensions[(4 * j) +3] = initialBD[3] + (53 * j);
	 end
endgenerate

generate
    for(k = 0; k < 16; k++) begin : boat_visual_gen			
			assign boatsPos[k] = boatDimensions[k];
	 end
endgenerate


//always_ff @(posedge shoot) begin
//	if (shoot) begin
//		boatsPos[i] = leftC;
//		boatsPos[i+1] = rightC;
//		boatsPos[i+2] = topC;
//		boatsPos[i+3] = botC;
//		i = i + 4;
//	end
//end

always_ff @(posedge moveX) begin
	if (moveX) begin
		if ((dirX == 0) & (rightC < 620)) begin
			leftC = leftC + 53;
			rightC = rightC + 53;
		end
		else if ((dirX == 1) & (leftC > 360)) begin
			leftC = leftC - 53;
			rightC = rightC - 53;
		end
	end
end

always_ff @(posedge moveY) begin
	if (moveY) begin
		if ((dirY == 0) & (botC < 336)) begin
			topC = topC + 53;
			botC = botC + 53;
		end
		else if ((dirY == 1) & (topC > 76)) begin
			topC = topC - 53;
			botC = botC - 53;
		end
	end
end

endmodule