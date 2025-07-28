`timescale 1ns/1ps

module tb_logic_top();
    reg [15:0]in0;
    reg [15:0]in1;
    wire [15:0]result;
    reg [2:0]sel;

    logic_top uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .result(result)
    );

    initial begin
        $dumpfile("logicwaveform.vcd");
        $dumpvars(0, tb_logic_top);

        sel = 3'b000;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b000;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b000;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b000;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b001;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b001;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b001;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b001;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b010;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b010;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b010;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b010;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b011;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b011;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b011;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b011;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b100;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b100;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b100;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b100;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b101;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b101;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b101;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b101;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b110;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b110;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b110;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b110;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);

        sel = 3'b111;
        in0 = 0;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b111;
        in0 = 0;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b111;
        in0 = 1;
        in1 = 0;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        sel = 3'b111;
        in0 = 1;
        in1 = 1;
        #10;
        $display("sel = %b || in1 = %b in2 = %b || result = %b", sel, in0, in1, result);
        $finish;
    end
endmodule