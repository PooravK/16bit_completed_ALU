module comp_top(
    input [15:0]in0, in1,
    input is_signed,
    output reg GT, LT, ET
    );

    always @(*)begin

        GT = 0;
        LT = 0;
        ET = 0;

        if (~is_signed)begin
            GT = (in0 > in1);
            LT = (in0 < in1);
            ET = (in0 == in1);
        end else begin
            if (in0[15] == 0 && in1[15] == 1)begin
                GT = 1;
                LT = 0;
                ET = 0;
            end else if (in0[15] == 1 && in1[15] == 0)begin
                GT = 0;
                LT = 1;
                ET = 0;
            end else if (in0[15] == 1 && in1[15] == 1)begin
                GT = ~(in0 < in1);
                LT = ~(in0 > in1);
                ET = (in0 == in1);
            end else begin
                GT = (in0 > in1);
                LT = (in0 < in1);
                ET = (in0 == in1);
            end
        end
    end
endmodule