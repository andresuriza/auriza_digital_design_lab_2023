//Main -------
module Problema1 #(parameter WIDTH = 4) (
    input logic [WIDTH-1:0] A, B,
    input logic [3:0] opcode,
    output logic [2 * (WIDTH - 1):0] result,
    output logic N, Z, C, V,
    output logic [6:0]seg1, seg2
);

logic [2 * (WIDTH - 1):0] multResult;
logic [WIDTH-1:0] addResult;
logic [WIDTH-1:0] subResult;
logic addCarry;

adder_n_bit #(WIDTH) adder(
				.a(A), 
				.b(B), 
				.sum(addResult), 
				.cout());
				
subtractor_n_bit #(WIDTH) subtractor(
				.a(A), 
				.b(B), 
				.difference(subResult), 
				.bout());
				
multiplier #(WIDTH) mult (
				.a(A), 
				.b(B), 
				.product(multResult));
				
to_7seg BCDseg(
				result, 
				seg1, 
				seg2);
						
    always_comb begin
        case (opcode)
            4'b0000: result = addResult;  // ADD
            4'b0001: result = subResult;  // SUB
            4'b0010: result = multResult;	// MUL
            4'b0011: result = A / B; // DIV
            4'b0100: result = A % B; // MOD
            4'b0101: result = A & B;// AND
            4'b0110: result = A | B; // OR
            4'b0111: result = A ^ B; // XOR
            4'b1000: result = A << B; // SHL
            4'b1001: result = A >> B; // SHR

            default: result = 0;
        endcase

			// Update flags
			N = result[WIDTH-1];
			Z = (result == 0);
			C = (opcode == 4'b0000) && (result < A) || (opcode == 4'b0001) && (result > A);
			V = (opcode < 4'b0011) && ((A[WIDTH-1] == B[WIDTH-1]) && (result[WIDTH-1] != A[WIDTH-1]));
    end
endmodule
