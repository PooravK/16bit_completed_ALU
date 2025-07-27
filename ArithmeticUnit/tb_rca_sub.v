`timescale 1ns/1ps

module tb_rca_sub();
    reg [15:0]in0;
    reg [15:0]in1;
    reg bin;
    wire [15:0]sub;
    wire bout;

    rca_sub uut (
        .in0(in0),
        .in1(in1),
        .bin(bin),
        .sub(sub),
        .bout(bout)
    );

    initial begin
        $dumpfile("rcawaveform.vcd");
        $dumpvars(0, tb_rca_sub);

        in0 = 16'd0;
        in1 = 16'd0;
        bin = 0;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd0;
        in1 = 16'd0;
        bin = 1;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd50;
        in1 = 16'd100;
        bin = 0;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd50;
        in1 = 16'd100;
        bin = 1;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd65535;
        in1 = 16'd0;
        bin = 0;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd0;
        in1 = 16'd65535;
        bin = 0;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);

        in0 = 16'd32768;
        in1 = 16'd32768;
        bin = 1;
        #10;
        $display("in0 = %b in1 = %b bin = %b || sub = %b || bout = %b", in0, in1, bin, sub, bout);
        $finish;
    end
endmodule