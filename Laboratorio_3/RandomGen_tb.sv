`timescale 1ns/1ps

module RandomGen_tb;

    // Parameters
    parameter CLK_PERIOD = 10; 
    parameter SIM_TIME = 100;  
    parameter INIT_DELAY = 100;
	 
    // Signals
    reg clk;
    reg rst_n;
    reg [24:0] seed; 
    wire [24:0] rand_out;
    wire [24:0] result;

    // Instancia RandomGen
    RandomGen dut (
        .clk(clk),
        .rst_n(rst_n),
        .seed(seed),
        .rand_out(rand_out),
        .result(result)
    );


    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initialize
    initial begin
        clk = 0;
        rst_n = 0;
        seed = 25'b1111111111000010111000000; //Seed de 25bits
        # (CLK_PERIOD * 2);
        rst_n = 1;
        # (INIT_DELAY);
    end

    // Simulation
    initial begin
        #INIT_DELAY;
        repeat (60) begin // Genera 60 valores randoms con mismo valor de seed
            #10;
            $display("Time = %0t, Seed = %h, Random number = %h, Result = %h", $time, seed, rand_out, result);
        end
        $finish; // End simulation
    end

endmodule
