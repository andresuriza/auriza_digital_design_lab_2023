module slowClock(input logic clk,
					  output logic clk_1Hz);

	logic [27:0] counter = 0;
	logic slowClk = 0;
	assign clk_1Hz = slowClk;

	always_ff @(posedge clk) begin
		if (counter == 2_000_000) begin // 25M equivalen a 1MHz
		  counter = 0;
		  slowClk = ~slowClk;
		end
		else begin
			counter = counter + 1;
		end
	end
endmodule   