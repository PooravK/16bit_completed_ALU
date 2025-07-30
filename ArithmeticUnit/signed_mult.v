module signed_mult(
    input [15:0]in0, in1,
    output reg [31:0]final_signedprod
    );

    reg [15:0]temp_in0;
    reg [15:0]temp_in1;
    wire [31:0]temp_prod;
    wire sign_check;

    assign sign_check = in0[15] ^ in1[15];

    always @(*)begin
        if (in0[15])begin
            temp_in0 = (~in0 + 1);
        end else begin
            temp_in0 = in0;
        end

        if (in1[15])begin
            temp_in1 = (~in1 + 1);
        end else begin
            temp_in1 = in1;
        end
    end

    unsigned_mult unsignedlogic (
        .in0(temp_in0),
        .in1(temp_in1),
        .prod(temp_prod)
    );

    always @(*)begin
        if (sign_check)begin
            final_signedprod = (~temp_prod + 1);
        end else begin
            final_signedprod = temp_prod;
        end
    end
endmodule