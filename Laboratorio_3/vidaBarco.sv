module vidaBarco(
	 input [24:0] tablero,
    input clk,
    output logic lp
);
integer i;
always @(posedge clk) begin
    for (i = 24; i >= 0; i = i - 1) begin
        if (tablero[i] == 1'b1) begin
				lp = 0;
            break;
        end	
    end
	 lp = 1;
end

endmodule