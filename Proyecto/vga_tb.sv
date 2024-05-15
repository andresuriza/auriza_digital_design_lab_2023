module vga_tb();

	logic [9:0] x, y;
	logic [7:0] r, g, b;

	videoGen vg(x, y, r, g, b);

	initial begin
		
	end

endmodule