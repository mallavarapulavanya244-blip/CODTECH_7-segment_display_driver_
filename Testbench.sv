// Company: CODTECH IT SOLUTIONS
// Domain: VLSI
// Intern Name: Mallavarapu Lavanya
// Intern ID: CITS1289
// Task Title: Testbench for 7-Segment Display Driver

`timescale 1ns / 1ps

module tb_seven_seg_driver;

    // Inputs to the Design Under Test (DUT)
    reg [3:0] bcd_in;

    // Outputs from the DUT
    wire [6:0] seg_out;

    // Instantiate the 7-segment driver module
    seven_seg_driver uut (
        .bcd_in(bcd_in),
        .seg_out(seg_out)
    );

    // Stimulus process to test all BCD inputs
      initial begin
    $dumpfile("dump.vcd");
        $dumpvars(0, tb_seven_seg_driver);
        // Monitor the changes in input and output lines
        $monitor("Time = %0t | BCD Input = %b (%d) | 7-Seg Output (g-f-e-d-c-b-a) = %b", $time, bcd_in, bcd_in, seg_out);
        
        // Initialize input
        bcd_in = 4'b0000; #10;
        
        // Loop through all valid BCD values (0 to 9)
        bcd_in = 4'b0001; #10;
        bcd_in = 4'b0010; #10;
        bcd_in = 4'b0011; #10;
        bcd_in = 4'b0100; #10;
        bcd_in = 4'b0101; #10;
        bcd_in = 4'b0110; #10;
        bcd_in = 4'b0111; #10;
        bcd_in = 4'b1000; #10;
        bcd_in = 4'b1001; #10;
        
        // Test an invalid BCD input to check default condition
        bcd_in = 4'b1111; #10;
        
        // End the simulation
        $finish;
    end

endmodule
