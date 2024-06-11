`timescale 1ns / 1ps

module top_tb;

    // Define constants
    localparam CLK_PERIOD = 10; // Clock period in ns

    // Declare signals
    logic clk = 0;
    logic reset = 1'b0; // Assuming active low reset
    logic [31:0] WriteData;
    logic [31:0] DataAdr;
    logic MemWrite;
    
    // Instantiate the DUT (Design Under Test)
    top dut (
        .clk(clk),
        .reset(reset),
        .WriteData(WriteData),
        .DataAdr(DataAdr),
        .MemWrite(MemWrite)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial stimulus
    initial begin
        // Reset
        reset = 1'b1;
        #100; // Hold reset for a while
        reset = 1'b0;
        #100; // Allow some time after reset

        // Your test scenario here
        // You need to write a sequence of memory accesses to test the ARM processor

        // Example: Write to Data Memory
        DataAdr = 32'h0000_0000; // Address to write
        WriteData = 32'h1234_5678; // Data to write
        MemWrite = 1'b1; // Enable memory write
        #20; // Wait some time
        MemWrite = 1'b0; // Disable memory write

        // Add more test scenarios as needed

        // End simulation
        #100; // Simulate for some time
        $finish;
    end

endmodule
