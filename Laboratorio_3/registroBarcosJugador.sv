module registroBarcosJugador (
    input [2:0] NumBarco,
    input [24:0] new_position,
    input clk,
    output reg [24:0] updated_positions
);

reg [24:0] temp_positions;
integer i, position, ones_count, start_bit, end_bit, available_space;
reg [24:0] mask;
reg first_time = 1'b1; // Variable para indicar la primera ejecución

// Encontrar la posición del bit '1' más significativo en new_position
always @(posedge clk) begin
    position = -1;
    for (i = 24; i >= 0; i = i - 1) begin
        if (new_position[i] == 1'b1) begin
            position = i;
            break;
        end
    end

    //Establece el tamaño del barco
    ones_count = 0;
    case(NumBarco)
        3'b000: ones_count = 1;
        3'b001: ones_count = 2;
        3'b010: ones_count = 3;
        3'b011: ones_count = 4;
        3'b100: ones_count = 5;
        default: ones_count = 0;
    endcase

    // Crear una máscara con 'ones_count' bits '1' desde la posición encontrada
    mask = (1 << ones_count) - 1;

    // Calcular los límites del rango de asignación
    start_bit = position;
    end_bit = position + ones_count - 1;
end

always @(posedge clk) begin
    // Si es la primera vez, inicializa updated_positions con ceros
    if (first_time) begin
        updated_positions = 25'b0;
        first_time = 1'b0;
    end

    // Copiar valores actuales a temp_positions
    temp_positions = updated_positions;
    
    // Verificar espacio en la fila
    available_space = 5 - (position % 5) + 1;
    if (available_space >= ones_count) begin
        // Actualizar temp_positions con nuevos valores
        if (position >= 0 && start_bit < 25) begin
            if (ones_count > 0) temp_positions[start_bit] = mask[0];
            if (ones_count > 1) temp_positions[start_bit + 1] = mask[1];
            if (ones_count > 2) temp_positions[start_bit + 2] = mask[2];
            if (ones_count > 3) temp_positions[start_bit + 3] = mask[3];
            if (ones_count > 4) temp_positions[start_bit + 4] = mask[4];
        end
    end else begin
        // Devolver updated_positions sin cambios si no hay suficiente espacio
        temp_positions = updated_positions;
    end
    
    // Asignar temp_positions a updated_positions
    updated_positions = temp_positions;
end

endmodule