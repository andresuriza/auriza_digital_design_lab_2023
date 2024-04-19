module clkCounter(input logic clk, rst,
						output logic t0);
	
	logic [7:0] cycles;
	logic new_clock;								
	
	slowClock slow_clock(clk, rst, new_clock);
	
	always_ff @(posedge new_clock or posedge rst) begin
		if (rst) begin
			cycles = 0;
			t0 = 0;
		end
		
		else begin
			cycles = cycles + 1;
			
			if (cycles == 15) begin
				cycles = 0;
				t0 = 1;
			end
		end
	end
	
endmodule