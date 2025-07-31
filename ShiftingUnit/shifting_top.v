module shifting_top(
    input [15:0]in0,
    input [15:0]in1,
    input [2:0]shift_type,
    output reg [15:0]shift_result
    );

    always @(*)begin
        case (shift_type)
            3'b000: shift_result = in0 << in1;
            3'b001: shift_result = in0 >> in1;
            3'b010: shift_result = in0 <<< in1;
            3'b011:begin
                if (~in0[15])begin
                    shift_result = in0 >>> in1;
                end else begin
                    shift_result = in0 >>> in1;
                    shift_result = (in0 >> in1) | (16'hFFF << (16-in1)); //Used masked logic here. Forces 1s instead of 0s.
                end
            end
            3'b100:begin
                shift_result = (in0 << in1) | (in0 >> (16-in1));
            end
            3'b101:begin
                shift_result = (in0 >> in1) | (in0 << (16-in1));
            end
            3'b110: shift_result = 16'b0;//Empty case
            3'b111: shift_result = 16'b0;//Empty case
        endcase
    end
endmodule