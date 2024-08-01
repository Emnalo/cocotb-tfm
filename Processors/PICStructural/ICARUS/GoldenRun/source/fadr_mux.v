module fadr_mux (
    input [4:0] inst_5,
    input [4:0] fsr,
    output reg [4:0] file_addr
);

always @(*) begin
    if (inst_5 == 5'b00000)
        file_addr = fsr;
    else
        file_addr = inst_5;
end

endmodule

