module arith_top(
    input [15:0]in0, in1,
    input [1:0]sel_arith,
    input carryin, borrowin,
    output carryout, borrowout,
    output [15:0]remainder_left, multiplication_upperbits,
    output reg signed_overflow, divbyzero,
    output reg [15:0]result
    );

    wire [15:0]addition_out;
    wire [15:0]subtraction_out;
    wire [31:0]multiplication_out;
    wire [15:0]division_out;
    wire adder_cout;
    wire subtractor_bout;

    cla_add ADDITION (
        .in0(in0),
        .in1(in1),
        .cin(carryin),
        .sum(addition_out),
        .cout(adder_cout)
    );

    rca_sub SUBTRACTION (
        .in0(in0),
        .in1(in1),
        .bin(borrowin),
        .sub(subtraction_out),
        .bout(subtractor_bout)
    );

    signed_mult MULTIPLICATION (
        .in0(in0),
        .in1(in1),
        .final_signedprod(multiplication_out)
    );

    signed_div DIVISION (
        .dividend(in0),
        .divisor(in1),
        .final_quotient(division_out),
        .final_remainder(remainder_left)
    );

    assign multiplication_upperbits = multiplication_out[31:16];
    assign carryout = (sel_arith == 2'b00)?adder_cout:1'b0;
    assign borrowout = (sel_arith == 2'b01)?subtractor_bout:1'b0;

    always @(*)begin

        signed_overflow = 1'b0;
        divbyzero = 1'b0;

        case (sel_arith)
            2'b00:begin
                 result = addition_out;divbyzero = 0;
                 signed_overflow = (in0[15] & in1[15] & ~addition_out[15]) | (~in0[15] & ~in1[15] & addition_out[15]);
            end
            2'b01:begin
                result = subtraction_out;divbyzero = 0;
                signed_overflow = (in0[15] & ~in1[15] & ~subtraction_out[15]) | (~in0[15] & in1[15] & subtraction_out[15]);
            end
            2'b10:begin
                result = multiplication_out[15:0];
            end
            2'b11:begin
                result = division_out;
                if (in1 == 16'b0)begin
                    divbyzero = 1'b1;
                end
            end
        endcase
    end
endmodule