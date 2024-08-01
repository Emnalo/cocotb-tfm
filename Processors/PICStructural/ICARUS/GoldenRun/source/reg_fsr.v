module reg_fsr (
    input        clock,
    input        out_en,
    input        write_en,
    input [7:0]  data_in,
    output reg [7:0] data_out,
    output reg [4:0] fsr_out
);

    reg [7:0] value;

    always @ (posedge clock) begin
        if (write_en) begin
            value <= data_in;
        end
    end

    always @ (*) begin
        if (out_en) begin
            data_out = value;
        end else begin
            data_out = 8'bz;
        end
        fsr_out = value[4:0];
    end
endmodule

