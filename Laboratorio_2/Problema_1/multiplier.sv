module multiplier #(parameter N = 4)(
    input [N-1:0] a, b, 
    output reg [2*N-1:0] product
);
	
    integer i, j;
    reg [2*N-1:0] temp;
    
    always @* begin        
        // Initialize product
        product = 0;
        
        for (i = 0; i < N; i = i + 1) begin
            if (b[i]) begin
                temp = a << i; // a * 2^i
                
                for (j = 0; j < 2*N; j = j + 1) begin
                    if (product[j] & temp[j]) begin
                        product[j+1] = product[j+1] ^ 1; // Add carry
                    end
                    product[j] = product[j] ^ temp[j]; // Add without carry
                end
            end
        end
    end
endmodule
