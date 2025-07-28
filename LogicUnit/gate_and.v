module gate_and(
    input [15:0]in0, in1,
    output [15:0]and_out
    );
    assign and_out = in0 & in1;
endmodule