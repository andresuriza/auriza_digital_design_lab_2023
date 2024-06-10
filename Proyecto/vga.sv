module vga(input logic clk, testB,
			  output logic vgaclk, // 25.175 MHz VGA clock
			  output logic hsync, vsync,
			  output logic sync_b, blank_b, // To monitor 
			  output logic [7:0] r, g, b);
			  
	logic [9:0] x, y;
	logic clkChar;
	logic [9:0] address_a, address_b;
	logic [7:0] data_a, data_b, q_a, q_b;
	logic wren_a, wren_b;
	
	
	// Modulo para obtener 25MHz
	pll vgapll(.inclk0(clk), .c0(vgaclk));
	slowClock sc(clk, clkChar);
	// Generador de señales para el monitor
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	
	// Modulo para pintar la pantalla
	videoGen videoGen(x, y, q_b, vgaclk, r, g, b, address_b);
	
	ram2 memRAM(address_a, address_b, clk, data_a, data_b, wren_a, wren_b, q_a, q_b);
	

	
	
endmodule