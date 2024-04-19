//640X480
module videoGen(input clk, finished, win, lose, input logic [9:0] x, y, 
					input moveX, moveY, dirX, dirY, shoot,
					output logic [7:0] r, g, b);
logic pixel, rect, rect2, rect3, rect4, rect5, rect6, rect7, rect8,
rect9, rect10, rect11, rect12, rect13, rect14, rect15, rect16, iR, iR2, iR3, wH, lH;
logic winC = 0;
logic loseC = 0;
logic boats [26:0]; // boats[0] corresponde a cursor, el resto a barcos
logic boatsP [25:0];
//logic [24:0] tablero  = 25'b1000111000000011111100000; 

logic [2:0] TotalBarcos = 3'b100;
logic [2:0] NumBarco = 3'b011; 
logic [24:0] new_position;
logic [24:0] playerBoard = 0;
logic [24:0] updated_positions;
logic [24:0] result;
logic [24:0] seed = 25'b1001010001110111110010101;
//logic [24:0] seed = 25'b0010100101;
logic rst_n = 0;
logic clk2;

slowClock sc(clk, (~rst_n), clk2);
RandomGen random(.clk(clk), .rst_n(rst_n), .seed(seed), .result(result));


//probe p(updated_positions);

registroBarcos barcosCOM (TotalBarcos, result, clk, updated_positions);
registroBarcos barcosPl (TotalBarcos, playerBoard, clk, new_position);


logic [9:0] leftC = 10'd360;
logic [9:0] rightC = 10'd411;
logic [9:0] topC = 10'd76;
logic [9:0] botC = 10'd126;

logic [9:0] boatDimensions [0:99]; // [0:4*cantidad de cuadros-1]
logic [9:0] initialBD [0:99];

logic [24:0] t1Status = 0;

assign initialBD[0] = 10'd19;
assign initialBD[1] = 10'd70;
assign initialBD[2] = 10'd76;
assign initialBD[3] = 10'd126;

logic [9:0] boatsPos [0:99];
logic [6:0] i = 24;
logic [6:0] offset = 0;
logic done = 0;
genvar k;
int j;
int s;

rectgen rectgen1(1,x, y, 10'd20, 10'd279, 10'd76, 10'd336, rect); // Tablero jugador
rectgen rectgen2(1,x, y, 10'd361, 10'd620, 10'd76, 10'd336, rect2); // Tablero COM

rectgen rectgen3(1,x, y, 10'd70, 10'd73, 10'd76, 10'd336, rect3); // Linea divisora vertical jugador
rectgen rectgen4(1,x, y, 10'd123, 10'd126, 10'd76, 10'd336, rect4); // Linea divisora vertical jugador
rectgen rectgen5(1,x, y, 10'd176, 10'd179, 10'd76, 10'd336, rect5); // Linea divisora vertical jugador
rectgen rectgen6(1,x, y, 10'd229, 10'd232, 10'd76, 10'd336, rect6); // Linea divisora vertical jugador
rectgen rectgen7(1,x, y, 10'd282, 10'd285, 10'd76, 10'd336, rect7); // Linea divisora vertical jugador

rectgen rectgen8(1,x, y, 10'd0, 10'd640, 10'd126, 10'd129, rect8); // Linea divisora horizontal
rectgen rectgen9(1,x, y, 10'd0, 10'd640, 10'd179, 10'd182, rect9); // Linea divisora horizontal
rectgen rectgen10(1,x, y, 10'd0, 10'd640, 10'd232, 10'd235, rect10); // Linea divisora horizontal
rectgen rectgen11(1,x, y, 10'd0, 10'd640, 10'd285, 10'd288, rect11); // Linea divisora horizontal
rectgen rectgen12(1,x, y, 10'd0, 10'd640, 10'd338, 10'd341, rect12); // Linea divisora horizontal

