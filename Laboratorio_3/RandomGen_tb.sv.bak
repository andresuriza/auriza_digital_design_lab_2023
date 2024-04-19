`timescale 1ns/1ps

module RandomGen_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    parameter SIM_TIME = 100;  // Simulation time in ns
    parameter INIT_DELAY = 100; // Initial delay after releasing reset (adjust as needed)

    // Signals
    reg clk;
    reg rst_n;
    reg [7:0] seed; // Input seed value
    wire [7:0] rand_out;

    // Instantiate PRNG module
    RandomGen dut (
        .clk(clk),
        .rst_n(rst_n),
        .seed(seed),
        .rand_out(rand_out)
    );

    // Generate clock
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initialize
    initial begin
        clk = 0;
        rst_n = 0;
        seed = $random; // Generate a random seed value
        # (CLK_PERIOD * 2); // Wait for a couple of clock cycles before releasing reset
        rst_n = 1;
        # (INIT_DELAY); // Simulation time
    end

    // Simulation
    initial begin
        #INIT_DELAY;
        repeat (60) begin // Generate 60 random seed values and corresponding random numbers
            #10;
            $display("Time = %0t, Seed = %h, Random number = %h", $time, seed, rand_out);
            seed = $random; // Generate a new random seed value for the next iteration
        end
        # (SIM_TIME - INIT_DELAY - 20); // Wait for the remaining simulation time
        $finish; // End simulation
    end

endmodule
