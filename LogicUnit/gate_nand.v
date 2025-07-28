module gate_nand(
    input [15:0]in0, in1,
    output [15:0]nand_out
    );
    assign nand_out = ~(in0 & in1);
endmodule