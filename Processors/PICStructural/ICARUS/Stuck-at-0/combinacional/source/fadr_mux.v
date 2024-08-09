`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 16:16:13
// Design Name: 
// Module Name: fadr_mux
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


module fadr_mux(
    input [4:0] inst_5,
    input [4:0] fsr,
    output [4:0] file_addr
    );
    
    assign file_addr = (inst_5 == 5'b0) ? fsr : inst_5;
    
endmodule
