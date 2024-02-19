module contador_regresivo_self_tb();
	logic [5:0] num;
	logic dec;
	logic reset;
	logic [5:0] out;
	logic [6:0] seg;
	
	contador_regresivo modulo (num, reset, dec, out, seg);
	
	initial begin
		num = 6'b001000; 
		dec = 1; 
		reset = 1; 
		#10;
		assert(seg === 7'b1111111) 
		else $error("Start failed");
		num = 6'b001000; 
		reset = 0; 
		#10;
		assert(seg === 7'b0000000) 
		else $error("Reset failed");
		num = 6'b001000; 
		dec = 0; 
		reset = 1; 
		#10;
		assert(seg === 7'b0001111) 
		else $error("Substraction failed");
	end
endmodule