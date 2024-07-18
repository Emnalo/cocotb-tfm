// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 09:07:59
// Design Name: 
// Module Name: RegisterNbits - Behavioral
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

module RegisterNbits #(
    parameter SIZE = 8             // number of bits
)(
    input rst_i,                   // reset
    input clk_i,                   // clock
    input en_i,                    // enable
    input [SIZE-1:0] d_i,          // data
    output reg [SIZE-1:0] q_o      // output
);

    // Internal storage
    reg [SIZE-1:0] aux;

    // Process to handle reset, clock and enable
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i)                 // asynchronous reset
            aux <= {SIZE{1'b0}};
        else if (en_i)             // synchronous inputs
            aux <= d_i;            // store data when enabled
    end

    // Assign internal storage to output
    always @(*) begin
        q_o = aux;
    end

endmodule

