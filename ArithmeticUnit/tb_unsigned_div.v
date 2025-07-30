`timescale 1ns/1ps

module tb_unsigned_div();
    reg [15:0]dividend;
    reg [15:0]divisor;
    wire [15:0]quotient;
    wire [15:0]remainder;

    unsigned_div uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        $dumpfile("unsignedwaveform.vcd");
        $dumpvars(0, tb_unsigned_div);

        dividend = 16'd100;
        divisor = 16'd10;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd103;
        divisor = 16'd10;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd50;
        divisor = 16'd0;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd12345;
        divisor = 16'd1;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd0;
        divisor = 16'd12345;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd50;
        divisor = 16'd100;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'd4321;
        divisor = 16'd4321;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'hFFFF;
        divisor = 16'd2;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        dividend = 16'hFFFF;
        divisor = 16'hFFFF;
        #10;
        $display("input 1 = %b input 2 = %b || quotient = %b || remainder = %b", dividend, divisor, quotient, remainder);

        $finish;
    end
endmodule