module n_bit_divider #(parameter N = 4)(
    input [N-1:0] numerator,
    input [N-1:0] denominator,
    output [N-1:0] quotient,
    output [N-1:0] remainder
);
    wire [N-1:0] temp_numerator;
    wire [N-1:0] temp_denominator;
    wire [N-1:0] temp_quotient;
    wire bout;

    // Initialize temporary variables
    assign temp_numerator = numerator;
    assign temp_denominator = denominator;
    assign temp_quotient = 0;

    // Perform binary division
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : DIV_LOOP
            subtractor_n_bit #(.N(N)) subtr(.a(temp_numerator[i]), .b(temp_denominator[i]),
                                            .difference(temp_quotient[i]), .bout(bout));
            assign temp_numerator[i] = temp_quotient[i];
        end
    endgenerate

    // Assign final quotient and remainder
    assign quotient = temp_quotient;
    assign remainder = temp_numerator;
endmodule
