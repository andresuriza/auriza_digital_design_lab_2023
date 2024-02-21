module contador_manual_tb;
	logic [5:0] num;
	logic dec;
	logic reset;
	logic [5:0] out;
	logic [6:0] seg;
	
	contador_regresivo modulo (num, reset, dec, out, seg);
								  
  initial begin
  num = 6'b001000;
  reset = 1;
  dec = 1;
  #40
  reset = 0;
  //reset = 1;
  #40
  reset = 1;
  #40
  dec = 0;
  #40
  dec = 1;
  #40
  dec = 0;
  #40
  dec = 1;
  #40
  dec = 0;
  #40
  dec = 1;
  
  end
 
 endmodule