# 16 BIT ALSU

## Project Overview:
This repository contains the source code and testbenches for a fully featured 16 bit ALSU (Arithmetic logic shifting unit) designed and implemented in Verilog. The ALSU is designed as a purely combinational circuit, supporting a comprehensive set of arithmetics, logics, comparisons and shiftings operations for signed and unsigned integers.
The architecture follows a hierarchial and modular approach, mirroring the industry best practices. It features a top-level controller that uses a 5 digit opcode to manage 4 different units namely the: Arithmetic Unit, Logical Unit, Shifting Unit, Comparison Unit. This project demonstrates a deep understanding of digital logic design and Verilog for hardware description and verification.

## Features:

### Arithmetic Unit:
 - 16 bit Addition implemented by CLA (Carry look-ahead adder)
 - 16 bit Subtraction implemented by 2's complement on RCA (Ripple carry adder)
 - Signed and Unsigned 16x16 multiplication producing a 32 bit output
 - Signed and Unsigned 16/16 division producing a 16 bit quotient and 16 bit remainder
### Logical Unit:
 - Bitwise operations: AND/OR/XOR/NOT/NAND/NOR/XNOR
### Comparison Unit:
 - Signed and unsigned
 - Produces GT )Greater than), LT (Less than), ET (Equal to)
### Shifting Unit:
 - Logical: Left shift (LSL) and Right shift (LSR)
 - Arithmetic: Left shift (ASL) and Right shift (ASR)
 - Rotate: Left (RL) and Right (RR)
### Status flags:
 - Zero Flag: Set if the result is zero.
 - Negative Flag: Set if the result is negative (MSB is 1).
 - Carry Flag: Set on unsigned overflow from addition.
 - Borrow Flag: Set on unsigned underflow from subtraction.
 - Overflow Flag: Set on signed overflow from addition/subtraction.
 - Divide by Zero Flag: Set on an attempted division by zero.

## Architectural Overview:

<img width="681" height="601" alt="block_diagram" src="https://github.com/user-attachments/assets/a9e0763f-0abb-4f42-af28-e4ea6b1138b4" />

### Opcode Decoding:
The alu_top module accepts a 5-bit unified opcode. This opcode is partitioned and sliced to generate the necessary control signals for the sub-modules without requiring complex decoding logic. For example, opcode[1:0] directly controls the arithmetic unit's operation selection.

### Functional Units:
Four specialized, independently verified units are instantiated within the top module:
 - arith_top: Performs all arithmetic calculations.
 - logic_top: Performs all bitwise logical operations.
 - comp_top: Performs all signed and unsigned comparisons.
 - shifting_top: Performs all shift and rotate operations

### Result Multiplexing:
A case statement in alu_top acts as the final multiplexer, selecting the output from the appropriate functional unit based on the high-level bits of the opcode

## Design choices and Implementation:

### Arithmetic Unit:
 - Addition was implemented with the concept of the CLA (Carry lookahead adder) generating both result and an unsigned overflow aka carryout
 - Subtraction was implemented by applying the concept of 2's complement on the RCA (Ripple carry adder) generating both result and an unsigned overflow aka borrowout
 - Multipliers: This was divided into 2 sub modules: (1) Unsigned and (2) Signed.
      The unsigned multiplier was applied with the algorithm called "Shift and Add". With the help of genvar and generate loops 8 different intermediate stages were created to implement this algorithm.
      The signed multiplier acted as a wrapper around the unsigned multiplier based on the algo called "Convert and Correct". The inputs were checked to see if any of them were negative or not, if true the        2's complement was implemented on the final output, if not then the final output was correct. A sign check flag was implemented by XORing the MSBs of both inputs.
 - Divider: Same as the multiplier it was also divided into 2 sub modules
     The unsigned divider was applied with the algorithm called "Restoring Division". 16 different remainder stages and quotient stages vectors were created, each working on the outputs from the previous         stage using a for loop. A major bug which occured at this stage was that I was declaring i as a reg instead of an integer, which was causing icarus compilation issues. The 16th stage was then assigned       to the final quotient and remainder.
     The signed divider acted as a wrapper around unsigned divider based on the same algorithm used for signed multiplier, the convert and correct algorithm.
<img width="1918" height="1016" alt="arithmeticwaveform" src="https://github.com/user-attachments/assets/d5767d45-7c1e-4ff0-91b5-fe14df76cb95" />


### Comparison Unit:
 - The comparator was controlled by a single last bit, which decided if the input was to be compared as signed or unsigned.
 - 4 different conditions were assigned for each case such as: Unsigned, Signed PP, Signed PN, Signed NP, Signed NN
<img width="1918" height="1018" alt="comparisonwaveform" src="https://github.com/user-attachments/assets/58a699e3-b32d-465e-a936-cb7c12f49e42" />

### Logical Unit:
 - Most basic Unit, implemented all 7 bitwise operations in separate modules and controlled all of them using a 3 bit opcode from a top module
<img width="1918" height="1078" alt="logicwaveform" src="https://github.com/user-attachments/assets/6f542ae0-4187-4ba5-8a6a-a1cc4a68a8db" />

### Shifting Unit:
 - A signle barrel shifter was implemented to handle all of the shifting operations
 - Logical shifting: Empty spaces filled with 0s
 - Arithmetic shifting: Empty spaces filled with MSBs, which I implemented by masking.
 - Rotation: Implemented by the concatenation operator
<img width="1918" height="1017" alt="shiftingwaveform" src="https://github.com/user-attachments/assets/d00bcb6f-29ea-45ba-877d-2e651a953210" />

## Final Waveform:
<img width="1665" height="905" alt="aluwaveform" src="https://github.com/user-attachments/assets/102c9029-a901-413b-99c1-2593165b7cc6" />

## Verification Strategies:
 - Verification was performed into 2 stages:

### Unit testing:
 - Each of the 4 fundamental units were exhaustively tested separately with dedicated testbenches.
### Integration testing:
 - After each of the units were successfully verified, a final testbench was implemented at the top level to test if each units were integrated successfuly, this test was based on mostly op code only, to check if the 5 bit op code was correctly choosing the right units.
