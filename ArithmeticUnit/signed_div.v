module signed_div(
    input [15:0]divisor, dividend,
    output reg [15:0]final_quotient, final_remainder
    );

    reg [15:0]temp_divisor;
    reg [15:0]temp_dividend;

    wire [15:0]temp_quotient;
    wire [15:0]temp_remainder;
    wire quotient_sign;
    wire remainder_sign;

    assign quotient_sign = divisor[15] ^ dividend[15];
    assign remainder_sign = dividend[15];

    always @(*)begin
        if(~divisor[15])begin
            temp_divisor = divisor;
        end else begin
            temp_divisor = ~divisor + 1;
        end

        if(~dividend[15])begin
            temp_dividend = dividend;
        end else begin
            temp_dividend = ~dividend + 1;
        end
    end

    unsigned_div unsigneddivisionlogic (
        .dividend(temp_dividend),
        .divisor(temp_divisor),
        .quotient(temp_quotient),
        .remainder(temp_remainder)
    );

    always @(*)begin
        if (~quotient_sign)begin
            final_quotient = temp_quotient;
        end else begin
            final_quotient = ~temp_quotient + 1;
        end

        if (~remainder_sign)begin
            final_remainder = temp_remainder;
        end else begin
            final_remainder = ~temp_remainder + 1;
        end
    end
endmodule