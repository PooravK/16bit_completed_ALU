`timescale 1ns/1ps

module tb_arith_top();
    reg [15:0]in0;
    reg [15:0]in1;
    reg [1:0]sel_arith;
    reg carryin;
    reg borrowin;
    wire [15:0]result;
    wire[15:0]result_upperhalf;
    wire [15:0]remainder_left;
    wire signed_overflow;
    wire divbyzero;
    wire carryout;
    wire borrowout;

    arith_top uut (
        .in0(in0),
        .in1(in1),
        .sel_arith(sel_arith),
        .carryin(carryin),
        .borrowin(borrowin),
        .result(result),
        .multiplication_upperbits(result_upperhalf),
        .signed_overflow(signed_overflow),
        .divbyzero(divbyzero),
        .remainder_left(remainder_left),
        .carryout(carryout),
        .borrowout(borrowout)
    );

    initial begin 
        $dumpfile("arithmeticwaveform.vcd");
        $dumpvars(0, tb_arith_top);

    sel_arith = 2'b00; carryin = 0; borrowin = 0;

    in0 = 16'd1234; in1 = 16'd4321; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'd65535; in1 = 16'd1; #10;     
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd1000; in1 = -16'sd2000; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'sd32767; in1 = 16'd1; #10;  
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd32768; in1 = -16'd1; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    carryin = 1; in0 = 16'd1000; in1 = 16'd2000; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);


    sel_arith = 2'b01; borrowin = 0;

    in0 = 16'd5000; in1 = 16'd1234; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'd1234; in1 = 16'd5000; #10; 
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd3000; in1 = 16'd1000; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'sd32767; in1 = -16'sd1; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd32768; in1 = 16'd1; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    borrowin = 1; in0 = 16'd1000; in1 = 16'd999; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);

    sel_arith = 2'b10;

    in0 = 16'd123; in1 = 16'd456; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd123; in1 = 16'd456; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd123; in1 = -16'sd456; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'd32767; in1 = 16'd2; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);

    sel_arith = 2'b11;

    in0 = 16'd1000; in1 = 16'd10; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'd1000; in1 = 16'd0; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd1000; in1 = 16'd10; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = -16'sd32768; in1 = -16'sd1; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    in0 = 16'd1; in1 = 16'd2; #10;
    $display("input 1 = %d input 2 = %d || carryin = %d borrowin = %d || result_upper = %d result_lower = %d || signedoverflow = %d || divbyzero = %d || remainder = %d || carryout = %b borrowout = %b", in0, in1, carryin, borrowin, result_upperhalf, result, signed_overflow, divbyzero, remainder_left, carryout, borrowout);
    $finish;
  end
endmodule