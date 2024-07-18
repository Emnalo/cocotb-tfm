module CounterComponent (
    input clk,            // Señal de reloj
    input rst,            // Señal de reset
    output reg [3:0] int_counter,   // Salida del contador de tipo integer (4 bits para contar hasta 10)
    output reg [3:0] unsigned_counter // Salida del contador de tipo unsigned (4 bits para contar hasta 10)
);

    // Registro interno para el contador de tipo integer
    reg signed [3:0] int_counter_reg;
    // Registro interno para el contador de tipo unsigned
    reg [3:0] unsigned_counter_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reiniciar los contadores a 0
            int_counter_reg <= 0;
            unsigned_counter_reg <= 4'b0000;
        end else begin
            // Incrementar el contador integer
            if (int_counter_reg < 10) begin
                int_counter_reg <= int_counter_reg + 1;
            end else begin
                int_counter_reg <= 0; // Reiniciar el contador después de llegar a 10
            end

            // Incrementar el contador unsigned
            if (unsigned_counter_reg < 10) begin
                unsigned_counter_reg <= unsigned_counter_reg + 1;
            end else begin
                unsigned_counter_reg <= 4'b0000; // Reiniciar el contador después de llegar a 10
            end
        end
    end

    // Asignar los valores de los registros a las salidas
    assign int_counter = int_counter_reg;
    assign unsigned_counter = unsigned_counter_reg;

endmodule

