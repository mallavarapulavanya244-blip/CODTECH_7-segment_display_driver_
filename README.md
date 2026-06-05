# 7-Segment Display Driver (VLSI Design Task)

A Verilog HDL-based 4-bit BCD (Binary Coded Decimal) to 7-segment display driver module designed and verified using active-high logic.

---

## 👥 Internship Information
* **Company:** CODTECH IT SOLUTIONS
* **Domain:** VLSI Design
* **Intern Name:** Mallavarapu Lavanya
* **Intern ID:** CITS1289
* **Task Title:** 7-Segment Display Driver

---

## 📌 Project Overview
This project converts a 4-bit digital input (0 to 9) into a 7-bit bus. 
The bus controls a standard 7-segment display using active-high logic.
* **Logic High (`1`):** Segment turns ON.
* **Logic Low (`0`):** Segment turns OFF.
* **Vector Order:** `[g f e d c b a]`

---

## 🎛️ Functional Specifications

### Hardware Mapping Table

| Input (Decimal) | 4-Bit BCD Input | 7-Bit Output (Hex) | 7-Bit Output (g-f-e-d-c-b-a) |
| :---: | :---: | :---: | :---: |
| 0 | `0000` | `3f` | `0111111` |
| 1 | `0001` | `06` | `0000110` |
| 2 | `0010` | `5b` | `1011011` |
| 3 | `0011` | `4f` | `1001111` |
| 4 | `0100` | `66` | `1100110` |
| 5 | `0101` | `6d` | `1101101` |
| 6 | `0110` | `7d` | `1111101` |
| 7 | `0111` | `07` | `0000111` |
| 8 | `1000` | `7f` | `1111111` |
| 9 | `1001` | `6f` | `1101111` |
| Invalid (15) | `1111` | `00` | `0000000` |

---

## 📂 Repository Structure
* `seven_seg_driver.v` - Main hardware design module.
* `tb_seven_seg_driver.v` - Testbench module for stimulus generation.
* `dump.vcd` - Value Change Dump file for waveform plotting.
* `README.md` - Documentation file.

---

## 🚀 Simulation and Verification
The design was verified using **Icarus Verilog 12.0** and **EPWave** on EDA Playground.

### Key Verification Results
* **Combinational Logic:** Changes execute instantaneously without propagation delays.
* **Boundary Validation:** Inputs from 0 to 9 map accurately to expected hexadecimal vectors.
* **Error Handling:** Invalid inputs like `4'b1111` safely map to the default `7'b0000000` condition (all segments blank).

---
verilog source code
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

Test bench code 
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

simulation & results ouput 
![Screenshot](Screenshot_20260605-182659-Gallery.png)

## 🛠️ How to Run
1. Open [EDA Playground](https://edaplayground.com).
2. Set the top-level tool to **Icarus Verilog**.
3. Check the box for **Open EPWave after run**.
4. Click **Run** to execute the simulation and view the digital # CODTECH_7-segment_display_diver_
7segment display driver 
