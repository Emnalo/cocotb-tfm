`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:21:50
// Design Name: 
// Module Name: reg_file
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

module reg_file(
    input clock,
    input write_en,
    input out_en,
    input [4:0] address,
    input [7:0] data_in,
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
    
    always @(address, out_en, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31) begin
        if (out_en == 1'b1) begin
            case (address) 
                5'b01000 : data_out <= r8 ;
                5'b01001 : data_out <= r9 ;
                5'b01010 : data_out <= r10;
                5'b01011 : data_out <= r11;
                5'b01100 : data_out <= r12;
                5'b01101 : data_out <= r13;
                5'b01110 : data_out <= r14;
                5'b01111 : data_out <= r15;
                5'b10000 : data_out <= r16;
                5'b10001 : data_out <= r17;
                5'b10010 : data_out <= r18;
                5'b10011 : data_out <= r19;
                5'b10100 : data_out <= r20;
                5'b10101 : data_out <= r21;
                5'b10110 : data_out <= r22;
                5'b10111 : data_out <= r23;
                5'b11000 : data_out <= r24;
                5'b11001 : data_out <= r25;
                5'b11010 : data_out <= r26;
                5'b11011 : data_out <= r27;
                5'b11100 : data_out <= r28;
                5'b11101 : data_out <= r29;
                5'b11110 : data_out <= r30;
                5'b11111 : data_out <= r31; 
                default : data_out <= 8'bZ;
            endcase
        end
        else begin
            data_out <= 8'bZ;
        end  
    end
    /*
    assign data_out = (address == 5'b01000 && out_en == 1'b1) ? r8 : 8'bZ;
    assign data_out = (address == 5'b01001 && out_en == 1'b1) ? r9 : 8'bZ;
    assign data_out = (address == 5'b01010 && out_en == 1'b1) ? r10 : 8'bZ;
    assign data_out = (address == 5'b01011 && out_en == 1'b1) ? r11 : 8'bZ;
    assign data_out = (address == 5'b01100 && out_en == 1'b1) ? r12 : 8'bZ;
    assign data_out = (address == 5'b01101 && out_en == 1'b1) ? r13 : 8'bZ;
    assign data_out = (address == 5'b01110 && out_en == 1'b1) ? r14 : 8'bZ;
    assign data_out = (address == 5'b01111 && out_en == 1'b1) ? r15 : 8'bZ;
    assign data_out = (address == 5'b10000 && out_en == 1'b1) ? r16 : 8'bZ;
    assign data_out = (address == 5'b10001 && out_en == 1'b1) ? r17 : 8'bZ;
    assign data_out = (address == 5'b10010 && out_en == 1'b1) ? r18 : 8'bZ;
    assign data_out = (address == 5'b10011 && out_en == 1'b1) ? r19 : 8'bZ;
    assign data_out = (address == 5'b10100 && out_en == 1'b1) ? r20 : 8'bZ;
    assign data_out = (address == 5'b10101 && out_en == 1'b1) ? r21 : 8'bZ;
    assign data_out = (address == 5'b10110 && out_en == 1'b1) ? r22 : 8'bZ;
    assign data_out = (address == 5'b10111 && out_en == 1'b1) ? r23 : 8'bZ;
    assign data_out = (address == 5'b11000 && out_en == 1'b1) ? r24 : 8'bZ;
    assign data_out = (address == 5'b11001 && out_en == 1'b1) ? r25 : 8'bZ;
    assign data_out = (address == 5'b11010 && out_en == 1'b1) ? r26 : 8'bZ;
    assign data_out = (address == 5'b11011 && out_en == 1'b1) ? r27 : 8'bZ;
    assign data_out = (address == 5'b11100 && out_en == 1'b1) ? r28 : 8'bZ;
    assign data_out = (address == 5'b11101 && out_en == 1'b1) ? r29 : 8'bZ;
    assign data_out = (address == 5'b11110 && out_en == 1'b1) ? r30 : 8'bZ;
    assign data_out = (address == 5'b11111 && out_en == 1'b1) ? r31 : 8'bZ;
*/
    always @(posedge clock) begin
        if (write_en == 1'b1) begin
            case(address)
               5'b01000 : r8 <= data_in; 
               5'b01001 : r9 <= data_in; 
               5'b01010 : r10 <= data_in; 
               5'b01011 : r11 <= data_in; 
               5'b01100 : r12 <= data_in; 
               5'b01101 : r13 <= data_in; 
               5'b01110 : r14 <= data_in; 
               5'b01111 : r15 <= data_in; 
               5'b10000 : r16 <= data_in; 
               5'b10001 : r17 <= data_in; 
               5'b10010 : r18 <= data_in; 
               5'b10011 : r19 <= data_in; 
               5'b10100 : r20 <= data_in; 
               5'b10101 : r21 <= data_in; 
               5'b10110 : r22 <= data_in; 
               5'b10111 : r23 <= data_in; 
               5'b11000 : r24 <= data_in; 
               5'b11001 : r25 <= data_in; 
               5'b11010 : r26 <= data_in; 
               5'b11011 : r27 <= data_in; 
               5'b11100 : r28 <= data_in; 
               5'b11101 : r29 <= data_in; 
               5'b11110 : r30 <= data_in; 
               5'b11111 : r31 <= data_in; 
               default : ;
            endcase
        end
    end
endmodule
