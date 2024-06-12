module vga_tb();

	logic [7:0] r, g, b;
	logic clk, vgaclk, hsync, vsync, sync_b, blank_b;
	vga vga1(clk, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);
	
endmodule