module reg_inst (
    input        clock,
    input        reset,
    input        skip,
    input        out_en,
    input [11:0] inst_in,
    output reg [11:0] inst_out,
    output reg [7:0] imm_out
);

    reg [11:0] value;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            value <= 12'b000000000000; 
        end else if (skip) begin
            value <= 12'b000000000000; 
        end else begin
            value <= inst_in;
        end
    end

    always @ (*) begin
        if (out_en) begin
            imm_out = value[7:0];
        end else begin
            imm_out = 8'bz; 
        end
        inst_out = value;
    end
endmodule

