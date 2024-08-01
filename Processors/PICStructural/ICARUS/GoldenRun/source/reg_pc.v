module reg_pc (
    input           clock,
    input           reset,
    input           out_en,
    input           write_en,
    input [7:0]     data_in,
    output reg [7:0] data_out,
    input [8:0]     addr_in,
    output reg [8:0] addr_out,
    input           push,
    input           pop,
    input           load
);

    reg [8:0] pc, stack1, stack2;

    always @ (*) begin
        if (out_en) begin
            data_out = pc[7:0];
        end else begin
            data_out = 8'bz;
        end
    end

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            pc <= 9'b000000000;
        end else begin
            if (write_en) begin
                pc[7:0] <= data_in;
                pc[8] <= 1'b0;
            end else if (push) begin
                pc[7:0] <= data_in;
                pc[8] <= 1'b0;
                stack1 <= pc;
                stack2 <= stack1;
            end else if (pop) begin
                pc <= stack1;
                stack1 <= stack2;
            end else if (load) begin
                pc <= addr_in;
            end else begin
                pc <= pc + 1;
            end
        end
    end

    always @ (*) begin
        addr_out = pc;
    end

endmodule

