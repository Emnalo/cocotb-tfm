module reg_file (
    input        clock,
    input        write_en,
    input        out_en,
    input [4:0]  address,
    input [7:0]  data_in,
    output reg [7:0] data_out
);

    reg [7:0] r8;
    reg [7:0] r9;
    reg [7:0] r10;
    reg [7:0] r11;
    reg [7:0] r12;
    reg [7:0] r13;
    reg [7:0] r14;
    reg [7:0] r15;
    reg [7:0] r16;
    reg [7:0] r17;
    reg [7:0] r18;
    reg [7:0] r19;
    reg [7:0] r20;
    reg [7:0] r21;
    reg [7:0] r22;
    reg [7:0] r23;
    reg [7:0] r24;
    reg [7:0] r25;
    reg [7:0] r26;
    reg [7:0] r27;
    reg [7:0] r28;
    reg [7:0] r29;
    reg [7:0] r30;
    reg [7:0] r31;

    always @ (posedge clock) begin
        if (write_en) begin
            case (address)
                5'b01000: r8  <= data_in;
                5'b01001: r9  <= data_in;
                5'b01010: r10 <= data_in;
                5'b01011: r11 <= data_in;
                5'b01100: r12 <= data_in;
                5'b01101: r13 <= data_in;
                5'b01110: r14 <= data_in;
                5'b01111: r15 <= data_in;
                5'b10000: r16 <= data_in;
                5'b10001: r17 <= data_in;
                5'b10010: r18 <= data_in;
                5'b10011: r19 <= data_in;
                5'b10100: r20 <= data_in;
                5'b10101: r21 <= data_in;
                5'b10110: r22 <= data_in;
                5'b10111: r23 <= data_in;
                5'b11000: r24 <= data_in;
                5'b11001: r25 <= data_in;
                5'b11010: r26 <= data_in;
                5'b11011: r27 <= data_in;
                5'b11100: r28 <= data_in;
                5'b11101: r29 <= data_in;
                5'b11110: r30 <= data_in;
                5'b11111: r31 <= data_in;
                default: ;
            endcase
        end
    end

    always @ (*) begin
        case (address)
            5'b01000: data_out = (out_en) ? r8  : 8'bz;
            5'b01001: data_out = (out_en) ? r9  : 8'bz;
            5'b01010: data_out = (out_en) ? r10 : 8'bz;
            5'b01011: data_out = (out_en) ? r11 : 8'bz;
            5'b01100: data_out = (out_en) ? r12 : 8'bz;
            5'b01101: data_out = (out_en) ? r13 : 8'bz;
            5'b01110: data_out = (out_en) ? r14 : 8'bz;
            5'b01111: data_out = (out_en) ? r15 : 8'bz;
            5'b10000: data_out = (out_en) ? r16 : 8'bz;
            5'b10001: data_out = (out_en) ? r17 : 8'bz;
            5'b10010: data_out = (out_en) ? r18 : 8'bz;
            5'b10011: data_out = (out_en) ? r19 : 8'bz;
            5'b10100: data_out = (out_en) ? r20 : 8'bz;
            5'b10101: data_out = (out_en) ? r21 : 8'bz;
            5'b10110: data_out = (out_en) ? r22 : 8'bz;
            5'b10111: data_out = (out_en) ? r23 : 8'bz;
            5'b11000: data_out = (out_en) ? r24 : 8'bz;
            5'b11001: data_out = (out_en) ? r25 : 8'bz;
            5'b11010: data_out = (out_en) ? r26 : 8'bz;
            5'b11011: data_out = (out_en) ? r27 : 8'bz;
            5'b11100: data_out = (out_en) ? r28 : 8'bz;
            5'b11101: data_out = (out_en) ? r29 : 8'bz;
            5'b11110: data_out = (out_en) ? r30 : 8'bz;
            5'b11111: data_out = (out_en) ? r31 : 8'bz;
            default: data_out = 8'bz;
        endcase
    end
endmodule

