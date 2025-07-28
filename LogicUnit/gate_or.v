module gate_or(
    input [15:0]in0, in1,
    output [15:0]or_out
    );
    assign or_out = in0 | in1;
endmodule