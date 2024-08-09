`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 15:51:03
// Design Name: 
// Module Name: reg_pc
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

module reg_pc(
    input clock,
    input reset,
    input out_en,
    input write_en,
    input [7:0] data_in,
    output [7:0] data_out,
    input [8:0] addr_in,
    output [8:0] addr_out,
    input push,
    input pop,
    input load
    );
    
    reg [8:0] pc, stack1, stack2;
    
    assign data_out = (out_en == 1'b1) ? pc[7:0] : 8'bZ;
    assign addr_out = pc;
    
    always @(posedge clock or negedge reset) begin
        if (reset == 1'b0) begin
            pc <= 8'b0;
            stack1 <= 8'b0;
            stack2 <= 8'b0;
        end
        else if (write_en == 1'b1) begin
            pc[7:0] <= data_in;
            pc[8] <= 1'b0;
        end
        else if (push == 1'b1) begin
            pc[7:0] <= data_in;
            pc[8] <= 1'b0;
            stack1 <= pc;
            stack2 <= stack1;            
        end
        else if (pop == 1'b1) begin
            pc <= stack1;
            stack1 <= stack2;
        end
        else if (load == 1'b1) begin
            pc <= addr_in;
        end
        else begin
            pc <= pc + 1;
        end
    end 
    
endmodule
