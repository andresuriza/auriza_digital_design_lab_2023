module Problema1 #(parameter WIDTH = 4) (
    input [WIDTH-1:0] A, B,
    input [3:0] opcode, // Increased opcode width to 5 bits to accommodate new operations
    output logic [WIDTH-1:0] result,
    output logic N, Z, C, V
);
    always_comb begin
        case (opcode)
            4'b0000: // ADD
                begin
                    logic [WIDTH-1:0] carry;
                    carry = A & B;
                    result = A ^ B;
                    while(carry != 0) begin
                        logic [WIDTH-1:0] shiftedCarry;
                        shiftedCarry = carry << 1;
                        carry = result & shiftedCarry;
                        result = result ^ shiftedCarry;
                    end
                end
            4'b0001: // SUB
                begin
                    logic [WIDTH-1:0] borrow;
                    borrow = ~A & B;
                    result = A ^ B;
                    while(borrow != 0) begin
                        logic [WIDTH-1:0] shiftedBorrow;
                        shiftedBorrow = borrow << 1;
                        borrow = ~result & shiftedBorrow;
                        result = result ^ shiftedBorrow;
                    end
                end
            4'b0010: result = A * B; // MUL
            4'b0011: result = A / B; // DIV
            4'b0100: result = A % B; // MOD
            4'b0101: // AND
                begin
                    for(int i = 0; i < WIDTH; i = i + 1) begin
                        // Implement AND using NAND gates
                        logic nand1, nand2;
                        nand1 = ~(A[i] & B[i]); // NAND
                        nand2 = ~nand1; // NAND
                        result[i] = ~nand2; // NAND
                    end
                end
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
