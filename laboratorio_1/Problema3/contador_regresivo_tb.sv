module contador_regresivo_tb;
	reg clk;
	reg reset;
	wire [3:0] out;
	
	contador_regresivo modulo (.clk(clk),
					           .reset(reset),
					           .out(out));
   always #40 clk = ~clk;
	
	initial begin
	clk <= 0;
	reset <= 0;
	#50 reset <= 1;
	//#80 reset <= 0;
	//#50 reset <= 1;
	
	//#20 $finish;
	
	end
	
endmodule