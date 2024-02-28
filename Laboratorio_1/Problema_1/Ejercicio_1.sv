module Ejercicio_1(input logic a,b,c,d,
						 output logic s0,s1,s2,s3,s4,s5,s6);

assign s0 = ~(a || c || (b & d) || ((~b) & (~d)));
assign s1 = ~(~b || ((~c) & (~d)) || (c & d));
assign s2 = ~(b || ~c || d);
assign s3 = ~(a || ((~b) & (~d)) || ((~b) & c) || (c & (~d)) || (b & (~c) & d));
assign s4 = ~(((~b) & (~d)) || (c & (~d)));
assign s5 = ~(a || (b & (~c)) || (b & (~d)) || ((~c) & (~d)));
assign s6 = ~(a || (b & (~c)) || ((~b) & c) || (c & (~d)));

endmodule