module problema2 #(parameter Width = 4) (
  input  logic clk,
  input  logic rst,
  input  logic [Width - 1: 0] a,b,
  output logic  [Width - 1: 0] salida);
  
Problema1 p1(.A(q1), .B(q2), .opcode(4'b0000), .result(result));

  logic [Width - 1: 0] q1, q2, result;
  
  always_ff @(posedge clk, posedge rst) begin
    if (rst) begin
		q1 <= 0;
		q2 <= 0;
		salida <= 0;
	end
	
	else begin
	 q1 <= a;
	 q2 <= b;
	 salida <= result;
  end
  
  end
endmodule