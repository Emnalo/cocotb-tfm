module pic_ctrl (
    input  [11:0] inst,
    input  [4:0]  file_addr,
    input         zero,
    output [3:0]  alu_op,
    output        tris_a_wen,
    output        tris_b_wen,
    output        tris_c_wen,
    output        port_a_wen,
    output        port_b_wen,
    output        port_c_wen,
    output        port_a_oen,
    output        port_b_oen,
    output        port_c_oen,
    output        w_wen,
    output        w_a_oen,
    output        w_b_oen,
    output        pc_wen,
    output        pc_oen,
    output        pc_push,
    output        pc_pop,
    output        pc_load,
    output        fsr_wen,
    output        fsr_oen,
    output        rtcc_wen,
    output        rtcc_oen,
    output        file_wen,
    output        file_oen,
    output        inst_skip,
    output        imm_oen,
    output        status_oen,
    output        status_wen,
    output        carry_wen,
    output        zero_wen,
    output        const_oen,
    output        const_01
);

    // Constants
    parameter [3:0] ALUOP_ADD = 4'b0000;
    parameter [3:0] ALUOP_SUB = 4'b0001;
    parameter [3:0] ALUOP_AND = 4'b0010;
    parameter [3:0] ALUOP_OR  = 4'b0011;
    parameter [3:0] ALUOP_XOR = 4'b0100;
    parameter [3:0] ALUOP_COM = 4'b0101;
    parameter [3:0] ALUOP_ROR = 4'b0110;
    parameter [3:0] ALUOP_ROL = 4'b0111;
    parameter [3:0] ALUOP_SWAP = 4'b1000;
    parameter [3:0] ALUOP_BITCLR = 4'b1001;
    parameter [3:0] ALUOP_BITSET = 4'b1010;
    parameter [3:0] ALUOP_BITTESTCLR = 4'b1011;
    parameter [3:0] ALUOP_BITTESTSET = 4'b1100;
    parameter [3:0] ALUOP_PASSA = 4'b1101;
    parameter [3:0] ALUOP_PASSB = 4'b1110;

    parameter [11:0] NOP = 12'b000000000000;
    parameter [6:0] MOVWF = 7'b0000001;
    parameter [6:0] CLRW  = 7'b0000010;
    parameter [6:0] CLRF  = 7'b0000011;
    parameter [5:0] SUBWF = 6'b000010;
    parameter [5:0] DECF  = 6'b000011;
    parameter [5:0] IORWF = 6'b000100;
    parameter [5:0] ANDWF = 6'b000101;
    parameter [5:0] XORWF = 6'b000110;
    parameter [5:0] ADDWF = 6'b000111;
    parameter [5:0] MOVF  = 6'b001000;
    parameter [5:0] COMF  = 6'b001001;
    parameter [5:0] INCF  = 6'b001010;
    parameter [5:0] DECFSZ = 6'b001011;
    parameter [5:0] RRF   = 6'b001100;
    parameter [5:0] RLF   = 6'b001101;
    parameter [5:0] SWAPF = 6'b001110;
    parameter [5:0] INCFSZ = 6'b001111;
    parameter [3:0] BCF   = 4'b0100;
    parameter [3:0] BSF   = 4'b0101;
    parameter [3:0] BTFSC = 4'b0110;
    parameter [3:0] BTFSS = 4'b0111;
    parameter [11:0] OPTION = 12'b000000000010;
    parameter [11:0] SLEEP = 12'b000000000011;
    parameter [11:0] CLRWDT = 12'b000000000100;
    parameter [9:0] TRIS = 10'b0000000001;
    parameter [3:0] RETLW = 4'b1000;
    parameter [3:0] CALL  = 4'b1001;
    parameter [2:0] GOTO  = 3'b101;
    parameter [3:0] MOVLW = 4'b1100;
    parameter [3:0] IORLW = 4'b1101;
    parameter [3:0] ANDLW = 4'b1110;
    parameter [3:0] XORLW = 4'b1111;

    reg [3:0] alu_op;
    reg tris_a_wen, tris_b_wen, tris_c_wen;
    reg port_a_wen, port_b_wen, port_c_wen;
    reg port_a_oen, port_b_oen, port_c_oen;
    reg w_wen, w_a_oen, w_b_oen;
    reg pc_wen, pc_oen, pc_push, pc_pop, pc_load;
    reg fsr_wen, fsr_oen;
    reg rtcc_wen, rtcc_oen;
    reg file_wen, file_oen;
    reg inst_skip, imm_oen, status_oen, status_wen;
    reg carry_wen, zero_wen, const_oen, const_01;
    
    reg [1:0] tris_sel;
    reg dest;
    reg file_moen, file_mwen;

    always @(*) begin
        tris_a_wen = 0;
        tris_b_wen = 0;
        tris_c_wen = 0;
        port_a_wen = 0;
        port_b_wen = 0;
        port_c_wen = 0;
        port_a_oen = 0;
        port_b_oen = 0;
        port_c_oen = 0;
        w_wen = 0;
        w_a_oen = 0;
        w_b_oen = 0;
        pc_wen = 0;
        pc_oen = 0;
        pc_push = 0;
        pc_pop = 0;
        pc_load = 0;
        fsr_wen = 0;
        fsr_oen = 0;
        rtcc_wen = 0;
        rtcc_oen = 0;
        file_wen = 0;
        file_oen = 0;
        inst_skip = 0;
        imm_oen = 0;
        status_oen = 0;
        status_wen = 0;
        carry_wen = 0;
        zero_wen = 0;
        const_oen = 0;
        const_01 = 0;
        alu_op = 4'bxxxx;

        dest = inst[5];
        tris_sel = inst[1:0];

        file_moen = 0;
        file_mwen = 0;

        if (file_moen) begin
            case (file_addr)
                5'b00001: rtcc_oen = 1;
                5'b00010: pc_oen = 1;
                5'b00011: status_oen = 1;
                5'b00100: fsr_oen = 1;
                5'b00101: port_a_oen = 1;
                5'b00110: port_b_oen = 1;
                5'b00111: port_c_oen = 1;
                default: file_oen = 1;
            endcase
        end

        if (file_mwen) begin
            case (file_addr)
                5'b00001: rtcc_wen = 1;
                5'b00010: pc_wen = 1;
                5'b00011: status_wen = 1;
                5'b00100: fsr_wen = 1;
                5'b00101: port_a_wen = 1;
                5'b00110: port_b_wen = 1;
                5'b00111: port_c_wen = 1;
                default: file_wen = 1;
            endcase
        end
    end

    always @(*) begin
        case (inst[11:6])
            ADDWF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_ADD;
                carry_wen = 1;
                zero_wen = 1;
                if (dest == 0) w_wen = 1;
                else file_mwen = 1;
            end
            ANDWF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_AND;
                zero_wen = 1;
                if (dest == 0) w_wen = 1;
                else file_mwen = 1;
            end
            CLRW: begin
                alu_op = ALUOP_ADD;
                w_wen = 1;
            end
            CLRF: begin
                file_mwen = 1;
                alu_op = ALUOP_ADD;
            end
            COMF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_COM;
                w_wen = 1;
            end
            DECFSZ: begin
                file_mwen = 1;
                alu_op = ALUOP_ADD;
                inst_skip = 1;
            end
            GOTO: begin
                pc_load = 1;
            end
            INCF: begin
                file_mwen = 1;
                alu_op = ALUOP_ADD;
            end
            IORWF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_OR;
                if (dest == 0) w_wen = 1;
                else file_mwen = 1;
            end
            MOVF: begin
                w_b_oen = 1;
                file_moen = 1;
                if (dest == 0) w_wen = 1;
                else file_mwen = 1;
            end
            MOVLW: begin
                imm_oen = 1;
                alu_op = ALUOP_PASSB;
                w_wen = 1;
            end
            NOP: begin
                // Do nothing
            end
            RETLW: begin
                // Implement RETLW behavior if needed
            end
            SWAPF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_SWAP;
                w_wen = 1;
            end
            XORWF: begin
                w_b_oen = 1;
                file_moen = 1;
                alu_op = ALUOP_XOR;
                if (dest == 0) w_wen = 1;
                else file_mwen = 1;
            end
            default: begin
                // Default case
            end
        endcase
    end

endmodule

