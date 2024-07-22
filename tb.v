`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2024 19:53:07
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
    reg clk;
    reg reset;
    wire [2:0] signal_M1;
    wire [2:0] signal_M2;
    wire [2:0] signal_M3;
    wire [2:0] signal_M4;
    wire [2:0] signal_L1;
    wire [2:0] signal_L2;
    wire [2:0] signal_L3;
    wire [2:0] signal_L4;
    wire signal_pedestrian;
    wire [4:0]count;
  traffic_signal dut (clk,reset,count,signal_M1,signal_M2,signal_M3,signal_M4,signal_L1,signal_L2,signal_L3,signal_L4,signal_pedestrian);

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset =0;
        #10;
        reset = 1;
        #10;
        reset = 0;

        // Observe the signals for a period of time
        #1500; // Run the simulation for 500 time units

        // End the simulation
        $finish;
    end

endmodule
