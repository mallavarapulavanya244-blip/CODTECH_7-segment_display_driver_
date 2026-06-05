// Company: CODTECH IT SOLUTIONS
// Domain: VLSI
// Intern Name: Mallavarapu Lavanya
// Intern ID: CITS1289
// Task Title: 7-Segment Display Driver
`timescale 1ns / 1ps
module seven_seg_driver (
    input wire [3:0] bcd_in,     // 4-bit BCD input (0 to 9)
    output reg [6:0] seg_out     // 7-bit output for segments (g f e d c b a)
);

    // Behavioral block that updates whenever the BCD input changes
    always @(*) begin
        case (bcd_in)
            // Active-high logic (1 turns the segment ON, 0 turns it OFF)
            // Segment order: g-f-e-d-c-b-a
            4'b0000: seg_out = 7'b0111111; // Displays 0
            4'b0001: seg_out = 7'b0000110; // Displays 1
            4'b0010: seg_out = 7'b1011011; // Displays 2
            4'b0011: seg_out = 7'b1001111; // Displays 3
            4'b0100: seg_out = 7'b1100110; // Displays 4
            4'b0101: seg_out = 7'b1101101; // Displays 5
            4'b0110: seg_out = 7'b1111101; // Displays 6
            4'b0111: seg_out = 7'b0000111; // Displays 7
            4'b1000: seg_out = 7'b1111111; // Displays 8
            4'b1001: seg_out = 7'b1101111; // Displays 9
            default: seg_out = 7'b0000000; // Default case turns all segments OFF
        endcase
    end

endmodule
