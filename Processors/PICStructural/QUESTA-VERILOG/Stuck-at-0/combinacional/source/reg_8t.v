`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 15:09:12
// Design Name: 
// Module Name: reg_8t
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

module reg_8t(
    input clock,
    input out_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out
    );
    
    reg [7:0] value;
    
    assign data_out = (out_en == 1'b1) ? value : 8'bZ;
    
    always @(posedge clock) begin
        if (write_en == 1'b1) begin
            value <= data_in;
        end
    end
        
endmodule
