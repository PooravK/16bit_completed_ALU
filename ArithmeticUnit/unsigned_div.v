module unsigned_div(
    input [15:0]dividend,
    input [15:0]divisor,
    output reg [15:0]quotient, 
    output reg [15:0]remainder
    );

    integer i;
    reg [16:0]remainder_stages[0:16];
    reg [15:0]quotient_stages[0:16];
    reg [16:0]temp_remainder[0:15];
    reg [16:0]temp_sub[0:15];

    always @(*)begin

        remainder_stages[0] = 17'b0;
        quotient_stages[0] = dividend;

        for (i = 0; i < 16; i = i + 1)begin

            temp_remainder[i] = {remainder_stages[i][15:0], quotient_stages[i][15]};
            temp_sub[i] = temp_remainder[i] - {1'b0, divisor};

            if (temp_sub[i][16] == 1'b0)begin
                remainder_stages[i + 1] = temp_sub[i];
                quotient_stages[i + 1] = {quotient_stages[i][14:0], 1'b1};
            end else begin
                remainder_stages[i + 1] = temp_remainder[i];
                quotient_stages[i + 1] = quotient_stages[i] << 1;
            end
        end
        quotient = quotient_stages[16];
        remainder = remainder_stages[16][15:0];
    end
endmodule