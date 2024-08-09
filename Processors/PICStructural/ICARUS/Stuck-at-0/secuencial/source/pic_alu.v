`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:38:31
// Design Name: 
// Module Name: pic_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pic_alu(
    input [3:0] operation,
    input [7:0] a,
    input [7:0] b,
    output [7:0] res,
    input carry_in,
    output carry_out,
    output reg zero
    );

    localparam [3:0] ALUOP_ADD        = 4'b0000;
    localparam [3:0] ALUOP_SUB        = 4'b0001;
    localparam [3:0] ALUOP_AND        = 4'b0010;
    localparam [3:0] ALUOP_OR         = 4'b0011;
    localparam [3:0] ALUOP_XOR        = 4'b0100;
    localparam [3:0] ALUOP_COM        = 4'b0101;
    localparam [3:0] ALUOP_ROR        = 4'b0110;
    localparam [3:0] ALUOP_ROL        = 4'b0111;
    localparam [3:0] ALUOP_SWAP       = 4'b1000;
    localparam [3:0] ALUOP_BITCLR     = 4'b1001;
    localparam [3:0] ALUOP_BITSET     = 4'b1010;
    localparam [3:0] ALUOP_BITTESTCLR = 4'b1011;
    localparam [3:0] ALUOP_BITTESTSET = 4'b1100;
    localparam [3:0] ALUOP_PASSA      = 4'b1101;
    localparam [3:0] ALUOP_PASSB      = 4'b1110;   
    
    wire [7:0] temp_b;
    wire [0:0] temp_carry;
    
    reg [9:0] result;
    wire [9:0] temp_c;
    
    reg [7:0] bit_pattern;
    wire [7:0] bit_test;
    
    always @(b[7:5]) begin
        case (b[7:5])
            3'b000 : bit_pattern = 8'b00000001;
            3'b001 : bit_pattern = 8'b00000010;
            3'b010 : bit_pattern = 8'b00000100;
            3'b011 : bit_pattern = 8'b00001000;
            3'b100 : bit_pattern = 8'b00010000;
            3'b101 : bit_pattern = 8'b00100000;
            3'b110 : bit_pattern = 8'b01000000;
            3'b111 : bit_pattern = 8'b10000000;
            default : bit_pattern =  8'bX;            
        endcase
    end

    assign temp_carry = (operation == ALUOP_SUB) ? 1'b1 : 1'b0;
    assign temp_b = (operation == ALUOP_SUB) ? ~b : b;

    always @(operation, a, b, carry_in, bit_pattern) begin
        case (operation)
            ALUOP_ADD : result <= {1'b0, a} + temp_b + temp_carry;
            ALUOP_SUB : result <= {1'b0, a} + temp_b + temp_carry;
            ALUOP_AND : result <= {1'bx, a & b};
            ALUOP_OR : result <= {1'bx, a | b};
            ALUOP_XOR : result <= {1'bx, a ^ b};
            ALUOP_COM : result <= {1'bx, ~a};
            ALUOP_ROR : result <= {a[0], carry_in, a[7:1]};
            ALUOP_ROL : result <= {a, carry_in};              
            ALUOP_SWAP : result <= {1'bx, a[3:0], a[7:4]};    
            ALUOP_BITCLR : result <= {1'bx, ~bit_pattern & a};
            ALUOP_BITSET : result <= {1'bx, bit_pattern | a}; 
            ALUOP_PASSA : result <= {1'bx, a};                
            ALUOP_PASSB : result <= {1'bx, b};                
            default : result <= 8'bZ;
        endcase
    end
    /*
    assign result = (operation == ALUOP_ADD || operation == ALUOP_SUB) ? {1'b0, a} + temp_b + temp_carry : 8'bZ;
    assign result = (operation == ALUOP_AND) ? {1'bx, a & b} : 8'bZ;
    assign result = (operation == ALUOP_OR) ? {1'bx, a | b} : 8'bZ;
    assign result = (operation == ALUOP_XOR) ? {1'bx, a ^ b} : 8'bZ;
    assign result = (operation == ALUOP_COM) ? {1'bx, ~a} : 8'bZ;
    assign result = (operation == ALUOP_ROR) ? {a[0], carry_in, a[7:1]} : 8'bZ;
    assign result = (operation == ALUOP_ROL) ? {a, carry_in} : 8'bZ;
    assign result = (operation == ALUOP_SWAP) ? {1'bx, a[3:0], a[7:4]} : 8'bZ;
    assign result = (operation == ALUOP_BITCLR) ? {1'bx, ~bit_pattern & a} : 8'bZ;
    assign result = (operation == ALUOP_BITSET) ? {1'bx, bit_pattern | a} : 8'bZ;
    assign result = (operation == ALUOP_PASSA) ? {1'bx, a} : 8'bZ;
    assign result = (operation == ALUOP_PASSB) ? {1'bx, b} : 8'bZ;
*/
    assign res = result[7:0];
    assign carry_out = result[8];
    
    assign bit_test = bit_pattern & a;

    always @(bit_test, operation, result[7:0]) begin
        if (bit_test != 8'b0 && operation == ALUOP_BITTESTSET) begin
            zero <= 1'b1;
        end
        else if (bit_test == 8'b0 && operation == ALUOP_BITTESTCLR) begin
            zero <= 1'b1;
        end
        else if (result[7:0] == 8'b0) begin
            zero <= 1'b1;
        end
        else begin
            zero <= 1'b0;
        end
    end
endmodule
