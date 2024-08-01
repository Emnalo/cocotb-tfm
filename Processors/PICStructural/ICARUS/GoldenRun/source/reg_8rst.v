module reg_8rst (
    input wire clock,
    input wire reset,
    input wire write_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] value;

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            value <= 8'b11111111;
        end else if (write_en) begin
            value <= data_in;
        end
    end

    always @(*) begin
        data_out = value;
    end

endmodule

