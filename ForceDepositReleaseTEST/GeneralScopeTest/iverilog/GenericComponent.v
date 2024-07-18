module GenericComponent #(
    parameter integer N = 4   // Constante genérica
)(
    input wire clk,           // Puerto de entrada
    input wire rst,           // Puerto de entrada
    input wire [N-1:0] din,   // Puerto de entrada
    output reg [N-1:0] dout,  // Puerto de salida
    output reg [N-1:0] inversa // Nueva salida
);

    // Definición del tipo de estado
    localparam IDLE = 2'b00, WORKING = 2'b01, DONE = 2'b10;
    reg [1:0] state;          // Tipo ENUM

    // Definición de array
    reg [N-1:0] array_signal [0:N-1];

    // Constante de array
    wire [N-1:0] array_constant = {N{1'b1}};

    // Contador
    integer counter;          // Tipo integer

    // Señal enable
    reg enable;               // Tipo Boolean (usando reg en lugar de boolean)

    reg [N-1:0] temp_var; // Variable en proceso
    wire [N-1:0] temp_inversa; // Señal interna para la inversa

    // Instancia del componente Inversor
    Inversor #(N) U_Inversor (
        .entrada(din),
        .salida(temp_inversa)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dout <= 0;
            inversa <= 0;
            counter <= 0;
            state <= IDLE;
            enable <= 0;
            for (int i = 0; i < N; i = i + 1) begin
                array_signal[i] <= 0;
            end
        end else begin
            case (state)
                IDLE: begin
                    if (enable) begin
                        state <= WORKING;
                    end
                end
                WORKING: begin
                    temp_var = din;
                    for (int i = 0; i < N; i = i + 1) begin
                        array_signal[i] <= {temp_var[i]};
                    end
                    dout <= temp_var;
                    inversa <= temp_inversa;
                    counter <= counter + 1;
                    if (counter == 9) begin
                        state <= DONE;
                    end
                end
                DONE: begin
                    dout <= array_constant;
                    for (int i = 0; i < N; i = i + 1) begin
                        array_signal[i] <= {array_constant[i]};
                    end
                    inversa <= temp_inversa;
                end
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

    // Bloque para generar VCD
    initial begin
        $dumpfile("failsignal.vcd");
        $dumpvars(0, GenericComponent);
        $dumpvars(1, temp_var);
    end

endmodule

