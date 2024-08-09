`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:03:57
// Design Name: 
// Module Name: reg_w
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

module reg_w(
    input clock,
    input out_a_en,
    input out_b_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_a_out,
    output [7:0] data_b_out
    );

    reg [7:0] value;
    
    assign data_a_out = (out_a_en == 1'b1) ? value : 8'bZ;
    assign data_b_out = (out_b_en == 1'b1) ? value : 8'bZ;

    always @(posedge clock) begin
        if (write_en == 1'b1) begin
            value <= data_in;
        end 
    end

endmodule
