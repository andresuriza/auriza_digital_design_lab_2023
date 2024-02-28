module alu_tb;

	logic [3:0] a, b;       
	logic [3:0] ALU_Sel;
	logic [7:0] ALU_Out; 
	logic n, z, c, v;

	Problema1 modulo(a, b, ALU_Sel, ALU_Out, n, z, c, v);

	initial begin
		a = 4'b1100;
		b = 4'b1000;
		ALU_Sel = 4'b0010;
		#40
		ALU_Sel = 4'b0101;
		a = 4'b1111;
		b = 4'b1111;
		#40
		a = 4'b1011;
		b = 4'b1111;
	end

endmodule