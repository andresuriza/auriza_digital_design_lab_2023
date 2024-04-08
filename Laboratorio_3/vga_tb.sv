module vga_tb();

logic [9:0] x,y;
logic clk, nxt;
logic [7:0] r,g,b;

videoGen vg(x,y,nxt,r,g,b);



initial begin
	nxt = 0;
	#40
	nxt = 1;
	#40
	nxt = 0;
	#40
	nxt = 1;
end

endmodule