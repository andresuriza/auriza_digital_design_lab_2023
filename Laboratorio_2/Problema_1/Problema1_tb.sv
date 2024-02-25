module Problema1_tb;
    reg [3:0] A, B;
    reg [3:0] opcode;
    wire [3:0] result;
    wire N, Z, C, V;

    Problema1 #(.WIDTH(4)) uut (
        .A(A), .B(B), .opcode(opcode),
        .result(result),
        .N(N), .Z(Z), .C(C), .V(V)
    );

    initial begin
        $monitor("A=%b B=%b opcode=%b result=%b N=%b Z=%b C=%b V=%b", A, B, opcode, result, N, Z, C, V);

        A = 4'b1010; B = 4'b0010; opcode = 4'b0000; #10; // ADD 1100
		  A = 4'b1111; B = 4'b1111; opcode = 4'b0000; #10; // ADD 1110 cout
		  
        A = 4'b1111; B = 4'b1001; opcode = 4'b0001; #10; // SUB 0110
        A = 4'b0001; B = 4'b1100; opcode = 4'b0001; #10; // SUB 0101 neg
		  
        A = 4'b0011; B = 4'b0100; opcode = 4'b0010; #10; // MUL 1100
        A = 4'b1010; B = 4'b0101; opcode = 4'b0010; #10; // MUL 11 0010

        A = 4'b0100; B = 4'b0011; opcode = 4'b0011; #10; // DIV 0001
        A = 4'b1100; B = 4'b0010; opcode = 4'b0011; #10; // DIV 0110

        A = 4'b0101; B = 4'b0110; opcode = 4'b0100; #10; // MOD
        A = 4'b1111; B = 4'b0010; opcode = 4'b0100; #10; // MOD

		 
        A = 4'b1111; B = 4'b1111; opcode = 4'b0101; #10; // AND 1
        A = 4'b0110; B = 4'b0101; opcode = 4'b0101; #10; // AND 0

        A = 4'b0111; B = 4'b1000; opcode = 4'b0110; #10; // OR 1
        A = 4'b0000; B = 4'b0000; opcode = 4'b0110; #10; // OR 0
        A = 4'b1111; B = 4'b1111; opcode = 4'b0110; #10; // OR 1


        A = 4'b1000; B = 4'b0111; opcode = 4'b0111; #10; // XOR 1
        A = 4'b0000; B = 4'b0000; opcode = 4'b0111; #10; // XOR 0
        A = 4'b1111; B = 4'b1111; opcode = 4'b0111; #10; // XOR 0



        $stop;
    end
endmodule