rectgen rectgen13(1,x, y, 10'd411, 10'd414, 10'd76, 10'd336, rect13); // Linea divisora vertical jugador
rectgen rectgen14(1,x, y, 10'd464, 10'd467, 10'd76, 10'd336, rect14); // Linea divisora vertical jugador
rectgen rectgen15(1,x, y, 10'd517, 10'd520, 10'd76, 10'd336, rect15); // Linea divisora vertical jugador
rectgen rectgen16(1,x, y, 10'd570, 10'd573, 10'd76, 10'd336, rect16); // Linea divisora vertical jugador

rectgen squareSel(1,x, y, leftC, rightC, topC, botC, boats[0]);
rectgen boat1(t1Status[24],x, y, boatsPos[0], boatsPos[1], boatsPos[2], boatsPos[3], boats[1]);
rectgen boat2(t1Status[23],x, y, boatsPos[4], boatsPos[5], boatsPos[6], boatsPos[7], boats[2]);
rectgen boat3(t1Status[22],x, y, boatsPos[8], boatsPos[9], boatsPos[10], boatsPos[11], boats[3]);
rectgen boat4(t1Status[21],x, y, boatsPos[12], boatsPos[13], boatsPos[14], boatsPos[15], boats[4]);
rectgen boat5(t1Status[20],x, y, boatsPos[16], boatsPos[17], boatsPos[18], boatsPos[19], boats[5]);
rectgen boat6(t1Status[19],x, y, boatsPos[20], boatsPos[21], boatsPos[22], boatsPos[23], boats[6]);
rectgen boat7(t1Status[18],x, y, boatsPos[24], boatsPos[25], boatsPos[26], boatsPos[27], boats[7]);
rectgen boat8(t1Status[17],x, y, boatsPos[28], boatsPos[29], boatsPos[30], boatsPos[31], boats[8]);
rectgen boat9(t1Status[16],x, y, boatsPos[32], boatsPos[33], boatsPos[34], boatsPos[35], boats[9]);
rectgen boat10(t1Status[15],x, y, boatsPos[36], boatsPos[37], boatsPos[38], boatsPos[39], boats[10]);
rectgen boat11(t1Status[14],x, y, boatsPos[40], boatsPos[41], boatsPos[42], boatsPos[43], boats[11]);
rectgen boat12(t1Status[13],x, y, boatsPos[44], boatsPos[45], boatsPos[46], boatsPos[47], boats[12]);
rectgen boat13(t1Status[12],x, y, boatsPos[48], boatsPos[49], boatsPos[50], boatsPos[51], boats[13]);
rectgen boat14(t1Status[11],x, y, boatsPos[52], boatsPos[53], boatsPos[54], boatsPos[55], boats[14]);
rectgen boat15(t1Status[10],x, y, boatsPos[56], boatsPos[57], boatsPos[58], boatsPos[59], boats[15]);
rectgen boat16(t1Status[9],x, y, boatsPos[60], boatsPos[61], boatsPos[62], boatsPos[63], boats[16]);
rectgen boat17(t1Status[8],x, y, boatsPos[64], boatsPos[65], boatsPos[66], boatsPos[67], boats[17]);
rectgen boat18(t1Status[7],x, y, boatsPos[68], boatsPos[69], boatsPos[70], boatsPos[71], boats[18]);
rectgen boat19(t1Status[6],x, y, boatsPos[72], boatsPos[73], boatsPos[74], boatsPos[75], boats[19]);
rectgen boat20(t1Status[5],x, y, boatsPos[76], boatsPos[77], boatsPos[78], boatsPos[79], boats[20]);
rectgen boat21(t1Status[4],x, y, boatsPos[80], boatsPos[81], boatsPos[82], boatsPos[83], boats[21]);
rectgen boat22(t1Status[3],x, y, boatsPos[84], boatsPos[85], boatsPos[86], boatsPos[87], boats[22]);
rectgen boat23(t1Status[2],x, y, boatsPos[88], boatsPos[89], boatsPos[90], boatsPos[91], boats[23]);
rectgen boat24(t1Status[1],x, y, boatsPos[92], boatsPos[93], boatsPos[94], boatsPos[95], boats[24]);
rectgen boat25(t1Status[0],x, y, boatsPos[96], boatsPos[97], boatsPos[98], boatsPos[99], boats[25]);

