module top(
	input logic clk, reset,
	input logic inicio,
	input logic procesar,
   input logic [2:0] vocales, 
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b,
	output logic [31:0] WriteData, DataAdr,
	output logic MemWrite
);

	logic [9:0] address_b;
	logic [7:0] data_b, q_a, q_b;
	logic wren_a, wren_b;
	logic [31:0] PC, Instr, ReadData;
	
	logic [7:0] data_a = 0; 
	
	logic [9:0] address_a = 659;
	
	//	always_ff @(negedge inicio or negedge procesar) begin	
//		if (~inicio) begin
//			address_a = 659;	
//			data_a = 1;
//		end
//		else if (~procesar) begin
//			address_a = 660;
//			data_a = vocales;
//			
//			address_a = DataAdr;
//			data_a = WriteData;
//		end
//	end
//
	
	always_ff @(negedge inicio) begin		
		data_a = 1;
	end
	
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	ram2 memRAM(address_a, address_b, clk, data_a, data_b, wren_a, wren_b, q_a, q_b);

	vga vgaInst(clk, q_b, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b, address_b);
	
endmodule 