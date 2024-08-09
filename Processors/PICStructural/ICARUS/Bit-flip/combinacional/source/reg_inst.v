`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:09:59
// Design Name: 
// Module Name: reg_inst
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

module reg_inst(
    input clock,
    input reset,
    input skip,
    input out_en,
    input [11:0] inst_in,
    output [11:0] inst_out,
    output [7:0] imm_out
    );

    reg [11:0] value;
    
    assign imm_out = (out_en == 1'b1) ? value[7:0] : 8'bZ;
    assign inst_out = value;
    
    always @(posedge clock or negedge reset) begin
        if (reset == 1'b0) begin
            value <= 11'b0;
        end
        else if (skip == 1'b1) begin
            value <= 11'b0;
        end
        else begin
            value <= inst_in;
        end
    end
    
endmodule