rectgen boatP1(new_position[24],x, y, boatsPos[0] + 342, boatsPos[0] + 393, boatsPos[2], boatsPos[3], boatsP[1]);
rectgen boatP2(new_position[23],x, y, boatsPos[4] + 342, boatsPos[4]+ 393, boatsPos[6], boatsPos[7], boatsP[2]);
rectgen boatP3(new_position[22],x, y, boatsPos[8] + 342, boatsPos[8]+ 393, boatsPos[10], boatsPos[11], boatsP[3]);
rectgen boatP4(new_position[21],x, y, boatsPos[12] + 342, boatsPos[12]+ 393, boatsPos[14], boatsPos[15], boatsP[4]);
rectgen boatP5(new_position[20],x, y, boatsPos[16] + 342, boatsPos[16]+ 393, boatsPos[18], boatsPos[19], boatsP[5]);
rectgen boatP6(new_position[19],x, y, boatsPos[20] + 342, boatsPos[20]+ 393, boatsPos[22], boatsPos[23], boatsP[6]);
rectgen boatP7(new_position[18],x, y, boatsPos[24] + 342, boatsPos[24]+ 393, boatsPos[26], boatsPos[27], boatsP[7]);
rectgen boatP8(new_position[17],x, y, boatsPos[28] + 342, boatsPos[28]+ 393, boatsPos[30], boatsPos[31], boatsP[8]);
rectgen boatP9(new_position[16],x, y, boatsPos[32] + 342, boatsPos[32]+ 393, boatsPos[34], boatsPos[35], boatsP[9]);
rectgen boatP10(new_position[15],x, y, boatsPos[36] + 342, boatsPos[36]+ 393, boatsPos[38], boatsPos[39], boatsP[10]);
rectgen boatP11(new_position[14],x, y, boatsPos[40] + 342, boatsPos[40]+ 393, boatsPos[42], boatsPos[43], boatsP[11]);
rectgen boatP12(new_position[13],x, y, boatsPos[44] + 342, boatsPos[44]+ 393, boatsPos[46], boatsPos[47], boatsP[12]);
rectgen boatP13(new_position[12],x, y, boatsPos[48] + 342, boatsPos[48]+ 393, boatsPos[50], boatsPos[51], boatsP[13]);
rectgen boatP14(new_position[11],x, y, boatsPos[52] + 342, boatsPos[52]+ 393, boatsPos[54], boatsPos[55], boatsP[14]);
rectgen boatP15(new_position[10],x, y, boatsPos[56] + 342, boatsPos[56]+ 393, boatsPos[58], boatsPos[59], boatsP[15]);
rectgen boatP16(new_position[9],x, y, boatsPos[60] + 342, boatsPos[60]+ 393, boatsPos[62], boatsPos[63], boatsP[16]);
rectgen boatP17(new_position[8],x, y, boatsPos[64] + 342, boatsPos[64]+ 393, boatsPos[66], boatsPos[67], boatsP[17]);
rectgen boatP18(new_position[7],x, y, boatsPos[68] + 342, boatsPos[68]+ 393, boatsPos[70], boatsPos[71], boatsP[18]);
rectgen boatP19(new_position[6],x, y, boatsPos[72] + 342, boatsPos[72]+ 393, boatsPos[74], boatsPos[75], boatsP[19]);
rectgen boatP20(new_position[5],x, y, boatsPos[76] + 342, boatsPos[76]+ 393, boatsPos[78], boatsPos[79], boatsP[20]);
rectgen boatP21(new_position[4],x, y, boatsPos[80] + 342, boatsPos[80]+ 393, boatsPos[82], boatsPos[83], boatsP[21]);
rectgen boatP22(new_position[3],x, y, boatsPos[84] + 342, boatsPos[84]+ 393, boatsPos[86], boatsPos[87], boatsP[22]);
rectgen boatP23(new_position[2],x, y, boatsPos[88] + 342, boatsPos[88]+ 393, boatsPos[90], boatsPos[91], boatsP[23]);
rectgen boatP24(new_position[1],x, y, boatsPos[92] + 342, boatsPos[92]+ 393, boatsPos[94], boatsPos[95], boatsP[24]);
rectgen boatP25(new_position[0],x, y, boatsPos[96] + 342, boatsPos[96]+ 393, boatsPos[98], boatsPos[99], boatsP[25]);



