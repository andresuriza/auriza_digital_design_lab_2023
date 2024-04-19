module videoGen_tb();

logic clk, moveX, moveY, dirX, dirY, shoot;
logic [7:0] r,g,b;
logic [9:0] x,y;

videoGen vg(clk, x, y, moveX, moveY, dirX, dirY, shoot, r, g, b);
//registroBarcos rb(TotalBarcos, NumBarco, new_position, clk, updated_positions);

always #5 clk = ~clk;

initial begin
	clk = 0;
end

endmodule