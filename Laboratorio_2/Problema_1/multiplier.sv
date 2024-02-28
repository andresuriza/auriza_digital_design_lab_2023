module multiplier (input logic [3:0] a, b,
						 output logic [7:0] result);

		logic [10:0] cout;
		logic [5:0] sum;
		
		assign result[0] = a[0] & b[0];
		
		half_adder halfAdder1(b[0] & a[1], a[0] & b[1], 0, result[1], cout[0]);
		half_adder halfAdder2(b[0] & a[2], a[1] & b[1], cout[0], sum[0], cout[1]);
		half_adder halfAdder3(b[0] & a[3], a[2] & b[1], cout[1], sum[1], cout[2]);
		half_adder halfAdder4(0, a[3] & b[1], cout[2], sum[2], cout[3]);
		half_adder halfAdder5(sum[0], a[0] & b[2], 0, result[2], cout[4]);
		half_adder halfAdder6(sum[1], a[1] & b[2], cout[4], sum[3], cout[5]);
		half_adder halfAdder7(sum[2], a[2] & b[2], cout[5], sum[4], cout[6]);
		half_adder halfAdder8(cout[3], a[3] & b[2], cout[6], sum[5], cout[7]);
		half_adder halfAdder9(sum[3], a[0] & b[3], 0, result[3], cout[8]);
		half_adder halfAdder10(sum[4], a[1] & b[3], cout[8], result[4], cout[9]);
		half_adder halfAdder11(sum[5], a[2] & b[3], cout[9], result[5], cout[10]);
		half_adder halfAdder12(cout[7], a[3] & b[3], cout[10], result[6], result[7]);
endmodule