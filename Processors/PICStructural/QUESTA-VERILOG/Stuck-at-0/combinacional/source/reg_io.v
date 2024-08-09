`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 21:46:13
// Design Name: 
// Module Name: reg_io
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

module reg_io(
    input clock,
    input out_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out,
    input [7:0] inout_sel,
    inout [7:0] dataport
    );
    
    reg [7:0] output_value;
    reg [7:0] input_value;
    
    assign dataport[0] = (inout_sel[0]) ? output_value[0] : 1'bZ;
    assign dataport[1] = (inout_sel[1]) ? output_value[1] : 1'bZ;
    assign dataport[2] = (inout_sel[2]) ? output_value[2] : 1'bZ;
    assign dataport[3] = (inout_sel[3]) ? output_value[3] : 1'bZ;
    assign dataport[4] = (inout_sel[4]) ? output_value[4] : 1'bZ;
    assign dataport[5] = (inout_sel[5]) ? output_value[5] : 1'bZ;
    assign dataport[6] = (inout_sel[6]) ? output_value[6] : 1'bZ;
    assign dataport[7] = (inout_sel[7]) ? output_value[7] : 1'bZ;
    
    assign data_out = (out_en == 1'b1) ? input_value : 8'bZ;
    
    always @(posedge clock) begin
        if (write_en == 1'b1) begin
            output_value <= data_in;
        end
        input_value <= dataport;
    end
    
endmodule
