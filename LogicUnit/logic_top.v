module logic_top(
    input [2:0]sel,
    input [15:0]in0,
    input [15:0]in1,
    output [15:0]and_out,
    output [15:0]or_out,
    output [15:0]xor_out,
    output [15:0]not_out,
    output [15:0]nand_out,
    output [15:0]nor_out,
    output [15:0]xnor_out,
    output reg [15:0]result
    );

    gate_and andmodule (
        .in0(in0),
        .in1(in1),
        .and_out(and_out)
    );
    gate_or ormodule (
        .in0(in0),
        .in1(in1),
        .or_out(or_out)
    );
    gate_xor xormodule (
        .in0(in0),
        .in1(in1),
        .xor_out(xor_out)
    );
    gate_not notmodule (
        .in0(in0),
        .in1(in1),
        .not_out(not_out)
    );
    gate_nand nandmodule (
        .in0(in0),
        .in1(in1),
        .nand_out(nand_out)
    );
    gate_nor normodule (
        .in0(in0),
        .in1(in1),
        .nor_out(nor_out)
    );
    gate_xnor xnormodule (
        .in0(in0),
        .in1(in1),
        .xnor_out(xnor_out)
    );

    always @(*)begin
        case(sel)
            3'b000: result = and_out;
            3'b001: result = or_out;
            3'b010: result = xor_out;
            3'b011: result = not_out;
            3'b100: result = nand_out;
            3'b101: result = nor_out;
            3'b110: result = xnor_out;
            3'b111: result = 16'd0;
        endcase
    end
endmodule