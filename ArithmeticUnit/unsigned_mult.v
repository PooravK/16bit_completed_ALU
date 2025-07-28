module unsigned_mult(
    input [15:0]in0, in1,
    output [31:0]prod
    );

    wire [15:0]prod1, prod2, prod3, prod4;

    u_mult8bit lxl(.in0(in0[7:0]), .in1(in1[7:0]), .prod(prod1));
    u_mult8bit lxh(.in0(in0[7:0]), .in1(in1[15:8]), .prod(prod2));
    u_mult8bit hxl(.in0(in0[15:8]), .in1(in1[7:0]), .prod(prod3));
    u_mult8bit hxh(.in0(in0[15:8]), .in1(in1[15:8]), .prod(prod4));

    assign prod = prod1 + (prod2 <<8) + (prod3<<8) + (prod4<<16);

endmodule

module u_mult8bit(
    input [7:0]in0, in1,
    output [15:0]prod
    );

    genvar i;
    wire [7:0]mult[0:7];

    generate
        for (i = 0; i < 8; i = i + 1)
            assign mult[i] = {8{in0[i]}} & in1[7:0];
    endgenerate

    assign prod = mult[0] + (mult[1]<<1) + (mult[2]<<2) + (mult[3]<<3) + (mult[4]<<4) + (mult[5]<<5) + (mult[6]<<6) + (mult[7]<<7);
endmodule