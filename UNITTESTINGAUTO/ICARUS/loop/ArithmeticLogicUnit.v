// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 18:17:17
// Design Name: 
// Module Name: ArithmeticLogicUnit - Behavioral
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

module ArithmeticLogicUnit (
    input [7:0] a_i,           // first operand
    input [7:0] b_i,           // second operand
    input [2:0] operation_i,   // operation
    output zero_o,             // zero flag
    output [7:0] result_o      // result
);

    // Constants
    localparam ZERO = 8'b00000000;

    // Internal signals
    wire [7:0] add_result, sub_result, and_result, or_result, slt_result;
    reg [7:0] aux_result;

    // Operations
    assign add_result = a_i + b_i;                  // add result
    assign sub_result = a_i - b_i;                  // sub result
    assign and_result = a_i & b_i;                  // and result
    assign or_result = a_i | b_i;                   // or result
    assign slt_result = (a_i < b_i) ? 8'b00000001 : 8'b00000000; // slt result

    // Result selection based on operation_i
    always @(*) begin
        case (operation_i)
            3'b010: aux_result = add_result;
            3'b110: aux_result = sub_result;
            3'b000: aux_result = and_result;
            3'b001: aux_result = or_result;
            3'b111: aux_result = slt_result;
            default: aux_result = 8'b00000000;
        endcase
    end

    // Zero flag
    assign zero_o = (aux_result == ZERO) ? 1'b1 : 1'b0;

    // Output result
    assign result_o = aux_result;

endmodule

