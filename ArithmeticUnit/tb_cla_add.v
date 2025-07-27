`timescale 1ns/1ps

module tb_cla_add();
    reg [15:0]in0;
    reg [15:0]in1;
    reg cin;
    wire [15:0]sum;
    wire cout;

    cla_add uut (
        .in0(in0),
        .in1(in1),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("clawaveform.vcd");
        $dumpvars(0, tb_cla_add);

        in0 = 16'b0;
        in1 = 16'b0;
        cin = 0;
        #10;
        $display("in0 = %b in1 = %b cin = %b || sum = %b || cout = %b", in0, in1, cin, sum, cout);

        in0 = 16'hFFFF;
        in1 = 16'hFFFF;
        cin = 1;
        #10;
        $display("in0 = %b in1 = %b cin = %b || sum = %b || cout = %b", in0, in1, cin, sum, cout);

        in0 = 16'b0101010101010101;
        in1 = 16'b1010101010101010;
        cin = 0;
        #10;
        $display("in0 = %b in1 = %b cin = %b || sum = %b || cout = %b", in0, in1, cin, sum, cout);

        in0 = 16'h0FFF;
        in1 = 16'h0001;
        cin = 0;
        #10;
        $display("in0 = %b in1 = %b cin = %b || sum = %b || cout = %b", in0, in1, cin, sum, cout);

        in0 = 0;
        in1 = 0;
        cin = 1;
        #10;
        $display("in0 = %b in1 = %b cin = %b || sum = %b || cout = %b", in0, in1, cin, sum, cout);
        $finish;
    end
endmodule