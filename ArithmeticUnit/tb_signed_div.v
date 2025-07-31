`timescale 1ns/1ps

module tb_signed_div();
    reg [15:0]dividend;
    reg [15:0]divisor;
    wire [15:0]final_quotient;
    wire [15:0]final_remainder;

    signed_div uut (
        .dividend(dividend),
        .divisor(divisor),
        .final_quotient(final_quotient),
        .final_remainder(final_remainder)
    );

    initial begin 
        $dumpfile("signedwaveform.vcd");
        $dumpvars(0, tb_signed_div);

        dividend = 16'sd100;
        divisor = 16'sd10;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = -16'sd1000;
        divisor = 16'sd10;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd1000;
        divisor = -16'sd10;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = -16'sd1000;
        divisor = -16'sd10;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd123;
        divisor = 16'sd1;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd123;
        divisor = -16'sd1;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd32767;
        divisor = 16'sd2;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = -16'sd32768;
        divisor = -16'sd2;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd32767;
        divisor = -16'sd32768;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd1234;
        divisor = 16'sd1234;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd1234;
        divisor = 16'sd0;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        dividend = 16'sd0;
        divisor = 16'sd1234;
        #10;
        $display("input 1 = %d input 2 = %d || quotient = %d || remainder = %d", dividend, divisor, final_quotient, final_remainder);

        $finish;
    end
endmodule