module Ejercicio_1_tb();

	logic a,b,c,d,s0,s1,s2,s3,s4,s5,s6;
	Ejercicio_1 modulo(a,b,c,d,s0,s1,s2,s3,s4,s5,s6);
	
	initial begin
	
	a=0;
	b=0;
	c=0;
	d=0;
	#40
	
	a=0;
	b=0;
	c=0;
	d=1;
	#40
	
	a=0;
	b=0;
	c=1;
	d=0;
	#40
	
	a=0;
	b=0;
	c=1;
	d=1;
	#40
	
	a=0;
	b=1;
	c=0;
	d=0;
	#40
	
	a=0;
	b=1;
	c=0;
	d=1;
	#40
	
	a=0;
	b=1;
	c=1;
	d=0;
	#40
	
	a=0;
	b=1;
	c=1;
	d=1;

	end
endmodule