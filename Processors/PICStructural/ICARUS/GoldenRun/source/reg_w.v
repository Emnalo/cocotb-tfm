module reg_w (
    input           clock,
    input           out_a_en,
    input           out_b_en,
    input           write_en,
    input [7:0]     data_in,
    output reg [7:0] data_a_out,
    output reg [7:0] data_b_out
);

    reg [7:0] value;

    always @ (posedge clock) begin
        if (write_en) begin
            value <= data_in;
        end
    end

    always @ (*) begin
        if (out_a_en) begin
            data_a_out = value;
        end else begin
            data_a_out = 8'bz;
        end

        if (out_b_en) begin
            data_b_out = value;
        end else begin
            data_b_out = 8'bz;
        end
    end

endmodule

