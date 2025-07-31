`timescale 1ns/1ps

module tb_alu_top();
    `include "opcode.vh"

    reg [15:0]in0;
    reg [15:0]in1;
    reg carryin;
    reg borrowin;
    reg [4:0]sel_alu;
    wire [15:0]alu_out;
    wire [15:0]upper_alubits;
    wire [15:0]remainder_alubits;
    wire zero_flag;
    wire negative_flag;
    wire carryout_flag;
    wire borrowout_flag;
    wire alu_overflow;
    wire divbyzero_flag;
    wire GT_flag;
    wire LT_flag;
    wire ET_flag;

    alu_top uut (
        .in0(in0),
        .in1(in1),
        .carryin(carryin),
        .borrowin(borrowin),
        .sel_alu(sel_alu),
        .alu_out(alu_out),
        .upper_alubits(upper_alubits),
        .remainder_alubits(remainder_alubits),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag),
        .carryout_flag(carryout_flag),
        .borrowout_flag(borrowout_flag),
        .alu_overflow(alu_overflow),
        .divbyzero_flag(divbyzero_flag),
        .GT_flag(GT_flag),
        .LT_flag(LT_flag),
        .ET_flag(ET_flag)
    );

    initial begin
        $dumpfile("aluwaveform.vcd");
        $dumpvars(0, tb_alu_top);

        $display("\n--- Testing Arithmetic Unit ---");

        sel_alu = ALU_ADD; in0 = 16'd10; in1 = 16'd5; carryin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag, alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_ADD; in0 = 16'd65535; in1 = 16'd1; carryin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_ADD; in0 = 16'sd32767; in1 = 16'd1; carryin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SUB; in0 = 16'd10; in1 = 16'd5; borrowin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SUB; in0 = 16'd5; in1 = 16'd10; borrowin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SUB; in0 = -16'sd32768; in1 = 16'd1; borrowin = 0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_MUL; in0 = 16'd200; in1 = 16'd200; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_DIV; in0 = 16'd103; in1 = 16'd10; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_DIV; in0 = 16'd100; in1 = 16'd0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_AND; in0 = 16'hF0F0; in1 = 16'hAAAA; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_OR; in0 = 16'hF0F0; in1 = 16'hAAAA; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_XOR; in0 = 16'hF0F0; in1 = 16'hAAAA; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_NOT; in0 = 16'hF0F0; in1 = 16'h0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_NAND; in0 = 16'hF0F0; in1 = 16'hAAAA; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_NOR; in0 = 16'hF0F0; in1 = 16'h0; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_XNOR; in0 = 16'hAAAA; in1 = 16'hAAAA; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_UNSIGNED_GT; in0 = 16'd10; in1 = 16'd5; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_UNSIGNED_LT; in0 = 16'd5; in1 = 16'd10; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_UNSIGNED_ET; in0 = 16'd7; in1 = 16'd7; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SIGNED_GT; in0 = -16'sd2; in1 = -16'sd5; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SIGNED_LT; in0 = -16'sd5; in1 = 16'd2; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_SIGNED_ET; in0 = -16'sd7; in1 = -16'sd7; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_LSL; in0 = 16'h00FF; in1 = 16'd4; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_LSR; in0 = 16'hF000; in1 = 16'd4; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_ASL; in0 = 16'hA000; in1 = 16'd1; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_ASR; in0 = -16'sd16; in1 = 16'd2; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_RL; in0 = 16'hC001; in1 = 16'd2; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        sel_alu = ALU_RR; in0 = 16'hC001; in1 = 16'd2; #10;
        $display("sel=%d || in1=%d || in2=%d || cin=%d || bin=%d || upperbits=%d result=%d remainder=%d || zero=%d || negative=%d || cout=%d || bout=%d ||alu_overflow=%d || divbyzero=%d || GT=%d LT=%d ET=%d", sel_alu, in0, in1, carryin, borrowin, upper_alubits, alu_out, remainder_alubits, zero_flag, negative_flag, carryout_flag, borrowout_flag,alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag);
        
        $finish;
    end
endmodule