`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 15:31:40
// Design Name: 
// Module Name: reg_fsr
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

module reg_fsr(
    input clock,
    input out_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out,
    output [4:0] fsr_out
    );
    
    reg [7:0] value;
    
    assign data_out = (out_en == 1'b1) ? value : 8'bZ;
    assign fsr_out = value[4:0];  
    
    always @(posedge clock) begin
        if (write_en == 1'b1) begin
            value <= data_in;
        end
    end  
    
endmodule
