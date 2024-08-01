module reg_io (
    input        clock,
    input        out_en,
    input        write_en,
    input [7:0]  data_in,
    output reg [7:0] data_out,
    input [7:0]  inout_sel,
    inout [7:0]  dataport
);

    reg [7:0] output_value;
    reg [7:0] input_value;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : io_port
            assign dataport[i] = (inout_sel[i] == 1'b0) ? output_value[i] : 1'bz;
        end
    endgenerate

    always @ (*) begin
        if (out_en) begin
            data_out = input_value;
        end else begin
            data_out = 8'bz;
        end
    end

    always @ (posedge clock) begin
        if (write_en) begin
            output_value <= data_in;
        end
        input_value <= dataport;
    end

endmodule

