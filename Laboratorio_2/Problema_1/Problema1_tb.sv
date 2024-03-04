module Problema1_tb;
    logic [3:0] A, B;
    logic [3:0] opcode;
    logic [3:0] result;
    logic N, Z, C, V;

    Problema1 #(.WIDTH(4)) modulo(.A(A), .B(B), .opcode(opcode), .result(result),.N(N), .Z(Z), .C(C), .V(V));

    initial begin
	 
	//---------------Add------------------
		  A = 4'b1010; B = 4'b0010; opcode = 4'b0000; 
		  #10
		  assert(result === 4'b1100) 
		  else $error("Adding failed");
		  A = 4'b1111; B = 4'b1111; opcode = 4'b0000; 
		  #10 
		  assert(result === 4'b1110) 
		  else $error("Adding failed");
		  
	//---------------Substract------------------	  
		  A = 4'b1010; B = 4'b0010; opcode = 4'b0001; 
		  #10
		  assert(result === 4'b1000) 
		  else $error("Substraction failed");
		  A = 4'b0100; B = 4'b0111; opcode = 4'b0001; 
		  #10
		  assert(N === 1) 
		  else $error("Flag error");
		  
	//---------------Multiplication------------------	  
		  A = 4'b1010; B = 4'b0010; opcode = 4'b0010; 
		  #10
		  assert(result === 4'b0100) 
		  else $error("Multiplication failed");
		  A = 4'b0100; B = 4'b0000; opcode = 4'b0010; 
		  #10
		  assert(result === 4'b0000) 
		  else $error("Multiplication failed");
		  
	//---------------Division------------------	  
		  A = 4'b1010; B = 4'b1100; opcode = 4'b0011; 
		  #10
		  assert(Z === 1) 
		  else $error("Flag error");
		  A = 4'b0100; B = 4'b0011; opcode = 4'b0011; 
		  #10
		  assert(result === 4'b0001) 
		  else $error("Division error");
		  
	//---------------Modulus------------------	  
		  A = 4'b0100; B = 4'b0011; opcode = 4'b0100; 
		  #10
		  assert(result === 4'b0001) 
		  else $error("Modulus failed");
		  A = 4'b1111; B = 4'b0100; opcode = 4'b0100; 
		  #10
		  assert(result === 4'b0011) 
		  else $error("Modulus failed");
		  
	//---------------AND------------------	  
		  A = 4'b0100; B = 4'b0011; opcode = 4'b0101; 
		  #10
		  assert(result === 4'b0000) 
		  else $error("AND failed");
		  A = 4'b1111; B = 4'b0010; opcode = 4'b0101; 
		  #10
		  assert(result === 4'b0010) 
		  else $error("AND failed");
		  
	//---------------OR------------------	  
		  A = 4'b1000; B = 4'b0000; opcode = 4'b0110; 
		  #10
		  assert(result === 4'b1000) 
		  else $error("OR failed");
		  A = 4'b1111; B = 4'b1111; opcode = 4'b0110; 
		  #10
		  assert(result === 4'b1111) 
		  else $error("OR failed");
		  
	//---------------XOR------------------	  
		  A = 4'b1001; B = 4'b1111; opcode = 4'b0111; 
		  #10
		  assert(result === 4'b0110) 
		  else $error("XOR failed");
		  A = 4'b0111; B = 4'b1000; opcode = 4'b0111; 
		  #10
		  assert(result === 4'b1111) 
		  else $error("XOR failed");
		  
	  //---------------SHLEFT------------------
		  A = 4'b0010; B = 4'b0001; opcode = 4'b1000; 
		  #10
		  assert(result === 4'b0100) 
		  else $error("Shift left failed");
		  A = 4'b1111; B = 4'b0011; opcode = 4'b1000; 
		  #10
		  assert(result === 4'b1000) 
		  else $error("Shift left failed");
		  
	  //---------------SHRIGHT------------------
		  A = 4'b0100; B = 4'b0011; opcode = 4'b1001; 
		  #10
		  assert(result === 4'b0000) 
		  else $error("Shift right failed");
		  A = 4'b0101; B = 4'b0000; opcode = 4'b1001; 
		  #10
		  assert(result === 4'b0101) 
		  else $error("Shift right failed");
	end
endmodule
