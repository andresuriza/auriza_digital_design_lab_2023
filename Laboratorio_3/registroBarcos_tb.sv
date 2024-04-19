module registroBarcos_tb;

    // Señales de entrada
    logic [2:0] TotalBarcos = 3'b011;
    logic [24:0] new_position;
    logic clk;
	 logic rst_n;
	 logic [24:0] seed = 25'b0010100101;
	 logic [24:0] result; 

    // Señales de salida
    logic [24:0] updated_positions;

	RandomGen ranG(clk, rst_n, seed, result);
    // Instancia del módulo registroBarcos
    registroBarcos dut (
        .TotalBarcos(TotalBarcos),
        .new_position(result),
        .clk(clk),
        .updated_positions(updated_positions)
    );
	 


    // Generación de la señal de reloj
    always #5 clk = ~clk;

    initial begin
        rst_n = 0;
		  clk = 0;
		  #40
		  rst_n = 1;
    end

endmodule
