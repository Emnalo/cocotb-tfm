module reg_cons (
    input wire out_en,
    input wire const_01,
    output reg [7:0] data_out
);

    always @(*) begin
        if (out_en) begin
            data_out = {7'b0000000, const_01};
        end else begin
            data_out = 8'bz;
        end
    end

endmodule

