module multiplier #(parameter WIDTH = 4) (
    input [WIDTH-1:0] A, B,
    output [2*WIDTH-1:0] P
);
    generate
        genvar i, j;
        wire [WIDTH-1:0] and_gates [WIDTH-1:0];
        for (i = 0; i < WIDTH; i = i + 1) begin : and_gate_gen
            assign and_gates[i] = A[i] & B;
        end

        wire [WIDTH:0] carry [WIDTH:0];
        assign carry[0] = 0;
        for (i = 1; i < WIDTH+1; i = i + 1) begin : carry_gen
            assign carry[i] = carry[i-1] + and_gates[i-1];
        end

        assign P[0] = and_gates[0][0];
        for (i = 1; i < 2*WIDTH; i = i + 1) begin : result_gen
            if (i < WIDTH) assign P[i] = carry[i][i-1] ^ and_gates[i][i];
            else assign P[i] = carry[i-WIDTH+1][WIDTH];
        end
    endgenerate
endmodule
