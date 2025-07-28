module gate_xor(
    input [15:0]in0, in1,
    output [15:0]xor_out
    );
    assign xor_out = in0 ^ in1;
endmodule