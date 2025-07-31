module alu_top(
    input [15:0]in0, in1,
    input [4:0]sel_alu,
    input carryin,
    input borrowin,
    output reg [15:0]alu_out,
    output [15:0]upper_alubits, remainder_alubits,
    output zero_flag, negative_flag,
    output carryout_flag, borrowout_flag, alu_overflow, divbyzero_flag, GT_flag, LT_flag, ET_flag
    );

    `include "opcode.vh"

    wire [15:0]arith_out, logic_out, shift_out;

    wire [1:0]op_arith;
    wire op_comp;
    wire [2:0]op_logic;
    wire [2:0]op_shift;

    wire carry_temp;
    wire borrow_temp;
    wire overflow_temp;
    wire divbyzero_temp;
    wire [15:0]upper_temp;
    wire [15:0]remainder_temp;

    assign op_arith = sel_alu[1:0];
    assign op_comp = sel_alu[0];
    assign op_logic = sel_alu[2:0];
    assign op_shift = sel_alu[2:0];

    arith_top AU(
        .sel_arith(op_arith),
        .in0(in0),
        .in1(in1),
        .carryin(carryin),
        .borrowin(borrowin),
        .carryout(carry_temp),
        .borrowout(borrow_temp),
        .result(arith_out),
        .signed_overflow(overflow_temp),
        .multiplication_upperbits(upper_temp),
        .remainder_left(remainder_temp),
        .divbyzero(divbyzero_temp)
    );

    comp_top CU(
        .is_signed(op_comp),
        .in0(in0),
        .in1(in1),
        .GT(GT_flag),
        .LT(LT_flag),
        .ET(ET_flag)
    );

    logic_top LU(
        .sel(op_logic),
        .in0(in0),
        .in1(in1),
        .result(logic_out)
    );

    shifting_top SU(
        .shift_type(op_shift),
        .in0(in0),
        .in1(in1),
        .shift_result(shift_out)
    );

    assign carryout_flag    = (sel_alu == ALU_ADD) ? carry_temp : 1'b0;
    assign borrowout_flag   = (sel_alu == ALU_SUB) ? borrow_temp : 1'b0;
    assign alu_overflow     = (sel_alu == ALU_ADD || sel_alu == ALU_SUB) ? overflow_temp : 1'b0;
    assign divbyzero_flag   = (sel_alu == ALU_DIV) ? divbyzero_temp : 1'b0;
    assign upper_alubits    = (sel_alu == ALU_MUL) ? upper_temp : 16'b0;
    assign remainder_alubits= (sel_alu == ALU_DIV) ? remainder_temp : 16'b0;
    assign zero_flag        = (alu_out == 16'h0000);
    assign negative_flag    = alu_out[15];

    always @(*)begin
        alu_out = 16'd0;

        case (sel_alu)
            ALU_ADD, ALU_SUB, ALU_MUL, ALU_DIV: begin
                alu_out = arith_out;
            end
            ALU_AND, ALU_OR, ALU_XOR, ALU_NOT, ALU_NAND, ALU_NOR, ALU_XNOR: begin
                alu_out = logic_out;
            end
            ALU_UNSIGNED_GT, ALU_SIGNED_GT: begin
                alu_out = {15'b0, GT_flag};
            end
            ALU_UNSIGNED_LT, ALU_SIGNED_LT: begin
                alu_out = {15'b0, LT_flag};
            end
            ALU_UNSIGNED_ET, ALU_SIGNED_ET: begin
                alu_out = {15'b0, ET_flag};
            end
            ALU_LSL, ALU_LSR, ALU_ASL, ALU_ASR, ALU_RL, ALU_RR: begin
                alu_out = shift_out;
            end
        endcase
    end

endmodule