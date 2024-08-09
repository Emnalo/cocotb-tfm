`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 15:40:54
// Design Name: 
// Module Name: reg_s
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

module reg_s( 
    input clock,
    input reset,
    input out_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out,
    output carry_out,
    input carry_in,
    input zero_in,
    input carry_wr,
    input zero_wr
    );
    
    reg [7:0] value;
    
    assign data_out = (out_en == 1'b1) ? value : 8'bZ;
    assign carry_out = value[2];
    
    always @(posedge clock or negedge reset) begin
        if (reset == 1'b0) begin
            value <= 8'b0;
        end
        else if (write_en == 1'b1) begin
            value <= data_in;
        end
        else begin
            if (carry_wr == 1'b1) begin
                value[2] = carry_in;
            end
            if (zero_wr == 1'b1) begin
                value[0] = zero_in;
            end
        end
    end

endmodule
