module verifDisparos_tb;

    // Definir las señales del testbench
    reg [24:0] new_position;
    reg [24:0] tablero;
    reg clk;
    wire [24:0] updated_tablero;

    // Instanciar el módulo bajo prueba
    verifDisparo uut (
        .new_position(new_position),
        .tablero(tablero),
        .clk(clk),
        .updated_tablero(updated_tablero)
    );

    // Generar un clock para el testbench
    always #5 clk = ~clk;

    // Inicializar las señales
    initial begin
        //Valores iniciales:
		  tablero = 25'b0011001000111110111000001;
		  // Mostrar los valores iniciales
        $display("Inicio del testbench:");
        $display("tablero = %b", tablero);
		  clk = 0;
		  
		  #100
		  
		  //Posición del disparo:
        new_position = 25'b0000000000001000000000000;
		  $display("new_position = %b", new_position);
		  
		  #100

        // Mostrar los valores después de 10 ciclos
        $display("Actualización de tablero: ");
		  tablero = updated_tablero;
        $display("updated_tablero = %b", tablero);
		  
		  #100
		  
		  //Posición del disparo:
        new_position = 25'b0000000000010000000000000;
		  $display("new_position = %b", new_position);
		  
		  #100

        // Mostrar los valores después de 10 ciclos
        $display("Actualización de tablero: ");
		  tablero = updated_tablero;
        $display("updated_tablero = %b", tablero);
		  
		  #100
		  
		  //Posición del disparo:
        new_position = 25'b0000000000000000000001000;
		  $display("new_position = %b", new_position);
		  
		  #100

        // Mostrar los valores después de 10 ciclos
        $display("Actualización de tablero: ");
		  tablero = updated_tablero;
        $display("updated_tablero = %b", tablero);
		  
		  
		  
        // Finalizar la simulación
        $finish;
    end

endmodule
