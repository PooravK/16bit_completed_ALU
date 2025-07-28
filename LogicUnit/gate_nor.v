module gate_nor(
    input [15:0]in0, in1,
    output [15:0]nor_out
    );
    assign nor_out = ~(in0 | in1);
endmodule