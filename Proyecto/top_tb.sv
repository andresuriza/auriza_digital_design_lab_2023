module top_tb;
	logic clk, reset;
	logic inicio;
	logic [3:0] vocales; 
	logic vgaclk;
	logic hsync, vsync;
	logic sync_b, blank_b;
	logic [7:0] r, g, b;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	
	top top1(clk, inicio,vocales, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b, WriteData, DataAdr, MemWrite);
	
	
endmodule
