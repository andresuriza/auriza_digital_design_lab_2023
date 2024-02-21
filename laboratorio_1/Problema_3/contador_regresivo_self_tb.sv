// REALIZAR CAMBIO EN slowClock.sv antes de probar testbench
module contador_regresivo_self_tb();
	logic [5:0] num;
	logic dec;
	logic rst;
	logic clk = 0;
	logic [6:0] seg1;
	logic [6:0] seg2;
	logic new_clock;
	contador_regresivo modulo (num, rst, dec, clk, seg1, seg2);
   slowClock slow_clock(clk, rst, new_clock);

	initial begin	
	//------------6 bits-----------------------------------	
		num = 6'b111111;
		dec = 1;
		rst = 0;
		#10
		assert(seg1 === 7'b1111111) 
		else $error("Start failed, segment low. 6 bits");
		assert(seg2 === 7'b0000001)
		else $error("Start failed, segment high. 6 bits");	
		rst = 1;
		#10 clk = ~clk;
		rst = 0;
		#10
		assert(seg1 === 7'b0111000) 
		else $error("Reset failed. 6 bits");
		assert(seg2 === 7'b0000110) 
		else $error("Reset failed. 6 bits");
		clk = ~clk;
		#10
		dec = 0; 
		clk = ~clk; // Se activa
		#10
		assert(seg1 === 7'b0110000) 
		else $error("Substraction failed. 6 bits");
		assert(seg2 === 7'b0000110) 
		else $error("Reset failed. 6 bits");
		#10
		//---------------------4 bits----------------------------------
		clk = ~clk;
		num = 4'b1111;
		dec = 1;
		rst = 0;
		#10
		rst = 1;
		#10 clk = ~clk;
		rst = 0;
		#10
		assert(seg1 === 7'b0111000) 
		else $error("Reset failed. 4 bits");
		assert(seg2 === 7'b0000001) 
		else $error("Reset failed. 4 bits");
		clk = ~clk;
		#10
		dec = 0; 
		clk = ~clk; // Se activa
		#10
		assert(seg1 === 7'b0110000) 
		else $error("Substraction failed. 4 bits");
		assert(seg2 === 7'b0000001) 
		else $error("Substraction failed. 4 bits");
		#10
		//--------------------2 bits-----------------------------------
		clk = ~clk;
		num = 2'b11;
		dec = 1;
		rst = 0;
		#10
		rst = 1;
		#10 clk = ~clk;
		rst = 0;
		#10
		assert(seg1 === 7'b0000110) 
		else $error("Reset failed. 2 bits");
		assert(seg2 === 7'b0000001) 
		else $error("Reset failed. 2 bits");
		clk = ~clk;
		#10
		dec = 0; 
		clk = ~clk; // Se activa
		#10
		assert(seg1 === 7'b0010010) 
		else $error("Substraction failed. 2 bits");
		assert(seg2 === 7'b0000001) 
		else $error("Substraction failed. 2 bits");
	end
endmodule