module rca_sub(
    input [15:0]in0, in1,
    input bin,
    output [15:0]sub,
    output bout
    );

    wire c5;

    rca_sub8bit block6 (
        .in0(in0[7:0]),
        .in1(in1[7:0]),
        .bin(bin),
        .sub(sub[7:0]),
        .bout(c5)
    );
    rca_sub8bit block7 (
        .in0(in0[15:8]),
        .in1(in1[15:8]),
        .bin(c5),
        .sub(sub[15:8]),
        .bout(bout)
    );
endmodule

module rca_sub8bit(
    input [7:0]in0, in1,
    input bin,
    output [7:0]sub,
    output bout
    );

    wire c4;

    rca_sub4bit block4 (
        .in0(in0[3:0]),
        .in1(in1[3:0]),
        .bin(bin),
        .sub(sub[3:0]),
        .bout(c4)
    );
    rca_sub4bit block5 (
        .in0(in0[7:4]),
        .in1(in1[7:4]),
        .bin(c4),
        .sub(sub[7:4]),
        .bout(bout)
    );
endmodule

module rca_sub4bit(
    input [3:0]in0, in1,
    input bin,
    output [3:0]sub,
    output bout
    );

    wire c1;
    wire c2;
    wire c3;

    rca_sub1bit block0 (
        .in0(in0[0]),
        .in1(in1[0]),
        .bin(bin),
        .sub(sub[0]),
        .bout(c1)
    );
    rca_sub1bit block1 (
        .in0(in0[1]),
        .in1(in1[1]),
        .bin(c1),
        .sub(sub[1]),
        .bout(c2)
    );
    rca_sub1bit block2 (
        .in0(in0[2]),
        .in1(in1[2]),
        .bin(c2),
        .sub(sub[2]),
        .bout(c3)
    );
    rca_sub1bit block3 (
        .in0(in0[3]),
        .in1(in1[3]),
        .bin(c3),
        .sub(sub[3]),
        .bout(bout)
    );

endmodule

module rca_sub1bit(
    input in0, in1, bin,
    output sub, bout
    );

    assign sub = in0 ^ in1 ^ bin;
    assign bout = (~in0 & in1) | (in1 & bin) | (~in0 & bin);
endmodule