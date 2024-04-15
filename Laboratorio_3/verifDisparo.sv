module verifDisparo (
    input [24:0] new_position,
    input [24:0] tablero,
    input clk,
    output reg [24:0] updated_tablero
);

integer i, position;

// Encontrar la posición del único '1' en new_position
always @(posedge clk) begin
    position = -1;
    for (i = 24; i >= 0; i = i - 1) begin
        if (new_position[i] == 1'b1) begin
            position = i;
            break;
        end
    end
end

always @(posedge clk) begin
    // Copiar valores actuales a updated_tablero
    updated_tablero = tablero;
    
    // Modificar updated_tablero basado en position
    if (position >= 0 && position < 25) begin
        if (updated_tablero[position] == 1'b1) begin
            updated_tablero[position] = 1'b0;
        end
    end
end

endmodule
