`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2024 22:15:51
// Design Name: 
// Module Name: reg_cons
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

module reg_cons(
    input out_en,
    input const_01,
    output [7:0] data_out
    );

    assign data_out = (out_en == 1'b1) ? {7'b0, const_01} : 8'bZ;

endmodule
