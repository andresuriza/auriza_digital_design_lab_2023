//640X480
module videoGen(input logic [9:0] x, y, 
					input nxt,
					output logic [7:0] r, g, b);
logic pixel, rect, rect2, rect3, rect4, rect5, rect6, rect7, rect8,
rect9, rect10, rect11, rect12, rect13, rect14, rect15, rect16, rect17;
logic [10:0] topS = 10'd360;
logic [10:0] botS = 10'd411;
logic [10:0] leftS = 10'd76;
logic [10:0] rightS = 10'd126;

// Given y position, choose a character to display
// then look up the pixel value from the character ROM
// and display it in red or blue.Also draw a green rectangle.
//chargenrom chargenromb(y[8:3] + 8'd65, x[2:0], y[2:0], pixel);
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

//rectgen squareSel(x, y, 10'd360, 10'd411, 10'd76, 10'd126, rect17); // Linea divisora vertical jugador
//rectgen squareSel(x, y, 10'd413, 10'd464, 10'd128, 10'd179, rect17); // Linea divisora vertical jugador
//rectgen squareSel(x, y, 10'd468, 10'd517, 10'd183, 10'd232, rect17); // Linea divisora vertical jugador
rectgen squareSel(x, y, topS, botS, leftS, rightS, rect17); // Linea divisora vertical jugador
assign r = (rect17) ? 8'hFF:8'h00;
assign b = ((rect || rect2) & ~(rect3 || rect4 || rect5 || rect6 || rect7
|| rect8 || rect9 || rect10 || rect11 || rect12 || rect13 || rect14 || rect15
|| rect16 || rect17 || rect17)) ? 8'hFF:8'h00;

always_ff @(posedge nxt) begin
	if (nxt)
		topS = topS + 53;
		botS = botS + 53;
		leftS = leftS + 53;
		rightS = rightS + 53;
end

endmodule