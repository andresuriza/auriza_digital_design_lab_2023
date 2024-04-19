module slowClock(input logic clk, reset,
					  output logic clk_1Hz);

	logic [27:0] counter;

	always_ff @(posedge reset or posedge clk)
	begin
		 if (reset == 1'b1)
			  begin
					clk_1Hz <= 0;
					counter <= 0;
			  end
		 else
			  begin
					counter <= counter + 1;
					if (counter == 2) // 25M equivalen a 1MHz
						 begin
							  counter <= 1_000_000;
							  clk_1Hz <= ~clk_1Hz;
						 end
			  end
	end
endmodule   