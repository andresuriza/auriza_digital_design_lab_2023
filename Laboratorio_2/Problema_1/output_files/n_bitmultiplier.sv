module n_bitmultiplier #(parameter N = 4)(input logic start,
														input logic [N - 1: 0 a_in, b_in],
														output logic [(N * 2) - 1: 0] out);

logic [(N *2)- 1: 0] out_reg;
logic finish_reg = 0;
logic [(N*2) - 1: 0] a_in_reg;
logic [(N*2) - 1: 0] b_in_reg;
logic [8:0] bits;

endmodule

assign out = out_reg;
assign finish = finish_reg;
assign a_in = a_in_reg;
assign b_in = b_in_reg;

integer i;

always_comb
	
	