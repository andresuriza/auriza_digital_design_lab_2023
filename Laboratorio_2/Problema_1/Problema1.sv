//Half - adder -----------
module half_adder (
    input bit a,
    input bit b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule


//Full - adder -----------
module full_adder (
    input bit a,
    input bit b,
    input bit cin,
    output sum,
    output cout
);
    wire s1, c1, c2;
    half_adder HA1(.a(a), .b(b), .sum(s1), .carry(c1));
    half_adder HA2(.a(s1), .b(cin), .sum(sum), .carry(c2));
    assign cout = c1 | c2;
endmodule


//Nbit - adder -----------
module adder_n_bit #(parameter N = 4)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] sum,
    output cout
);
    wire [N:0] c;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : ADD_LOOP
            if (i == 0) begin
                full_adder FA1(.a(a[i]), .b(b[i]), .cin(1'b0), .sum(sum[i]), .cout(c[i]));
            end else begin
                full_adder FA(.a(a[i]), .b(b[i]), .cin(c[i-1]), .sum(sum[i]), .cout(c[i]));
            end
        end
    endgenerate
    assign cout = c[N-1];
endmodule

//Half - subtractor -----------
module half_subtractor (
    input bit a,
    input bit b,
    output difference,
    output borrow
);
    assign difference = a ^ b;
    assign borrow = (~a) & b;
endmodule


//Full - subtractor -----------
module full_subtractor (
    input bit a,
    input bit b,
    input bit bin,
    output difference,
    output bout
);
    wire d1, b1, b2;
    half_subtractor HS1(.a(a), .b(b), .difference(d1), .borrow(b1));
    half_subtractor HS2(.a(d1), .b(bin), .difference(difference), .borrow(b2));
    assign bout = b1 | b2;
endmodule


//Nbit - subtractor -----------
module subtractor_n_bit #(parameter N = 4)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] difference,
    output bout
);
    wire [N:0] b_;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : SUB_LOOP
            if (i == 0) begin
                full_subtractor FS1(.a(a[i]), .b(b[i]), .bin(1'b0), .difference(difference[i]), .bout(b_[i]));
            end else begin
                full_subtractor FS(.a(a[i]), .b(b[i]), .bin(b_[i-1]), .difference(difference[i]), .bout(b_[i]));
            end
        end
    endgenerate
    assign bout = b_[N-1];
endmodule

//Multiplier -----------
module multiplicador #(parameter N = 8)(input [N-1:0] a, b, output reg [2*N-1:0] product);
	reg [2*N-1:0] p;
	integer i;

  always @* begin
    p = 0;
    for (i = 0; i < N; i = i + 1) begin
      if (b[i])
        p = p + (a << i);
    end
  end
  assign product = p;
endmodule



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

adder_n_bit #(WIDTH) adder(.a(A), .b(B), .sum(addResult), .cout(addCarry));
subtractor_n_bit #(WIDTH) subtractor(.a(A), .b(B), .difference(subResult), .bout());
multiplicador #(WIDTH) mult (.a(A), .b(B), .product(multResult));
to_7seg BCDseg(result, seg1, seg2);
						
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