rectgen iL(winC,x, y, 300, 302, 429, 459, iR);
rectgen iL2(winC,x, y, 311, 313, 429, 459, iR2);
rectgen iL2R(loseC,x, y, 311, 313, 429, 459, iR2R);
rectgen iL3(winC,x, y, 323, 325, 429, 459, iR3);
rectgen wHoriz(winC,x, y, 300, 325, 457, 459, wH);
rectgen lHoriz(loseC,x, y, 313, 325, 457, 459, lH);
//325
assign r = (boats[0] || boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10]
|| boats[11] || boats[12] || boats[13] || boats[14] || boats[15] || boats[16] 
|| boats[17] || boats[18] || boats[19] || boats[20] || boats[21] || boats[22] 
|| boats[23] || boats[24] || boats[25] || boatsP[1] || boatsP[2] || boatsP[3] || boatsP[4]
|| boatsP[5] || boatsP[6] || boatsP[7] || boatsP[8] || boatsP[9] || boatsP[10]
|| boatsP[11] || boatsP[12] || boatsP[13] || boatsP[14] || boatsP[15] || boatsP[16] 
|| boatsP[17] || boatsP[18] || boatsP[19] || boatsP[20] || boatsP[21] || boatsP[22] 
|| boatsP[23] || boatsP[24] || boatsP[25] || iR2R || lH) ? 8'hFF:8'h00;
assign g = (boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10] || boats[11]
|| boats[12] || boats[13] || boats[14] || boats[15] || boats[16] || boats[17]
|| boats[18] || boats[19] || boats[20] || boats[21] || boats[22] || boats[23]
|| boats[24] || boats[25] || boatsP[1] || boatsP[2] || boatsP[3] || boatsP[4]
|| boatsP[5] || boatsP[6] || boatsP[7] || boatsP[8] || boatsP[9] || boatsP[10]
|| boatsP[11] || boatsP[12] || boatsP[13] || boatsP[14] || boatsP[15] || boatsP[16] 
|| boatsP[17] || boatsP[18] || boatsP[19] || boatsP[20] || boatsP[21] || boatsP[22] 
|| boatsP[23] || boatsP[24] || boatsP[25]) & ~(boats[0]) ? 8'hFF:8'h00;
assign b = (rect || rect2 || iR || iR2 || iR3 || wH) & ~(rect3 || rect4 || rect5 || rect6 || rect7
|| rect8 || rect9 || rect10 || rect11 || rect12 || rect13 || rect14 || rect15
|| rect16 || boats[0] || boats[1] || boats[2] || boats[3] || boats[4]
|| boats[5] || boats[6] || boats[7] || boats[8] || boats[9] || boats[10] || boats[11]
|| boats[12] || boats[13] || boats[14] || boats[15] || boats[16] || boats[17]
|| boats[18] || boats[19] || boats[20] || boats[21] || boats[22] || boats[23]
|| boats[24] || boats[25] || boatsP[1] || boatsP[2] || boatsP[3] || boatsP[4]
|| boatsP[5] || boatsP[6] || boatsP[7] || boatsP[8] || boatsP[9] || boatsP[10]
|| boatsP[11] || boatsP[12] || boatsP[13] || boatsP[14] || boatsP[15] || boatsP[16] 
|| boatsP[17] || boatsP[18] || boatsP[19] || boatsP[20] || boatsP[21] || boatsP[22] 
|| boatsP[23] || boatsP[24] || boatsP[25]) ? 8'hFF:8'h00;


