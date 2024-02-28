// Es un full adder
module half_adder (input logic a, b,
												 input logic cin,
												 output logic sum, cout);

		assign sum = (a ^ b) ^ cin;
		assign cout = (cin & (a ^ b)) | (a & b);
endmodule