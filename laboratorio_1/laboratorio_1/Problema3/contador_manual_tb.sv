module contador_manual_tb;
	logic [5:0] num;
	logic dec;
	logic reset;
	logic [5:0] out;
	logic s0;
	logic s1;
	logic s2;
	logic s3;
	logic s4;
	logic s5;
	
	contador_regresivo modulo (
								  .num(num),
								  .reset(reset),
								  .dec(dec),
					           .out(out),
								  .s0(s0),
								  .s1(s1),
								  .s2(s2),
								  .s3(s3),
								  .s4(s4),
								  .s5(s5));
								  
  initial begin
  //num = 6'b111111;
  //num = {1,0,0,0,0,1};
  reset = 1;
  dec = 1;
  #40
  reset = 0;
  #40
  reset = 1;
  dec = 0;
  #40
  //reset = 1;
  dec = 1;
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
  #40
  dec = 0;
  #40
  dec = 1;
  
  end
 
 endmodule