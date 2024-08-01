module reg_s (
    input           clock,
    input           reset,
    input           out_en,
    input           write_en,
    input [7:0]     data_in,
    output reg [7:0] data_out,
    output reg      carry_out,
    input           carry_in,
    input           zero_in,
    input           carry_wr,
    input           zero_wr
);

    reg [7:0] value;

    always @ (*) begin
        if (out_en) begin
            data_out = value;
        end else begin
            data_out = 8'bz;
        end
    end

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            value <= 8'b00000000;
        end else begin
            if (write_en) begin
                value <= data_in;
            end else begin
                if (carry_wr) begin
                    value[2] <= carry_in;
                end
                if (zero_wr) begin
                    value[0] <= zero_in;
                end
            end
        end
    end

    always @ (*) begin
        carry_out = value[2];
    end

endmodule

