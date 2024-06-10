module vga_tb();

	logic [7:0] r, g, b;
	logic clk, testB, vgaclk, hsync, vsync, sync_b, blank_b;

	vga vga1(clk, testB, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);
	
endmodule