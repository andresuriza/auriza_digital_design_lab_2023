module registroBarcos_tb;

    // Señales de entrada
    reg [2:0] TotalBarcos;
    reg [2:0] NumBarco;
    reg [24:0] new_position;
    reg clk;

    // Señales de salida
    wire [24:0] updated_positions;

    // Instancia del módulo registroBarcos
    registroBarcos dut (
        .TotalBarcos(TotalBarcos),
        .NumBarco(NumBarco),
        .new_position(new_position),
        .clk(clk),
        .updated_positions(updated_positions)
    );

    // Generación de la señal de reloj
    always #5 clk = ~clk;

    initial begin
        TotalBarcos = 3'b100;
        NumBarco = 3'b000;
        new_position = 25'b0000000000000000000000001; //deja
        clk = 0;
		  
        // Espera un ciclo de reloj antes de cambiar las señales
        #100;
		  
		  NumBarco = 3'b010;
        new_position = 25'b0000000000000000000100000; //deja
		  #100;
		  
		  NumBarco = 3'b100;
        new_position = 25'b0000000000000000100000000; // no deja
		  #100;
		  
		  NumBarco = 3'b011;
        new_position = 25'b1000000000000000000000000; //no deja
		  #100;
		  
		  
		  NumBarco = 3'b011;
        new_position = 25'b0000100000000000000000000; // deja
		  #100;
		  
		  NumBarco = 3'b10;
        new_position = 25'b1000000000000000000000000; //no deja
		  #100;
		  
		  NumBarco = 3'b00;
        new_position = 25'b1000000000000000000000000; // deja
		  #100;
		  
		  $finish;
    end

endmodule