assign initialBD[4] = initialBD[0] + 53;
assign initialBD[5] = initialBD[1] + 53;
assign initialBD[6] = initialBD[2];
assign initialBD[7] = initialBD[3];

assign initialBD[8] = initialBD[4] + 53;
assign initialBD[9] = initialBD[5] + 53;
assign initialBD[10] = initialBD[2];
assign initialBD[11] = initialBD[3];

assign initialBD[12] = initialBD[8] + 53;
assign initialBD[13] = initialBD[9] + 53;
assign initialBD[14] = initialBD[2];
assign initialBD[15] = initialBD[3];

assign initialBD[16] = initialBD[12] + 53;
assign initialBD[17] = initialBD[13] + 53;
assign initialBD[18] = initialBD[2];
assign initialBD[19] = initialBD[3];
//-------------------------------------------
assign initialBD[20] = initialBD[0];
assign initialBD[21] = initialBD[1];
assign initialBD[22] = initialBD[2] + 53;
assign initialBD[23] = initialBD[3] + 53;

assign initialBD[24] = initialBD[20] + 53;
assign initialBD[25] = initialBD[21] + 53;
assign initialBD[26] = initialBD[2] + 53;
assign initialBD[27] = initialBD[3] + 53;

assign initialBD[28] = initialBD[24] + 53;
assign initialBD[29] = initialBD[25] + 53;
assign initialBD[30] = initialBD[2] + 53;
assign initialBD[31] = initialBD[3] + 53;

assign initialBD[32] = initialBD[28] + 53;
assign initialBD[33] = initialBD[29] + 53;
assign initialBD[34] = initialBD[2] + 53;
assign initialBD[35] = initialBD[3] + 53;

assign initialBD[36] = initialBD[32] + 53;
assign initialBD[37] = initialBD[33] + 53;
assign initialBD[38] = initialBD[2] + 53;
assign initialBD[39] = initialBD[3] + 53;
//--------------------------------------------
assign initialBD[40] = initialBD[0];
assign initialBD[41] = initialBD[1];
assign initialBD[42] = initialBD[38] + 53;
assign initialBD[43] = initialBD[39] + 53;

assign initialBD[44] = initialBD[40] + 53;
assign initialBD[45] = initialBD[41] + 53;
assign initialBD[46] = initialBD[38] + 53;
assign initialBD[47] = initialBD[39] + 53;

assign initialBD[48] = initialBD[44] + 53;
assign initialBD[49] = initialBD[45] + 53;
assign initialBD[50] = initialBD[38] + 53;
assign initialBD[51] = initialBD[39] + 53;

assign initialBD[52] = initialBD[48] + 53;
assign initialBD[53] = initialBD[49] + 53;
assign initialBD[54] = initialBD[38] + 53;
assign initialBD[55] = initialBD[39] + 53;

assign initialBD[56] = initialBD[52] + 53;
assign initialBD[57] = initialBD[53] + 53;
assign initialBD[58] = initialBD[38] + 53;
assign initialBD[59] = initialBD[39] + 53;
//---------------------------------------------------
assign initialBD[60] = initialBD[0];
assign initialBD[61] = initialBD[1];
assign initialBD[62] = initialBD[58] + 53;
assign initialBD[63] = initialBD[59] + 53;

assign initialBD[64] = initialBD[60] + 53;
assign initialBD[65] = initialBD[61] + 53;
assign initialBD[66] = initialBD[58] + 53;
assign initialBD[67] = initialBD[59] + 53;

assign initialBD[68] = initialBD[64] + 53;
assign initialBD[69] = initialBD[65] + 53;
assign initialBD[70] = initialBD[58] + 53;
assign initialBD[71] = initialBD[59] + 53;

