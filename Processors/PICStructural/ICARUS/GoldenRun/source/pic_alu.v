module pic_alu (
    input [3:0] operation,
    input [7:0] a,
    input [7:0] b,
    input carry_in,
    output reg [7:0] res,
    output reg carry_out,
    output reg zero
);

localparam [3:0]
    ALUOP_ADD        = 4'b0000,
    ALUOP_SUB        = 4'b0001,
    ALUOP_AND        = 4'b0010,
    ALUOP_OR         = 4'b0011,
    ALUOP_XOR        = 4'b0100,
    ALUOP_COM        = 4'b0101,
    ALUOP_ROR        = 4'b0110,
    ALUOP_ROL        = 4'b0111,
    ALUOP_SWAP       = 4'b1000,
    ALUOP_BITCLR     = 4'b1001,
    ALUOP_BITSET     = 4'b1010,
    ALUOP_BITTESTCLR = 4'b1011,
    ALUOP_BITTESTSET = 4'b1100,
    ALUOP_PASSA      = 4'b1101,
    ALUOP_PASSB      = 4'b1110;

reg [7:0] temp_b;
reg temp_carry;
reg [8:0] result;
reg [7:0] bit_pattern;
reg [7:0] bit_test;

always @(*) begin
    case (b[7:5])
        3'b000: bit_pattern = 8'b00000001;
        3'b001: bit_pattern = 8'b00000010;
        3'b010: bit_pattern = 8'b00000100;
        3'b011: bit_pattern = 8'b00001000;
        3'b100: bit_pattern = 8'b00010000;
        3'b101: bit_pattern = 8'b00100000;
        3'b110: bit_pattern = 8'b01000000;
        3'b111: bit_pattern = 8'b10000000;
        default: bit_pattern = 8'bXXXXXXXX; // Only for simulation.
    endcase

    temp_carry = (operation == ALUOP_SUB) ? 1'b1 : 1'b0;
    temp_b = (operation == ALUOP_SUB) ? ~b : b;

    case (operation)
        ALUOP_ADD, ALUOP_SUB: result = {1'b0, a} + temp_b + temp_carry;
        ALUOP_AND: result = {1'b0,a & b};
        ALUOP_OR: result = {1'b0,a | b};
        ALUOP_XOR: result = {1'b0,a ^ b};
        ALUOP_COM: result = {1'b0,~a};
        ALUOP_ROR: result = {1'b0,a[0],carry_in, a[7:1]};
        ALUOP_ROL: result = {1'b0,a, carry_in};
        ALUOP_SWAP: result = {1'b0,a[3:0], a[7:4]};
        ALUOP_BITCLR: result = {1'b0,a & ~bit_pattern};
        ALUOP_BITSET: result = {1'b0, a | bit_pattern};
        ALUOP_PASSA: result = {1'b0, a};
        ALUOP_PASSB: result = {1'b0, b};
        default: result = 9'bZZZZZZZZZ;
    endcase

    res = result[7:0];
    carry_out = result[8];

    bit_test = bit_pattern & a;

assign zero = ((bit_test != 8'b00000000) && (operation == ALUOP_BITTESTSET)) ? 1'b1 :
              ((bit_test == 8'b00000000) && (operation == ALUOP_BITTESTCLR)) ? 1'b1 :
              (result[7:0] == 8'b00000000) ? 1'b1 :
              1'b0;
end

endmodule

