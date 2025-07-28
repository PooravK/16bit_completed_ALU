module gate_xnor(
    input [15:0]in0, in1,
    output [15:0]xnor_out
)   ;
    assign xnor_out = ~(in0 ^ in1);
endmodule