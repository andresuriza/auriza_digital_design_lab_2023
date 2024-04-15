module RandomGen (
    input wire clk,        
    input wire rst_n,      
    input wire [24:0] seed, 
    output reg [24:0] rand_out, 
    output reg [24:0] result 
);

reg [24:0] lfsr;
reg [4:0] index; 

//Valores iniciales
initial begin
    lfsr = seed | 25'b1; //Se asegura que al menos 1 bit tenga un '1'
    index = 0;  
end

//Calculo de valor random usando LFSR
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        lfsr <= seed | 25'b1; // Reset del LFSR
    end else begin
        lfsr <= {lfsr[23:0], lfsr[22] ^ lfsr[20] ^ lfsr[19] ^ lfsr[17] ^ (lfsr[4] ^ lfsr[2])};
		  index <= lfsr[4:0] % 25;
    end
end

//Guarda LSFR en rand_out
always @(posedge clk) begin
    rand_out <= lfsr;
end

//Escoge una posición aleatoria y escribe un bit '1' y el resto de bis '0'
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        result <= 25'b0; //Reinicio de resultado a '0's
    end else begin
		  result <= (index == 0) ? 25'b1000000000000000000000000 : (1 << index); //Escribe el bit '1' en posición random
    end
end

endmodule
