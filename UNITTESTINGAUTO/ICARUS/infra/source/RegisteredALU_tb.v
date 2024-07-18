`timescale 1ns / 1ps

module RegisteredALU_tb;

    reg rst, clk, en;
    reg [7:0] a, b;
    reg [2:0] operation;
    wire zero;
    wire [7:0] result;

    integer experiments, failures;
    
    // Instancia del Unit Under Test (UUT)
    RegisteredALU uut (
        .rst_i(rst),
        .clk_i(clk),
        .en_i(en),
        .a_i(a),
        .b_i(b),
        .operation_i(operation),
        .zero_o(zero),
        .result_o(result)
    );

    // Generación del reloj
    initial begin
        rst = 1'b1;
        clk = 1'b0;
        #10 rst = 1'b0;
        #5 clk = ~clk;
        forever #5 clk = ~clk;
    end

    // Lógica del testbench
    initial begin
        experiments = 0;
        failures = 0;

                en = 1'b1;
                a = 8'b0000;
                b = 8'b0000;
                operation = 3'b000;
                @(negedge rst);
                @(posedge clk);

                operation = 3'b010;
                @(posedge clk);
                if (result !== 8'b00000000 || zero !== 1'b1) 
                    failures = failures + 1;
                experiments = experiments + 1;

                operation = 3'b110;
                @(posedge clk);
                if (result !== 8'b00000000 || zero !== 1'b1) 
                    failures = failures + 1;
                experiments = experiments + 1;

                a = 8'b00111010;
                b = 8'b00011001;

                operation = 3'b010;
                @(posedge clk);
                if (result !== 8'b01010011 || zero !== 1'b0) 
                    failures = failures + 1;
                experiments = experiments + 1;

                operation = 3'b110;
                @(posedge clk);
                if (result !== 8'b00100001 || zero !== 1'b0) 
                    failures = failures + 1;
                experiments = experiments + 1;

                a = 8'b00001110;
                b = 8'b00011001;

                operation = 3'b010;
                @(posedge clk);
                if (result !== 8'b00100111 || zero !== 1'b0) 
                    failures = failures + 1;
                experiments = experiments + 1;

                operation = 3'b110;
                @(posedge clk);
                if (result !== 8'b11110101 || zero !== 1'b0) 
                    failures = failures + 1;
                experiments = experiments + 1;

    end

    // Volcado de variables para visualización de formas de onda
    initial begin
        $dumpfile("signalverilog.vcd");
        $dumpvars(0, RegisteredALU_tb);
    end

endmodule

