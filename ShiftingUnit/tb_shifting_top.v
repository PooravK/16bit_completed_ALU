`timescale 1ns/1ps

module tb_shifting_top();
    reg [15:0]in0;
    reg [3:0]in1;
    reg [2:0]shift_type;
    wire [15:0]shift_result;

    shifting_top uut (
        .in0(in0),
        .in1(in1),
        .shift_result(shift_result),
        .shift_type(shift_type)
    );

    initial begin
        $dumpfile("shiftingwaveform.vcd");
        $dumpvars(0, tb_shifting_top);

        in0 = 16'h0000; in1 = 4'd0;  shift_type = 3'b000; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h0001; in1 = 4'd1;  shift_type = 3'b000; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h8000; in1 = 4'd15; shift_type = 3'b000; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h0001; in1 = 4'd15; shift_type = 3'b001; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'hF000; in1 = 4'd4;  shift_type = 3'b001; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'hF000; in1 = 4'd1;  shift_type = 3'b010; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h8000; in1 = 4'd1;  shift_type = 3'b011; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h7000; in1 = 4'd1;  shift_type = 3'b011; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h1000; in1 = 4'd1;  shift_type = 3'b100; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h8001; in1 = 4'd1;  shift_type = 3'b100; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h0002; in1 = 4'd1;  shift_type = 3'b101; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h0003; in1 = 4'd1;  shift_type = 3'b101; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'hF000; in1 = 4'd1;  shift_type = 3'b110; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h0001; in1 = 4'd1;  shift_type = 3'b111; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h8000; in1 = 4'd1;  shift_type = 3'b011; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        in0 = 16'h7000; in1 = 4'd1;  shift_type = 3'b011; #10;
        $display("Input number: %b || Shifted by: %b || Shift type: %b || Output: %b ||", in0, in1, shift_type, shift_result);
        $finish;
    end
endmodule