assign initialBD[72] = initialBD[68] + 53;
assign initialBD[73] = initialBD[69] + 53;
assign initialBD[74] = initialBD[58] + 53;
assign initialBD[75] = initialBD[59] + 53;

assign initialBD[76] = initialBD[72] + 53;
assign initialBD[77] = initialBD[73] + 53;
assign initialBD[78] = initialBD[58] + 53;
assign initialBD[79] = initialBD[59] + 53;
//----------------------------------------------------
assign initialBD[80] = initialBD[0];
assign initialBD[81] = initialBD[1];
assign initialBD[82] = initialBD[78] + 53;
assign initialBD[83] = initialBD[79] + 53;

assign initialBD[84] = initialBD[80] + 53;
assign initialBD[85] = initialBD[81] + 53;
assign initialBD[86] = initialBD[78] + 53;
assign initialBD[87] = initialBD[79] + 53;

assign initialBD[88] = initialBD[84] + 53;
assign initialBD[89] = initialBD[85] + 53;
assign initialBD[90] = initialBD[78] + 53;
assign initialBD[91] = initialBD[79] + 53;

assign initialBD[92] = initialBD[88] + 53;
assign initialBD[93] = initialBD[89] + 53;
assign initialBD[94] = initialBD[78] + 53;
assign initialBD[95] = initialBD[79] + 53;

assign initialBD[96] = initialBD[92] + 53;
assign initialBD[97] = initialBD[93] + 53;
assign initialBD[98] = initialBD[78] + 53;
assign initialBD[99] = initialBD[79] + 53;

always_ff @(posedge clk) begin
	if (finished) begin
		if (win)
			winC = 1;
		else
			loseC = 1;
	end
end

assign boatDimensions = initialBD;
assign boatsPos = boatDimensions;

always_ff @(posedge clk) begin
	rst_n = 1;

end
		// Genera nums de dimensiones

assign t1Status = updated_positions;	
		
//always_ff @(posedge clk) begin
//	for(j = 0; j < 25; j++) begin //: generar_barcos
//			if (updated_positions[24-j] == 1) begin
//				t1Status[24-j] = 1;
////				 boatDimensions[j*4] = initialBD[j*4];
////				 boatDimensions[(j*4) + 1] = initialBD[(j*4) + 1];
////				 boatDimensions[(j*4) + 2] = initialBD[(j*4) + 2];
////				 boatDimensions[(j*4) + 3] = initialBD[(j*4) + 3];
//			end
////			else begin
////				boatDimensions[j*4] = 0;
////				 boatDimensions[(j*4) + 1] = 0;
////				 boatDimensions[(j*4) + 2] = 0;
////				 boatDimensions[(j*4) + 3] = 0;
////			end
//		end
//	for(s = 0; s < 100; s++) begin	
//			boatsPos[s] = boatDimensions[s];
//	 end
//end



always_ff @(posedge shoot) begin
	if (shoot) begin
		playerBoard[i] = 1;
	end
end

always_ff @(posedge moveX) begin
		i = i - 1;
		if (rightC < 623) begin
			leftC = leftC + 53;
			rightC = rightC + 53;
		end
		else if ((rightC == 623) & (botC < 336)) begin
			topC = topC + 53;
			botC = botC + 53;
			leftC = 10'd360;
			rightC = 10'd411;
		end
		else if (botC == 338) begin
			leftC = 10'd360;
			rightC = 10'd411;
			topC = 10'd76;
			botC = 10'd126;
			i = 24;
		end
end

//always_ff @(posedge moveY) begin
//	if (moveY) begin
//		if ((dirY == 0) & (botC < 336)) begin
//			topC = topC + 53;
//			botC = botC + 53;
//		end
//		else if ((dirY == 1) & (topC > 76)) begin
//			topC = topC - 53;
//			botC = botC - 53;
//		end
//	end
//end

endmodule