module registroBarcos_tb;

    // Señales de entrada
    reg [2:0] TotalBarcos;
    reg [24:0] new_position;
    reg clk;

    // Señales de salida
    wire [24:0] updated_positions;

    // Instancia del módulo registroBarcos
    registroBarcos dut (
        .TotalBarcos(TotalBarcos),
        .new_position(new_position),
        .clk(clk),
        .updated_positions(updated_positions)
    );

    // Generación de la señal de reloj
    always #5 clk = ~clk;

    initial begin
        TotalBarcos = 3'b010;
		  clk = 0;
        new_position = 25'b0000000000000000000000001; //deja
		  #100;
		  
        // Espera un ciclo de reloj antes de cambiar las señales
		  
        new_position = 25'b0000000000000000000100000; //deja
		  #100;
		  
        new_position = 25'b0000000000000000001000000; // no deja
		  #100;
		  
        new_position = 25'b1000000000000000000000000; //no deja
		  #100;
		  
		  
        new_position = 25'b0000100000000000000000000; // deja
		  #100;
		  
        new_position = 25'b1000000000000000000000000; //no deja
		  #100;
		  
        new_position = 25'b1000000000000000000000000; // deja
		  #100;
		  
		  $finish;
    end

endmodule
