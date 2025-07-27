module cla_add(
    input [15:0]in0,
    input [15:0]in1,
    input cin,
    output [15:0]sum,
    output p_final,
    output g_final,
    output cout
    );

    wire [4:0]carryfinal;
    wire [3:0]p;
    wire [3:0]g;

    assign carryfinal[0] = cin;
    assign carryfinal[1] = g[0] | p[0] & carryfinal[0];
    assign carryfinal[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & carryfinal[0]);
    assign carryfinal[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & carryfinal[0]);
    assign carryfinal[4] = g_final | (p_final & carryfinal[0]);

    assign cout = carryfinal[4];

    cla_add4bit block0 (
        .in0(in0[3:0]),
        .in1(in1[3:0]),
        .cin(cin),
        .p_grp(p[0]),
        .g_grp(g[0]),
        .sum(sum[3:0]),
        .cout(carryfinal[1])
    );

    cla_add4bit block1 (
        .in0(in0[7:4]),
        .in1(in1[7:4]),
        .cin(carryfinal[1]),
        .p_grp(p[1]),
        .g_grp(g[1]),
        .sum(sum[7:4]),
        .cout(carryfinal[2])
    );

    cla_add4bit block2 (
        .in0(in0[11:8]),
        .in1(in1[11:8]),
        .cin(carryfinal[2]),
        .p_grp(p[2]),
        .g_grp(g[2]),
        .sum(sum[11:8]),
        .cout(carryfinal[3])
    );

    cla_add4bit block3 (
        .in0(in0[15:12]),
        .in1(in1[15:12]),
        .cin(carryfinal[3]),
        .p_grp(p[3]),
        .g_grp(g[3]),
        .sum(sum[15:12]),
        .cout(carryfinal[4])
    );

    assign p_final = p[3] & p[2] & p[1] & p[0];
    assign g_final = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule

module cla_add4bit(
    input [3:0]in0,
    input [3:0]in1,
    input cin,
    output [3:0]sum,
    output p_grp,
    output g_grp,
    output cout
    );

    wire [3:0]p;
    wire [3:0]g;
    wire [3:0]carry;

    assign p[0] = in0[0] ^ in1[0];
    assign g[0] = in0[0] & in1[0];
    assign p[1] = in0[1] ^ in1[1];
    assign g[1] = in0[1] & in1[1];
    assign p[2] = in0[2] ^ in1[2];
    assign g[2] = in0[2] & in1[2];
    assign p[3] = in0[3] ^ in1[3];
    assign g[3] = in0[3] & in1[3];

    assign carry[0] = cin;
    assign carry[1] = g[0] | (p[0] & carry[0]);
    assign carry[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & carry[0]);
    assign carry[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & carry[0]);

    assign sum[0] = p[0] ^ carry[0];
    assign sum[1] = p[1] ^ carry[1];
    assign sum[2] = p[2] ^ carry[2];
    assign sum[3] = p[3] ^ carry[3];

    assign p_grp = p[3] & p[2] & p[1] & p[0];
    assign g_grp = g[3] | (p[3] & g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]);

    assign cout = g_grp | (p_grp & cin);
endmodule

module cla_add1bit(
    input in0, in1, cin,
    output sum, p, g, cout
    );

    assign p = in0 ^ in1;
    assign g = in0 & in1;
    assign sum = p ^ cin;
    assign cout = g | p & cin; 
endmodule