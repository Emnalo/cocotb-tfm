`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 21:42:03
// Design Name: 
// Module Name: reg_8rst
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

module reg_8rst(
    input clock,
    input reset,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out
    );
    
    reg [7:0] value;
    
    assign data_out = value;
    
    always @(posedge clock or negedge reset) begin
        if (reset == 1'b0) begin
            value <= 8'b1;
        end
        else if (write_en == 1'b1) begin
            value <= data_in;
        end
    end
    
endmodule
