`timescale 1ns/1ps

module tb_comp_top();

    reg [15:0]in0;
    reg [15:0]in1;
    reg is_signed;
    wire GT;
    wire LT;
    wire ET;

    comp_top uut (
        .in0(in0),
        .in1(in1),
        .is_signed(is_signed),
        .GT(GT),
        .LT(LT),
        .ET(ET)
    );

    initial begin
        $dumpfile("comparisonwaveform.vcd");
        $dumpvars(0, tb_comp_top);

        is_signed = 0; #10;
        in0 = 16'd5; in1 = 16'd3; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = 16'd3; in1 = 16'd10; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = 16'd7; in1 = 16'd7; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        is_signed = 1; #10;
        in0 = -16'sd1; in1 = 16'd5; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = 16'd5; in1 = -16'sd1; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = -16'sd2; in1 = -16'sd5; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = -16'sd5; in1 = -16'sd2; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        in0 = 16'd10; in1 = 16'd2; #10;
        $display("input 1 = %d input 2 = %d || GT = %b || LT = %b || ET = %b", in0, in1, GT, LT, ET);
        $finish;
    end
endmodule