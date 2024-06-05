`timescale 1 ps / 1 ps

module instruction_tb();
		
	logic	[5:0]  pc;
	logic	  clk, rst;
	logic	[31:0]  q;
	
	
	
	AssemblyROM IM(pc, clk, q);
	initial begin
	pc = 0;
	rst = 0;
	#40
	rst = 1;
	#40
	rst = 0;
	clk = 0;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	#40
	clk = 0;
	pc = pc + 1;
	#40
	clk = 1;
	
	end
endmodule