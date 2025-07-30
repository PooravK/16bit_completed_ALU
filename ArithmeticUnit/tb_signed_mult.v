`timescale 1ns/1ps

module tb_signed_mult;
    reg [15:0]in0;
    reg [15:0]in1;
    wire [31:0]final_signedprod;

    signed_mult uut (
        .in0(in0),
        .in1(in1),
        .final_signedprod(final_signedprod)
    );

    initial begin
        $dumpfile("signedwaveform.vcd");
        $dumpvars(0, tb_signed_mult);

        in0 = 16'd0;
        in1 = 16'd0;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = 16'd1234;
        in1 = 16'd0;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = 16'd0;
        in1 = -16'sd5678;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = -16'sd1;
        in1 = -16'sd1;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = 16'd30000;
        in1 = 16'd30000;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = -16'sd1234;
        in1 = 16'd54;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);

        in0 = -16'sd32768;
        in1 = 16'd32768;
        #10;
        $display("input 1 = %b input 2 = %b || product = %b", in0, in1, final_signedprod);
        $finish;
    end
endmodule