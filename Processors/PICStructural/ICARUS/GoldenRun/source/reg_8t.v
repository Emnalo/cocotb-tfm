module reg_8t (
    input wire clock,
    input wire out_en,
    input wire write_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] value;

    always @(posedge clock) begin
        if (write_en) begin
            value <= data_in;
        end
    end

    always @(*) begin
        if (out_en) begin
            data_out = value;
        end else begin
            data_out = 8'bz;
        end
    end

endmodule

