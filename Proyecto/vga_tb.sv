module vga_tb();

//	logic [9:0] address_a, address_b;
//	logic [7:0] data_a, data_b, q_a, q_b;
//	logic wren_a, wren_b;
//	logic clk;
//	
//	ram2 mem(address_a, address_b, clk, data_a, data_b, wren_a, wren_b, q_a, q_b);
	logic clk, rst, clkChar;
	
	slowClock sc(clk, rst, clkChar);

endmodule