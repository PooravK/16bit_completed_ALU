`timescale 1ns/1ps

module tb_unsigned_mult();
    reg [15:0]in0;
    reg [15:0]in1;
    wire [31:0]prod;

    unsigned_mult uut (
        .in0(in0),
        .in1(in1),
        .prod(prod)
    );

    initial begin
        $dumpfile("unsignedwaveform.vcd");
        $dumpvars(0, tb_unsigned_mult);

        in0 = 16'd0;
        in1 = 16'd0;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd1234;
        in1 = 16'd0;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd0;
        in1 = 16'd5678;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd65535;
        in1 = 16'd1;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd1;
        in1 = 16'd65535;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd65535;
        in1 = 16'd65535;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd2;
        in1 = 16'd2;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd256;
        in1 = 16'd256;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'd1024;
        in1 = 16'd1024;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);

        in0 = 16'b0101010101010101;
        in1 = 16'b1010101010101010;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, prod);
        $finish;
    end
endmodule