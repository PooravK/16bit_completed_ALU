module gate_not(
    input [15:0]in0, in1,
    output [15:0]not_out
    );
    assign not_out = ~in0;
endmodule