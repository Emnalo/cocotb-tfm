// RegisteredALU.v
module RegisteredALU (
    input rst_i,
    input clk_i,
    input en_i,
    input [7:0] a_i,
    input [7:0] b_i,
    input [2:0] operation_i,
    output zero_o,
    output [7:0] result_o
);
    // Internal signals
    wire [7:0] result;
    wire zero;

    // Instance of ArithmeticLogicUnit
    ArithmeticLogicUnit alu (
        .a_i(a_i),
        .b_i(b_i),
        .operation_i(operation_i),
        .zero_o(zero),
        .result_o(result)
    );

    // Instance of an 8-bit register to hold the result
    RegisterNbits #(.SIZE(8)) result_register (
        .rst_i(rst_i),
        .clk_i(clk_i),
        .en_i(en_i),
        .d_i(result),
        .q_o(result_o)
    );

    // Instance of a 1-bit register to hold the zero flag
    RegisterNbits #(.SIZE(1)) zero_register (
        .rst_i(rst_i),
        .clk_i(clk_i),
        .en_i(en_i),
        .d_i(zero),
        .q_o(zero_o)
    );

endmodule

